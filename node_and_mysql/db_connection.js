//DATABASE CONNECTION
var mysql = require('mysql');

var connection = mysql.createConnection({
    host    :   'localhost',
    user    :   'root',
    database:   'join_us'
});
