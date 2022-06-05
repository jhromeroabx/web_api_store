const mysql = require("mysql2");

const mysqlConfig = {
  //     host: "25.38.59.175",
  //     host: "192.168.18.5",
  //     host: "127.0.0.1",
  host: "192.168.18.6",
  port: "3350",
  user: "root",
  password: "wasd12125",
  database: "db_company",
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
