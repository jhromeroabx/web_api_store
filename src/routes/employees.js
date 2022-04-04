const express = require("express");
const router = express.Router();

const mysqlConnection = require("../database");

router.get("/", (req, res) => {
  res.json("HOLA A TODOS");
});

router.get("/getAllEmployee", (req, res) => {
  mysqlConnection.query("SELECT * FROM tb_employee", (err, rows, fields) => {
    if (err) {
      console.error(err);
    } else {
      res.json(rows);
    }
  });
});

router.get("/findEmployee/:id", (req, res) => {
  // const id_antiguo  = req.params.id;
  const { id } = req.params;
  mysqlConnection.query(
    "SELECT * FROM tb_employee WHERE id = ?",
    [id],
    (err, rows, fields) => {
      if (err) {
        console.error(err);
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
});

router.delete("/deleteEmployee/:id", (req, res) => {
  // const id_antiguo  = req.params.id;
  const { id } = req.params;
  mysqlConnection.query(
    "DELETE FROM tb_employee WHERE id = ?",
    [id],
    (err, rows, fields) => {
      if (err) {
        console.error(err);
      } else {
        res.json({
          status: "El empleado con id: " + [id] + " ha sido borrado!",
        });
      }
    }
  );
});

router.post("/AddEmployeeOrEdit", (req, res) => {
  const { id, name, salary, id_employee_type } = req.body;

  const query = "CALL employeeAddOrEdit(?, ?, ?, ?);";

  mysqlConnection.query(
    query,
    [id, name, salary, id_employee_type],
    (err, rows, fields) => {
      if (!err) {
        res.json({ status: "Employeed Saved", response: rows[0] });
      } else {
        console.error(err);
      }
    }
  );
});

module.exports = router;
