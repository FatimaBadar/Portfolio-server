import express from 'express'
import contactMe from './contactMe.js';

const router = express.Router();
router.get('/', (req, res) => {
    res.json({
      message: 'API - 👋🌎🌍🌏',
    });
  });
  
router.use('/contactMe', contactMe);

export default router;