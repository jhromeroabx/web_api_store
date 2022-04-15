const Minio = require('minio');

var minioConnection;

try {
    minioConnection = new Minio.Client({
        endPoint: '192.168.18.6',
        // endPoint: "play.minio.io",
        port: 8501,
        // port: 9000,
        useSSL: true,
        accessKey: 'loasi.wastore',
        secretKey: 'loasi.wastore@wasd12125'
        // accessKey: 'Q3AM3UQ867SPQQA43P2F',
        // secretKey: 'zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG'
    });
} catch (error) {
    console.console.error("Error MINIO Server: ", error);
}

module.exports = minioConnection;