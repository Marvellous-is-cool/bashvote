const express = require("express");
const router = express.Router();
const adminController = require("../../controllers/adminController");

// Admin show awards route
router.get("/add-contestant", async (req, res) => {
  try {
    // Fetch award titles from the database
    const awards = await adminController.getAwardTitles();

    res.render("admin/add-contestant", { awards });
  } catch (error) {
    console.error("Error fetching award titles:", error);
    res.status(500).send("Internal Server Error");
  }
});

// Admin add contestant route
router.post("/add-contestant", async (req, res) => {
  try {
    await adminController.addContestant(req, res);
  } catch (error) {
    console.error("Error adding contestant:", error);
    res.status(500).send("Internal Server Error");
  }
});

// Admin dashboard route
// Attach an event listener for beforeunload to trigger session destruction
router.get("/dashboard", async (req, res) => {
  try {
    // Fetch admin dashboard data using the admin controller
    const awards = await adminController.getDashboardData();

    // Attach an event listener for beforeunload to trigger session destruction
    res.render("admin/admin-dashboard", { awards, attachBeforeUnload: true });
  } catch (error) {
    console.error("Error fetching admin dashboard data:", error);
    res.status(500).send("Internal Server Error");
  }
});

// Admin delete contestant route
router.post("/delete-contestant/:awardId/:contestantId", async (req, res) => {
  const awardId = req.params.awardId;
  const contestantId = req.params.contestantId;

  try {
    const result = await adminController.deleteContestant(
      awardId,
      contestantId
    );
    req.flash("success", result.message);
    res.redirect("/admin/dashboard");
  } catch (error) {
    console.error("Error deleting contestant:", error);
    req.flash("error", "Error deleting contestant. Please try again.");
    res.redirect("/admin/dashboard");
  }
});

// Admin dashboard overview route
router.get("/dashboard/overview", async (req, res) => {
  try {
    // Fetch admin dashboard data using the admin controller
    const awards = await adminController.getDashboardData();

    // Fetch transaction details
    const payments = await adminController.getPaymentsDetails();

    // Render the admin overview page with awards and payments data
    res.render("admin/admin-overview", { awards, payments });
  } catch (error) {
    console.error("Error fetching admin dashboard data:", error);
    res.status(500).send("Internal Server Error");
  }
});

router.get("/logout", (req, res) => {
  // Destroy the session
  req.session.destroy((err) => {
    if (err) {
      console.error("Error destroying session:", err);
      res.status(500).send("Internal Server Error");
    } else {
      // Redirect to the login page after destroying the session
      res.redirect("/");
    }
  });
});

// Endpoint to handle session destruction when the tab or connection is closed
router.post("/destroy-session", (req, res) => {
  // Destroy the session
  req.session.destroy((err) => {
    if (err) {
      console.error("Error destroying session:", err);
      res.status(500).send("Internal Server Error");
    } else {
      res.sendStatus(200);
    }
  });
});

module.exports = router;
