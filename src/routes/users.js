const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/users", (req, res) => {
  res.json("HOLA A TODOS LOS USERS!!!");
});

try {
  router.get("/getAllUser", (req, res) => {
    mysqlConnection.query(
      "SELECT * FROM tb_user tu WHERE tu.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllUser", err);
        } else {
          res.json(rows);
        }
      }
    );
  });
} catch (error) {
  console.error("ERROR AT: /getAllUser", error);
}

try {
  router.get("/getAllUserType", (req, res) => {
    mysqlConnection.query(
      "SELECT * FROM tb_user_type tuy WHERE tuy.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllUserType", err);
        } else {
          res.json(rows);
        }
      }
    );
  });
} catch (error) {
  console.error("ERROR AT: /getAllUserType", error);
}

try {
  router.post("/login", (req, res) => {
    const { user, contrasenia } = req.body;

    if (String(user).length == 0 || String(contrasenia).length == 0) {
      res
        .status(500)
        .send({ error: "el user y/o la contrasena estan vacias!" });
    } else if (String(user).length > 50) {
      res
        .status(500)
        .send({ error: "el user no puede ser mayor de 50 caracteres!" });
    } else if (String(contrasenia).length > 15) {
      res
        .status(500)
        .send({ error: "la contrasenia no puede ser mayor a 15 caracteres!" });
    } else {
      const query = "CALL login(?, ?);";
      mysqlConnection.query(query, [user, contrasenia], (err, rows, fields) => {
        if (err) {
          res.json("ERROR AT: /login", err);
        } else {
          // const [RowDataPacket] = rows[0];
          // console.log("PAQUETE DATA MYSQL",RowDataPacket);
          // const {id,nombre,apellido,dni,telefono,email,estado} = RowDataPacket;
          // console.log("ID DEL USER",id);
          // if (condition) {

          // }
          // console.log("USER",rows[1]);
          if (rows.length == 3) {
            //el 1ero el state, el 2do del user y 3er del dataBDmysql
            res.json({ state: rows[0], userData: rows[1] });
          } else {
            res.json({ state: rows[0], userData: null });
          }
        }
      });
    }
  });
} catch (error) {
  console.error("ERROR AT: /login", error);
}

module.exports = router;
