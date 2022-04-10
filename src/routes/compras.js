const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/compras", (req, res) => {
  res.json(
    "HOLA ACA SE GESTIONARA TODAS LAS COMPRAS DE PRODUCTOS PARA ALMACEN!!!"
  );
});

try {
  router.get("/getAllCompras", (req, res) => {
    mysqlConnection.query(
      "SELECT * FROM tb_compra tc WHERE tc.active = 1",
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllCompras!", cause: err });

          console.error("ERROR AT: /getAllCompras", err);
        } else {
          res.json(rows);
        }
      }
    );
  });
} catch (error) {
  console.error("ERROR AT: /getAllCompras", error);
}

try {
  router.post("/getAllComprasDetailBy", (req, res) => {
    const { id_compra } = req.body;
    mysqlConnection.query(
      "SELECT tcp.*,tc.active compraState FROM tb_compra_producto TCP INNER JOIN tb_compra TC ON TC.id = TCP.id_compra WHERE tcp.id_compra = ?",
      [id_compra],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllCompras!", cause: err });

          console.error("ERROR AT: /getAllCompras", err);
        } else {
          res.json(rows);
        }
      }
    );
  });
} catch (error) {
  console.error("ERROR AT: /getAllCompras", error);
}

try {
  router.post("/compraAdd", (req, res) => {
    const {
      comentario,
      id_user_responsable,
      productos_concat,
      cantidad_productos,
    } = req.body;

    const query = "CALL compraAdd(?, ?, ?, ?);";
    mysqlConnection.query(
      query,
      [comentario, id_user_responsable, productos_concat, cantidad_productos],
      (err, rows, fields) => {
        if (err) {
          res.status(500).send({ error: "ERROR AT: /compraAdd", cause: err });
        } else {
          res.json(rows);
        }
      }
    );
  });
} catch (error) {
  res.status(500).send({ error: "ERROR AT: /compraAdd", cause: error });
  console.error("ERROR AT: /compraAdd", error);
}

module.exports = router;
