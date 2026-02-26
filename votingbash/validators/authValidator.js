// validators/authValidator.js
const { z } = require("zod");

/**
 * Schema for admin login form submission.
 * Both fields are required non-empty strings; username is lowercased.
 */
const adminLoginSchema = z.object({
  username: z
    .string({ required_error: "Username is required" })
    .min(1, "Username cannot be empty")
    .transform((v) => v.toLowerCase().trim()),

  password: z
    .string({ required_error: "Password is required" })
    .min(1, "Password cannot be empty"),
});

module.exports = { adminLoginSchema };
