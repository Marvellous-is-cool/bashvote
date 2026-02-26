const express = require("express");
const router = express.Router();
const contestantService = require("../../services/contestantService");
const paymentService = require("../../services/paymentService");
const asyncHandler = require("../../middlewares/asyncHandler");
const validate = require("../../middlewares/validate");
const { voteLimiter } = require("../../middlewares/rateLimiter");
const { initiatePaymentSchema } = require("../../validators/paymentValidator");

// Endpoint to fetch Paystack authorization URL
// Zod validates email format and coerces amount before the handler runs.
router.post(
  "/:id/payment/get-url",
  voteLimiter,
  validate(initiatePaymentSchema),
  asyncHandler(async (req, res) => {
    const contestantId = parseInt(req.params.id, 10);
    const { email, amount } = req.body; // email & amount already validated + coerced by Zod

    const selectedContestant =
      await contestantService.getContestantById(contestantId);
    if (!selectedContestant) {
      return res.status(404).json({ error: "Contestant not found" });
    }

    const { authorization_url } = await paymentService.initializeTransaction(
      email,
      amount,
      selectedContestant.id,
    );

    res.status(200).json({ authorization_url, email });
  }),
);

// Callback endpoint to handle Paystack callback
router.get(
  "/paid/callback",
  asyncHandler(async (req, res) => {
    const transactionReference = req.query.reference;

    // Extract contestant id from the reference string  (vote__<id>__<timestamp>)
    const match = transactionReference?.match(/vote__(\d+)__/);
    const contestantId = match ? parseInt(match[1], 10) : null;

    const selectedContestant =
      await contestantService.getContestantById(contestantId);

    const txData = await paymentService.verifyTransaction(transactionReference);

    if (txData.currency === "NGN") {
      // N100 per vote
      const paidAmountNGN = txData.amount / 100;
      const numberOfVotes = Math.floor(paidAmountNGN / 100);

      await paymentService.recordPayment(
        txData.amount,
        "paid",
        selectedContestant,
      );
      await contestantService.incrementVotesForContestant(
        contestantId,
        numberOfVotes,
      );

      return res.redirect(
        `/voteNowSucess?status=success&email=${req.query.email}&contestantId=${contestantId}`,
      );
    }

    await paymentService.recordPayment(0, "failed", selectedContestant);
    res.redirect(
      `/voteNowSucess?status=failed&email=${req.query.email}&contestantId=${contestantId}`,
    );
  }),
);

module.exports = router;
