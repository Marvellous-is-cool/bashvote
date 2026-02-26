// services/contestantService.js
// Encapsulates all contestant-related database operations.
// Controllers and routes should call these functions rather than
// querying the database directly.

"use strict";

const connection = require("../models/connection");

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/** Converts undefined values in a bind-parameter array to null (mysql2 safety). */
function sanitizeParams(params = []) {
  return params.map((p) => (p === undefined ? null : p));
}

// ---------------------------------------------------------------------------
// Award queries
// ---------------------------------------------------------------------------

/**
 * Fetch all awards ordered alphabetically.
 * @returns {Promise<Array>}
 */
async function getAwards() {
  const [awards] = await connection.execute(
    "SELECT * FROM awards ORDER BY title ASC",
  );
  return awards;
}

/**
 * Fetch a single award by its primary key.
 * @param {number} awardId
 * @returns {Promise<object|undefined>}
 */
async function getSelectedAward(awardId) {
  if (awardId == null) throw new Error("getSelectedAward: awardId is required");
  const [rows] = await connection.execute(
    "SELECT * FROM awards WHERE id = ?",
    sanitizeParams([awardId]),
  );
  return rows[0];
}

// ---------------------------------------------------------------------------
// Contestant queries
// ---------------------------------------------------------------------------

/**
 * Return all contestants that belong to a given award.
 * @param {number} awardId
 * @returns {Promise<Array>}
 */
async function getContestantsForAward(awardId) {
  const [results] = await connection.execute(
    `SELECT contestants.*, award_contestants.award_id
     FROM contestants
     JOIN award_contestants ON contestants.id = award_contestants.contestant_id
     WHERE award_contestants.award_id = ?`,
    sanitizeParams([awardId]),
  );
  return results;
}

/**
 * Return a contestant by ID, including their comma-separated award titles
 * expanded into an array.
 * @param {number} contestantId
 * @returns {Promise<object|null>}
 */
async function getContestantById(contestantId) {
  if (contestantId == null)
    throw new Error("getContestantById: contestantId is required");

  const [rows] = await connection.execute(
    `SELECT c.*, GROUP_CONCAT(a.title) AS award_titles
     FROM contestants c
     LEFT JOIN award_contestants ac ON c.id = ac.contestant_id
     LEFT JOIN awards a ON ac.award_id = a.id
     WHERE c.id = ?
     GROUP BY c.id`,
    sanitizeParams([contestantId]),
  );

  if (rows.length === 0) return null;

  return {
    ...rows[0],
    award_titles: rows[0].award_titles ? rows[0].award_titles.split(",") : [],
  };
}

/**
 * Return a contestant joined with their award_contestant row for the
 * given award (used by the edit flow).
 * @param {number} awardId
 * @param {number} contestantId
 * @returns {Promise<object|undefined>}
 */
async function getContestantByAwardAndId(awardId, contestantId) {
  const [rows] = await connection.execute(
    `SELECT c.*, ac.id AS award_contestant_id
     FROM contestants c
     JOIN award_contestants ac ON c.id = ac.contestant_id
     WHERE ac.award_id = ? AND c.id = ?`,
    [awardId, contestantId],
  );
  return rows[0];
}

/**
 * Return all contestants ordered by votes descending.
 * @returns {Promise<Array>}
 */
async function getAllContestantsWithVotes() {
  const [contestants] = await connection.execute(
    "SELECT * FROM contestants ORDER BY votes DESC",
  );
  return contestants;
}

/**
 * Return all awards, each with its associated contestant list.
 * @returns {Promise<Array>}
 */
async function getAwardsWithContestants() {
  const [awards] = await connection.execute(
    "SELECT * FROM awards ORDER BY title ASC",
  );
  const awardsWithContestants = await Promise.all(
    awards.map(async (award) => {
      const contestants = await getContestantsForAward(award.id);
      return { ...award, contestants };
    }),
  );
  return awardsWithContestants;
}

// ---------------------------------------------------------------------------
// Vote mutations
// ---------------------------------------------------------------------------

/**
 * Atomically increment a contestant's vote counter.
 * @param {number} contestantId
 * @param {number} numberOfVotes
 */
async function incrementVotesForContestant(contestantId, numberOfVotes) {
  if (contestantId == null)
    throw new Error("incrementVotesForContestant: contestantId is required");
  if (numberOfVotes == null)
    throw new Error("incrementVotesForContestant: numberOfVotes is required");

  await connection.execute(
    "UPDATE contestants SET votes = votes + ? WHERE id = ?",
    sanitizeParams([numberOfVotes, contestantId]),
  );
}

// ---------------------------------------------------------------------------
// Award–contestant link operations
// ---------------------------------------------------------------------------

/**
 * Create an award_contestants record linking a contestant to an award.
 * @param {number} contestantId
 * @param {number} awardId
 */
async function linkContestantToAward(contestantId, awardId) {
  await connection.execute(
    "INSERT INTO award_contestants (contestant_id, award_id) VALUES (?, ?)",
    [contestantId, awardId],
  );
}

/**
 * Remove all award_contestant rows for a given contestant.
 * @param {number} contestantId
 */
async function unlinkContestantFromAllAwards(contestantId) {
  const [results] = await connection.execute(
    "DELETE FROM award_contestants WHERE contestant_id = ?",
    [contestantId],
  );
  return results;
}

module.exports = {
  getAwards,
  getSelectedAward,
  getContestantsForAward,
  getContestantById,
  getContestantByAwardAndId,
  getAllContestantsWithVotes,
  getAwardsWithContestants,
  incrementVotesForContestant,
  linkContestantToAward,
  unlinkContestantFromAllAwards,
};
