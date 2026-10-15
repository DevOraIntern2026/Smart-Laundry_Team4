<<<<<<< HEAD
import { Types } from "mongoose";
export interface IAddress {
  user: Types.ObjectId;
  street: string;
  city: string;
  building: string;
  apartment?: string;
  isDefault: boolean;
=======

import { Types } from "mongoose";

export interface I_address {
    customer: Types.ObjectId;
    street: string;
    city: string;
    building?: string;
    apartment?: string;
    floor?: string;
    additionalInfo?: string;
    isDefault: boolean;
>>>>>>> c745c93190463eac63d3cb1bbe257e1c2294253e
}
