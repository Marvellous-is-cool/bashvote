// validators/contestantValidator.js
const { z } = require("zod");

/**
 * Schema for adding a new contestant (admin form).
 * The photo file is handled separately by express-fileupload,
 * so it is not part of the body schema.
 */
const addContestantSchema = z.object({
  contestantName: z
    .string({ required_error: "Contestant name is required" })
    .min(1, "Contestant name cannot be empty")
    .max(100, "Contestant name is too long")
    .trim(),

  contestantLevel: z
    .string()
    .max(100, "Level value is too long")
    .optional()
    .transform((v) => v?.trim()),

  contestantDepartment: z
    .string()
    .max(100, "Department value is too long")
    .optional()
    .transform((v) => v?.trim()),

  selectedAwardId: z
    .string({ required_error: "Award selection is required" })
    .min(1, "Please select an award")
    .transform((v) => parseInt(v, 10))
    .refine((v) => !isNaN(v) && v > 0, { message: "Invalid award ID" }),
});

/**
 * Schema for editing an existing contestant.
 * votes is coerced to a non-negative integer.
 */
const editContestantSchema = z.object({
  nickname: z
    .string({ required_error: "Nickname is required" })
    .min(1, "Nickname cannot be empty")
    .max(100, "Nickname is too long")
    .trim(),

  department: z
    .string()
    .max(100, "Department is too long")
    .optional()
    .transform((v) => v?.trim()),

  level: z
    .string()
    .max(100, "Level is too long")
    .optional()
    .transform((v) => v?.trim()),

  votes: z
    .union([z.string(), z.number()])
    .transform((v) => (typeof v === "string" ? parseInt(v, 10) : v))
    .refine((v) => !isNaN(v) && v >= 0, {
      message: "Votes must be a non-negative number",
    })
    .optional()
    .default(0),
});

module.exports = { addContestantSchema, editContestantSchema };
