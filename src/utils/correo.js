const nodemailer = require('nodemailer');

let sendEmail = function (to, subject, body) {
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


let armarListaCompras = function (serializado) {

    let listaProductos = serializado.split("@");
  
    let listaCompras = "PRODUCTOS A COMPRAR: \n\n\n";
  
  
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

// module.exports.sendEmail = sendEmail;
module.exports = sendEmail;
module.exports = armarListaCompras;
// // EXPORT SHAPES
// https://www.sitepoint.com/understanding-module-exports-exports-node-js/
// var add = require('./counter').add;
// var sub = require('./counter').sub;

// add(1,2);
// sub(1,2);

// function sleep() {
//   .......
//   return *something*;
// };
// module.exports.sleep = sleep;
// const task = require(__dirname + "/task.js");
//task is the name of the file
// let eat = task.eat();
// let sleep = task.sleep();

// // Function

// function square(number) {
//     return number * number;
//   }

// function sumar(sum1, sum2)


// {


//     var resultado;


//     resultado = sum1 + sum2;


//     return resultado;


// }

// var exports = module.exports = {};

// exports.AddNumber = function(a, b) {
//     return a + b;
// }