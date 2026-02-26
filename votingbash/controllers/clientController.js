// controllers/clientController.js
// Thin controller layer - delegates all database operations to
// contestantService and paymentService.
// Route handlers should prefer importing the services directly.

"use strict";

const contestantService = require("../services/contestantService");
const paymentService = require("../services/paymentService");

module.exports = {
  getAwards: () => contestantService.getAwards(),
  getSelectedAward: (awardId) => contestantService.getSelectedAward(awardId),
  getContestantsForAward: (awardId) =>
    contestantService.getContestantsForAward(awardId),
  getContestantById: (contestantId) =>
    contestantService.getContestantById(contestantId),
  incrementVotesForContestant: (contestantId, numberOfVotes) =>
    contestantService.incrementVotesForContestant(contestantId, numberOfVotes),
  handlePaymentQueries: (amount, status, contestant) =>
    paymentService.recordPayment(amount, status, contestant),
  getAllContestantsWithVotes: () =>
    contestantService.getAllContestantsWithVotes(),
  getAwardsWithContestants: () => contestantService.getAwardsWithContestants(),
};
