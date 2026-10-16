
import { Schema, model } from "mongoose";
import { I_address } from "../../common/interface/address.interface.js";

const address_schema = new Schema<I_address>(
    {
        customer: {
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true,
        },

        street: {
            type: String,
            required: true,
            trim: true,
            minlength: 3,
            maxlength: 200,
        },

        city: {
            type: String,
            required: true,
            trim: true,
            minlength: 2,
            maxlength: 100,
        },

        building: {
            type: String,
            trim: true,
            maxlength: 50,
        },

        apartment: {
            type: String,
            trim: true,
            maxlength: 50,
        },

        floor: {
            type: String,
            trim: true,
            maxlength: 20,
        },

        additionalInfo: {
            type: String,
            trim: true,
            maxlength: 300,
        },

        isDefault: {
            type: Boolean,
            default: false,
        },
    },
    {
        timestamps: true,
    }
);

const address_model = model<I_address>(
    "Address",
    address_schema
);

export default address_model;
