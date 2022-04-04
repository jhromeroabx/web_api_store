const mysql = require('mysql');

const mysqlConnection = mysql.createConnection({
    host: '192.168.0.13',
    user: 'qwert',
    password: 'wasd12345',
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