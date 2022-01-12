const express = require('express')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const _ = require('underscore')
const router = express.Router()

router.get('/', async (req, res) => {
    const vats = await db.query('SELECT * FROM vats')
    res.send(helpers.validateArr(vats))
})

module.exports = router
