// services/adminService.js
// Encapsulates all admin-related database operations: authentication,
// award management, contestant CRUD, and payment reporting.

"use strict";

const fs = require("fs");
const path = require("path");
const connection = require("../models/connection");
const uploadFile = require("../helpers/uploadFile");
const contestantService = require("./contestantService");

// ---------------------------------------------------------------------------
// Auth
// ---------------------------------------------------------------------------

/**
 * Verify admin credentials.
 * @param {string} username - Already normalised to lower-case by the validator.
 * @param {string} password
 * @returns {Promise<{ success: boolean, error: string|null, admin: object|null }>}
 */
async function authenticateAdmin(username, password) {
  const [rows] = await connection.query(
    "SELECT * FROM admins WHERE username = ? AND password = ?",
    [username, password],
  );

  return {
    success: rows.length > 0,
    error: rows.length > 0 ? null : "Incorrect username or password",
    admin: rows.length > 0 ? rows[0] : null,
  };
}

// ---------------------------------------------------------------------------
// Dashboard
// ---------------------------------------------------------------------------

/**
 * Return all awards with their nested contestant lists.
 * @returns {Promise<Array>}
 */
async function getDashboardData() {
  return contestantService.getAwardsWithContestants();
}

/**
 * Return all awards (id + title only) for dropdowns.
 * @returns {Promise<Array>}
 */
async function getAwardTitles() {
  const [awards] = await connection.query("SELECT id, title FROM awards");
  return awards;
}

// ---------------------------------------------------------------------------
// Contestant management
// ---------------------------------------------------------------------------

/**
 * Insert a new contestant and link them to an award.
 * Handles the photo upload internally.
 *
 * @param {{ contestantName: string, contestantLevel?: string, contestantDepartment?: string, selectedAwardId: number }} data
 * @param {object|null} photoFile - File object from express-fileupload, or null.
 * @returns {Promise<{ insertId: number }>}
 */
async function addContestant(data, photoFile) {
  const {
    contestantName,
    contestantLevel,
    contestantDepartment,
    selectedAwardId,
  } = data;

  // Handle optional photo upload
  const contestantData = photoFile
    ? await uploadFile(photoFile, { name: contestantName }, "photo")
    : { photo: null };

  const [result] = await connection.query(
    "INSERT INTO contestants (nickname, level, department, photo_url) VALUES (?, ?, ?, ?)",
    [
      contestantName,
      contestantLevel ?? null,
      contestantDepartment ?? null,
      contestantData.photo ?? null,
    ],
  );

  await contestantService.linkContestantToAward(
    result.insertId,
    selectedAwardId,
  );

  return { insertId: result.insertId };
}

/**
 * Update an existing contestant's details and optional photo.
 *
 * @param {number} awardId
 * @param {number} contestantId
 * @param {{ nickname: string, department?: string, level?: string, votes?: number }} editedDetails
 * @param {object|null} photoFile
 */
async function updateContestant(
  awardId,
  contestantId,
  editedDetails,
  photoFile,
) {
  const [existingRows] = await connection.execute(
    "SELECT * FROM contestants WHERE id = ?",
    [contestantId],
  );

  if (existingRows.length === 0) {
    throw new Error(`Contestant with ID ${contestantId} not found.`);
  }

  let photoUrl = existingRows[0].photo_url;

  if (photoFile) {
    const uploadResult = await uploadFile(
      photoFile,
      { name: editedDetails.nickname },
      "photo",
    );
    photoUrl = uploadResult.photo;
  }

  await connection.query(
    `UPDATE contestants
     SET nickname = ?, department = ?, photo_url = ?, votes = ?, level = ?
     WHERE id = ?`,
    [
      editedDetails.nickname,
      editedDetails.department ?? null,
      photoUrl,
      editedDetails.votes ?? 0,
      editedDetails.level ?? null,
      contestantId,
    ],
  );
}

/**
 * Delete a contestant: unlinks from all awards, removes the DB row,
 * and deletes the uploaded photo file.
 *
 * @param {number} awardId  (kept for API consistency; not needed after photo delete)
 * @param {number} contestantId
 * @returns {Promise<{ success: boolean, message: string }>}
 */
async function deleteContestant(awardId, contestantId) {
  await contestantService.unlinkContestantFromAllAwards(contestantId);

  const [rows] = await connection.execute(
    "SELECT photo_url FROM contestants WHERE id = ?",
    [contestantId],
  );

  if (rows.length > 0) {
    const photoUrl = rows[0].photo_url;
    await connection.execute("DELETE FROM contestants WHERE id = ?", [
      contestantId,
    ]);

    if (photoUrl) {
      const photoPath = path.join("uploads", photoUrl);
      if (fs.existsSync(photoPath)) fs.unlinkSync(photoPath);
    }
  }

  return { success: true, message: "Contestant deleted successfully." };
}

// ---------------------------------------------------------------------------
// Award (title) management
// ---------------------------------------------------------------------------

/**
 * Insert a new award title.
 * @param {string} title
 */
async function addTitle(title) {
  await connection.query("INSERT INTO awards (title) VALUES (?)", [title]);
}

// ---------------------------------------------------------------------------
// Payments reporting
// ---------------------------------------------------------------------------

/**
 * Return the full payments list (paid only) joined with contestant & award info.
 * @returns {Promise<Array>}
 */
async function getPaymentsDetails() {
  const [payments] = await connection.query(`
    SELECT
      p.id,
      p.status,
      c.nickname  AS contestant_name,
      a.title     AS award_title,
      (p.amount_divided_by_10 / 10) AS amount,
      p.payment_date,
      c.department,
      c.votes
    FROM payments p
    JOIN contestants c ON p.contestant_id = c.id
    JOIN awards     a ON p.award_id      = a.id
    WHERE p.status = 'paid'
  `);
  return payments;
}

module.exports = {
  authenticateAdmin,
  getDashboardData,
  getAwardTitles,
  addContestant,
  updateContestant,
  deleteContestant,
  addTitle,
  getPaymentsDetails,
};
