const express = require("express");
const app = express();

try {
  // Settings
  app.set("port", process.env.PORT || 5000); //si el sistema tiene un puerto que nos lo de o sino 5000 por defecto

  // Middlewares --process before transactions
  app.use(express.json()); //convertira en JSON nuestra info

  // routes
  app.use(require("./routes/employees"));
  app.use(require("./routes/users"));
  app.use(require("./routes/products"));
  app.use(require("./routes/compras"));
  app.use(require("./routes/minio"));

  //ruta incial de la app
  app.get("/", (req, res) => {
    res.json("SERVICIO DE CALIDAD DE SOFTWARE");
  });

  //Starting server
  app.listen(app.get("port"), () => {
    //arriba setteamos la prop PORT asi que lo usamos
    console.log("activoo!!!!! in http://localhost:5000");
  });
} catch (error) {
  console.log("ERROR MAIN", error);
}
