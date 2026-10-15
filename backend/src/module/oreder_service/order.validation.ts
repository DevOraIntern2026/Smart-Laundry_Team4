import Joi from "joi";
import { OrderStatus } from "../../common/enum/order.enum.js";

const objectId_schema = Joi.string().hex().length(24);

const schedule_schema = Joi.object({
  date: Joi.date().iso().required(),

  timeSlot: Joi.string().trim().min(1).required(),
});

export const create_order_schema = Joi.object({
  customer: objectId_schema.optional(),

  items: Joi.array()
    .items(
      Joi.object({
        service: objectId_schema.required(),

        item: objectId_schema.required(),

        quantity: Joi.number().integer().min(1).required(),
      }),
    )
    .min(1)
    .required(),

  pickupAddress: objectId_schema.required(),

  pickupSchedule: schedule_schema.required(),

  deliverySchedule: schedule_schema.required(),
}).custom((value, helpers) => {
  const pickupDate = new Date(value.pickupSchedule.date);
  const deliveryDate = new Date(value.deliverySchedule.date);

  if (pickupDate < new Date()) {
    return helpers.error("any.invalid", {
      message: "Pickup date cannot be in the past",
    });
  }

  if (deliveryDate < pickupDate) {
    return helpers.error("any.invalid", {
      message: "Delivery date cannot be before pickup date",
    });
  }

  return value;
});

export const update_pickup_schema = Joi.object({
  date: Joi.date().iso().min("now").required(),

  timeSlot: Joi.string().trim().min(1).required(),

  addressId: objectId_schema.required(),
});

export const get_order_by_id_schema = Joi.object({
  orderId: objectId_schema.required(),
});

export const get_customer_orders_schema = Joi.object({
  customerId: objectId_schema.required(),
});

export const update_order_status_schema = Joi.object({
  status: Joi.string()
    .valid(...Object.values(OrderStatus))
    .required(),
});

export const get_orders_schema = Joi.object({
  status: Joi.string()
    .valid(...Object.values(OrderStatus))
    .optional(),
});