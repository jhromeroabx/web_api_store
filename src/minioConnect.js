const Minio = require('minio');
require("dotenv").config();

var minioConnection;

try {
    minioConnection = new Minio.Client({
        endPoint: process.env.MINIO_URL,
        port: 8700,
        accessKey: process.env.MINIO_ACCESSKEY,
        secretKey: process.env.MINIO_SECRETKEY
    });
} catch (err) {
    console.log("Error MINIO Server: ", err);
}

module.exports = minioConnection;