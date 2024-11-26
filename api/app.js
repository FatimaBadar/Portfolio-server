import express from 'express'
import cors from 'cors'
import dotenv from "dotenv";
import api from './index.js';
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
    res.send('Express js Backend');
  });
app.use('/api', api);

// // Local server listening
// const PORT = process.env.PORT; // Default to 3000 if no environment variable is set
// app.listen(PORT, () => {
//   console.log(`Server is running`);
// });

export default app;