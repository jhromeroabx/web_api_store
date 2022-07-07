const nodemailer = require("nodemailer");
require("dotenv").config();

function sendEmail(to, subject, body) {
  // SEND EMAIL
  // https://cheatcode.co/tutorials/how-to-send-email-with-nodemailer

  //https://www.youtube.com/watch?v=RpSQQIGTpTM GENERATE APP PASSWORD - GOOGLE AUTH NICE
  const transporter = nodemailer.createTransport({
    service: "gmail",
    secure: true, // Compliant
    requireTLS: true, // Compliant
    secured: true, // Compliant
    auth: {
      user: process.env.EMAIL_ADDRESS,
      pass: process.env.EMAIL_PASS,
    },
  });

  const mailOptions = {
    from: process.env.EMAIL_ADDRESS,
    to: to,
    subject: subject,
    text: body,
    // html: '<p>Sending some HTML to test.</p>'
  };

  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log("Email error", error);
    } else {
      console.log("Email sent: " + info.response);
    }
  });
}

function armarListaCompras(serializado) {
  let listaProductos = serializado.split("@");

  let listaCompras = "PRODUCTOS A COMPRAR: \n\n\n";

  for (let producto of listaProductos) {
    let producto_pro = producto.split("|");

    let id = producto_pro[0];
    let nombre = producto_pro[1];
    let stockMin = producto_pro[2];
    let fecha = producto_pro[3];

    listaCompras += `(${id}) - ${nombre}: necesita como minimo ${stockMin} \n fecha solicitud: ${fecha} \n\n`;
  }
  return listaCompras;
}

module.exports = {
  sendEmail,
  armarListaCompras,
};
