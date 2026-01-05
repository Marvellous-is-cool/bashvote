// controllers/adminController.js

const connection = require("../models/connection");
const uploadFile = require("../helpers/uploadFile");
const awardContestantController = require("./awardContestantController");

const adminController = {
  // Get admin dashboard data (e.g., award titles)
  getDashboardData: async () => {
    try {
      const [awards] = await connection.query(
        "SELECT * FROM awards ORDER BY title ASC"
      );

      // Fetch contestants for each award using the awardContestantController
      const awardsWithContestants = await Promise.all(
        awards.map(async (award) => {
          const contestants =
            await awardContestantController.getContestantsForAward(award.id);
          return { ...award, contestants };
        })
      );

      return awardsWithContestants;
    } catch (error) {
      console.error(
        "ADMINCONTROLLER - Error fetching award titles and contestants:",
        error
      );
      throw new Error("ADMINCONTROLLER - Internal Server Error");
    }
  },

  // Get award titles for the dropdown
  getAwardTitles: async () => {
    try {
      const [awards] = await connection.query("SELECT id, title FROM awards");

      return awards;
    } catch (error) {
      console.error("ADMINCONTROLLER - Error fetching award titles:", error);
      throw new Error("ADMINCONTROLLER - Internal Server Error");
    }
  },

  // Authenticate admin
  authenticateAdmin: async (username, password) => {
    try {
      const [admin] = await connection.query(
        "SELECT * FROM admins WHERE username = ? AND password = ?",
        [username.toLowerCase(), password]
      );

      const result = {
        success: admin.length > 0,
        error: admin.length > 0 ? null : "Incorrect username or password",
        admin: admin.length > 0 ? admin[0] : null, // Include admin data
      };

      return result;
    } catch (error) {
      console.error("ADMINCONTROLLER - Error authenticating admin:", error);
      throw new Error("ADMINCONTROLLER - Internal Server Error");
    }
  },

  // Add Contestant operation
  addContestant: async (req, res) => {
    const { contestantName, contestantLevel, selectedAwardId } = req.body;

    // Check if contestantName is set before proceeding
    if (!contestantName) {
      console.error(
        "ADMINCONTROLLER - Contestant name is missing in the request."
      );
      res.status(400).send("Contestant name is required.");
      return;
    }

    // Use uploadFile to handle file upload and get the generated filename
    const contestantData = await uploadFile(
      req.files.contestantPhoto,
      { name: contestantName }, // Pass an object with a 'name' property
      "photo"
    );

    try {
      // Insert the contestant into the contestants table
      const contestantInsertSql =
        "INSERT INTO contestants (nickname, level, photo_url) VALUES (?, ?, ?)";
      const contestantInsertValues = [
        contestantName,
        contestantLevel,
        contestantData.photo, // Use the generated filename
      ];

      const [insertedContestant] = await connection.query(
        contestantInsertSql,
        contestantInsertValues
      );

      // Insert the contestant-award relationship into award_contestants table
      const awardContestantInsertSql =
        "INSERT INTO award_contestants (contestant_id, award_id) VALUES (?, ?)";
      const awardContestantInsertValues = [
        insertedContestant.insertId,
        selectedAwardId,
      ];

      await connection.query(
        awardContestantInsertSql,
        awardContestantInsertValues
      );

      req.flash("success", "Contestant added successfully.");
      res.redirect("/admin/dashboard");
    } catch (error) {
      console.error("ADMINCONTROLLER - Error adding contestant:", error);

      // Provide a user-friendly error message based on the type of error
      if (error.code === "ER_DUP_ENTRY") {
        // Duplicate entry error (e.g., contestant with the same name for the same award)
        res
          .status(400)
          .send("Contestant with the same name already exists for this award.");
      } else {
        // Generic internal server error message
        res.status(500).send("Internal Server Error");
      }
    }
  },

  // Delete Contestant operation
  deleteContestant: async (awardId, contestantId) => {
    try {
      // Use the awardContestantController to unlink the contestant from all awards
      await awardContestantController.unlinkContestantFromAllAwards(
        contestantId
      );

      // Fetch the contestant's photo URL from the database
      const [contestant] = await connection.execute(
        "SELECT photo_url FROM contestants WHERE id = ?",
        [contestantId]
      );

      if (contestant.length > 0) {
        const photoUrl = contestant[0].photo_url;

        // Delete the contestant from the contestants table
        await connection.execute("DELETE FROM contestants WHERE id = ?", [
          contestantId,
        ]);

        // Delete the contestant's photo from the uploads folder
        const fs = require("fs");
        const path = require("path");
        const photoPath = path.join("uploads", photoUrl);
        if (fs.existsSync(photoPath)) {
          fs.unlinkSync(photoPath);
        }

        const result = {
          success: true,
          message: "Contestant deleted successfully.",
        };

        return result;
      }
    } catch (error) {
      console.error("ADMINCONTROLLER - Error deleting contestant:", error);
      throw new Error("ADMINCONTROLLER - Internal Server Error");
    }
  },

  // Get Payments details
  getPaymentsDetails: async () => {
    try {
      const [payments] = await connection.query(`
        SELECT 
          p.id, 
          p.status, 
          c.nickname AS contestant_name,
          a.title AS award_title,
          (p.amount_divided_by_10 / 10) AS amount,
          p.payment_date,
          c.department,
          c.votes
        FROM payments p
        JOIN contestants c ON p.contestant_id = c.id
        JOIN awards a ON p.award_id = a.id
        WHERE p.status = 'paid'
      `);

      return payments;
    } catch (error) {
      console.error(
        "ADMINCONTROLLER - Error fetching Payments details:",
        error
      );
      throw new Error("ADMINCONTROLLER - Internal Server Error");
    }
  },

  // Add Award Title operation
  addTitle: async (req, res) => {
    const { title } = req.body;

    try {
      // Check if title is provided
      if (!title) {
        req.flash("error", "Award title is required.");
        return res.redirect("/admin/add-title");
      }

      // Insert the new award title
      const sql = "INSERT INTO awards (title) VALUES (?)";
      await connection.query(sql, [title]);

      req.flash("success", "Award title added successfully.");
      res.redirect("/admin/dashboard");
    } catch (error) {
      console.error("ADMINCONTROLLER - Error adding award title:", error);

      if (error.code === "ER_DUP_ENTRY") {
        req.flash("error", "An award with this title already exists.");
        res.redirect("/admin/add-title");
      } else {
        req.flash("error", "Failed to add award title. Please try again.");
        res.redirect("/admin/add-title");
      }
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
