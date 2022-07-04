const mercadopago = require("mercadopago");

mercadopago.configure({
  sandbox: true,
  access_token:
    "TEST-8109654715449045-070101-ff2e62a292f11a00d9699d96c432685e-523770842",
});

module.exports = {
  async createPayment(req, res) {
    let payment = req.body;

    console.log("PAYMENT: ", payment);

    const payment_data = {
      token: payment.token,
      issuer_id: payment.issuer_id,
      payment_method_id: payment.payment_method_id,
      transaction_amount: payment.transaction_amount,
      installments: payment.installments,
      payer: {
        email: payment.payer.email,
        identification: {
          type: payment.payer.identification.type,
          number: payment.payer.identification.number,
        },
      },
    };

    const data = await mercadopago.payment.create(payment_data).catch((err) => {
      console.log("Error de mercado pago", err);
      return res.status(501).json({
        success: false,
        message: "Error al crear el pago",
        error: err,
      });
    });

    if (data.body !== null && data.body !== undefined) {
      return res.status(201).json({
        success: true,
        message: "La orden se ha creado correctamente",
        data: data.response,
      });
    }
  },
};
