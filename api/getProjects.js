import conn from "../dbConfig.js";

export default async function handler(req, res) {
   // Set CORS headers
   res.setHeader("Access-Control-Allow-Origin", "https://noorfatimaqureshi.vercel.app");
   res.setHeader("Access-Control-Allow-Credentials", "true");
   res.setHeader("Access-Control-Allow-Headers", "X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version");

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
