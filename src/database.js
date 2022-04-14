const mysql = require("mysql");

let mysqlConnection;

try {
  mysqlConnection = mysql.createConnection({
    // host: "25.38.59.175",
    host: "192.168.18.6",
    // host: "192.168.0.2",
    // host: "127.0.0.1",
    port: "3350",
    user: "qwert",
    password: "wasd12125",
    database: "db_company",
  });

  mysqlConnection.connect(function (err) {
    if (err) {
      console.log(err);
      return;
    } else {
      console.log("DB CONNECTED");
    }
  });
} catch (error) {
  console.console.error("Error DATABASE: ", error);
}

module.exports = mysqlConnection;
