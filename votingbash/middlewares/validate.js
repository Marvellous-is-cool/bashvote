// middlewares/validate.js
// Generic Zod validation middleware factory.
// Usage: router.post('/route', validate(MyZodSchema), handler)

const { ZodError } = require("zod");

/**
 * Creates an Express middleware that validates req.body against a Zod schema.
 * On failure it responds with 400 and a JSON array of field-level errors.
 *
 * @param {import('zod').ZodTypeAny} schema - A Zod schema to validate against
 * @param {'body'|'params'|'query'} [source='body'] - Which request part to validate
 */
function validate(schema, source = "body") {
  return (req, res, next) => {
    const result = schema.safeParse(req[source]);

    if (!result.success) {
      const errors = result.error.errors.map((e) => ({
        field: e.path.join("."),
        message: e.message,
      }));

      // If the request expects JSON (API endpoint), respond with JSON
      if (req.xhr || req.headers.accept?.includes("application/json")) {
        return res.status(400).json({ success: false, errors });
      }

      // Otherwise flash errors and redirect back (form submissions)
      const firstError = errors[0]?.message || "Validation failed";
      req.flash("error", firstError);
      return res.redirect("back");
    }

    // Attach parsed (and coerced) data back onto the request
    req[source] = result.data;
    next();
  };
}

module.exports = validate;
