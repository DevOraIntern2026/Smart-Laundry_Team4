
import {
    Router,
    type Request,
    type Response,
    type NextFunction
} from "express";

import mongoose from "mongoose";
import Joi from "joi";

import {
    create_order_service,
    get_all_orders_service,
    get_order_by_id_service,
    get_customer_orders_service,
    update_order_status_service,
    update_pickup_service
} from "./order_service.js";

import {
    create_order_schema,
    get_order_by_id_schema,
    get_customer_orders_schema,
    get_orders_schema,
    update_order_status_schema,
    update_pickup_schema
} from "./order.validation.js";

import { OrderStatus } from "../../common/enum/order.enum.js";
import { userRole } from "../../common/enum/role.enum.js";

import { auth } from "../../common/middleware/auth.js";
import { authorization } from "../../common/middleware/authorization.middleware.js";

const order_router = Router();

// Validation middleware
const validate = (
    schema: Joi.ObjectSchema,
    source: "body" | "params" | "query"
) => {
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

        if (source === "body") {
            req.body = value;
        }

        next();
    };
};

// Create order: USER only
order_router.post(
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

            return res.status(201).json({
                message: "Order created successfully",
                order
            });
        } catch (error) {
            const message = error instanceof Error
                ? error.message
                : "Error creating order";

            if (
                message.startsWith("Service not found") ||
                message.startsWith("Pickup address not found")
            ) {
                return res.status(404).json({ message });
            }

            if (message.startsWith("Service is unavailable")) {
                return res.status(422).json({ message });
            }

            if (
                message.includes("schedule") ||
                message.includes("Time slot") ||
                message.includes("Quantity") ||
                message.includes("Invalid") ||
                message.includes("must contain")
            ) {
                return res.status(400).json({ message });
            }

            return res.status(500).json({
                message: "Error creating order"
            });
        }
    }
);

// Get all orders: ADMIN only
order_router.get(
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

            return res.status(200).json({
                message: "Orders fetched successfully",
                orders
            });
        } catch {
            return res.status(500).json({
                message: "Error fetching orders"
            });
        }
    }
);

// Get customer orders:
// USER can access their own orders.
// ADMIN can access any customer's orders.
order_router.get(
    "/customer/:customerId",
    auth,
    authorization(userRole.user, userRole.admin),
    validate(get_customer_orders_schema, "params"),
    async (req: Request, res: Response) => {
        try {
            const customerId = req.params.customerId;

            if (
                typeof customerId !== "string" ||
                !mongoose.Types.ObjectId.isValid(customerId)
            ) {
                return res.status(400).json({
                    message: "Invalid Customer ID"
                });
            }

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

            return res.status(200).json({
                message: "Customer orders fetched successfully",
                orders
            });
        } catch {
            return res.status(500).json({
                message: "Error fetching customer orders"
            });
        }
    }
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
    "/:orderId",
    auth,
    authorization(userRole.user, userRole.admin),
    validate(get_order_by_id_schema, "params"),
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

            const order =
                await get_order_by_id_service(orderId);

            if (!order) {
                return res.status(404).json({
                    message: "Order not found"
                });
            }

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
    }
);

// Update order status: ADMIN only
order_router.patch(
    "/:orderId/status",
    auth,
    authorization(userRole.admin),
    validate(get_order_by_id_schema, "params"),
    validate(update_order_status_schema, "body"),
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

            const order = await update_order_status_service(
                orderId,
                req.body.status
            );

            return res.status(200).json({
                message: "Order status updated successfully",
                order
            });
        } catch (error) {
            const message = error instanceof Error
                ? error.message
                : "Error updating order status";

            if (message === "Order not found") {
                return res.status(404).json({ message });
            }

            if (message.startsWith("Invalid status transition")) {
                return res.status(422).json({ message });
            }

            return res.status(500).json({
                message: "Error updating order status"
            });
        }
    }
);

export default order_router;
