# Order Status Backend Review

This document records the proposed backend authorization changes for review. The code below is a proposal only; it has not been applied to the source files.

## Current behavior

Orders already store a required `status` using `OrderStatus`, and creation initializes it to `Placed`. The service validates the existing sequential workflow:

`Placed → Pickup Scheduled → Picked Up → Processing → Ready for Delivery → Out for Delivery → Completed`

`Completed` is terminal. Joi validates status values for filtering and status updates. Order routes currently do not apply authentication or ownership checks.

## Proposed permissions

| Operation                 | Customer (`aud: "user"`)                          | Admin (`aud: "admin"`)                       |
| ------------------------- | ------------------------------------------------- | -------------------------------------------- |
| Create order              | Yes; customer ID is taken from the verified token | No                                           |
| List/filter all orders    | No                                                | Yes                                          |
| Get orders by customer ID | Own ID only                                       | Any customer                                 |
| Get order by ID           | Own order only                                    | Any order                                    |
| Update order status       | No                                                | Yes, subject to the current transition rules |

Requests without a valid bearer token should receive `401`. Authenticated callers without permission, or customers requesting another customer's orders, should receive `403`.

## Proposed source changes

### `src/common/middleware/auth.ts`

Reuse the existing `auth` middleware and verified JWT payload. Add an authorization middleware that checks the existing token `aud` claim:

```ts
import { NextFunction, Request, RequestHandler, Response } from "express";
import { forbidden, unauthorized } from "../responce/error.responce";
import { authService } from "../service/auth.jwt";
import { userRole } from "../enum/role.enum";

export type AuthUser = {
  id: string;
  aud: userRole;
};

export type AuthRequest = Request & {
  user?: AuthUser;
};

const isAuthUser = (value: unknown): value is AuthUser => {
  if (typeof value !== "object" || value === null) {
    return false;
  }

  return (
    "id" in value &&
    typeof value.id === "string" &&
    "aud" in value &&
    (value.aud === userRole.user || value.aud === userRole.admin)
  );
};

// After authService.verifyToken(token):
const decodedUser = authService.verifyToken(token);
if (!isAuthUser(decodedUser)) {
  throw new unauthorized("Invalid token");
}
req.user = decodedUser;

export const authorize = (...roles: userRole[]): RequestHandler => {
  return (req, res, next) => {
    const user = (req as AuthRequest).user;
    if (!user || !roles.includes(user.aud)) {
      return next(new forbidden("Insufficient permissions"));
    }
    next();
  };
};
```

The shown verification lines belong inside the existing Bearer-token branch, replacing its direct assignment to `req.user`. Existing invalid-token handling remains in place.

### `src/module/oreder_service/order.validation.ts`

Make a client-supplied `customer` optional for compatibility, but never use it as the order owner:

```ts
export const create_order_schema = Joi.object({
  customer: objectId_schema.optional(),
  // Existing items, pickup address, and schedule validation remains unchanged.
});
```

The existing allowed status values and query validation remain unchanged.

### `src/module/oreder_service/order.controller.ts`

Apply authentication to every order route, then role-specific authorization. Preserve the existing validation and controller responses.

```ts
import {
  authorize,
  auth,
  type AuthRequest,
} from "../../common/middleware/auth.js";
import { userRole } from "../../common/enum/role.enum.js";

const order_router = Router();
order_router.use(auth);
```

Creation is customer-only and overrides any submitted `customer` with the verified token ID:

```ts
order_router.post(
  "/",
  authorize(userRole.user),
  validate(create_order_schema, "body"),
  async (req: AuthRequest, res: Response) => {
    const order = await create_order_service({
      ...req.body,
      customer: req.user!.id,
    });
    // Existing response and error mapping remains unchanged.
  },
);
```

Use `authorize(userRole.admin)` on `GET /` and `PATCH /:orderId/status`. Use `authorize(userRole.user, userRole.admin)` on both retrieval routes.

For `GET /customer/:customerId`, after validating the ID and before querying, reject a customer token whose ID differs from the requested ID:

```ts
if (
  req.user!.aud === userRole.user &&
  req.user!.id.toLowerCase() !== customerId.toLowerCase()
) {
  return res.status(403).json({
    message: "You can only access your own orders",
  });
}
```

For `GET /:orderId`, after fetching and checking for not-found, apply the same ownership rule to the order's customer:

```ts
if (
  req.user!.aud === userRole.user &&
  order.customer._id.toString().toLowerCase() !== req.user!.id.toLowerCase()
) {
  return res.status(403).json({
    message: "You can only access your own orders",
  });
}
```

The existing status-update service remains responsible for allowing only the next transition and keeping `Completed` terminal. Joi continues to reject unrecognized status values.

## API test cases

All endpoints require `Authorization: Bearer <access-token>`.

### 1. Create order as a customer

`POST /orders` with a valid customer token and existing order data:

```json
{
  "customer": "64f000000000000000000099",
  "items": [
    {
      "service": "64f000000000000000000001",
      "item": "64f000000000000000000002",
      "quantity": 2
    }
  ],
  "pickupAddress": "64f000000000000000000003",
  "pickupSchedule": {
    "date": "2027-01-15T10:00:00.000Z",
    "timeSlot": "10:00-12:00"
  },
  "deliverySchedule": {
    "date": "2027-01-16T10:00:00.000Z",
    "timeSlot": "10:00-12:00"
  }
}
```

Expected: `201`; response order has the caller's token ID as `customer` (not the submitted ID) and `status: "Placed"`.

### 2. Reject unauthenticated requests

Call any order endpoint without a bearer token.

Expected: `401`.

### 3. Enforce roles and ownership

- Customer calls `GET /orders`: expected `403`.
- Customer calls `PATCH /orders/:orderId/status`: expected `403`.
- Admin calls `POST /orders`: expected `403`.
- Customer calls `GET /orders/customer/:anotherCustomerId`: expected `403`.
- Customer calls `GET /orders/:anotherCustomersOrderId`: expected `403`.
- Customer calls either retrieval endpoint for their own data: expected `200`.
- Admin calls `GET /orders` or views any order/customer: expected `200`.

### 4. Update an order status as admin

`PATCH /orders/:orderId/status`:

```json
{ "status": "Pickup Scheduled" }
```

Expected: `200` when the order is currently `Placed`. An unknown status is `400`; a known but disallowed transition (for example, `Placed` directly to `Processing`) is `422`. Updating an order already at `Completed` is also `422`.

## Unresolved model references

`Order.model.ts` declares population refs `Service`, `LaundryItem`, and `Address`. The local service model is registered under lowercase `"service"`; no local `LaundryItem` or `Address` model definitions were found. Existing populated order reads may depend on those models being registered outside the inspected backend source. This is separate from the proposed authorization changes and is not addressed here.
