const express = require("express");
const app = express();
var fs = require("file-system");
const https = require("https");
var path = require("path");

const PORT_HTTP = 5000;
const PORT_HTTPS = 5001;

// Settings
// app.set("port", process.env.PORT || PORT_HTTP); //si el sistema tiene un puerto que nos lo de o sino 5000 por defecto

// Middlewares --process before transactions
app.use(express.json()); //convertira en JSON nuestra info

// routes
app.use(require("./routes/employees"));
app.use(require("./routes/users"));
app.use(require("./routes/products"));
app.use(require("./routes/compras"));
app.use(require("./routes/minio"));

const https_state = false;

//https://192.168.18.5:5001/getAllCategory
//http://192.168.18.5:5000/getAllCategory

if (https_state) {
  https
    .createServer(
      {
        cert: fs.readFileSync(path.join(path.resolve('.'), '/src/certs/server.cer')),
        key: fs.readFileSync(path.join(path.resolve('.'), '/src/certs/server.key')),
      },
      app
    )
    .listen(PORT_HTTPS, () => {
      //arriba setteamos la prop PORT asi que lo usamos
      console.log("activoo!!!!! in https://localhost:" + PORT_HTTPS);
    });
} else {
  app.set("port", process.env.PORT || PORT_HTTP); //si el sistema tiene un puerto que nos lo de o sino 5000 por defecto
  app.listen(PORT_HTTP, () => {
    //arriba setteamos la prop PORT asi que lo usamos
    console.log("activoo!!!!! in http://localhost:" + PORT_HTTP);
  });
}

//ruta incial de la app
app.get("/", (req, res) => {
  res.json("SERVICIO DE CALIDAD DE SOFTWARE");
});
