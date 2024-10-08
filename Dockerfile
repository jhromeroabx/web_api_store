#USAMOS node 17
FROM node:17

#creamos carpeta de trabajo
WORKDIR /app

#copiaremos los archivos de los paquetes y comandos
COPY package*.json ./

#instalaremos el node_modules
#RUN npm profile disable-2fa
RUN npm install

RUN npm install -g npm@8.10.0

#copiaremos el codigo de src al la carpta dentro del docker
#con ayuda del .dockerignore ignoramos el node_modules para la copia ya que lo instalaremos todo
COPY . .

EXPOSE 5000
#comandos a ejecutar para levantar proyecto
CMD [ "npm", "run","pro" ]
#docker build -t urname

# docker build -t node-store-loasi .

# docker run \
# --name storeloasi \
# --restart always \
# -d -p 7770:5000 node-store-loasi