import express from "express";
import conn from "../dbConfig.js";

const router = express.Router();
router.get("/", async (req, res) => {
  conn.query("SELECT p.id, p.title, p.subheading, p.description, GROUP_CONCAT(t.name) as tool, p.link, p.fileName from projects p Left Join project_tools pt On p.id = pt.project_id Left JOIn tools t on pt.tool_id = t.tool_id GROUP BY p.id, p.title, p.subheading, p.description;", (err, results) => {
    if (err) {
      console.error(err.message);
      return res.status(500).json({ message: "Couldnt fetched Project data" });
    }

    return res
      .status(200)
      .json({ message: "Fetched Project data successfully", data: results });
  });
});

export default router;