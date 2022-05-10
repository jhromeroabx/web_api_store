const express = require("express");
const router = express.Router();

const mysql = require("mysql");

const mysqlConnection = require("../database");

router.get("/employee", (req, res) => {
  res.json("HOLA A TODOS LOS EMPLEADOS!!!");
});

router.get("/getAllEmployeeType", (req, res) => {
  try {
    mysqlConnection.query(
      "SELECT * FROM tb_employee_type ty WHERE ty.estado = 1",
      (err, rows, fields) => {
        if (err) {
          res
      .status(500)
      .send({ error: "ERROR AT: /getAllEmployeeType" + String(err) });
          // console.error("ERROR AT: /getAllEmployeeType",err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (error) {
    res
    .status(500)
    .send({ error: "ERROR AT: /getAllEmployeeType" + String(err) });
    // console.error("ERROR AT: /getAllEmployeeType", error);
  }
});

router.get("/getAllEmployee", (req, res) => {
  
  let mysqlConnection2 = mysql.createConnection({
    // host: "25.38.59.175",
    host: "192.168.18.6",
    // host: "192.168.0.2",
    // host: "127.0.0.1",
    port: "3350",
    user: "qwert",
    password: "wasd12125",
    database: "db_company",
  });

  mysqlConnection2.connect(function (err) {
    if (err) {
      console.log(err);
      return;
    } else {
      console.log("DB CONNECTED");
    }
  });
  
  try {
    mysqlConnection2.query("SELECT * FROM tb_employee", (err, rows, fields) => {
      if (err) {
        console.error("ERROR AT: /getAllEmployee",err);
      } else {
        res.json(rows);
      }
    });
    mysqlConnection2.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
  }
});

router.get("/findEmployee/:id", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.params;
    mysqlConnection.query(
      "SELECT * FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /findEmployee/:id",err);
        } else {
          if (!rows.length) {
            //indicamos si el err esta null no trae data del SQL
            console.log("CONSULTA A TABLA EMPLOYEES SIN ROWS");
            res.json({ status: "El empleado con id: " + [id] + " no existe!" });
          } else {
            res.json(rows[0]);
          }
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /findEmployee/:id", error);
  }
});

router.delete("/deleteEmployee/:id", (req, res) => {
  try {
    // const id_antiguo  = req.params.id;
    const { id } = req.params;
    mysqlConnection.query(
      "DELETE FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllEmployee",err);
        } else {
          res.json({
            status: "El empleado con id: " + [id] + " ha sido borrado!",
          });
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
  }
});

router.post("/AddEmployeeOrEdit", (req, res) => {
  try {
    const { id, name, salary, id_employee_type } = req.body;

    const query = "CALL employeeAddOrEdit(?, ?, ?, ?);";

    mysqlConnection.query(
      query,
      [id, name, salary, id_employee_type],
      (err, rows, fields) => {
        if (!err) {
          res.json({ status: "Employeed Saved", response: rows[0] });
        } else {
          console.error("ERROR AT: /getAllEmployee",err);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
  }
});

module.exports = router;
