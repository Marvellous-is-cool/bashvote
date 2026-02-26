// services/paymentService.js
// Encapsulates Paystack API interactions and payment database operations.

"use strict";

const connection = require("../models/connection");

const paystack = require("paystack")(process.env.PAYSTACK_SECRET_KEY);

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function sanitizeParams(params = []) {
  return params.map((p) => (p === undefined ? null : p));
}

const VALID_STATUSES = ["pending", "paid", "failed"];

// ---------------------------------------------------------------------------
// Paystack API wrappers
// ---------------------------------------------------------------------------

/**
 * Initialise a Paystack transaction and return the authorization URL.
 *
 * @param {string} email       - Voter's email (validated by Zod before reaching here).
 * @param {number} amountNGN   - Amount in NGN (e.g. 100).  Converted to kobo internally.
 * @param {number} contestantId
 * @returns {Promise<{ authorization_url: string, reference: string }>}
 */
async function initializeTransaction(email, amountNGN, contestantId) {
  const reference = `vote__${contestantId}__${Date.now()}`;

  const response = await paystack.transaction.initialize({
    email,
    amount: amountNGN * 100, // convert to kobo
    reference,
    currency: "NGN",
    callback_url: `${process.env.APP_HOST}${process.env.PAYSTACK_CALLBACK_PATH}`,
  });

  if (!response.status) {
    throw new Error(
      "Paystack initialisation failed: " + JSON.stringify(response),
    );
  }

  return {
    authorization_url: response.data.authorization_url,
    reference,
  };
}

/**
 * Verify a Paystack transaction by reference.
 *
 * @param {string} reference
 * @returns {Promise<object>} raw Paystack verify response data
 */
async function verifyTransaction(reference) {
  const response = await paystack.transaction.verify(reference);

  if (!response.status) {
    throw new Error(
      "Paystack verification failed: " + JSON.stringify(response),
    );
  }

  return response.data;
}

// ---------------------------------------------------------------------------
// Database helpers
// ---------------------------------------------------------------------------

/**
 * Record or update the payment status for a contestant, and insert a new
 * payment row.
 *
 * @param {number} amount              - Amount in kobo (Paystack's unit).
 * @param {'pending'|'paid'|'failed'} status
 * @param {{ id: number }} contestant  - Must have at least an `id` field.
 */
async function recordPayment(amount, status, contestant) {
  if (!VALID_STATUSES.includes(status)) {
    throw new Error(
      `Invalid payment status: "${status}". Must be one of: ${VALID_STATUSES.join(", ")}`,
    );
  }

  if (!contestant?.id) {
    throw new Error("recordPayment: contestant object with an id is required");
  }

  // Resolve the award linked to this contestant
  const [awardRows] = await connection.execute(
    `SELECT ac.award_id
     FROM award_contestants ac
     WHERE ac.contestant_id = ?
     LIMIT 1`,
    sanitizeParams([contestant.id]),
  );

  const awardId = awardRows.length > 0 ? awardRows[0].award_id : null;

  if (!awardId) {
    throw new Error(`No award found for contestant ID ${contestant.id}`);
  }

  const amountDividedBy10 = amount / 10;

  // Update any existing pending record
  await connection.execute(
    "UPDATE payments SET status = ? WHERE contestant_id = ?",
    sanitizeParams([status, contestant.id]),
  );

  // Insert a new payment record
  await connection.execute(
    `INSERT INTO payments (contestant_id, award_id, amount_divided_by_10, payment_date, status)
     VALUES (?, ?, ?, ?, ?)`,
    sanitizeParams([
      contestant.id,
      awardId,
      amountDividedBy10,
      new Date(),
      status,
    ]),
  );
}

module.exports = {
  initializeTransaction,
  verifyTransaction,
  recordPayment,
};
