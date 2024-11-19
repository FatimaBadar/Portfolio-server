import mysql from 'mysql2';
// var mysql = require('mysql');
var conn = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'Portfolio'
})

conn.connect(function(err){
    if(err)
        throw err;
    console.log('Database connected')
})
export default conn;
// module.exports = conn;