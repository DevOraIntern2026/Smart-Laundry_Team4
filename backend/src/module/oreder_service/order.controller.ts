<<<<<<< HEAD
import {
  Router,
  type Request,
  type Response,
  type NextFunction,
} from "express";
=======

import {
    Router,
    type Request,
    type Response,
    type NextFunction
} from "express";

>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
import mongoose from "mongoose";
import Joi from "joi";

import {
<<<<<<< HEAD
  create_order_service,
  get_all_orders_service,
  get_order_by_id_service,
  get_customer_orders_service,
  update_order_status_service,
=======
    create_order_service,
    get_all_orders_service,
    get_order_by_id_service,
    get_customer_orders_service,
    update_order_status_service,
    update_pickup_service
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
} from "./order_service.js";

import {
<<<<<<< HEAD
  create_order_schema,
  get_order_by_id_schema,
  get_customer_orders_schema,
  get_orders_schema,
  update_order_status_schema,
=======
    create_order_schema,
    get_order_by_id_schema,
    get_customer_orders_schema,
    get_orders_schema,
    update_order_status_schema,
    update_pickup_schema
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
} from "./order.validation.js";

import { OrderStatus } from "../../common/enum/order.enum.js";
<<<<<<< HEAD
import {
  auth,
  authorize,
  type AuthRequest,
} from "../../common/middleware/auth.js";
import { userRole } from "../../common/enum/role.enum.js";

const order_router = Router();
order_router.use(auth);
=======
import { userRole } from "../../common/enum/role.enum.js";

import { auth } from "../../common/middleware/auth.js";
import { authorization } from "../../common/middleware/authorization.middleware.js";

const order_router = Router();

// Validation middleware
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
const validate = (
  schema: Joi.ObjectSchema,
  source: "body" | "params" | "query",
) => {
<<<<<<< HEAD
  return (req: Request, res: Response, next: NextFunction) => {
    const { error, value } = schema.validate(req[source], {
      abortEarly: false,
      convert: true,
    });

    if (error) {
      return res.status(400).json({
        message: "Validation error",
        errors: error.details.map((detail) => detail.message),
      });
    }
=======
    return (
        req: Request,
        res: Response,
        next: NextFunction
    ) => {
        const { error, value } = schema.validate(req[source], {
            abortEarly: false,
            convert: true
        });

        if (error) {
            return res.status(400).json({
                message: "Validation error",
                errors: error.details.map(
                    (detail) => detail.message
                )
            });
        }
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

    if (source === "body") {
      req.body = value;
    }

    next();
  };
};

// Create order: USER only
order_router.post(
<<<<<<< HEAD
  "/",
  authorize(userRole.user),
  validate(create_order_schema, "body"),
  async (req: AuthRequest, res: Response) => {
    try {
      const order = await create_order_service({
        ...req.body,
        customer: req.user!.id,
      });
=======
    "/",
    auth,
    authorization(userRole.user),
    validate(create_order_schema, "body"),
    async (req: Request, res: Response) => {
        try {
            const order = await create_order_service({
                ...req.body,
                customer: req.user!.id
            });
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      return res.status(201).json({
        message: "Order created successfully",
        order,
      });
    } catch (error) {
      const message =
        error instanceof Error ? error.message : "Error creating order";

<<<<<<< HEAD
      if (message.startsWith("Service not found")) {
        return res.status(404).json({ message });
      }
=======
            if (
                message.startsWith("Service not found") ||
                message.startsWith("Pickup address not found")
            ) {
                return res.status(404).json({ message });
            }
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      if (message.startsWith("Service is unavailable")) {
        return res.status(422).json({ message });
      }

<<<<<<< HEAD
      if (
        message === "Invalid pickup schedule" ||
        message === "Invalid delivery schedule"
      ) {
        return res.status(400).json({ message });
      }
=======
            if (
                message.includes("schedule") ||
                message.includes("Time slot") ||
                message.includes("Quantity") ||
                message.includes("Invalid") ||
                message.includes("must contain")
            ) {
                return res.status(400).json({ message });
            }
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      return res.status(500).json({
        message: "Error creating order",
      });
    }
  },
);

// Get all orders: ADMIN only
order_router.get(
<<<<<<< HEAD
  "/",
  authorize(userRole.admin),
  validate(get_orders_schema, "query"),
  async (req: Request, res: Response) => {
    try {
      const status = req.query.status as OrderStatus | undefined;
      const orders = await get_all_orders_service(status);
=======
    "/",
    auth,
    authorization(userRole.admin),
    validate(get_orders_schema, "query"),
    async (req: Request, res: Response) => {
        try {
            const status = req.query.status as
                | OrderStatus
                | undefined;

            const orders = await get_all_orders_service(status);
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      return res.status(200).json({
        message: "Orders fetched successfully",
        orders,
      });
    } catch {
      return res.status(500).json({
        message: "Error fetching orders",
      });
    }
  },
);

// Get customer orders:
// USER can access their own orders.
// ADMIN can access any customer's orders.
order_router.get(
<<<<<<< HEAD
  "/customer/:customerId",
  authorize(userRole.admin, userRole.user),
  validate(get_customer_orders_schema, "params"),
  async (req: AuthRequest, res: Response) => {
    try {
      const customerId = req.params.customerId;
=======
    "/customer/:customerId",
    auth,
    authorization(userRole.user, userRole.admin),
    validate(get_customer_orders_schema, "params"),
    async (req: Request, res: Response) => {
        try {
            const customerId = req.params.customerId;
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      if (
        typeof customerId !== "string" ||
        !mongoose.Types.ObjectId.isValid(customerId)
      ) {
        return res.status(400).json({
          message: "Invalid Customer ID",
        });
      }

<<<<<<< HEAD
      if (
        req.user!.aud === userRole.user &&
        req.user!.id !== req.params.customerId
      ) {
        return res.status(403).json({
          message: "You are not allowed to access these orders",
        });
      }
=======
            if (
                req.user!.role === userRole.user &&
                req.user!.id !== customerId
            ) {
                return res.status(403).json({
                    message: "You can only access your own orders"
                });
            }

            const orders =
                await get_customer_orders_service(customerId);
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      const orders = await get_customer_orders_service(customerId);

      return res.status(200).json({
        message: "Customer orders fetched successfully",
        orders,
      });
    } catch {
      return res.status(500).json({
        message: "Error fetching customer orders",
      });
    }
  },
);

// Update pickup: USER only.
// update_pickup_service must verify order ownership.
order_router.patch(
    "/:orderId/pickup",
    auth,
    authorization(userRole.user),
    validate(get_order_by_id_schema, "params"),
    validate(update_pickup_schema, "body"),
    async (req: Request, res: Response) => {
        try {
            const orderId = req.params.orderId;

            if (
                typeof orderId !== "string" ||
                !mongoose.Types.ObjectId.isValid(orderId)
            ) {
                return res.status(400).json({
                    message: "Invalid Order ID"
                });
            }

            const order = await update_pickup_service(
                orderId,
                req.user!.id,
                req.body
            );

            return res.status(200).json({
                message: "Pickup updated successfully",
                order
            });
        } catch (error) {
            const message = error instanceof Error
                ? error.message
                : "Error updating pickup";

            if (message === "Order not found") {
                return res.status(404).json({ message });
            }

            if (
                message === "Invalid ID" ||
                message === "Invalid schedule date" ||
                message === "Time slot is required"
            ) {
                return res.status(400).json({ message });
            }

            if (
                message.startsWith("Pickup address not found") ||
                message.startsWith("Pickup cannot be modified")
            ) {
                return res.status(422).json({ message });
            }

            return res.status(500).json({
                message: "Error updating pickup"
            });
        }
    }
);

// Get order by ID:
// ADMIN can access any order.
// USER can access their own order only.
order_router.get(
<<<<<<< HEAD
  "/:orderId",
  authorize(userRole.admin, userRole.user),
  validate(get_order_by_id_schema, "params"),
  async (req: AuthRequest, res: Response) => {
    try {
      const orderId = req.params.orderId;
=======
    "/:orderId",
    auth,
    authorization(userRole.user, userRole.admin),
    validate(get_order_by_id_schema, "params"),
    async (req: Request, res: Response) => {
        try {
            const orderId = req.params.orderId;
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      if (
        typeof orderId !== "string" ||
        !mongoose.Types.ObjectId.isValid(orderId)
      ) {
        return res.status(400).json({
          message: "Invalid Order ID",
        });
      }

<<<<<<< HEAD
      const order = await get_order_by_id_service(orderId);
=======
            const order =
                await get_order_by_id_service(orderId);
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      if (!order) {
        return res.status(404).json({
          message: "Order not found",
        });
      }

<<<<<<< HEAD
      if (
        req.user!.aud === userRole.user &&
        String((order.customer as any)?._id) !== req.user!.id
      ) {
        return res.status(403).json({
          message: "You are not allowed to access this order",
        });
      }

      return res.status(200).json({
        message: "Order fetched successfully",
        order,
      });
    } catch {
      return res.status(500).json({
        message: "Error fetching order",
      });
=======
            // Handle both populated and non-populated customer references.
            const customer = order.customer as unknown as {
                _id?: mongoose.Types.ObjectId | string;
            } | mongoose.Types.ObjectId | string;

            const orderCustomerId =
                typeof customer === "object" &&
                customer !== null &&
                "_id" in customer
                    ? String(customer._id)
                    : String(customer);

            if (
                req.user!.role === userRole.user &&
                orderCustomerId !== req.user!.id
            ) {
                return res.status(403).json({
                    message: "You can only access your own orders"
                });
            }

            return res.status(200).json({
                message: "Order fetched successfully",
                order
            });
        } catch {
            return res.status(500).json({
                message: "Error fetching order"
            });
        }
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
    }
  },
);

// Update order status: ADMIN only
order_router.patch(
<<<<<<< HEAD
  "/:orderId/status",
  authorize(userRole.admin),
  validate(get_order_by_id_schema, "params"),
  validate(update_order_status_schema, "body"),
  async (req: Request, res: Response) => {
    try {
      const orderId = req.params.orderId;
=======
    "/:orderId/status",
    auth,
    authorization(userRole.admin),
    validate(get_order_by_id_schema, "params"),
    validate(update_order_status_schema, "body"),
    async (req: Request, res: Response) => {
        try {
            const orderId = req.params.orderId;
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e

      if (
        typeof orderId !== "string" ||
        !mongoose.Types.ObjectId.isValid(orderId)
      ) {
        return res.status(400).json({
          message: "Invalid Order ID",
        });
      }

      const order = await update_order_status_service(orderId, req.body.status);

      return res.status(200).json({
        message: "Order status updated successfully",
        order,
      });
    } catch (error) {
      const message =
        error instanceof Error ? error.message : "Error updating order status";

      if (message === "Order not found") {
        return res.status(404).json({ message });
      }

      if (message.startsWith("Invalid status transition")) {
        return res.status(422).json({ message });
      }

      return res.status(500).json({
        message: "Error updating order status",
      });
    }
  },
);

export default order_router;
