const express = require("express");
const router = express.Router();

const minioConnection = require("../minioConnect");

router.get("/miniotest", (req, res) => {

    minioConnection.listBuckets(function (err, buckets) {
        if (err) return console.log(err)
        res.json({ title: "LISTA DE BUCKETS", LISTA: buckets });
        // console.log('buckets :', buckets)
    })

});

module.exports = router;