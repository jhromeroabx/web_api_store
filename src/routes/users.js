const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/users", (req, res) => {
  res.json("HOLA A TODOS LOS USERS!!!");
});

router.get("/getAllUser", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM tb_user tu WHERE tu.estado = 1",
    (err, rows, fields) => {
      if (err) {
        console.error(err);
      } else {
        res.json(rows);
      }
    }
  );
});

router.get("/getAllUserType", (req, res) => {
  mysqlConnection.query(
    "SELECT * FROM tb_user_type tuy WHERE tuy.estado = 1",
    (err, rows, fields) => {
      if (err) {
        console.error(err);
      } else {
        res.json(rows);
      }
    }
  );
});

router.post("/login", (req, res) => {
  const { user, contrasenia } = req.body;

  if (String(user).length > 50) {
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
        res.json(err);
      } else {
        res.json(rows);
      }
    });
  }
});

module.exports = router;
