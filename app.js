import express from 'express'
import bodyParser from 'body-parser';
import cors from 'cors'
import dotenv from "dotenv";
import api from './api/index.js';

dotenv.config();
const app = express();
const corsOptions = {
    origin: 'https://noorfatimaqureshi.vercel.app', 
    methods: ['GET', 'POST', 'PUT', 'DELETE'], 
    allowedHeaders: ['Content-Type', 'Authorization'],
  };
  
app.use(cors(corsOptions));
app.use(bodyParser.json()); //Middleware

app.get('/', (req, res) => {
    res.json({
      message: 'Express js Backend 🦄🌈✨👋🌎🌍🌏✨🌈🦄',
    });
  });
app.use('/api', api);
  
app.listen(process.env.PORT);
console.log("server is running")