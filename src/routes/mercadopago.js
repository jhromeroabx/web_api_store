const mercadoPagoController = require("../controllers/mercadoPagoController");
const express = require("express");
const router = express.Router();

router.post("/api/payments/create", mercadoPagoController.createPayment);

module.exports = router;
