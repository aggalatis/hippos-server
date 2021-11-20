const express = require("express")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const router = express.Router()

router.get("/", async (req, res) => {
    const products = await db.query("SELECT * FROM products WHERE product_deleted = 0")
    res.send(helpers.validateArr(products))
})

module.exports = router
