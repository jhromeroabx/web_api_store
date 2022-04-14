const Minio = require('minio');

let minioConnection;

try {
    minioConnection = new Minio.Client({
        endPoint: 'play.min.io',
        port: 9000,
        useSSL: true,
        accessKey: 'Q3AM3UQ867SPQQA43P2F',
        secretKey: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG'
    }); 
} catch (error) {
    console.console.error("Error MINIO Server: ", error);
}

module.exports = minioConnection;