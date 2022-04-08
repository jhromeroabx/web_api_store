const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/", (req, res) => {
  res.json("SERVICIO DE CALIDAD DE SOFTWARE");
});

router.get("/employee", (req, res) => {
  res.json("HOLA A TODOS LOS EMPLEADOS!!!");
});

router.get("/getAllEmployeeType", (req, res) => {
  try {
    mysqlConnection.query(
      "SELECT * FROM tb_employee_type ty WHERE ty.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllEmployee",err);
        } else {
          res.json(rows);
        }
      }
    );
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
  }
});

router.get("/getAllEmployee", (req, res) => {
  try {
    mysqlConnection.query("SELECT * FROM tb_employee", (err, rows, fields) => {
      if (err) {
        console.error("ERROR AT: /getAllEmployee",err);
      } else {
        res.json(rows);
      }
    });
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
