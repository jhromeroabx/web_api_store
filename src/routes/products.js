// import express from "express";
const express = require('express');
const router = express.Router();

// import mysql from "mysql2";
const mysql = require('mysql2');

// import mysqlConfig from "../database";
const mysqlConfig = require('../database');

router.get("/products", (req, res) => {
  /// inicias la conexión
  res.json("HOLA, ACA GESTIONAREMOS TODOS LOS PRODUCTOS!!!");
  /// try catch
  /// cierras la conexión si es que se conectó y luego de los procesos
});

router.get("/getAllCategory", (req, res) => {
  try {

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT * FROM tb_categoria cat WHERE cat.active = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllCategory", err);
          res.status(500).send({ where: "ERROR AT SQL: /getAllCategory", err })
        } else {
          console.log("DB CONNECTED");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (err) {
    console.error("ERROR AT ROUTER: /getAllCategory (SEE LOG FOR DETAILS) => ", err);
    res.status(500).send({ where: "ERROR AT ROUTER: /getAllCategory (SEE LOG FOR DETAILS) ===> " });
  }
});

// interface GetAllProductos{
// 	id_categoria: string;
// 	active: boolean;
// }

router.post("/getAllProducts", (req, res) => {
  try {
    // let getAllProductos : GetAllProductos = req.body;

    // if (getAllProductos.id_categoria == null) {
    //   getAllProductos.id_categoria = "0";
    // }

    let { id_categoria, active } = req.body;

    if (String(id_categoria).length == 0) {
      id_categoria = 0;
    }

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "CALL ProductsByCategoryANDORActive(?,?)",
      // [getAllProductos.id_categoria, getAllProductos.active],
      [id_categoria, active],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllProducts", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /getAllProducts", err });
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
    // const id_antiguo  = req.params.id;
    let { id, barcode } = req.body;
    let error_message = "EL PRODUCTO NO EXISTE";
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

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "CALL findProductBy(?, ?);",
      [id, barcode],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /findProductBy", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /findProductBy", err });
        } else {
          console.log("DB CONNECTED");
          // if (!rows.length) {
          //   //indicamos si el err esta null no trae data del SQL
          //   console.log("CONSULTA A TABLA PRODUCTS SIN ROWS");
          //   res.json({
          //     status: error_message,
          //   });
          // } else {
          //   const [RowDataPacket] = rows[0];
          //   res.json(RowDataPacket);
          // }
          const [RowDataPacket] = rows[0];
          res.json(RowDataPacket);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /findProductBy", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /findProductBy", error });
  }
});

router.post("/disableProductBy", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.body;

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "UPDATE tb_producto SET active = 0 WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /disableProductBy", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /disableProductBy", err });
        } else {
          console.log("DB CONNECTED");
          res.json({
            status: "El producto con id: " + [id] + " ha sido deshabilitado!",
          });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /disableProductBy", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /disableProductBy", error });
  }
});

router.post("/productoAddOrEdit", (req, res) => {
  try {
    const {
      id,
      nombre,
      comentario,
      barcode,
      imagen_url,
      id_categoria,
      active,
    } = req.body;
    const query = "CALL productoAddOrEdit(?, ?, ?, ?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [id, nombre, comentario, barcode, imagen_url, id_categoria, active],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /productoAddOrEdit", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /productoAddOrEdit", err });
        } else {
          console.log("DB CONNECTED");
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
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /productoAddOrEdit", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /productoAddOrEdit", error });
  }
});

router.post("/categoriaAddOrEdit", (req, res) => {
  try {
    const { id, nombre, comentario, active } = req.body;

    const query = "CALL categoriaAddOrEdit(?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [id, nombre, comentario, active],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /categoriaAddOrEdit", err);
          res.status(500).send({ where: "ERROR AT ROUTER: /categoriaAddOrEdit", err });
        } else {
          console.log("DB CONNECTED");
          res.json({ status: "Categoria Saved", response: rows[0] });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /categoriaAddOrEdit", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /categoriaAddOrEdit", error });
  }
});

router.delete("/DeleteCategoria", (req, res) => {
  try {
    const { id } = req.body;

    const query = "DELETE FROM tb_categoria WHERE id = ?";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(query, [id], (err, rows, fields) => {
      if (err) {
        console.error("ERROR AT: /DeleteCategoria", err);
        res.status(500).send({ where: "ERROR AT ROUTER: /DeleteCategoria", err });
      } else {
        console.log("DB CONNECTED");
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
