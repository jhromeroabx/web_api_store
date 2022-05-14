#USAMOS node 17
#FROM node:16
FROM node

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
CMD [ "npm", "pro" ]
#docker build -t urname