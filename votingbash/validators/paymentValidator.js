// validators/paymentValidator.js
const { z } = require("zod");

/**
 * Schema for the payment initiation request body.
 * Validates email format and optional amount (defaults to 100 NGN).
 */
const initiatePaymentSchema = z.object({
  email: z
    .string({ required_error: "Email address is required" })
    .email("Please provide a valid email address")
    .max(255, "Email address is too long")
    .toLowerCase()
    .trim(),

  amount: z
    .union([z.string(), z.number()])
    .transform((v) => (typeof v === "string" ? parseFloat(v) : v))
    .refine((v) => !isNaN(v) && v > 0, {
      message: "Amount must be a positive number",
    })
    .optional()
    .default(100), // default 100 NGN → 10000 kobo
});

module.exports = { initiatePaymentSchema };
