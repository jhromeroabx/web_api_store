const express = require("express");
const router = express.Router();
const connectMysql = require("../database");

router.get("/ingresos&salidas", (req, res) => {
  res.json(
    "HOLA ACA SE GESTIONARA TODOS LOS INGRESOS Y SALIDAS DE PRODUCTOS PARA ALMACEN!!!"
  );
});

// lo veran solo los administradores 3
// ver rango de fechas,
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

router.get("/getAllRetiros", (req, res) => {
  try {
    let mysqlConnection = connectMysql("/getAllRetiros");

    const {
      id_user_responsable,
    } = req.body;

    mysqlConnection.query(
      "CALL getAllRetiros(?);",
      [id_user_responsable],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllRetiros!", cause: err });
          console.error("ERROR AT: /getAllRetiros: ", err);
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
    res.status(500).send({ error: "ERROR AT: /getAllRetiros", error });
    console.error("ERROR AT: /getAllRetiros", error);
  }
});

router.post("/getAllIngresosDetailById", (req, res) => {
  try {
    const { id_ingreso, id_user_responsable } = req.body;

    let mysqlConnection = connectMysql("/getAllIngresosDetailById");

    mysqlConnection.query(
      "CALL getAllIngresosDetailById(?, ?);",
      [id_ingreso, id_user_responsable],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllIngresosDetailById!", err });

          console.error("ERROR AT: /getAllIngresosDetailById", err);
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllIngresosDetailById", error);
    res.status(500).send({ error: "ERROR AT: /getAllIngresosDetailById", error });
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
          const [RolState] = rows[0];
          const { state, response } = RolState;
          if (state == 1) {
            const [DataState] = rows[1];
            const { state, message } = DataState;
            if (state == 1) {
              res.json({ state: true, message });
            } else {
              res.json({ state: false, message });
            }
          } else {
            res.json({ state: false, response });
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    res.status(500).send({ error: "ERROR AT: /ingresoAdd", error });
    console.error("ERROR AT: /ingresoAdd", error);
  }
});

router.post("/getAllRetirosDetailById", (req, res) => {
  try {
    const { id_retiro, id_user_responsable } = req.body;

    let mysqlConnection = connectMysql("/getAllRetirosDetailById");

    mysqlConnection.query(
      "CALL getAllRetirosDetailById(?, ?);",
      [id_retiro, id_user_responsable],
      (err, rows, fields) => {
        if (err) {
          res
            .status(500)
            .send({ error: "Error en /getAllRetirosDetailById!", err });

          console.error("ERROR AT: /getAllRetirosDetailById", err);
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllRetirosDetailById", error);
    res.status(500).send({ error: "ERROR AT: /getAllRetirosDetailById", error });
  }
});

const { sendEmail, armarListaCompras } = require('../utils/correo');

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
          const [RolData] = rows[0];
          const { state, response } = RolData;
          if (state == 1) {
            [DataState] = rows[1];
            const { state, procesado, message } = DataState;
            if (state == 1) {
              if (procesado != null) {// VALIDAR QUE CUANDO NO HAYA PRODUCTOS BAJO NO ENVIE DATA
                let emailToSend = armarListaCompras(procesado);
                sendEmail('jhosepromero14@gmail.com', 'PRODUCTOS A COMPRAR - STOCK BAJO!!!', emailToSend);
              }
              res.json({ state: true, message, procesado });
            } else {
              res.json({ state: false, message });
            }
          } else {
            res.json({ state: false, response });
          }
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