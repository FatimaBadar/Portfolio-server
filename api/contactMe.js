import express from "express";
import transporter from "../emailConfig.js"
import dotenv from "dotenv";
import conn from "../dbConfig.js";

dotenv.config();
const router = express.Router()

router.post('/', async (req, res) => {
    const firstname = req.body.EmailPayload.firstname;
    const lastname = req.body.EmailPayload.lastname;
    const email = req.body.EmailPayload.email;
    const message = req.body.EmailPayload.message;

    if (!firstname || !lastname || !email || !message) {
      return res.status(400).json({ message: "Invalid or missing contact form data" });
    }
    const mailOptions = {
      from: email,
      to: process.env.EMAIL_USER,
      subject: "Portfolio contact form",
      text: `From: ${firstname} ${lastname}:\n ${message}`,
    };

    try {
      const info = await transporter.sendMail(mailOptions);

      //Insert sent email record to the database
      await postContact(req.body.EmailPayload, res);

      return res.status(200).json({
        message: `Message Sent: ${info.response}`,
        emailInsertStatus: "Email record inserted successfully",
      });
    } catch (error) {
      return res.status(500).json({ message: `Error: ${error.message}` });
    }
  });

const postContact = async (EmailPayload) => {
  const sql = "INSERT INTO Email(sender, message) VALUES (?, ?)";

  return new Promise((resolve, reject) => {
    conn.query(sql, [EmailPayload.email, EmailPayload.message], (err, results) => {
      if(err){
        reject(new Error(`Could not insert Email record: ${err.message}`));
      }
      else{
        console.debug("Inserted Email record successfully", results);
        resolve(results);
      }
    })
  })
}

export default router;
