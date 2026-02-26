// controllers/adminController.js
// Thin controller layer – delegates all business and persistence logic
// to adminService.  Route handlers should prefer importing adminService
// directly; these wrappers exist for backward compatibility.

const adminService = require("../services/adminService");

const adminController = {
  // Get admin dashboard data (e.g., award titles)
  getDashboardData: () => adminService.getDashboardData(),

  // Get award titles for the dropdown
  getAwardTitles: () => adminService.getAwardTitles(),

  // Authenticate admin
  authenticateAdmin: (username, password) =>
    adminService.authenticateAdmin(username, password),

  // Add Contestant operation (kept for backward compatibility – routes now use adminService directly)
  addContestant: async (req, res) => {
    const {
      contestantName,
      contestantLevel,
      contestantDepartment,
      selectedAwardId,
    } = req.body;

    if (!contestantName) {
      return res.status(400).send("Contestant name is required.");
    }

    try {
      const photoFile = req.files?.contestantPhoto ?? null;
      await adminService.addContestant(
        {
          contestantName,
          contestantLevel,
          contestantDepartment,
          selectedAwardId,
        },
        photoFile,
      );
      req.flash("success", "Contestant added successfully.");
      res.redirect("/admin/dashboard");
    } catch (error) {
      if (error.code === "ER_DUP_ENTRY") {
        return res
          .status(400)
          .send("Contestant with the same name already exists for this award.");
      }
      res.status(500).send("Internal Server Error");
    }
  },

  // Delete Contestant operation
  deleteContestant: (awardId, contestantId) =>
    adminService.deleteContestant(awardId, contestantId),

  // Get Payments details
  getPaymentsDetails: () => adminService.getPaymentsDetails(),

  // Add Award Title operation
  addTitle: async (req, res) => {
    const { title } = req.body;

    if (!title) {
      req.flash("error", "Award title is required.");
      return res.redirect("/admin/add-title");
    }

    try {
      await adminService.addTitle(title);
      req.flash("success", "Award title added successfully.");
      res.redirect("/admin/dashboard");
    } catch (error) {
      if (error.code === "ER_DUP_ENTRY") {
        req.flash("error", "An award with this title already exists.");
        return res.redirect("/admin/add-title");
      }
      req.flash("error", "Failed to add award title. Please try again.");
      res.redirect("/admin/add-title");
    }
  },

  // Render Add Title Page
  renderAddTitlePage: async (req, res) => {
    try {
      res.render("admin/add-title");
    } catch (error) {
      console.error("ADMINCONTROLLER - Error rendering add title page:", error);
      res.redirect("/admin/dashboard");
    }
  },
};

module.exports = adminController;
