// validators/awardValidator.js
const { z } = require("zod");

/**
 * Schema for adding a new award title.
 */
const addAwardSchema = z.object({
  title: z
    .string({ required_error: "Award title is required" })
    .min(1, "Award title cannot be empty")
    .max(255, "Award title is too long")
    .trim(),

  description: z.string().max(1000, "Description is too long").optional(),
});

module.exports = { addAwardSchema };
