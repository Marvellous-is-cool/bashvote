const express = require("express");
const session = require("express-session");
const MySQLStore = require("express-mysql-session")(session);
const bodyParser = require("body-parser");
const fileUpload = require("express-fileupload");
const flash = require("express-flash");
const connection = require("./models/connection");
const path = require("path");
const validator = require("validator");
const cors = require("cors");
require("dotenv").config(); // Load environment variables

const app = express();
const asyncHandler = require("./middlewares/asyncHandler");
const createErrorHandler = require("./middlewares/errorHandler");

// Load rate limiter module defensively so the app doesn't crash if the
// rate limiter module throws during initialization (e.g. incompatible store).
let generalLimiter = (req, res, next) => next();
let usingRedis = false;
try {
  const rl = require("./middlewares/rateLimiter");
  if (rl && rl.generalLimiter) {
    generalLimiter = rl.generalLimiter;
  }
  usingRedis = Boolean(rl && rl.usingRedis);
} catch (err) {
  console.error(
    "Warning: rate limiter failed to load, falling back to no-op limiter:",
    err && err.message ? err.message : err
  );
}

// Set the port using an environment variable or default to 3000
const port = process.env.PORT || 3000;

// Configure session middleware
const sessionSecret = process.env.SESSION_SECRET || "keyboard cat";
const sessionExpiration = 1000 * 60 * 60 * 20; // 20 hours
const sessionStore = new MySQLStore(
  {
    createDatabaseTable: true,
    schema: {
      tableName: "sessions",
      columnNames: {
        session_id: "session_id",
        expires: "expires",
        data: "data",
      },
    },
    expiration: sessionExpiration,
  },
  connection
);

app.use(
  session({
    key: "keyboard cat",
    secret: sessionSecret,
    store: sessionStore,
    resave: false,
    saveUninitialized: false,
    cookie: { maxAge: sessionExpiration },
  })
);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(flash());

app.set("view engine", "ejs");

// Serve static files
app.use(express.static("public"));
app.use(fileUpload({ tempFileDir: "/temp" }));
app.use(express.static("uploads"));
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

// Add validator to res.locals
app.use((req, res, next) => {
  res.locals.validator = validator;
  next();
});

app.use(cors()); // Enable CORS

app.use(express.json());

// Health check route for uptime monitoring
app.get(
  "/health",
  asyncHandler(async (req, res) => {
    // Simple DB ping to ensure DB is reachable
    try {
      await connection.execute("SELECT 1");
      res.status(200).json({ status: "ok" });
    } catch (err) {
      console.error("Health check DB error:", err.message);
      res.status(503).json({ status: "db-unavailable" });
    }
  })
);

// Apply general rate limiter for all routes
app.use(generalLimiter);

// Use routes from the 'routes' folder
const adminRoutes = require("./routes/adminRoutes/adminContestantRoute");
const clientRoutes = require("./routes/clientRoutes");

// Use other routes as needed
app.use("/", clientRoutes);

app.use("/admin", adminRoutes);

// Error handling middleware
// 404 handler
app.use((req, res, next) => {
  res.status(404).render("bye");
});

// Centralized error handler (optionally log to file when env var set)
app.use(
  createErrorHandler({ logToFile: process.env.LOG_ERRORS_TO_FILE === "true" })
);

// app.use((req, res, next) => {
//   res.status(404).render("bye");
// });

// Start the server and keep reference for graceful shutdown
const server = app.listen(port, () => {
  console.log(
    `Connected - ${
      process.env.NODE_ENV || "development"
    }; Redis rate-limiter: ${usingRedis ? "enabled" : "disabled"}`
  );
});

// Graceful shutdown helper
function gracefulShutdown(signal) {
  console.log(`Received ${signal}. Shutting down gracefully...`);
  // Stop accepting new connections
  server.close(async (err) => {
    if (err) {
      console.error("Error closing server:", err);
      process.exit(1);
    }

    try {
      // Close DB pool
      if (connection && typeof connection.end === "function") {
        await connection.end();
        console.log("Database pool closed.");
      }
    } catch (dbErr) {
      console.error("Error closing DB pool:", dbErr);
    }

    process.exit(0);
  });

  // Force exit after timeout
  setTimeout(() => {
    console.error("Force exiting process after timeout");
    process.exit(1);
  }, 10000).unref();
}

process.on("SIGTERM", () => gracefulShutdown("SIGTERM"));
process.on("SIGINT", () => gracefulShutdown("SIGINT"));

// Log unhandled rejections and uncaught exceptions, then attempt graceful shutdown
process.on("unhandledRejection", (reason, promise) => {
  console.error("Unhandled Rejection at:", promise, "reason:", reason);
  // attempt graceful shutdown
  gracefulShutdown("unhandledRejection");
});

process.on("uncaughtException", (err) => {
  console.error("Uncaught Exception:", err);
  // attempt graceful shutdown
  gracefulShutdown("uncaughtException");
});
