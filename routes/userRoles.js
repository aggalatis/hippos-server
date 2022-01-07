const express = require('express')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const router = express.Router()

router.get('/', async (req, res) => {
    const userRoles = await db.query('SELECT * FROM user_roles')
    res.send(helpers.validateArr(userRoles))
})

module.exports = router
