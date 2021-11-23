const express = require("express")
const _ = require("underscore")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const router = express.Router()

router.post("/", async (req, res) => {
    const customerData = req.body.customerData
    const newCustomer = await db.query(
        "INSERT INTO customers " +
            "(customer_fullname, customer_phone, customer_branch, customer_address, customer_address_number, customer_area, customer_vat_number, customer_tax_office, customer_postal_code, customer_bussiness, customer_load, customer_destination, customer_date_created) " +
            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [
            customerData.customer_fullname,
            customerData.customer_phone,
            customerData.customer_branch,
            customerData.customer_address,
            customerData.customer_address_number,
            customerData.customer_area,
            customerData.customer_vat_number,
            customerData.customer_tax_office,
            customerData.customer_postal_code,
            customerData.customer_bussiness,
            customerData.customer_load,
            customerData.customer_destination,
            helpers.getDateTimeNowMysql(),
        ]
    )
    if (_.isUndefined(newCustomer.insertId)) {
        res.send({ status: 500, data: "Αδυναμία καταχώρησης πελάτη." })
        return
    }
    res.send({ status: 200, data: "Επιτυχής καταχώρηση πελάτη." })
})

router.get("/all", async (req, res) => {
    const customers = await db.query("SELECT * FROM customers", [])
    if (_.isEmpty(customers)) {
        res.send({ status: 500, data: [] })
        return
    }
    res.send({ status: 200, data: customers })
})

module.exports = router
