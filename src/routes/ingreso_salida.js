const express = require("express");
const router = express.Router();
const connectMysql = require("../database");

router.get("/ingresos&salidas", (req, res) => {
  res.json(
    "HOLA ACA SE GESTIONARA TODOS LOS INGRESOS Y SALIDAS DE PRODUCTOS PARA ALMACEN!!!"
  );
});

// lo veran solo los administradores 3
router.get("/getAllIngresos", (req, res) => {
  try {
    let mysqlConnection = connectMysql("/getAllIngresos");

    const {
      id_user_responsable,
    } = req.body;

    mysqlConnection.query(
      "CALL getAllIngresos(?);",
      [id_user_responsable],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllIngresos!", cause: err });
          console.error("ERROR AT: /getAllIngresos: ", err);
        } else {
          let rptaFromMysql;
          [rptaFromMysql] = rows[0];// si encerramos entre corchetes obtenemos el objeto del arreglo
          const { state, response } = rptaFromMysql;
          if (state === 1) {
            rptaFromMysql = rows[1];
            res.json({ state: state, response: response, content: rptaFromMysql });
          } else {
            res.json({ state: state, response: response, content: null });
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    res.status(500).send({ error: "ERROR AT: /getAllIngresos", error });
    console.error("ERROR AT: /getAllIngresos", error);
  }
});


// EVALUAR
router.post("/getAllIngresosDetailBy", (req, res) => {
  try {
    const { id_ingreso } = req.body;

    let mysqlConnection = connectMysql("/getAllIngresosDetailBy");

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
    } = req.body;

    let error = false;
    let mensaje_error = "";

    var listaProductos = productos_concat.split("@");

    for (let i = 0; i < listaProductos.length && !error; i++) {
      var producto = listaProductos[i].split("|");
      //si el stock compra a ingresar es NEGATIVO o CERO
      if (parseInt(producto[1]) <= 0) {
        error = true;
        mensaje_error = `el producto ${producto[0]}, tiene stock cero o negativo`;
      }
      //si el precio compra a ingresar es CERO
      if (parseFloat(producto[2]) <= 0) {
        error = true;
        mensaje_error = `el producto ${producto[0]}, tiene precio compra cero o negativo`;
      }
    }

    if (error) {
      res.status(500).send({
        state: false,
        response: mensaje_error,
      });
    }

    const query = "CALL ingresoAdd(?, ?, ?);";

    let mysqlConnection = connectMysql("/ingresoAdd");

    mysqlConnection.query(
      query,
      [comentario, id_user_responsable, productos_concat],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /ingresoAdd", err);
          res.status(500).send({ error: "ERROR AT: /ingresoAdd", cause: err });
        } else {
          const [RowDataPacket] = rows[0];
          const { state, response } = RowDataPacket;
          res.json({ state: state === 1 ? true : false, response });
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

    let mysqlConnection = connectMysql("/getAllRetirosDetailBy");

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

let sendEmail = require('../utils/correo');
let armarListaCompras = require('../utils/correo');

router.post("/retiroAdd", (req, res) => {
  try {
    const {
      comentario,
      id_user_responsable,
      productos_concat,
    } = req.body;

    let error = false;
    let mensaje_error = "";

    var listaProductos = productos_concat.split("@");

    for (let i = 0; i < listaProductos.length && !error; i++) {
      var producto = listaProductos[i].split("|");
      //si el Stock a retirar es NEGATIVO o CERO
      if (parseInt(producto[1]) <= 0) {
        error = true;
        mensaje_error = `el producto ${producto[0]}, tiene stock cero o negativo`;
      }
      //si el Stock a retirar es CERO
      if (parseInt(producto[1]) === 0) {
        error = true;
        mensaje_error = `el producto ${producto[0]}, tiene stock cero`;
      }
    }

    if (error) {
      res.status(500).send({
        state: false,
        response: mensaje_error,
      });
    }

    let mysqlConnection = connectMysql("/retiroAdd");

    mysqlConnection.query("CALL retiroAdd(?, ?, ?);",
      [comentario, id_user_responsable, productos_concat],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /retiroAdd", err);
          res.status(500).send({ error: "ERROR AT: /retiroAdd", cause: err });
        } else {
          let RowDataPacket;
          [RowDataPacket] = rows[0];
          const { state, response } = RowDataPacket;

          [RowDataPacket] = rows[1];
          const { procesado } = RowDataPacket;

          if (procesado != null) {// VALIDAR QUE CUANDO NO HAYA PRODUCTOS BAJO NO ENVIE DATA
            let emailToSend = armarListaCompras(procesado);

            sendEmail('jhosepromero14@gmail.com', 'PRODUCTOS A COMPRAR - STOCK BAJO!!!', emailToSend);
          }

          res.json({ state: state === 1 ? true : false, response, procesado });
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