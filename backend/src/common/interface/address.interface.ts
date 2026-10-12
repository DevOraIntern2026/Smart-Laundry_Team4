
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
}
