
import { Schema, model } from "mongoose";
import { I_order } from "../../common/interface/order.interface.js";
import { OrderStatus } from "../../common/enum/order.enum.js";

const order_item_schema = new Schema(
    {
        service: {
            type: Schema.Types.ObjectId,
            ref: "Service",
            required: true
        },
        item: {
            type: Schema.Types.ObjectId,
            ref: "LaundryItem",
            required: true
        },
        quantity: {
            type: Number,
            required: true,
            min: 1
        },
        unitPrice: {
            type: Number,
            required: true,
            min: 0.01
        }
    },
    {
        _id: false
    }
);

const order_schedule_schema = new Schema(
    {
        date: {
            type: Date,
            required: true
        },
        timeSlot: {
            type: String,
            required: true,
            trim: true
        }
    },
    {
        _id: false
    }
);

const order_schema = new Schema<I_order>(
    {
        customer: {
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true
        },
        items: {
            type: [order_item_schema],
            required: true,
            validate: {
                validator: (items: unknown[]) => items.length > 0,
                message: "Order must contain at least one item"
            }
        },
        totalPrice: {
            type: Number,
            required: true,
            min: 0.01
        },
        pickupAddress: {
            type: Schema.Types.ObjectId,
            ref: "Address",
            required: true
        },
        pickupSchedule: {
            type: order_schedule_schema,
            required: true
        },
        deliverySchedule: {
            type: order_schedule_schema,
            required: true
        },
        status: {
            type: String,
            enum: Object.values(OrderStatus),
            default: OrderStatus.PLACED,
            required: true
        }
    },
    {
        timestamps: true
    }
);

const order_model = model<I_order>("Order", order_schema);

export default order_model;
