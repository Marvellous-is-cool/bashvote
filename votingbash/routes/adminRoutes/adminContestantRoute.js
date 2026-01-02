const express = require("express");
const router = express.Router();
const adminController = require("../../controllers/adminController");
const editController = require("../../controllers/editController");
const configModel = require("../../models/config");
const asyncHandler = require("../../middlewares/asyncHandler");

// Admin show awards route
router.get(
  "/add-contestant",
  asyncHandler(async (req, res) => {
    // Fetch award titles from the database using the updated method
    const awards = await adminController.getAwardTitles();

    res.render("admin/add-contestant", { awards });
  })
);

router.post(
  "/add-contestant",
  asyncHandler(async (req, res) => {
    // Call the updated addContestant method in adminController
    await adminController.addContestant(req, res);
  })
);

// Toggle live votes route
router.post(
  "/toggle-live",
  asyncHandler(async (req, res) => {
    const current = await configModel.getConfig("live_enabled");
    const newValue = current === "true" ? "false" : "true";
    await configModel.setConfig("live_enabled", newValue);
    res.redirect("/admin/dashboard");
  })
);

// Admin dashboard route
router.get(
  "/dashboard",
  asyncHandler(async (req, res) => {
    // Fetch admin dashboard data using the admin controller
    const awards = await adminController.getDashboardData();
    // Get live votes status
    const liveEnabled =
      (await configModel.getConfig("live_enabled")) === "true";
    // Attach an event listener for beforeunload to trigger session destruction
    res.render("admin/admin-dashboard", {
      awards,
      attachBeforeUnload: true,
      liveEnabled,
    });
  })
);

// Admin delete contestant route
router.post(
  "/delete-contestant/:awardId/:contestantId",
  asyncHandler(async (req, res) => {
    const awardId = req.params.awardId;
    const contestantId = req.params.contestantId;

    const result = await adminController.deleteContestant(
      awardId,
      contestantId
    );

    req.flash("success", result.message);
    res.redirect("/admin/dashboard");
  })
);

// admin edit routes
router.get(
  "/edit-contestant/:awardId/:contestantId",
  editController.renderEditContestantPage
);
router.post(
  "/edit-contestant/:awardId/:contestantId",
  editController.editContestant
);

// Award title management routes
router.get("/add-title", adminController.renderAddTitlePage);
router.post("/add-title", adminController.addTitle);

// Admin dashboard overview route
router.get(
  "/dashboard/overview",
  asyncHandler(async (req, res) => {
    // Fetch admin dashboard data using the admin controller
    const awards = await adminController.getDashboardData();

    // Fetch transaction details
    const payments = await adminController.getPaymentsDetails();

    // Render the admin overview page with awards and payments data
    res.render("admin/admin-overview", { awards, payments });
  })
);

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

module.exports = router;
