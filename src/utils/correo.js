const nodemailer = require('nodemailer');

function sendEmail(to, subject, body) {
    // SEND EMAIL
    // https://cheatcode.co/tutorials/how-to-send-email-with-nodemailer

    //https://www.youtube.com/watch?v=RpSQQIGTpTM GENERATE APP PASSWORD - GOOGLE AUTH NICE
    const transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'shareconmigo123@gmail.com',
            pass: 'nwwvjvtxgiomglnn'
        }
    });

    let error = false;

    const mailOptions = {
        from: 'shareconmigo123@gmail.com',
        to: to,
        subject: subject,
        text: body,
        // html: '<p>Sending some HTML to test.</p>'
    };

    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log("Email error", error);
            error = true;
        } else {
            console.log('Email sent: ' + info.response);
        }
    });

    return error;
}

function armarListaCompras(serializado) {

    //console.log('SI CUMPLE CRJJJJ!!!');

    let listaProductos = serializado.split("@");

    let listaCompras = "PRODUCTOS A COMPRAR CRJ: \n\n\n";


    for (let i = 0; i < listaProductos.length; i++) {
        let producto = listaProductos[i].split("|");

        let id = producto[0];
        let nombre = producto[1];
        let stockMin = producto[2];
        let fecha = producto[3];

        listaCompras += `(${id}) - ${nombre}: necesita como minimo ${stockMin} \n fecha solicitud: ${fecha} \n\n`;
    }
    return listaCompras;
}

module.exports = {
    sendEmail,
    armarListaCompras
};