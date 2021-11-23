const express = require("express")
const _ = require("underscore")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const printMng = require("../utils/printManager")
const mailMng = require("../utils/mailManager")
const router = express.Router()

router.get("/lastDay", async (req, res) => {
    const lastColeDate = await db.query(
        "SELECT day_closure_datetime FROM day_closure ORDER BY day_closure_id DESC LIMIT 1;",
        []
    )
    if (_.isEmpty(lastColeDate)) {
        res.send({ status: 500, data: "Αδυναμία επιλογής τελευταίου κλεισίματος." })
        return
    }
    const summary = await db.query(
        "SELECT order_payment_method, sum(order_total) as income_count, count(*) as customer_count FROM orders WHERE order_date_created > ? GROUP BY order_payment_method",
        [lastColeDate[0].day_closure_datetime]
    )
    res.send({ status: 200, lastDayClose: lastColeDate[0].day_closure_datetime, data: summary })
})

router.get("/X", async (req, res) => {
    const lastColeDate = await db.query(
        "SELECT day_closure_datetime FROM day_closure ORDER BY day_closure_id DESC LIMIT 1;",
        []
    )
    const summary = await db.query(
        "SELECT order_payment_method, sum(order_total) as income_count, count(*) as customer_count FROM orders WHERE order_date_created > ? GROUP BY order_payment_method",
        [lastColeDate[0].day_closure_datetime]
    )
    let mailResponse = false
    let printResponse = false
    if (global.parameters.summaries.print == true) {
        printResponse = printMng.printSummaryReport(lastColeDate[0].day_closure_datetime, summary)
    }
    if (global.parameters.summaries.email == true) {
        mailResponse = await mailMng.mailSummaryReport(
            "ΑΝΑΛΥΣΗ ΤΑΜΕΙΟΥ:",
            lastColeDate[0].day_closure_datetime,
            summary
        )
    }
    res.send({ status: 200, data: { mail: mailResponse, print: printResponse } })
})
module.exports = router
