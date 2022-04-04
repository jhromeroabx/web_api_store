const express = require('express');
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);//si el sistema tiene un puerto que nos lo de o sino 3000 por defecto

// Middlewares --process before transactions
app.use(express.json());//convertira en JSON nuestra info

// routes
app.use(require('./routes/employees'));

//Starting server
app.listen(app.get('port'), ()=> {//setteamos la prop PORT asi que lo getteamos
    console.log('activoo!!!!! in http://localhost:3000');
});