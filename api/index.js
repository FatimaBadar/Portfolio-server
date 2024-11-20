import express from 'express'
import contactMe from './contactMe.js';
import getProjects from './getProjects.js';

const router = express.Router();
router.get('/', (req, res) => {
    res.json({
      message: 'API - 👋🌎🌍🌏',
    });
  });
  
router.use('/contactMe', contactMe);
router.use('/getProjects', getProjects);

export default router;