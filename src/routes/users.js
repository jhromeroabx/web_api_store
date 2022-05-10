const express = require("express");
const router = express.Router();

const mysql = require("mysql");

const mysqlConnection = require("../database");

router.get("/users", (req, res) => {
  res.json("HOLA A TODOS LOS USERS!!!");
});

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

router.get("/getAllUserType", (req, res) => {
  try {

    let mysqlConnection2 = mysql.createConnection({
      // host: "25.38.59.175",
      host: "192.168.18.6",
      // host: "192.168.0.2",
      // host: "127.0.0.1",
      port: "3350",
      user: "qwert",
      password: "wasd12125",
      database: "db_company",
    });

    mysqlConnection2.connect(function (err) {
      if (err) {
        console.log(err);
        return;
      } else {
        console.log("DB CONNECTED");
      }
    });

    mysqlConnection2.query(
      "SELECT * FROM tb_user_type tuy WHERE tuy.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllUserType", err);
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection2.end();
  } catch (error) {
    console.error("ERROR AT ROUTER: /getAllUserType (SEE LOG FOR DETAILS) => ", err);
    res.status(500).send({ where: "ERROR AT ROUTER: /getAllUserType (SEE LOG FOR DETAILS) ===> " });
  }
});

router.post("/login", (req, res) => {
  try {
    const { user, contrasenia } = req.body;

    if (String(user).length == 0 || String(contrasenia).length == 0) {
      res.status(500).send({ error: "el user y/o la contrasena estan vacias!" });
    } else if (String(user).length > 50) {
      res
        .status(500)
        .send({ error: "el user no puede ser mayor de 50 caracteres!" });
    } else if (String(contrasenia).length > 15) {
      res
        .status(500)
        .send({ error: "la contrasenia no puede ser mayor a 15 caracteres!" });
    } else {
      let mysqlConnection2 = mysql.createConnection({
        // host: "25.38.59.175",
        host: "192.168.18.6",
        // host: "192.168.0.2",
        // host: "127.0.0.1",
        port: "3350",
        user: "qwert",
        password: "wasd12125",
        database: "db_company",
      });

      mysqlConnection2.connect(function (err) {
        if (err) {
          console.log(err);
          return;
        } else {
          console.log("DB CONNECTED");
        }
      });


      const query = "CALL login(?, ?);";
      mysqlConnection2.query(query, [user, contrasenia], (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /login", err);
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
      mysqlConnection2.end();
    }
  } catch (error) {
    console.error("ERROR AT ROUTER: /login (SEE LOG FOR DETAILS) => ", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /login (SEE LOG FOR DETAILS) ===> " });
  }
});

router.post("/AddUserOrEdit", (req, res) => {
  const estado = 1; //siempre activo
  const idUserType = 5; //siempre user default

  const {
    id,
    nombre,
    apellido,
    dni,
    telefono,
    email,
    fechaNacimiento,
    contrasenia,
  } = req.body;

  if (
    String(id).length == 0 ||
    String(nombre).length == 0 ||
    String(apellido).length == 0 ||
    String(dni).length == 0 ||
    String(telefono).length == 0 ||
    String(email).length == 0 ||
    String(fechaNacimiento).length == 0 ||
    String(contrasenia).length == 0
  ) {
    res.status(200).send({
      response: "Algunos campos o todos estan vacios!!!",
      state: false,
    });
  } else if (String(nombre).length > 50) {
    res.status(200).send({
      response: "el nombre no puede ser mayor de 50 caracteres!",
      state: false,
    });
  } else if (String(apellido).length > 50) {
    res.status(200).send({
      response: "el apellido no puede ser mayor a 50 caracteres!",
      state: false,
    });
  } else if (String(dni).length > 8 || String(dni).length < 8) {
    res.status(200).send({
      response: "la dni tiene 8 caracteres!",
      state: false,
    });
  } else if (String(telefono).length > 15) {
    res.status(200).send({
      response: "el telefono no puede ser mayor a 15 caracteres!",
      state: false,
    });
  } else if (String(email).length > 50) {
    res.status(200).send({
      response: "el correo no puede ser mayor a 50 caracteres!",
      state: false,
    });
  } else if (String(contrasenia).length > 15) {
    res.status(200).send({
      response: "la contrasenia no puede ser mayor a 15 caracteres!",
      state: false,
    });
  } else {
    const query = "CALL userAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
    mysqlConnection.query(
      query,
      [
        id,
        nombre,
        apellido,
        dni,
        telefono,
        email,
        fechaNacimiento,
        estado,
        idUserType,
        contrasenia,
      ],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /AddUserOrEdit", err);
        } else {
          const [RowDataPacket] = rows[0];
          const { state } = RowDataPacket;
          if (state == 1) {
            res.json({ response: RowDataPacket, state: true });
          } else {
            res.json({ response: RowDataPacket, state: false });
          }
        }
      }
    );
  }
});

module.exports = router;
