const express = require("express");
const router = express.Router();

const mysql = require("mysql2");

const mysqlConfig = require("../database");

router.get("/employee", (req, res) => {
  res.json("HOLA A TODOS LOS EMPLEADOS!!!");
});

router.get("/getAllEmployeeType", (req, res) => {
  try {
    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT * FROM tb_employee_type ty WHERE ty.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllEmployeeType", err);
          res
            .status(500)
            .send({ error: "ERROR AT: /getAllEmployeeType", err });
        } else {
          console.log("DB CONNECTED");
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployeeType", error);
    res
      .status(500)
      .send({ error: "ERROR AT: /getAllEmployeeType", error });
  }
});

router.get("/getAllEmployee", (req, res) => {
  try {
    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query("SELECT * FROM tb_employee", (err, rows, fields) => {
      if (err) {
        console.error("ERROR AT: /getAllEmployee", err);
        res.status(500).send({ where: "ERROR AT ROUTER: /getAllEmployee (SEE LOG FOR DETAILS) ===> ", err });
      } else {
        console.log("DB CONNECTED");
        res.json(rows);
      }
    });
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /getAllEmployee (SEE LOG FOR DETAILS) ===> ", error });
  }
});

router.get("/findEmployee/:id", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.params;

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "SELECT * FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /findEmployee/:id", err);
          res.status(500).send({ error: "ERROR AT: /findEmployee", err });
        } else {
          if (!rows.length) {
            //indicamos si el err esta null no trae data del SQL
            console.log("CONSULTA A TABLA EMPLOYEES SIN ROWS");
            res.json({ status: "El empleado con id: " + [id] + " no existe!" });
          } else {
            console.log("DB CONNECTED");
            res.json(rows[0]);
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /findEmployee", error);
    res.status(500).send({ error: "ERROR AT: /findEmployee", error });
  }
});

router.delete("/deleteEmployee/:id", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.params;

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      "DELETE FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /deleteEmployee", err);
          res.status(500).send({ error: "ERROR AT: /deleteEmployee", err });
        } else {
          console.log("DB CONNECTED");
          res.json({
            status: "El empleado con id: " + [id] + " ha sido borrado!",
          });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /deleteEmployee", error);
    res.status(500).send({ error: "ERROR AT: /deleteEmployee", error });
  }
});

router.post("/AddEmployeeOrEdit", (req, res) => {
  try {
    const { id, name, salary, id_employee_type } = req.body;

    const query = "CALL employeeAddOrEdit(?, ?, ?, ?);";

    let mysqlConnection = mysql.createConnection(mysqlConfig);
    mysqlConnection.connect();

    mysqlConnection.query(
      query,
      [id, name, salary, id_employee_type],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /AddEmployeeOrEdit", err);
          res.status(500).send({ error: "ERROR AT: /AddEmployeeOrEdit", err });
        } else {
          console.log("DB CONNECTED");
          res.json({ status: "Employeed Saved", response: rows[0] });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
    res.status(500).send({ error: "ERROR AT: /getAllEmployee", error });
  }
});

module.exports = router;
