/* 
I need it  :  < and >
*/


//Use to retrieve fake datas via module in node_modules/faker/lib
var faker = require('faker');


//DATABASE CONNECTION
var mysql = require('mysql');

var connection = mysql.createConnection({
    host    :   'localhost',
    user    :   'root',
    database:   'join_us'
});


//INSERTIN LOTS OF DATAS !!!
/* var datas = [];
for(var i = 0; i < 500; i++ ){
    datas.push([
        faker.internet.email(),
        faker.date.past()
    ])
}

// SQL Request
var q = 'INSERT INTO users (email, created_at) VALUES ?'
var end_result = connection.query(q,[datas],function(error, result){
    if (error) throw error;
}); */

var q = 'SELECT DATE_FORMAT(MIN(created_at),"%M %D %Y") AS earliest_date FROM users'

var q2 = 'SELECT * FROM users WHERE created_at = '+ 
         ' (SELECT MIN(created_at) FROM users)';

var q3 = 'SELECT DATE_FORMAT(created_at,"%M") AS month, COUNT(*) AS count FROM users GROUP BY DATE_FORMAT(created_at,"%M")  ';

var end_result = connection.query(q3,function(error, result){
    if (error) throw error;
    console.log(JSON.stringify(result));
});

console.log(end_result.sql);
connection.end();

