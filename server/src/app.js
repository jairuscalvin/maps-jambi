const express = require('express')
const morgan = require('morgan')
const cors = require('cors')
const bodyParser = require('body-parser')
const path = require('path')
const address = require('address')
const session = require('express-session')
require('dotenv').config()

const app = express()
const port = process.env.PORT || 5000

//-----Initialize Middlewares-----//
app.use(morgan('dev'))
app.use(bodyParser.json()) 
app.use(bodyParser.urlencoded({ extended: true }))
app.use(express.json())
app.use('/public/', express.static('./public'))

app.use(cors())
app.set('trust proxy', 1) // trust first proxy
app.use(
  session({
    secret: process.env.COOKIE_SECRET,
    credentials: true,
    name: "sid",
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: process.env.ENVIRONMENT === "production",
      httpOnly: true,
      sameSite: process.env.ENVIRONMENT === "production" ? "none" : "lax",
    },
  })
)

//-----Import ROUTES-----//
const homeRoute = require('./routes/homeRoutes')

//----------ROUTES----------//
app.use(homeRoute)

//ip + ipv6 + MAC
address(function (err, addrs) {
    console.log("IP Address : " + addrs.ip, "|| IPv6 : " + addrs.ipv6, "|| MAC : " + addrs.mac);
    // '192.168.0.2', 'fe80::7aca:39ff:feb0:e67d', '78:ca:39:b0:e6:7d'
  });

app.listen(port, (err) => {
    if (err) throw err
    console.log('Server is listening on port 5000')
})