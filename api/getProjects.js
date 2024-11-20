import conn from "../dbConfig.js";

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*'); 
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE'); 
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization'); 

  if (req.method === "GET") {
    try {
      const result = await conn`SELECT * FROM projects`;
      return res
        .status(200)
        .json({ message: "Fetched Project data successfully", data: result });
    } catch (error) {
      return res
        .status(500)
        .json({ message: `Error fetching projects: ${error.message}` });
    }
  } else {
    return res.status(405).json({ message: "Method Not Allowed" });
  }
}
