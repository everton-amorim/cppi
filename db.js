var mysql = require('mysql');

var connection = mysql.createConnection({
    host     : "localhost",
    user     : "root",
    password : "piratas",
    database : "pirates"
});

connection.connect();

exports.connection = connection;