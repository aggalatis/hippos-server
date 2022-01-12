const { app, BrowserWindow } = require('electron')
const _ = require('underscore')
const helpers = require('./utils/helpers')
const fs = require('fs')

global.parameters = helpers.getParameters()
global.parameters.summaries.image = 'C:\\hippos\\hippos_server\\summary.png'
helpers.deleteFile(global.parameters.server.logFile)

function createWindow() {
    const win = new BrowserWindow({
        width: 400,
        height: 250,
        webPreferences: {
            nodeIntegration: true,
        },
        icon: __dirname + '/assets/images/hippo.ico',
    })
    win.setMenu(null)
    win.setResizable(false)
    win.loadFile('index.html')
}

//Web server configuration
const express = require('express')
const morgan = require('morgan')
const users = require('./routes/users')
const userRoles = require('./routes/userRoles')
const products = require('./routes/products')
const orders = require('./routes/orders')
const customers = require('./routes/customers')
const summaries = require('./routes/summaries')
const categories = require('./routes/categories')
const vats = require('./routes/vats')
let webServer = express()

webServer.use(express.json())
// create a write stream (in append mode)
var accessLogStream = fs.createWriteStream(global.parameters.server.logFile, {
    flags: 'a',
})

webServer.use(
    morgan(
        function (tokens, req, res) {
            return [
                helpers.getDateTimeNow() + ' -->',
                tokens.method(req, res),
                tokens.url(req, res),
                tokens.status(req, res),
                tokens.res(req, res, 'content-length'),
                '-',
                tokens['response-time'](req, res),
                'ms',
            ].join(' ')
        },
        {
            stream: accessLogStream,
        }
    )
)
webServer.use(express.urlencoded({ extended: true }))
webServer.use('/hippoApi/users', users)
webServer.use('/hippoApi/userRoles', userRoles)
webServer.use('/hippoApi/products', products)
webServer.use('/hippoApi/orders', orders)
webServer.use('/hippoApi/customers', customers)
webServer.use('/hippoApi/summaries', summaries)
webServer.use('/hippoApi/categories', categories)
webServer.use('/hippoApi/vats', vats)

webServer.listen(parameters.server.port, () => {
    helpers.log(`Server is running on port: ${parameters.server.port}`)
    app.whenReady().then(createWindow)
})

webServer.get('/', function (req, res) {
    res.sendStatus(200)
})
