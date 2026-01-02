require("dotenv").config();
const { createClient } = require("redis");

async function test() {
  const url = process.env.REDIS_URL;
  if (!url) {
    console.error("No REDIS_URL set in environment");
    process.exit(2);
  }

  const client = createClient({ url });
  client.on("error", (err) => console.error("Redis client error", err));

  try {
    await client.connect();
    const pong = await client.ping();
    console.log("REDIS PING =>", pong);
    await client.quit();
    process.exit(0);
  } catch (err) {
    console.error("Redis ping failed:", err.message || err);
    try {
      await client.quit();
    } catch (_) {}
    process.exit(1);
  }
}

test();
