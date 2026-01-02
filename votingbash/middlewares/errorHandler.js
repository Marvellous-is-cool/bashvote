const fs = require("fs");
const path = require("path");

// Centralized error handler middleware
module.exports = function errorHandler(options = {}) {
  const {
    logToFile = false,
    logPath = path.join(__dirname, "../logs/error.log"),
  } = options;

  if (logToFile) {
    // ensure log directory exists
    try {
      fs.mkdirSync(path.dirname(logPath), { recursive: true });
    } catch (err) {
      console.warn("Could not create log directory:", err.message);
    }
  }

  return (err, req, res, next) => {
    const time = new Date().toISOString();
    const message = `${time} - Error: ${err.message}\nStack: ${err.stack}\nRequest: ${req.method} ${req.originalUrl}\n`;
    console.error(message);

    if (logToFile) {
      try {
        fs.appendFileSync(logPath, message + "\n");
      } catch (writeErr) {
        console.error("Failed to write to error log:", writeErr.message);
      }
    }

    // Render a friendly error page in production, JSON in APIs
    if (req.xhr || req.headers.accept?.includes("application/json")) {
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      // Keep the app running — send a 500 page
      res.status(500).render("suspended");
    }
  };
};
