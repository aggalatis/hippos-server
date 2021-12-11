const express = require("express")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const router = express.Router()

router.get("/", async (req, res) => {
    const categories = await db.query("SELECT * FROM categories WHERE category_deleted = 0")
    res.send(helpers.validateArr(categories))
})

module.exports = router
