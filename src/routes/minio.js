const express = require("express");
const router = express.Router();

const minioConnection = require("../minioConnect");

router.get("/miniotest", (req, res) => {
    
    var size = 0
    // minioClient.getObject('wasd', '123loasi.jpg', function(err, dataStream) {
    //   if (err) {
    //     return console.log("TEST: ",err)
    //   }
    //   dataStream.on('data', function(chunk) {
    //     size += chunk.length
    //   })
    //   dataStream.on('end', function() {
    //     console.log('End. Total size = ' + size)
    //   })
    //   dataStream.on('error', function(err) {
    //     console.log("TEST222: ",err)
    //   })
    // });

    minioConnection.listBuckets(function(err, buckets) {
        if (err) return console.log(err)
        res.json({title: "LISTA DE BUCKETS", LISTA: buckets});
        // console.log('buckets :', buckets)
      })

  });

  module.exports = router;