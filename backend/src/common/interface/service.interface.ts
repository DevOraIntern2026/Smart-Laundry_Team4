import { Types } from "mongoose";

export interface I_service {
    name:String;
    price:Number;
    isAvailable: boolean;
    creator:  Types.ObjectId;
    description:String;
}