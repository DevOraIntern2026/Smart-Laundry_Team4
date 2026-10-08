
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
