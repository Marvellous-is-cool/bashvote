const fs = require("fs");
const path = require("path");
const mysql = require("mysql2/promise");

// Build SSL options conditionally from environment (safer for dev)
const sslEnabled = process.env.MYSQL_SSL === "true";
let sslOptions;
if (sslEnabled) {
  const caPath = process.env.MYSQL_CA_PATH || path.join(__dirname, "ca.pem");
  try {
    const ca = fs.readFileSync(caPath);
    sslOptions = { ca };
    if (process.env.MYSQL_ALLOW_SELF_SIGNED === "true") {
      sslOptions.rejectUnauthorized = false;
    }
  } catch (err) {
    console.warn(
      `MySQL SSL: could not read CA file at ${caPath} - ${err.message}`
    );
    if (process.env.MYSQL_ALLOW_SELF_SIGNED === "true") {
      sslOptions = { rejectUnauthorized: false };
    } else {
      // Leave sslOptions undefined so the pool will connect without custom SSL CA
      sslOptions = undefined;
    }
  }
}

// Create the connection pool to the database
const pool = mysql.createPool(
  Object.assign(
    {
      host: process.env.MYSQL_HOST || "localhost",
      user: process.env.MYSQL_USER || "root",
      password: process.env.MYSQL_PASS || "admin",
      database: process.env.MYSQL_DB || "bashvote",
      port: process.env.MYSQL_PORT || 3306,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
      connectTimeout: 30000, // 30 seconds timeout
    },
    sslOptions ? { ssl: sslOptions } : {}
  )
);

pool.on("error", (err) => {
  console.error("MySQL Pool Error:", err.message);
});

// Export the promise-based interface of the pool
module.exports = pool;
