import express from 'express';
import conn from '../dbConfig.js';

const router = express.Router();
router.get('/', async (req, res) => {
    try {
        const result = await conn`SELECT * FROM projects`;
        return res.status(200).json({
          message: 'Fetched projects successfully',
          data: result,
        });
      } catch (error) {
        return res.status(500).json({ message: 'Error fetching projects', error: error.message });
      }
});
export default router;