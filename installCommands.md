<!-- creamos proyecto con modulos Node -->

npm init -y

<!-- modulos -->

npm install express mysql nodemon
<!-- usamos GITIGNORE para "NODEMODULES", este comando reinstalamos para las futuras clonaciones-->
npm install

<!-- corriendo servicios -->

node app

<!-- corriendo servicios con nodemon para RESTART AUTO -->

nodemon app

<!-- SI FALLA, SE REINSTALLA EL NODEMON -->

npm install -g nodemon

<!-- INSTALAR TYPESCRIPT -->
npm install -g typescript

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
<!-- wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz --> EL LINK SE OBTIENE EN LA PAGINA OFICIAL
<!-- tar -xvzf ngrok-v3.tgz -->
<!-- ./ngrok config add-authtoken 28TrjrFEe0bUxojmhfFd1ySnRzk_2BUAajPKjoPUv8CX9SJpy -->
<!-- /root/.config/ngrok/ngrok.yml CONFIG PATH -->
<!-- ALSO SEE THE DOCS for more steps -->

<!-- USER NODE DEL NVM DEL DIGITAL OCEAN INSTALL NODE -->
sudo ln -s "$(which node)" /usr/bin/node
sudo ln -s "$(which npm)" /usr/bin/npm

<!-- USE NODE 16.15.0 -->
https://www.youtube.com/watch?v=d2KYz8Qd6FE
nvm use 16.15

<!-- USAR EL NGROK CUANDO SE REINCIA -->
/home/loasi# ngrok http 5000

docker build -t node-store-loasi .
docker run \
--name storeloasi \
--restart always \
-p 4000:5000 node-store-loasi

docker-compose -f docker-compose-test1.yml up -d
docker-compose -f docker-compose-test1.yml down

<!-- GIT CREDENTIALS FOR CLONE PUSH etcetera -->
git config --global user.name "jhosepromeroabx"
git config --global user.email "jhromero.abx@gmail.com"

<!-- BACK UP -->
https://youtu.be/6kPIiY4La8Q //EXPORTE DATA
<!-- SI FALLA EL BACK UP DE WORKBENCH, AGREGAR ESTO (solo sirve para PHPMYADMIN) -->
SET GLOBAL log_bin_trust_function_creators = 1;

<!-- EXPORTA TABLE AND PROCS -->
SHOW CREATE TABLE tb_producto

<!-- PARA VER LA ESTRUCTURA DEL SP -->
SHOW CREATE PROCEDURE findProductBy

npm i swagger-jsdoc swagger-ui-express

<!-- VER PUERTO, SI ESTA USADO O APAGADO -->
netstat -a -n -o | grep 5000
netstat -tupln <!-- usados -->
netstat -antu <!-- escucha -->
kill -9 $( lsof -i:5000 -t ) <!-- mata proceso -->