import z from "zod";

export const signUpSchema = {
  body: z.strictObject({
    email: z.string().email({ error: "Please enter a valid email address" }),

    password: z
      .string()
      .min(5, { error: "Password must be at least 5 characters" })
      .max(20, { error: "Password must not exceed 20 characters" }),

    firstName: z
      .string()
      .min(2, { error: "First name must be at least 2 characters" }),

    lastName: z
      .string()
      .min(2, { error: "Last name must be at least 2 characters" }),

    age: z
      .number()
      .min(18, { error: "Age must be at least 18" })
      .max(100, { error: "Age must not exceed 100" }),

    phoneNumber: z.string().optional(),
  }),
};

export const loginSchema = {
  body: z.strictObject({
    email: z.string().email({ error: "Please enter a valid email address" }),

    password: z
      .string()
      .min(5, { error: "Password must be at least 5 characters" })
      .max(20, { error: "Password must not exceed 20 characters" }),
  }),
};

export const verifyOTPSchema = {
  body: z.strictObject({
    userId: z.string(),
    otp: z.string().length(6, {
      error: "OTP must be exactly 6 digits",
    }),
  }),
};
