import express from 'express'
import bodyParser from 'body-parser';
import conn from './dbConfig.js'
import cors from 'cors'
import dotenv from "dotenv";
import transporter from './emailConfig.js';

dotenv.config();
const app = express();
const corsOptions = {
    origin: 'https://noorfatimaqureshi.vercel.app', 
    methods: ['GET', 'POST', 'PUT', 'DELETE'], 
    allowedHeaders: ['Content-Type', 'Authorization'],
  };
  
app.use(cors(corsOptions));
app.use(bodyParser.json()); //Middleware

app.get('/api/getProjects', async (req, res) => {
    const result = await conn`SELECT * from projects`;
    if(result){
        return res.status(200).json({message: 'Fetched Project data successfully', data: results})
    }
    else{
        return res.status(500).json({message: 'Couldnt fetched Project data'})
    }
    //  conn('SELECT * from projects', (err, results) => {
    //     if(err){
    //         console.error(err.message)
    //         return res.status(500).json({message: 'Couldnt fetched Project data'})
    //     }
    //     return res.status(200).json({message: 'Fetched Project data successfully', data: results})
    // })
})

app.post('/api/contactMe', (req, res) => {
    const firstname = req.body.EmailPayload.firstname;
    const lastname = req.body.EmailPayload.lastname;
    const email = req.body.EmailPayload.email;
    const message = req.body.EmailPayload.message;
    
    if(req.body.EmailPayload){
        console.log("Received data:", req.body.EmailPayload);

        //Send email       
        let mailOptions = {
            from: process.env.EMAIL_USER, 
            to: email,
            subject: 'Portfolio contact form', 
            text: `From: ${firstname} ${lastname}:\n ${message}`, 
        };
        
        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                return res.status(500).json({ message: `Error: ${error}`});
            }
            return res.status(200).json({ message: `Message Sent: ${info.response}` });
        });        
    }
    else{
        return res.status(500).json({ message: 'No data in contact form' });
    }

})

app.listen(process.env.PORT);
console.log("server is running")