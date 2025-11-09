const connection = require("../models/connection");
const awardContestantController = require("./awardContestantController");

async function getAwards() {
  const sql = "SELECT * FROM awards ORDER BY title ASC";
  try {
    const [awards] = await connection.execute(sql);
    return awards;
  } catch (error) {
    console.error("Error fetching awards:", error);
    throw error;
  }
}

async function getSelectedAward(awardId) {
  const sql = "SELECT * FROM awards WHERE id = ?";
  try {
    const [selectedAward] = await connection.execute(sql, [awardId]);

    return selectedAward[0];
  } catch (error) {
    console.error("Error fetching selected award:", error);
    throw error;
  }
}

async function getContestantsForAward(awardId) {
  try {
    const contestants = await awardContestantController.getContestantsForAward(
      awardId
    );

    return contestants;
  } catch (error) {
    console.error("Error fetching contestants:", error);
    throw error;
  }
}

async function incrementVotesForContestant(contestantId, numberOfVotes) {
  const sql = "UPDATE contestants SET votes = votes + ? WHERE id = ?";
  try {
    await connection.execute(sql, [numberOfVotes, contestantId]);
  } catch (error) {
    console.error("Error incrementing votes for contestant:", error);
    throw error;
  }
}

async function getContestantById(contestantId) {
  const sql = `
  SELECT c.*, GROUP_CONCAT(a.title) AS award_titles
  FROM contestants c
  LEFT JOIN award_contestants ac ON c.id = ac.contestant_id
  LEFT JOIN awards a ON ac.award_id = a.id
  WHERE c.id = ?
  GROUP BY c.id;
`;

  try {
    const [contestant] = await connection.execute(sql, [contestantId]);

    if (contestant.length > 0) {
      // Convert the comma-separated string of award titles to an array
      const awardTitles = contestant[0].award_titles
        ? contestant[0].award_titles.split(",")
        : [];

      return {
        ...contestant[0],
        award_titles: awardTitles,
      };
    } else {
      return null;
    }
  } catch (error) {
    console.error("Error fetching contestant by ID:", error);
    throw error;
  }
}

// Function to handle database queries related to payments
async function handlePaymentQueries(amount, status, selectedContestant) {
  const updatePaymentQuery =
    "UPDATE payments SET status = ? WHERE contestant_id = ?";
  const getAwardIdQuery = `
    SELECT ac.award_id 
    FROM award_contestants ac 
    WHERE ac.contestant_id = ? 
    LIMIT 1
  `;

  const insertPaymentQuery = `
    INSERT INTO payments (contestant_id, award_id, amount_divided_by_10, payment_date, status)
    VALUES (?, ?, ?, ?, ?)
  `;

  try {
    // Get the award_id from the award_contestants table
    const [awardRows] = await connection.execute(getAwardIdQuery, [selectedContestant.id]);
    const awardId = awardRows.length > 0 ? awardRows[0].award_id : null;

    if (!awardId) {
      console.warn("No award found for contestant:", selectedContestant.id);
    }

    // Calculate amountDividedBy10 here before using it in the next execute call
    const amountDividedBy10 = amount / 10;

    // Update payment status in the database
    await connection.execute(updatePaymentQuery, [
      status,
      selectedContestant.id,
    ]);

    // Insert payment details into the new payments table
    await connection.execute(insertPaymentQuery, [
      selectedContestant.id,
      awardId,
      amountDividedBy10,
      new Date(),
      status,
    ]);
  } catch (error) {
    console.error("Error executing payment queries:", error);
    throw error;
  }
}

module.exports = {
  getAwards,
  getSelectedAward,
  getContestantsForAward,
  incrementVotesForContestant,
  getContestantById,
  handlePaymentQueries,
};
