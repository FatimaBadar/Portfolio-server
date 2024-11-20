import transporter from "../emailConfig.js";
import dotenv from "dotenv";

dotenv.config();

export default async function handler(req, res) {
     // Set CORS headers
  res.setHeader("Access-Control-Allow-Origin", "https://noorfatimaqureshi.vercel.app");
  res.setHeader("Access-Control-Allow-Credentials", "true");
  res.setHeader("Access-Control-Allow-Headers", "X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version");

  if (req.method === "POST") {
    const firstname = req.body.EmailPayload.firstname;
    const lastname = req.body.EmailPayload.lastname;
    const email = req.body.EmailPayload.email;
    const message = req.body.EmailPayload.message;

    if (req.body.EmailPayload) {
      let mailOptions = {
        from: email,
        to: process.env.EMAIL_USER,
        subject: "Portfolio contact form",
        text: `From: ${firstname} ${lastname}:\n ${message}`,
      };

      try {
        const info = await transporter.sendMail(mailOptions);
        return res
          .status(200)
          .json({ message: `Message Sent: ${info.response}` });
      } catch (error) {
        return res.status(500).json({ message: `Error: ${error.message}` });
      }
    } else {
      return res.status(500).json({ message: "No data in contact form" });
    }
  }
}
