import { Types } from "mongoose";
import service_model from "../../database/model/service.model.js";
import order_model from "../../database/model/Order.model.js";
import { OrderStatus } from "../../common/enum/order.enum.js";

interface I_create_order_data {
    customer: string;
    items: {
        service: string;
        item: string;
        quantity: number;
    }[];
    pickupAddress: string;
    pickupSchedule: {
        date: Date | string;
        timeSlot: string;
    };
    deliverySchedule: {
        date: Date | string;
        timeSlot: string;
    };
}

const allowed_transitions: Record<OrderStatus, OrderStatus[]> = {
    [OrderStatus.PLACED]: [OrderStatus.PICKUP_SCHEDULED],
    [OrderStatus.PICKUP_SCHEDULED]: [OrderStatus.PICKED_UP],
    [OrderStatus.PICKED_UP]: [OrderStatus.PROCESSING],
    [OrderStatus.PROCESSING]: [OrderStatus.READY_FOR_DELIVERY],
    [OrderStatus.READY_FOR_DELIVERY]: [OrderStatus.OUT_FOR_DELIVERY],
    [OrderStatus.OUT_FOR_DELIVERY]: [OrderStatus.COMPLETED],
    [OrderStatus.COMPLETED]: []
};

export const create_order_service = async (
    data: I_create_order_data
) => {
    const pickupDate = new Date(data.pickupSchedule.date);
    const deliveryDate = new Date(data.deliverySchedule.date);

    if (
        Number.isNaN(pickupDate.getTime()) ||
        pickupDate < new Date()
    ) {
        throw new Error("Invalid pickup schedule");
    }

    if (
        Number.isNaN(deliveryDate.getTime()) ||
        deliveryDate < pickupDate
    ) {
        throw new Error("Invalid delivery schedule");
    }

    const order_items: {
        service: Types.ObjectId;
        item: Types.ObjectId;
        quantity: number;
        unitPrice: number;
    }[] = [];

    let totalPrice = 0;

    for (const order_item of data.items) {
        const service = await service_model.findById(order_item.service);

        if (!service) {
            throw new Error(`Service not found: ${order_item.service}`);
        }

        if (service.isAvailable === false) {
            throw new Error(`Service is unavailable: ${service._id}`);
        }

        const unitPrice = Number(service.price);
        const quantity = order_item.quantity;

        if (!Number.isFinite(unitPrice) || unitPrice <= 0) {
            throw new Error("Invalid service price");
        }

        totalPrice += unitPrice * quantity;

        order_items.push({
            service: service._id,
            item: new Types.ObjectId(order_item.item),
            quantity,
            unitPrice
        });
    }

    const order = await order_model.create({
        customer: new Types.ObjectId(data.customer),
        items: order_items,
        totalPrice,
        pickupAddress: new Types.ObjectId(data.pickupAddress),
        pickupSchedule: {
            date: pickupDate,
            timeSlot: data.pickupSchedule.timeSlot
        },
        deliverySchedule: {
            date: deliveryDate,
            timeSlot: data.deliverySchedule.timeSlot
        },
        status: OrderStatus.PLACED
    });

    return order;
};

export const get_all_orders_service = async (
    status?: OrderStatus
) => {
    const filter: { status?: OrderStatus } = {};

    if (status) {
        filter.status = status;
    }

    return order_model
        .find(filter)
        .populate("customer")
        .populate("pickupAddress")
        .populate("items.service")
        .populate("items.item")
        .sort({ createdAt: -1 });
};

export const get_order_by_id_service = async (
    orderId: string
) => {
    return order_model
        .findById(orderId)
        .populate("customer")
        .populate("pickupAddress")
        .populate("items.service")
        .populate("items.item");
};

export const get_customer_orders_service = async (
    customerId: string
) => {
    return order_model
        .find({ customer: customerId })
        .populate("pickupAddress")
        .populate("items.service")
        .populate("items.item")
        .sort({ createdAt: -1 });
};

export const update_order_status_service = async (
    orderId: string,
    status: OrderStatus
) => {
    const order = await order_model.findById(orderId);

    if (!order) {
        throw new Error("Order not found");
    }

    const allowed = allowed_transitions[order.status] ?? [];

    if (!allowed.includes(status)) {
        throw new Error(
            `Invalid status transition from ${order.status} to ${status}`
        );
    }

    order.status = status;

    await order.save();

    return order;
};