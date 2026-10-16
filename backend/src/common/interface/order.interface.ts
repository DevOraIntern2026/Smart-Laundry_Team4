
import { Types } from "mongoose";
import { OrderStatus } from "../enum/order.enum.js";

export interface I_order_item {
    service: Types.ObjectId;
    item: Types.ObjectId;
    quantity: number;
    unitPrice: number;
}

export interface I_order_schedule {
    date: Date;
    timeSlot: string;
}

export interface I_order {
    customer: Types.ObjectId;
    items: I_order_item[];
    totalPrice: number;
    pickupAddress: Types.ObjectId;
    pickupSchedule: I_order_schedule;
    deliverySchedule: I_order_schedule;
    
    status: OrderStatus;
    createdAt?: Date;
    updatedAt?: Date;
}
