const express = require("express");
const router = express.Router();

const mysql = require("mysql2");

const mysqlConfig = require("../database");

router.get("/ingresos", (req, res) => {
  res.json(
    "HOLA ACA SE GESTIONARA TODOS LOS INGRESOS Y SALIDAS DE PRODUCTOS PARA ALMACEN!!!"
  );
});

// EVALUAR 
router.get("/getAllIngresos", (req, res) => {
  try {
    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT * FROM tb_ingreso tc WHERE tc.active = 1",
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllIngresos!", cause: err });

          console.error("ERROR AT: /getAllIngresos", err);
        } else {
          console.log("DB CONNECTED : getAllIngresos");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllIngresos", error);
  }
});


// EVALUAR 
router.post("/getAllIngresosDetailBy", (req, res) => {
  try {
    const { id_ingreso } = req.body;

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT TIP.*,TP.nombre,TI.active ingresoState FROM tb_ingreso_producto TIP INNER JOIN tb_ingreso TI ON TI.id = TIP.id_ingreso INNER JOIN tb_producto TP ON TIP.id_producto = TP.id WHERE TIP.id_ingreso = ?",
      [id_ingreso],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllIngresosDetailBy!", err });

          console.error("ERROR AT: /getAllIngresosDetailBy", err);
        } else {
          console.log("DB CONNECTED : getAllIngresosDetailBy");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllIngresosDetailBy", error);
    res.status(500).send({ error: "ERROR AT: /getAllIngresosDetailBy", error });
  }
});

router.post("/ingresoAdd", (req, res) => {
  try {
    const {
      comentario,
      id_user_responsable,
      productos_concat,
      cantidad_productos,
    } = req.body;

    const query = "CALL ingresoAdd(?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [comentario, id_user_responsable, productos_concat, cantidad_productos],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /ingresoAdd", err);
          res.status(500).send({ error: "ERROR AT: /ingresoAdd", cause: err });
        } else {
          console.log("DB CONNECTED : ingresoAdd");
          const [RowDataPacket] = rows[0];
          const { state, response } = RowDataPacket;
          res.json({ state, response });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    res.status(500).send({ error: "ERROR AT: /ingresoAdd", error });
    console.error("ERROR AT: /ingresoAdd", error);
  }
});

router.post("/getAllRetirosDetailBy", (req, res) => {
  try {
    const { id_retiro } = req.body;

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT TRP.*,TP.nombre,TR.comentario FROM tb_retiro TR INNER JOIN tb_retiro_producto TRP ON TR.id = TRP.id_retiro INNER JOIN tb_producto TP ON TRP.id_producto = TP.id WHERE TRP.id_retiro = ?",
      [id_retiro],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllRetirosDetailBy!", err });

          console.error("ERROR AT: /getAllRetirosDetailBy", err);
        } else {
          console.log("DB CONNECTED : getAllRetirosDetailBy");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllRetirosDetailBy", error);
    res.status(500).send({ error: "ERROR AT: /getAllRetirosDetailBy", error });
  }
});

router.post("/retiroAdd", (req, res) => {
  try {
    const {
      comentario,
      id_user_responsable,
      productos_concat,
      cantidad_productos,
    } = req.body;

    const query = "CALL retiroAdd(?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [comentario, id_user_responsable, productos_concat, cantidad_productos],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /retiroAdd", err);
          res.status(500).send({ error: "ERROR AT: /retiroAdd", cause: err });
        } else {
          console.log("DB CONNECTED : retiroAdd");
          const [RowDataPacket] = rows[0];
          const { state, response } = RowDataPacket;
          res.json({ state, response });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    res.status(500).send({ error: "ERROR AT: /retiroAdd", error });
    console.error("ERROR AT: /retiroAdd", error);
  }
});

module.exports = router;