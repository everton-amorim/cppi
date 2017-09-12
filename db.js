var mysql = require('mysql');

var connection = mysql.createConnection({
    host     : "localhost",
    user     : "root",
    password : "piratas",
    database : "piratas"
});

connection.connect();

exports.connection = connection;