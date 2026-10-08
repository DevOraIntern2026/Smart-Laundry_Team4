import { Types } from "mongoose";

export interface I_service {
    name:String;
    price:Number;
    creator:  Types.ObjectId;;
    description:String;
}