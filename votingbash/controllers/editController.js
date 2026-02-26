// controllers/editController.js
// Thin controller layer for contestant editing.
// Delegates persistence to adminService and contestantService.

"use strict";

const adminService = require("../services/adminService");
const contestantService = require("../services/contestantService");

// Render edit contestant page
const renderEditContestantPage = async (req, res) => {
  try {
    const { awardId, contestantId } = req.params;
    const contestant = await contestantService.getContestantByAwardAndId(
      awardId,
      contestantId,
    );

    if (!contestant) {
      req.flash("error", "Contestant not found. Please try again.");
      return res.redirect("/admin/dashboard");
    }

    res.render("admin/edit-contestant", { contestant, awardId });
  } catch (error) {
    console.error("Error rendering edit page:", error);
    req.flash("error", "Error rendering edit page. Please try again.");
    res.redirect("/admin/dashboard");
  }
};

// Edit contestant - body is already validated by Zod in the route layer
const editContestant = async (req, res) => {
  try {
    const { awardId, contestantId } = req.params;
    const photoFile = req.files?.contestantPhoto ?? null;
    await adminService.updateContestant(
      awardId,
      contestantId,
      req.body,
      photoFile,
    );
    req.flash("success", "Contestant updated successfully.");
    res.redirect("/admin/dashboard");
  } catch (error) {
    console.error("Error updating contestant:", error);
    req.flash("error", "Error updating contestant. Please try again.");
    res.redirect("/admin/dashboard");
  }
};

module.exports = { renderEditContestantPage, editContestant };
