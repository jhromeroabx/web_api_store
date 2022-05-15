// const mysql = require("mysql");

let mysqlConfig;

//   mysqlConnection = mysql.createConnection({
//     // host: "25.38.59.175",
//     host: "192.168.18.6",
//     // host: "192.168.0.2",
//     // host: "127.0.0.1",
//     port: "3350",
//     user: "qwert",
//     password: "wasd12125",
//     database: "db_company",
//   });

mysqlConfig = {
  host: "192.168.18.6",
  port: "3350",
  user: "root",
  password: "wasd12125",
  database: "db_company",
}

//   // mysqlConnection.connect(function (err) {
//   //   if (err) {
//   //     console.log(err);
//   //     return;
//   //   } else {
//   //     console.log("DB CONNECTED");
//   //   }
//   // });

module.exports = mysqlConfig;
