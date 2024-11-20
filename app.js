import express from 'express'
import bodyParser from 'body-parser';
import cors from 'cors'
import dotenv from "dotenv";
import contactMe from './api/contactMe.js';
import getProjects from './api/getProjects.js'

dotenv.config();
const app = express();
const corsOptions = {
    origin: 'https://noorfatimaqureshi.vercel.app', 
    methods: ['GET', 'POST', 'PUT', 'DELETE'], 
    allowedHeaders: ['Content-Type', 'Authorization'],
  };
  
app.use(cors(corsOptions));
app.use(bodyParser.json()); //Middleware

//API routes
app.use('/api/contactMe', contactMe); 
app.use('/api/getProjects', getProjects); 

app.listen(process.env.PORT);
console.log("server is running")