import express from "express";
import conn from "../dbConfig.js"

const router = express.Router();
router.get("/", async(req, res) => {
    conn.query("SELECT * from Skills", (err, results) => {
        if (err) {
          console.error(err.message);
          return res.status(500).json({ message: "Couldnt fetched Technologies data" });
        }
    
        return res
          .status(200)
          .json({ message: "Fetched Technologies data successfully", data: results });
      });
})
export default router;