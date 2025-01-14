import mysql from 'mysql2';
import dotenv from "dotenv";
dotenv.config();

var conn = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT,
})
conn.connect(function(err){
    if(err)
        throw err;
    console.log('Database connected')
})

export default conn;