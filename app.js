import express from 'express'
import cors from 'cors'
import dotenv from "dotenv";
import api from './api/index.js';
import bodyParser from 'body-parser';

dotenv.config();
const app = express();

const corsOptions = {
    origin: '*',
    methods: ["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"], 
    allowedHeaders: [
      'Content-Type',
      'Authorization',
      'X-Requested-With',
      'Accept',
      'Origin',
      'Access-Control-Allow-Origin'
    ],  };
  
  app.use(cors(corsOptions));
  app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.json({
      message: 'Express js Backend',
    });
  });
app.use('/api', api);
  
app.listen(process.env.PORT);
console.log("server is running")