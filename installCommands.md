<!-- creamos proyecto con modulos Node -->

npm init -y

<!-- modulos -->

npm install express mysql nodemon

<!-- corriendo servicios -->

node app

<!-- corriendo servicios con nodemon para RESTART AUTO -->

nodemon app

<!-- SI FALLA, SE REINSTALLA EL NODEMON -->

npm install -g nodemon

<!-- INICIAR PROYECTO -->

node src/index.js

npm install --save minio

<!-- ACCESO A CARPETAS Y ARCHIVOS -->
npm i --save file-system

<!-- HTTPS -->
npm install --save https

<!-- SENTRY test -->
npm install --save @sentry/node @sentry/tracing

<!-- INSTALL NGROK IN UBUNTU -->
https://youtu.be/_WttIi-24PQ
<!-- ALSO SEE THE DOCS for more steps -->

<!-- USER NODE DEL NVM DEL DIGITAL OCEAN INSTALL NODE -->
sudo ln -s "$(which node)" /usr/bin/node
sudo ln -s "$(which npm)" /usr/bin/npm

<!-- USE NODE 16.15.0 -->
https://www.youtube.com/watch?v=d2KYz8Qd6FE
nvm use 16.15.0