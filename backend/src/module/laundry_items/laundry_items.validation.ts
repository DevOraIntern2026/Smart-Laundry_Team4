import { z } from "zod";

export const createLaundryItemSchema = {
  body: z.strictObject({
    name: z.string().trim().min(2).max(100),
    description: z.string().trim().min(5),
    category: z.string().trim().min(1),
    isAvailable: z.boolean().optional(),
  }),
};
