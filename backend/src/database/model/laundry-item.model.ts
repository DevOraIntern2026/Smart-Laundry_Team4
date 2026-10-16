import { model, Schema } from "mongoose";
import { I_laundry_item } from "../../common/interface/laundry-item.interface";

const laundry_item_schema = new Schema<I_laundry_item>(
  {
    name: {
      type: String,
      required: true,
      trim: true,
      minlength: 2,
      maxlength: 100,
    },
    description: {
      type: String,
      required: true,
      trim: true,
      minlength: 5,
    },
    category: {
      type: String,
      required: true,
      trim: true,
    },
    isAvailable: {
      type: Boolean,
      default: true,
    },
  },
  {
    timestamps: true,
  },
);

export const laundry_item_model = model<I_laundry_item>(
  "LaundryItem",
  laundry_item_schema,
);
