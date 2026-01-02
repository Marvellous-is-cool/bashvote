const rateLimit = require("express-rate-limit");

// Try to initialize a Redis client (node-redis v4) if available
let RedisClient = null;
let usingRedis = false;
try {
  const nodeRedis = require("redis");
  const redisUrl = process.env.REDIS_URL || undefined;
  if (redisUrl) {
    RedisClient = nodeRedis.createClient({ url: redisUrl });
  } else {
    RedisClient = nodeRedis.createClient({
      socket: {
        host: process.env.REDIS_HOST || "127.0.0.1",
        port: process.env.REDIS_PORT
          ? parseInt(process.env.REDIS_PORT, 10)
          : 6379,
      },
      password: process.env.REDIS_PASSWORD || undefined,
    });
  }

  if (typeof RedisClient.connect === "function") {
    // connect but don't await here; we will handle errors silently
    RedisClient.connect().catch((err) => {
      console.error(
        "Redis client connect error:",
        err && err.message ? err.message : err
      );
    });
  }

  usingRedis = true;
} catch (err) {
  usingRedis = false;
}

// Helper to create a simple Redis-backed limiter middleware using INCR/EXPIRE
function createRedisLimiter({ keyPrefix, windowMs, max }) {
  // fall back to a no-op middleware if Redis is unavailable
  if (!usingRedis || !RedisClient) {
    // fallback to in-memory express-rate-limit when Redis not available
    return rateLimit({
      windowMs,
      max,
      standardHeaders: true,
      legacyHeaders: false,
    });
  }

  const expireSeconds = Math.ceil(windowMs / 1000);
  return async function (req, res, next) {
    try {
      const ip = req.ip || req.connection.remoteAddress || "unknown";
      const key = `${keyPrefix}:${ip}`;
      const current = await RedisClient.incr(key);
      if (current === 1) {
        await RedisClient.expire(key, expireSeconds);
      }

      if (current > max) {
        res.setHeader("Retry-After", String(expireSeconds));
        return res
          .status(429)
          .json({ error: "Too many requests, please try again later." });
      }
      return next();
    } catch (err) {
      // On any Redis error, allow the request to proceed (fail-open)
      console.error(
        "Redis limiter error:",
        err && err.message ? err.message : err
      );
      return next();
    }
  };
}

// Build limiters
const generalLimiter = createRedisLimiter({
  keyPrefix: "rl:general",
  windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS, 10) || 15 * 60 * 1000,
  max: parseInt(process.env.RATE_LIMIT_MAX_REQUESTS, 10) || 1000,
});

const voteLimiter = createRedisLimiter({
  keyPrefix: "rl:vote",
  windowMs: parseInt(process.env.RATE_LIMIT_VOTE_WINDOW_MS, 10) || 60 * 1000,
  max: parseInt(process.env.RATE_LIMIT_VOTE_MAX, 10) || 20,
});

module.exports = { generalLimiter, voteLimiter, usingRedis };
