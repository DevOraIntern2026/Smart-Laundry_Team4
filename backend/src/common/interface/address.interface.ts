import { Types } from "mongoose";
export interface IAddress {
  user: Types.ObjectId;
  street: string;
  city: string;
  building: string;
  apartment?: string;
  isDefault: boolean;
}
