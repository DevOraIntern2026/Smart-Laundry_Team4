
import Joi from "joi";

export const create_service_schema = Joi.object({
    name: Joi.string()
        .trim()
        .min(2)
        .max(100)
        .required(),

    description: Joi.string()
        .trim()
        .min(5)
        .required(),

    price: Joi.number()
        .positive()
        .required(),

    email: Joi.string()
        .email()
        .required()
});

export const get_user_services_schema = Joi.object({
    email: Joi.string()
        .email()
        .required()
});

export const delete_service_schema = Joi.object({
    serviceId: Joi.string()
        .hex()
        .length(24)
        .required()
});

export const get_service_by_id_schema = Joi.object({
    serviceId: Joi.string()
        .hex()
        .length(24)
        .required()
});

export const update_service_schema = Joi.object({
    serviceId: Joi.string()
        .hex()
        .length(24)
        .required(),

    name: Joi.string()
        .trim()
        .min(2)
        .max(100),

    description: Joi.string()
        .trim()
        .min(5),

    price: Joi.number()
        .positive(),

    isAvailable: Joi.boolean()
}).min(2);

export const get_available_services_schema = Joi.object({});

export const get_all_services_schema = Joi.object({});
