
import { Types } from "mongoose";
import service_model from "../../database/model/service.model.js";
import order_model from "../../database/model/Order.model.js";
import { OrderStatus } from "../../common/enum/order.enum.js";
import addressModel from "../../database/model/address.model.js";
import { laundry_item_model } from "../../database/model/laundry-item.model.js";
import {
  badRequest,
  notFound,
  unprocessableEntity,
} from "../../common/responce/error.responce.js";

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
  [OrderStatus.COMPLETED]: [],
};

export const create_order_service = async (data: I_create_order_data) => {
  const pickupDate = new Date(data.pickupSchedule.date);
  const deliveryDate = new Date(data.deliverySchedule.date);

  if (Number.isNaN(pickupDate.getTime()) || pickupDate < new Date()) {
    throw new badRequest("Invalid pickup schedule");
  }

  if (Number.isNaN(deliveryDate.getTime()) || deliveryDate < pickupDate) {
    throw new badRequest("Invalid delivery schedule");
  }

  if (!Types.ObjectId.isValid(data.customer)) {
    throw new badRequest("Invalid customer ID");
  }

  if (!Types.ObjectId.isValid(data.pickupAddress)) {
    throw new badRequest("Invalid address ID");
  }

  const address = await addressModel.findOne({
    _id: data.pickupAddress,
    user: data.customer,
  });

  if (!address) {
    throw new notFound("Address not found or does not belong to customer");
  }

  const order_items: {
    service: Types.ObjectId;
    item: Types.ObjectId;
    quantity: number;
    unitPrice: number;
  }[] = [];

  let totalPrice = 0;

  for (const order_item of data.items) {
    if (!Types.ObjectId.isValid(order_item.service)) {
      throw new badRequest("Invalid service ID");
    }

    const service = await service_model.findById(order_item.service);

    if (!service) {
      throw new notFound(`Service not found: ${order_item.service}`);
    }

    if (service.isAvailable === false) {
      throw new unprocessableEntity(`Service is unavailable: ${service._id}`);
    }

    if (!Types.ObjectId.isValid(order_item.item)) {
      throw new badRequest("Invalid laundry item ID");
    }

    const laundry_item = await laundry_item_model.findById(order_item.item);

    if (!laundry_item) {
      throw new notFound(`Laundry item not found: ${order_item.item}`);
    }

    if (laundry_item.isAvailable === false) {
      throw new unprocessableEntity(
        `Laundry item is unavailable: ${order_item.item}`,
      );
    }

    const unitPrice = Number(service.price);
    const quantity = order_item.quantity;

    if (!Number.isFinite(unitPrice) || unitPrice <= 0) {
      throw new unprocessableEntity("Invalid service price");
    }

    totalPrice += unitPrice * quantity;

    order_items.push({
      service: service._id,
      item: laundry_item._id,
      quantity,
      unitPrice,
    });
  }

  const order = await order_model.create({
    customer: new Types.ObjectId(data.customer),
    items: order_items,
    totalPrice,
    pickupAddress: address._id,
    pickupSchedule: {
      date: pickupDate,
      timeSlot: data.pickupSchedule.timeSlot,
    },
    deliverySchedule: {
      date: deliveryDate,
      timeSlot: data.deliverySchedule.timeSlot,
    },
    status: OrderStatus.PLACED,
  });

  return order;
};

export const get_all_orders_service = async (status?: OrderStatus) => {
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

export const update_pickup_service = async (
  orderId: string,
  customerId: string,
  data: I_update_pickup_data,
) => {
  if (
    !Types.ObjectId.isValid(orderId) ||
    !Types.ObjectId.isValid(customerId) ||
    !Types.ObjectId.isValid(data.addressId)
  ) {
    throw new badRequest("Invalid ID");
  }

  const pickupDate = new Date(data.date);

  if (Number.isNaN(pickupDate.getTime()) || pickupDate < new Date()) {
    throw new badRequest("Invalid schedule date");
  }

  if (typeof data.timeSlot !== "string" || !data.timeSlot.trim()) {
    throw new badRequest("Invalid time slot");
  }

  const order = await order_model.findOne({
    _id: orderId,
    customer: customerId,
  });

  if (!order) {
    throw new notFound("Order not found");
  }

  if (
    order.status !== OrderStatus.PLACED &&
    order.status !== OrderStatus.PICKUP_SCHEDULED
  ) {
    throw new unprocessableEntity(
      "Pickup cannot be modified at this order status",
    );
  }

  const address = await addressModel.findOne({
    _id: data.addressId,
    user: customerId,
  });

  if (!address) {
    throw new notFound("Address not found");
  }

  order.pickupSchedule = {
    date: pickupDate,
    timeSlot: data.timeSlot.trim(),
  };
  order.pickupAddress = address._id;

  await order.save();

  return order;
};

export const get_order_by_id_service = async (orderId: string) => {
  if (!Types.ObjectId.isValid(orderId)) {
    throw new badRequest("Invalid order ID");
  }

  return order_model
    .findById(orderId)
    .populate("customer")
    .populate("pickupAddress")
    .populate("items.service")
    .populate("items.item");
};

export const get_customer_orders_service = async (customerId: string) => {
  if (!Types.ObjectId.isValid(customerId)) {
    throw new badRequest("Invalid customer ID");
  }

  return order_model
    .find({ customer: customerId })
    .populate("customer")
    .populate("pickupAddress")
    .populate("items.service")
    .populate("items.item")
    .sort({ createdAt: -1 });
};

export const update_order_status_service = async (
  orderId: string,
  status: OrderStatus,
) => {
  if (!Types.ObjectId.isValid(orderId)) {
    throw new badRequest("Invalid order ID");
  }

  const order = await order_model.findById(orderId);

  if (!order) {
    throw new notFound("Order not found");
  }

  const allowed = allowed_transitions[order.status] ?? [];

  if (!allowed.includes(status)) {
    throw new unprocessableEntity(
      `Invalid status transition from ${order.status} to ${status}`,
    );
  }

  order.status = status;

  await order.save();

  return order;
};
