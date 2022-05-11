const express = require("express");
const router = express.Router();

const mysql = require("mysql");

const mysqlConfig = require("../database");

router.get("/compras", (req, res) => {
  res.json(
    "HOLA ACA SE GESTIONARA TODAS LAS COMPRAS DE PRODUCTOS PARA ALMACEN!!!"
  );
});


router.get("/getAllCompras", (req, res) => {
  try {
    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT * FROM tb_compra tc WHERE tc.active = 1",
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllCompras!", cause: err });

          console.error("ERROR AT: /getAllCompras", err);
        } else {
          console.log("DB CONNECTED");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllCompras", error);
  }
});



router.post("/getAllComprasDetailBy", (req, res) => {
  try {
    const { id_compra } = req.body;
    
    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT tcp.*,tc.active compraState FROM tb_compra_producto TCP INNER JOIN tb_compra TC ON TC.id = TCP.id_compra WHERE tcp.id_compra = ?",
      [id_compra],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllCompras!", err });

          console.error("ERROR AT: /getAllCompras", err);
        } else {
          console.log("DB CONNECTED");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllCompras", error);
    res.status(500).send({ error: "ERROR AT: /compraAdd", error });
  }
});



router.post("/compraAdd", (req, res) => {
  try {
    const {
      comentario,
      id_user_responsable,
      productos_concat,
      cantidad_productos,
    } = req.body;

    const query = "CALL compraAdd(?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [comentario, id_user_responsable, productos_concat, cantidad_productos],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /compraAdd", err);
          res.status(500).send({ error: "ERROR AT: /compraAdd", cause: err });
        } else {
          console.log("DB CONNECTED");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    res.status(500).send({ error: "ERROR AT: /compraAdd", error });
    console.error("ERROR AT: /compraAdd", error);
  }
});

module.exports = router;