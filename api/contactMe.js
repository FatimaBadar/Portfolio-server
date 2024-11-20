import transporter from '../emailConfig.js';
import dotenv from "dotenv";
dotenv.config()

export default function handler(req, res) {
    if (req.method === 'POST') {
        const firstname = req.body.EmailPayload.firstname;
        const lastname = req.body.EmailPayload.lastname;
        const email = req.body.EmailPayload.email;
        const message = req.body.EmailPayload.message;

        if (req.body.EmailPayload) {
            let mailOptions = {
                from: email, 
                to: process.env.EMAIL_USER,
                subject: 'Portfolio contact form', 
                text: `From: ${firstname} ${lastname}:\n ${message}`, 
            };
            
            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    return res.status(500).json({ message: `Error: ${error}`});
                }
                return res.status(200).json({ message: `Message Sent: ${info.response}` });
            });       
        } else {
            return res.status(500).json({ message: 'No data in contact form' });
        }
    } else {
        return res.status(405).json({ message: 'Method Not Allowed' });
    }
}
