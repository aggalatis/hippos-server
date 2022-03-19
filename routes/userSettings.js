const express = require('express')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const router = express.Router()

router.get('/:id', async (req, res) => {
    const userSettings = await db.query(`SELECT * FROM user_settings where user_settings_user_id = ${req.params.id} LIMIT 1;`)
    res.send(helpers.validateArr(userSettings))
})

module.exports = router
