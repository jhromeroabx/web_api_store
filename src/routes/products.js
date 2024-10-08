const express = require("express");
const router = express.Router();
const connectMysql = require("../database");

router.get("/products", (_req, res) => {
  res.json("HOLA, ACA GESTIONAREMOS TODOS LOS PRODUCTOS!!!");
});

router.post("/getAllCategories", (req, res) => {
  try {
    let { id_user_responsable } = req.body;

    let mysqlConnection = connectMysql("/getAllCategories");

    mysqlConnection.query(
      "CALL getAllCategory(?);",
      [id_user_responsable],
      (err, rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /getAllCategories", err);
          res
            .status(500)
            .send({ where: "ERROR AT SQL: /getAllCategories", err });
        } else {
          const [RolState] = rows[0];
          const { state, response } = RolState;
          if (state === 1) {
            // si es null no traemos data
            const Data = rows[1];
            res.json({
              state: true,
              content: Data,
            });
          } else {
            res.json({
              state: false,
              response: response,
            });
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (err) {
    console.error(
      "ERROR AT ROUTER: /getAllCategories (SEE LOG FOR DETAILS) => ",
      err
    );
    res.status(500).send({
      where: "ERROR AT ROUTER: /getAllCategories (SEE LOG FOR DETAILS) ===> ",
    });
  }
});

router.post("/getAllProducts", (req, res) => {
  try {
    let { id_categoria, active } = req.body;

    if (String(id_categoria).length == 0) {
      id_categoria = 0;
    }

    let mysqlConnection = connectMysql("/getAllProducts");

    mysqlConnection.query(
      "CALL ProductsByCategoryANDORActive(?,?)",
      [id_categoria, active],
      (err, rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /getAllProducts", err);
          res
            .status(500)
            .send({ where: "ERROR AT ROUTER: /getAllProducts", err });
        } else {
          const [RowDataPacket] = rows;
          res.json(RowDataPacket);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllProducts", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /getAllProducts", error });
  }
});

router.post("/findProductBy", (req, res) => {
  try {
    let { id, barcode, id_user } = req.body;
    let error_message = "";
    if (String(id).length == 0) {
      id = 0;
      error_message =
        "El producto con barCode: " +
        [barcode] +
        " no existe o no esta habilitado!";
    } else {
      barcode = 0;
      error_message =
        "El producto con id: " + [id] + " no existe o no esta habilitado!";
    }

    let mysqlConnection = connectMysql("/findProductBy");

    mysqlConnection.query(
      "CALL findProductBy(?, ?, ?);",
      [id, barcode, id_user],
      (err, rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /findProductBy", err);
          res
            .status(500)
            .send({ where: "ERROR AT ROUTER: /findProductBy", err });
        } else {
          const [RolState] = rows[0];
          const { state, response } = RolState;
          if (state === 1) {
            // si es null no traemos data
            const [DataState] = rows[1];
            if (DataState != undefined) {
              res.json({
                state: true,
                response: DataState,
              });
            } else {
              res.json({
                state: false,
                response: "No existe el producto!",
              });
            }
          } else {
            res.json({
              state: false,
              response: response,
            });
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /findProductBy", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /findProductBy", error });
  }
});

router.post("/disableOrActivateProductById", (req, res) => {
  try {
    const { id_producto, id_user, factor } = req.body; // factor 0 - 1

    let mysqlConnection = connectMysql("/disableOrActivateProductById");

    mysqlConnection.query(
      "CALL disableOrActivateProductById(?, ?, ?);",
      [id_producto, id_user, factor],
      (err, _rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /disableOrActivateProductById", err);
          res.status(500).send({
            where: "ERROR AT ROUTER: /disableOrActivateProductById",
            err,
          });
        } else {
          res.json({
            status: "El producto con id: " + [id] + " ha actualizada!",
          });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /disableOrActivateProductById", error);
    res
      .status(500)
      .send({ where: "ERROR AT ROUTER: /disableOrActivateProductById", error });
  }
});

router.post("/productoAddOrEdit", (req, res) => {
  try {
    const {
      id,
      nombre,
      comentario,
      barcode,

      stock_min,
      imagen_url,
      id_categoria,
      active,
      id_user,
    } = req.body;
    const query = "CALL productoAddOrEdit(?, ?, ?, ?, ?, ?, ?, ?, ?);";

    let mysqlConnection = connectMysql("/productoAddOrEdit");

    mysqlConnection.query(
      query,
      [
        id,
        nombre,
        comentario,
        barcode,
        stock_min,
        imagen_url,
        id_categoria,
        active,
        id_user,
      ],
      (err, rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /productoAddOrEdit", err);
          res
            .status(500)
            .send({ where: "ERROR AT ROUTER: /productoAddOrEdit", err });
        } else {
          const [RolState] = rows[0];
          const { state, response } = RolState;
          if (state == 1) {
            const [DataState] = rows[1];
            const { state, message } = DataState;
            if (state == 1) {
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
  } catch (error) {
    console.error("ERROR AT: /productoAddOrEdit", error);
    res
      .status(500)
      .send({ where: "ERROR AT ROUTER: /productoAddOrEdit", error });
  }
});

router.post("/categoriaAddOrEdit", (req, res) => {
  try {
    const { id, nombre, comentario, active, id_user } = req.body;

    const query = "CALL categoriaAddOrEdit(?, ?, ?, ?, ?);";

    let mysqlConnection = connectMysql("/categoriaAddOrEdit");

    mysqlConnection.query(
      query,
      [id, nombre, comentario, active, id_user],
      (err, rows, _fields) => {
        if (err) {
          console.error("ERROR AT: /categoriaAddOrEdit", err);
          res
            .status(500)
            .send({ where: "ERROR AT ROUTER: /categoriaAddOrEdit", err });
        } else {
          const [RolState] = rows[0];
          const { state, response } = RolState;
          if (state == 1) {
            const [DataState] = rows[1];
            const { state, message, id } = DataState;
            if (state == 1) {
              res.json({ response: `${message} - ${id}`, state: true });
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
  } catch (error) {
    console.error("ERROR AT: /categoriaAddOrEdit", error);
    res
      .status(500)
      .send({ where: "ERROR AT ROUTER: /categoriaAddOrEdit", error });
  }
});

router.delete("/DeleteCategoria", (req, res) => {
  try {
    const { id, id_user } = req.body;

    const query = "CALL DeleteCategoria(?, ?);";

    let mysqlConnection = connectMysql("/DeleteCategoria");

    mysqlConnection.query(query, [id, id_user], (err, rows, _fields) => {
      if (err) {
        console.error("ERROR AT: /DeleteCategoria", err);
        res
          .status(500)
          .send({ where: "ERROR AT ROUTER: /DeleteCategoria", err });
      } else {
        res.json({ status: "Categoria deleted", response: rows[0] });
      }
    });
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /DeleteCategoria", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /DeleteCategoria", error });
  }
});

module.exports = router;
