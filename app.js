import express from 'express'
import cors from 'cors'
import dotenv from "dotenv";
import api from './api/index.js';
// import bodyParser from 'body-parser';

dotenv.config();
const app = express();

const corsOptions = {
  origin: 'https://noorfatimaqureshi.vercel.app', 
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Requested-With'],
};
  app.use(cors(corsOptions));
  app.use(express.json());

app.get('/', (req, res) => {
    res.json({
      message: 'Express js Backend',
    });
  });
app.use('/api', api);
  
app.listen(process.env.PORT);
console.log("server is running")