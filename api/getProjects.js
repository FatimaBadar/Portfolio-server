import conn from '../dbConfig.js';

export default async function handler(req, res) {
    if (req.method === 'GET') {
        const result = await conn`SELECT * from projects`;
        if (result) {
            return res.status(200).json({ message: 'Fetched Project data successfully', data: result });
        } else {
            return res.status(500).json({ message: 'Couldn\'t fetch Project data' });
        }
    } else {
        return res.status(405).json({ message: 'Method Not Allowed' });
    }
}
