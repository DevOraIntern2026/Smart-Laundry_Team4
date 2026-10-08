import { model, Schema } from "mongoose";
import { I_service } from "../../common/interface/service.interface.js";

import { userRole } from "../../common/enum/role.enum";
import { timeStamp } from "node:console";
import { Types } from "mysql2";


export const service_schema = new Schema<I_service>({
        creator:{
            type:Schema.Types.ObjectId,
            ref:"User",
            required:true,
        },
    name:{
        type:String,
        required:true,
        trim:true,
    },
    description:{
        type:String,
        required:true
    },
    price:{
        type:Number,
        required:true,
        min:0,
    }


},{timestamps:true,})



const service_model = model<I_service>("service", service_schema);
export default service_model;