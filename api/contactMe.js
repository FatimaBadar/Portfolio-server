import express from "express";
import transporter from "../emailConfig.js"
import dotenv from "dotenv";

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
    text: `From: ${firstname} ${lastname} (${email}):\n\n   ${message}`,
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    return res.status(200).json({
      message: `Message Sent: ${info.response}`});
  } catch (error) {
    return res.status(500).json({ message: `Error: ${error.message}` });
  }
});

export default router;