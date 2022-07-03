const express = require("express");
const router = express.Router();

const connectMysql = require("../database");

router.get("/employee", (req, res) => {
  res.json("HOLA A TODOS LOS EMPLEADOS!!!");
});

//TODO: SP, ROL
router.get("/getAllEmployeeType", (req, res) => {
  try {

    let mysqlConnection = connectMysql("/getAllEmployeeType");

    mysqlConnection.query(
      "SELECT * FROM tb_employee_type ty WHERE ty.estado = 1",
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /getAllEmployeeType", err);
          res
            .status(500)
            .send({ where: "ERROR AT: /getAllEmployeeType", err });
        } else {
          res.json(rows);
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployeeType", error);
    res
      .status(500)
      .send({ where: "ERROR AT: /getAllEmployeeType", error });
  }
});

//TODO: SP, ROL
router.get("/getAllEmployee", (req, res) => {
  try {

    let mysqlConnection = connectMysql("/getAllEmployee");

    mysqlConnection.query("SELECT * FROM tb_employee", (err, rows, fields) => {
      if (err) {
        console.error("ERROR AT: /getAllEmployee", err);
        res.status(500).send({ where: "ERROR AT ROUTER: /getAllEmployee (SEE LOG FOR DETAILS) ===> ", err });
      } else {
        res.json(rows);
      }
    });
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /getAllEmployee", error);
    res.status(500).send({ where: "ERROR AT ROUTER: /getAllEmployee (SEE LOG FOR DETAILS) ===> ", error });
  }
});

//TODO: SP, ROL
router.get("/findEmployee", (req, res) => {
  try {
    // /findEmployee/:id
    // const id_antiguo  = req.params.id;
    const { id } = req.body;

    let mysqlConnection = connectMysql("/findEmployee");

    mysqlConnection.query(
      "SELECT * FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /findEmployee/:id", err);
          res.status(500).send({ where: "ERROR AT: /findEmployee", err });
        } else {
          if (!rows.length) {
            res.json({ status: "El empleado con id: " + [id] + " no existe!" });
          } else {
            res.json(rows[0]);
          }
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /findEmployee", error);
    res.status(500).send({ where: "ERROR AT: /findEmployee", error });
  }
});

//TODO: SP, ROL
router.delete("/deleteEmployee", (req, res) => {
  try {
    // /deleteEmployee/:id GET PARAM
    // const id_antiguo  = req.params.id;
    const { id } = req.body;

    let mysqlConnection = connectMysql("/deleteEmployee");

    mysqlConnection.query(
      "DELETE FROM tb_employee WHERE id = ?",
      [id],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /deleteEmployee", err);
          res.status(500).send({ where: "ERROR AT: /deleteEmployee", err });
        } else {
          res.json({
            status: "El empleado con id: " + [id] + " ha sido borrado!",
          });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /deleteEmployee", error);
    res.status(500).send({ where: "ERROR AT: /deleteEmployee", error });
  }
});

router.post("/AddEmployeeOrEdit", (req, res) => {
  try {
    const { id, name, salary, id_employee_type } = req.body;

    const query = "CALL employeeAddOrEdit(?, ?, ?, ?);";

    let mysqlConnection = connectMysql("/AddEmployeeOrEdit");

    mysqlConnection.query(
      query,
      [id, name, salary, id_employee_type],
      (err, rows, fields) => {
        if (err) {
          console.error("ERROR AT: /AddEmployeeOrEdit", err);
          res.status(500).send({ where: "ERROR AT: /AddEmployeeOrEdit", err });
        } else {
          res.json({ status: "Employeed Saved", response: rows[0] });
        }
      }
    );
    mysqlConnection.end();
  } catch (error) {
    console.error("ERROR AT: /AddEmployeeOrEdit", error);
    res.status(500).send({ where: "ERROR AT: /AddEmployeeOrEdit", error });
  }
});

module.exports = router;