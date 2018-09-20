//DATABASE CONNECTION
var mysql = require('mysql');

var connection = mysql.createConnection({
    host    :   'localhost',
    user    :   'root',
    database:   'join_us'
});


// SQL Request
var q = 'DELETE FROM users'
var end_result = connection.query(q, function(error, result){
    if (error) throw error;
    console.log(result);
});

console.log(end_result.sql);
connection.end();
