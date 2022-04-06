const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: '25.38.59.175',
    port: '3350',
    user: 'qwert',
    password: 'wasd12125',
    database: 'db_company'
});

mysqlConnection.connect(function (err){
    if(err){
        console.log(err);
        return;
    }else{
        console.log('DB CONNECTED');
    }
});

module.exports = mysqlConnection;