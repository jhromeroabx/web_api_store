const mysql = require("mysql2");
require("dotenv").config();

const mysqlConfig = {
  //     host: "25.38.59.175",
  //     host: "192.168.18.5",
  //     host: "127.0.0.1",
  host: process.env.MYSQL_URL,
  port: process.env.MYSQL_PORT,
  user: process.env.MYSQL_USERNAME,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
}

function connectMysql(funcion) {
  let mysqlConnection = mysql.createConnection(mysqlConfig);

  mysqlConnection.connect(function (err) {
    if (err) {
      console.log(`ERROR CAUSADO EN => ${funcion} : `, err);
      return;
    } else {
      console.log(`DB CONNECTED => ${funcion}`);
    }
  });

  return mysqlConnection;
}

// module.exports = mysqlConfig;
module.exports = connectMysql;
