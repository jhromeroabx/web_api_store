const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/products", (req, res) => {
  res.json("HOLA, ACA GESTIONAREMOS TODOS LOS PRODUCTOS!!!");
});

router.get("/getAllCategory", (req, res) => {
  try {
    mysqlConnection.query(
      "SELECT * FROM tb_categoria cat WHERE cat.active = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllCategory", err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /getAllCategory", error);
  }
});

router.get("/getAllProducts", (req, res) => {
  try {
    mysqlConnection.query(
      "SELECT * FROM QuantityAllProducts",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllProducts", err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /getAllProducts", error);
  }
});

router.get("/findProductBy", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id, barcode } = req.body;
    let error_message = "";
    if (String(id).length == 0) {
      id = 0;
      error_message =
        "El producto con barCode: " +
        [barcode] +
        " no existe o no esta habilitado!";
    } else if (String(barcode).length == 0) {
      barcode = 0;
      error_message =
        "El producto con id: " + [id] + " no existe o no esta habilitado!";
    }

    mysqlConnection.query(
      "CALL findProductBy(?, ?);",
      [id, barcode],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /findProductBy/:id", err);
        } else {
          if (!rows.length) {
            //indicamos si el err esta null no trae data del SQL
            console.log("CONSULTA A TABLA PRODUCTS SIN ROWS");
            res.json({
              status: error_message,
            });
          } else {
            res.json(rows[0]);
          }
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /findProductBy/:id", error);
  }
});

router.post("/disableProductBy", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.body;
    mysqlConnection.query(
      "UPDATE tb_producto SET active = 0 WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /disableProductBy", err);
        } else {
          res.json({
            status: "El producto con id: " + [id] + " ha sido deshabilitado!",
          });
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /disableProductBy", error);
  }
});

router.post("/productoAddOrEdit", (req, res) => {
  try {
    const { id, nombre, comentario, id_categoria, active } = req.body;

    const query = "CALL productoAddOrEdit(?, ?, ?, ?, ?);";

    mysqlConnection.query(
      query,
      [id, nombre, comentario, id_categoria, active],
      (err, rows, fields) => {
        if (!err) {
          res.json({ status: "Producto Saved", response: rows[0] });
        } else {
          console.error("ERROR AT: /productoAddOrEdit", err);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /productoAddOrEdit", error);
  }
});

router.post("/categoriaAddOrEdit", (req, res) => {
  try {
    const { id, nombre, comentario, active } = req.body;

    const query = "CALL categoriaAddOrEdit(?, ?, ?, ?);";

    mysqlConnection.query(
      query,
      [id, nombre, comentario, active],
      (err, rows, fields) => {
        if (!err) {
          res.json({ status: "Categoria Saved", response: rows[0] });
        } else {
          console.error("ERROR AT: /categoriaAddOrEdit", err);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /categoriaAddOrEdit", error);
  }
});

router.delete("/DeleteCategoria", (req, res) => {
  try {
    const { id } = req.body;

    const query = "DELETE FROM tb_categoria WHERE id = ?";

    mysqlConnection.query(query, [id], (err, rows, fields) => {
      if (!err) {
        res.json({ status: "Categoria deleted", response: rows[0] });
      } else {
        res.json({ error: "ERROR AT INSIDE: /DeleteCategoria: " + err });
      }
    });
  } catch (error) {
    res.json({ error: "ERROR AT OUTSIDE: /DeleteCategoria: " + err });
  }
});

module.exports = router;
