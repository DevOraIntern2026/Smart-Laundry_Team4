import { z } from "zod";

export const createAddressSchema = {
  body: z.strictObject({
    street: z.string().trim().min(2),

    city: z.string().trim().min(2),

    building: z.string().trim().min(1),

    apartment: z.string().trim().optional(),

    isDefault: z.boolean().optional(),
  }),
};
