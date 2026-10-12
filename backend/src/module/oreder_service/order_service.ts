
import { Types } from "mongoose";
import service_model from "../../database/model/service.model.js";
import order_model from "../../database/model/Order.model.js";
import address_model from "../../database/model/addrees_model.js";
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

interface I_update_pickup_data {
    date: Date | string;
    timeSlot: string;
    addressId: string;
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

const validate_schedule = (
    date: Date | string,
    timeSlot: string
): Date => {
    const parsedDate = new Date(date);

    if (
        Number.isNaN(parsedDate.getTime()) ||
        parsedDate < new Date()
    ) {
        throw new Error("Invalid schedule date");
    }

    if (typeof timeSlot !== "string" || !timeSlot.trim()) {
        throw new Error("Time slot is required");
    }

    return parsedDate;
};

export const create_order_service = async (
    data: I_create_order_data
) => {
    if (!Types.ObjectId.isValid(data.customer)) {
        throw new Error("Invalid customer ID");
    }

    if (!Types.ObjectId.isValid(data.pickupAddress)) {
        throw new Error("Invalid pickup address ID");
    }

    if (!Array.isArray(data.items) || data.items.length === 0) {
        throw new Error("Order must contain at least one item");
    }

    const pickupDate = validate_schedule(
        data.pickupSchedule.date,
        data.pickupSchedule.timeSlot
    );

    const deliveryDate = validate_schedule(
        data.deliverySchedule.date,
        data.deliverySchedule.timeSlot
    );

    if (deliveryDate < pickupDate) {
        throw new Error(
            "Delivery date cannot be before pickup date"
        );
    }

    const order_items: {
        service: Types.ObjectId;
        item: Types.ObjectId;
        quantity: number;
        unitPrice: number;
    }[] = [];

    let totalPrice = 0;

    for (const order_item of data.items) {
        if (
            !Types.ObjectId.isValid(order_item.service) ||
            !Types.ObjectId.isValid(order_item.item)
        ) {
            throw new Error("Invalid service or item ID");
        }

        if (
            !Number.isInteger(order_item.quantity) ||
            order_item.quantity < 1
        ) {
            throw new Error("Quantity must be a positive integer");
        }

        const service = await service_model.findById(
            order_item.service
        );

        if (!service) {
            throw new Error(
                `Service not found: ${order_item.service}`
            );
        }

        if (!service.isAvailable) {
            throw new Error(
                `Service is unavailable: ${service._id}`
            );
        }

        const unitPrice = Number(service.price);

        if (!Number.isFinite(unitPrice) || unitPrice <= 0) {
            throw new Error("Invalid service price");
        }

        totalPrice += unitPrice * order_item.quantity;

        order_items.push({
            service: service._id,
            item: new Types.ObjectId(order_item.item),
            quantity: order_item.quantity,
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
            timeSlot: data.pickupSchedule.timeSlot.trim()
        },
        deliverySchedule: {
            date: deliveryDate,
            timeSlot: data.deliverySchedule.timeSlot.trim()
        },
        status: OrderStatus.PLACED
    });

    return order;
};

export const update_pickup_service = async (
    orderId: string,
    customerId: string,
    data: I_update_pickup_data
) => {
    if (
        !Types.ObjectId.isValid(orderId) ||
        !Types.ObjectId.isValid(customerId) ||
        !Types.ObjectId.isValid(data.addressId)
    ) {
        throw new Error("Invalid ID");
    }

    const pickupDate = validate_schedule(
        data.date,
        data.timeSlot
    );

    const order = await order_model.findOne({
        _id: orderId,
        customer: customerId
    });

    if (!order) {
        throw new Error("Order not found");
    }

    if (
        order.status !== OrderStatus.PLACED &&
        order.status !== OrderStatus.PICKUP_SCHEDULED
    ) {
        throw new Error(
            "Pickup cannot be modified at this order status"
        );
    }

    const address = await address_model.findOne({
        _id: data.addressId,
        customer: customerId
    });

    if (!address) {
        throw new Error(
            "Pickup address not found or does not belong to customer"
        );
    }

    order.pickupSchedule = {
        date: pickupDate,
        timeSlot: data.timeSlot.trim()
    };

    order.pickupAddress = new Types.ObjectId(data.addressId);

    await order.save();

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
    if (!Types.ObjectId.isValid(orderId)) {
        throw new Error("Invalid order ID");
    }

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
    if (!Types.ObjectId.isValid(customerId)) {
        throw new Error("Invalid customer ID");
    }

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
    if (!Types.ObjectId.isValid(orderId)) {
        throw new Error("Invalid order ID");
    }

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
