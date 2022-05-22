const express = require("express");
const router = express.Router();
const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'shareconmigo123@gmail.com',
        pass: 'solojhosep@20'
    }
});

const mailOptions = {
    from: 'shareconmigo123@gmail.com',
    to: 'jhromero.abx@gmail.com',
    subject: 'JHOSEPPPPPPPPPPPPPPPPP',
    text: 'JHOSEPPPPPPPPPPPPPPPPP FROM NODE APP!!!'
};

router.post("/sendmail", (req, res) => {
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            console.log(error);
            res.json("END error");
        } else {
            console.log('Email sent: ' + info.response);
            res.json({ res: 'Email sent: ' + info.response });
        }
    });
});

module.exports = router;