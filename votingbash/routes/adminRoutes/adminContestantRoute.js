const express = require("express");
const router = express.Router();
const adminController = require("../../controllers/adminController");
const editController = require("../../controllers/editController");
const configModel = require("../../models/config");
const asyncHandler = require("../../middlewares/asyncHandler");
const validate = require("../../middlewares/validate");
const adminService = require("../../services/adminService");
const {
  addContestantSchema,
  editContestantSchema,
} = require("../../validators/contestantValidator");
const { addAwardSchema } = require("../../validators/awardValidator");

// Admin show awards route
router.get(
  "/add-contestant",
  asyncHandler(async (req, res) => {
    // Fetch award titles from the database using the updated method
    const awards = await adminController.getAwardTitles();

    res.render("admin/add-contestant", { awards });
  }),
);

router.post(
  "/add-contestant",
  validate(addContestantSchema),
  asyncHandler(async (req, res) => {
    const photoFile = req.files?.contestantPhoto ?? null;
    try {
      await adminService.addContestant(req.body, photoFile);
      req.flash("success", "Contestant added successfully.");
      res.redirect("/admin/dashboard");
    } catch (err) {
      if (err.code === "ER_DUP_ENTRY") {
        req.flash(
          "error",
          "A contestant with that name already exists for this award.",
        );
        return res.redirect("/admin/add-contestant");
      }
      throw err;
    }
  }),
);

// Toggle live votes route
router.post(
  "/toggle-live",
  asyncHandler(async (req, res) => {
    const current = await configModel.getConfig("live_enabled");
    const newValue = current === "true" ? "false" : "true";
    await configModel.setConfig("live_enabled", newValue);
    res.redirect("/admin/dashboard");
  }),
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
  }),
);

// Admin delete contestant route
router.post(
  "/delete-contestant/:awardId/:contestantId",
  asyncHandler(async (req, res) => {
    const awardId = req.params.awardId;
    const contestantId = req.params.contestantId;

    const result = await adminController.deleteContestant(
      awardId,
      contestantId,
    );

    req.flash("success", result.message);
    res.redirect("/admin/dashboard");
  }),
);

// admin edit routes
router.get(
  "/edit-contestant/:awardId/:contestantId",
  editController.renderEditContestantPage,
);
router.post(
  "/edit-contestant/:awardId/:contestantId",
  validate(editContestantSchema),
  asyncHandler(async (req, res) => {
    const { awardId, contestantId } = req.params;
    const photoFile = req.files?.contestantPhoto ?? null;
    try {
      await adminService.updateContestant(
        awardId,
        contestantId,
        req.body,
        photoFile,
      );
      req.flash("success", "Contestant updated successfully.");
      res.redirect("/admin/dashboard");
    } catch (err) {
      req.flash("error", "Error updating contestant. Please try again.");
      res.redirect("/admin/dashboard");
    }
  }),
);

// Award title management routes
router.get("/add-title", adminController.renderAddTitlePage);
router.post(
  "/add-title",
  validate(addAwardSchema),
  asyncHandler(async (req, res) => {
    try {
      await adminService.addTitle(req.body.title);
      req.flash("success", "Award title added successfully.");
      res.redirect("/admin/dashboard");
    } catch (err) {
      if (err.code === "ER_DUP_ENTRY") {
        req.flash("error", "An award with this title already exists.");
        return res.redirect("/admin/add-title");
      }
      req.flash("error", "Failed to add award title. Please try again.");
      res.redirect("/admin/add-title");
    }
  }),
);

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
  }),
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
