const express = require("express");
const app = express();
var fs = require("file-system");
const https = require("https");
var path = require("path");
const swaggerUI = require("swagger-ui-express");
const docs = require('./docs');

const PORT_HTTP = 5000;
const PORT_HTTPS = 5001;

const Sentry = require("@sentry/node");
const Tracing = require("@sentry/tracing");

//token 7bc3856ec9b511ecb7fa3a3a141bbc4f
Sentry.init({
  dsn: "https://a10c2360b46b4f6cb8499e2f09ee69e2@o1228261.ingest.sentry.io/6373959",
  integrations: [
    new Sentry.Integrations.Http({ tracing: true }),
    new Tracing.Integrations.Express({
      app,
    }),
  ],
  tracesSampleRate: 1.0,
});

app.use(
  Sentry.Handlers.requestHandler({
    shouldHandleError(error) {
      if (error.status === 404 || error.status === 500) {
        return true;
      }
      return false;
    },
  })
);
app.use(
  Sentry.Handlers.tracingHandler({
    shouldHandleError(error) {
      if (error.status === 404 || error.status === 500) {
        return true;
      }
      return false;
    },
  })
);
app.use(
  Sentry.Handlers.errorHandler({
    shouldHandleError(error) {
      if (error.status === 404 || error.status === 500) {
        return true;
      }
      return false;
    },
  })
);

// Settings
// app.set("port", process.env.PORT || PORT_HTTP); //si el sistema tiene un puerto que nos lo de o sino 5000 por defecto

// Middlewares --process before transactions
app.use(express.json()); //convertira en JSON nuestra info

// routes
app.use(require("./routes/employees"));
app.use(require("./routes/users"));
app.use(require("./routes/products"));
app.use(require("./routes/ingreso_salida"));
app.use(require("./routes/minio"));

app.use('/api-docs',swaggerUI.serve,swaggerUI.setup(docs));

app.use(function onError(err, req, res, next) {
  res.statusCode = 500;
  res.end(res.sentry + "\n");
});

const https_state = false;

//https://192.168.18.6:5001/getAllCategory
//http://192.168.18.6:5000/getAllCategory

if (https_state) {
  const server = https
    .createServer(
      {
        cert: fs.readFileSync(
          path.join(path.resolve("."), "/src/certs/server.cer")
        ),
        key: fs.readFileSync(
          path.join(path.resolve("."), "/src/certs/server.key")
        ),
      },
      app
    )
    .listen(PORT_HTTPS, () => {
      //arriba setteamos la prop PORT asi que lo usamos
      console.log("activoo!!!!! in https://localhost:" + PORT_HTTPS);
    });

  //https://connectreport.com/blog/tuning-http-keep-alive-in-node-js/
  server.keepAliveTimeout = 60 * 1000 + 1000;
  server.headersTimeout = 60 * 1000 + 2000;
} else {
  app.set("port", process.env.PORT || PORT_HTTP); //si el sistema tiene un puerto que nos lo de o sino 5000 por defecto

  // app.get('*', function(req, res){
  //   res.status(404).send('ERROR 404 | NO EXISTE TAL RUTA!!!')
  // });

  var server = app.listen(PORT_HTTP, () => {
    //arriba setteamos la prop PORT asi que lo usamos
    console.log("activoo!!!!! in http://localhost:" + PORT_HTTP);
  });

  //https://shuheikagawa.com/blog/2019/04/25/keep-alive-timeout/
  server.keepAliveTimeout = 3 * 1000;
  server.headersTimeout = 4 * 1000;
}

//ruta incial de la appcon
app.get("/", (req, res) => {
  res.json("SERVICIO WEB DE ALMACENES, PROP: JHOSEP ADBEL ROMERO LOA");
});