var mysql = require('mysql');

var connection = mysql.createConnection({
    host     : "localhost",
    user     : "piratas",
    password : "piratasDaIlha@2016",
    database : "pirates"
});

connection.connect();

exports.connection = connection;