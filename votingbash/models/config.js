const connection = require("./connection");

async function getConfig(key) {
  const [rows] = await connection.execute(
    "SELECT value FROM config WHERE `key` = ?",
    [key]
  );
  return rows.length > 0 ? rows[0].value : null;
}

async function setConfig(key, value) {
  await connection.execute("REPLACE INTO config (`key`, value) VALUES (?, ?)", [
    key,
    value,
  ]);
}

module.exports = { getConfig, setConfig };
