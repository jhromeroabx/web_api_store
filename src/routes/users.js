const express = require("express");
const router = express.Router();
const connectMysql = require("../database");

router.get("/users", (req, res) => {
  res.json("HOLA A TODOS LOS USERS!!!");
});

//TODO: FIX RES
router.get("/getAllUser", (req, res) => {
  try {
    const { id_user } = req.body;

    let mysqlConnection = connectMysql("/getAllUser");

    mysqlConnection.query(
      "CALL getAllUser(?);",
      [id_user],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllUser", err);
          res
            .status(500)
            .send({ where: "ERROR AT: /getAllUser", err });
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllUser", error);
    res
      .status(500)
      .send({ where: "ERROR AT: /getAllUser", error });
  }
});

//TODO: FIX RES
router.get("/getAllUserType", (req, res) => {
  try {
    const { id_user } = req.body;

    let mysqlConnection = connectMysql("/getAllUser");

    mysqlConnection.query(
      "CALL getAllUserType(?);",
      [id_user],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllUserType", err);
          res
            .status(500)
            .send({ where: "ERROR AT: /getAllUserType", err });
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT ROUTER: /getAllUserType (SEE LOG FOR DETAILS) => ", error);
    res
      .status(500)
      .send({ error_causado: "ERROR AT: /getAllUserType", error });
  }
});

router.post("/login", (req, res) => {
  try {
    const { user, contrasenia } = req.body;

    if (String(user).length == 0 || String(contrasenia).length == 0) {
      res.status(500).send({ where: "el user y/o la contrasena estan vacias!" });
    } else if (String(user).length > 50) {
      res
        .status(500)
        .send({ where: "el user no puede ser mayor de 50 caracteres!" });
    } else if (String(contrasenia).length > 15) {
      res
        .status(500)
        .send({ where: "la contrasenia no puede ser mayor a 15 caracteres!" });
    } else {

      let mysqlConnection = connectMysql("/login");

      const query = "CALL login(?, ?);";
      mysqlConnection.query(query, [user, contrasenia], (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /login", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /login (SEE LOG FOR DETAILS) ===> ", err });
        } else {
          let RowDataPacket;
          [RowDataPacket] = rows[0];
          const { msg, state } = RowDataPacket;
          if (state == 1) {
            [RowDataPacket] = rows[1];
            res.json({ state: { msg, state }, userData: RowDataPacket });
          } else {
            res.json({ state: { msg, state }, userData: null });
          }
        }
      });
      mysqlConnection.end();
    }
  } catch (error) {
    console.error("ERROR AT ROUTER: /login (SEE LOG FOR DETAILS) => ", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /login (SEE LOG FOR DETAILS) ===> " });
  }
});

router.post("/AddUserOrEdit", (req, res) => {
  try {
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
      id_responsable
    } = req.body;

    if (
      String(id).length == 0 ||
      String(nombre).length == 0 ||
      String(apellido).length == 0 ||
      String(dni).length == 0 ||
      String(telefono).length == 0 ||
      String(email).length == 0 ||
      String(fechaNacimiento).length == 0 ||
      String(contrasenia).length == 0 ||
      String(id_responsable).length == 0
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
      const query = "CALL userAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

      let mysqlConnection = connectMysql("/userAddOrEdit");

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
          id_responsable
        ],
        (err, rows, fields) => {
          if (err) {
            console.error("ERROR AT: /AddUserOrEdit", err);
            res.status(500).send({ where: "ERROR AT ROUTER: /AddUserOrEdit (SEE LOG FOR DETAILS) ===> ", err });
          } else {
            let RowDataPacket;
            [RowDataPacket] = rows[0];
            const { state, response } = RowDataPacket;
            if (state === 1) {
              [RowDataPacket] = rows[1];
              const { state, message } = RowDataPacket;
              if (state === 1) {
                res.json({ response: message, state: true });
              } else {
                res.json({ response: message, state: false });
              }
            } else {
              res.json({ response: response, state: false });
            }
          }
        }
      );
      mysqlConnection.end();
    }
  } catch (error) {
    console.error("ERROR AT: /AddUserOrEdit", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /AddUserOrEdit (SEE LOG FOR DETAILS) ===> ", error });
  }
});

module.exports = router;
