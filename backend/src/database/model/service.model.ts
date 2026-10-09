import { model, Schema } from "mongoose";
import { I_service } from "../../common/interface/service.interface.js";

import { userRole } from "../../common/enum/role.enum";
import { timeStamp } from "node:console";
import { Types } from "mysql2";

const service_schema = new Schema(
    {
        name: {
            type: String,
            required: true,
            trim: true,
            minlength: 2,
            maxlength: 100
        },
        description: {
            type: String,
            required: true,
            trim: true,
            minlength: 5
        },
        price: {
            type: Number,
            required: true,
            min: 0.01
        },
        isAvailable: {
            type: Boolean,
            default: true
        },
        creator: {
            type: Schema.Types.ObjectId,
            ref: "User",
            required: true
        }
    },
    {
        timestamps: true
    }
);



const service_model = model<I_service>("service", service_schema);
export default service_model;