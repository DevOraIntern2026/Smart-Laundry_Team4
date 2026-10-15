import { Types } from "mongoose";

export interface IAddress {
  user: Types.ObjectId;
  street: string;
  city: string;
  building: string;
  apartment?: string;
  isDefault: boolean;
}

export interface I_address {
  customer: Types.ObjectId;
  street: string;
  city: string;
  building?: string;
  apartment?: string;
  floor?: string;
  additionalInfo?: string;
  isDefault: boolean;
}
