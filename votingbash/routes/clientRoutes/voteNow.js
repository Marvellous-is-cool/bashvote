const express = require("express");
const router = express.Router();
const clientController = require("../../controllers/clientController");
const connection = require("../../models/connection");
const paystack = require("paystack")(`${process.env.PAYSTACK_SECRET_KEY}`);

// Function to get selected contestant details
async function getSelectedContestant(nickname) {
  return await clientController.getContestantByNickname(nickname);
}

// Endpoint to fetch Paystack authentication URL
router.post("/:nickname/payment/get-url", async (req, res) => {
  try {
    const nickname = req.params.nickname;
    const selectedContestant = await getSelectedContestant(nickname);

    // Extract email from query parameters
    const email = req.query.email;

    const paystackTransaction = {
      email: email, // Use the extracted email
      amount: 10000, // Modify the amount as needed
      reference: `vote_${selectedContestant.nickname.replace(
        /\s+/g,
        "__"
      )}_${Date.now()}`,
      currency: "NGN", // Modify the currency
      callback: `https://bashvoting.onrender.com/payment/callback`,
    };

    console.log("Request Body:", paystackTransaction);

    const paystackResponse = await paystack.transaction.initialize(
      paystackTransaction
    );

    if (paystackResponse.status && paystackResponse.status === true) {
      // Send Paystack authentication URL to the client side
      res.status(200).json({
        authorization_url: paystackResponse.data.authorization_url,
        email: email, // Send the email back to the client
      });
    } else {
      console.error("Invalid Paystack response:", paystackResponse);
      res.status(500).json({ error: "Invalid Paystack Response" });
    }
  } catch (error) {
    console.error("Error processing payment:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// Callback endpoint to handle Paystack callback
router.get("/payment/callback", async (req, res) => {
  try {
    console.log("Paystack Callback Request Received:", req.query);
    const transactionReference = req.query.reference;

    // Extracting nickname from the transaction reference
    const nicknameMatch = transactionReference.match(/vote_(.*?)_\d+/);
    const nickname = nicknameMatch
      ? nicknameMatch[1].replace(/__/g, " ").trim()
      : null;

    console.log("Extracted Nickname:", nickname);

    // Getting the contestant details by nickname
    const selectedContestant = await getSelectedContestant(nickname);

    // Verify the Paystack transaction
    const verifyResponse = await paystack.transaction.verify(
      transactionReference
    );

    if (
      verifyResponse.status &&
      verifyResponse.status === true &&
      verifyResponse.data.currency === "NGN"
    ) {
      // Update the payment status in the database
      const updatePaymentQuery =
        'UPDATE payments SET status = "success" WHERE transaction_reference = ?';
      await connection.query(updatePaymentQuery, [transactionReference]);

      // Increment votes for the contestant
      await clientController.incrementVotesForContestant(selectedContestant.id);

      res.redirect(
        302,
        `/voteNowSuccess?status=success&email=${req.query.email}&nickname=${selectedContestant.nickname}`
      );
    } else {
      // Update the payment status in the database for failed transactions
      const updatePaymentQuery =
        'UPDATE payments SET status = "failed" WHERE transaction_reference = ?';
      await connection.query(updatePaymentQuery, [transactionReference]);

      res.redirect(
        302,
        `/voteNowSuccess?status=failed&email=${req.query.email}&nickname=${selectedContestant.nickname}`
      );
    }
  } catch (error) {
    console.error("Error processing Paystack callback:", error);
    res.status(500).send("Internal Server Error");
  }
});

module.exports = router;
