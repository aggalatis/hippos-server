const express = require('express')
const _ = require('underscore')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const printMng = require('../utils/printManager')
const mailMng = require('../utils/mailManager')
const router = express.Router()

router.get('/lastDay', async (req, res) => {
    const lastColeDate = await db.query('SELECT day_closure_datetime FROM day_closure ORDER BY day_closure_id DESC LIMIT 1;', [])
    if (_.isEmpty(lastColeDate)) {
        res.send({ status: 500, data: 'Αδυναμία επιλογής τελευταίου κλεισίματος.' })
        return
    }
    let summary = await db.query(
        'SELECT order_payment_method, sum(order_total) as income_count, count(*) as customer_count FROM orders WHERE order_date_created > ? GROUP BY order_payment_method',
        [lastColeDate[0].day_closure_datetime]
    )
    if (global.parameters.summaries.view == false) summary = []
    res.send({ status: 200, lastDayClose: lastColeDate[0].day_closure_datetime, data: summary })
})

router.get('/X', async (req, res) => {
    const lastColeDate = await db.query('SELECT day_closure_datetime FROM day_closure ORDER BY day_closure_id DESC LIMIT 1;', [])
    const summary = await db.query(
        'SELECT \
        usr.user_name as user_name, \
        ord.order_payment_method as order_payment_method, \
        sum(ord.order_subtotal) as order_subtotal, \
        sum(ord.order_discount) as order_discount, \
        sum(ord.order_total) as order_total, \
        count(*) as customers_count \
        FROM orders as ord \
        JOIN users as usr on ord.order_user_id = usr.user_id \
        WHERE ord.order_date_created > ? \
        GROUP BY user_name, order_payment_method',
        [lastColeDate[0].day_closure_datetime]
    )
    let formattedSummaries = helpers.changeSummariesFormat(summary)
    let mailResponse = false
    let printResponse = false
    if (global.parameters.summaries.print == true)
        printResponse = await printMng.printSummaryReport('ΑΝΑΛΥΣΗ ΤΑΜΕΙΟΥ:', lastColeDate[0].day_closure_datetime, formattedSummaries)

    if (global.parameters.summaries.email == true)
        mailResponse = await mailMng.mailSummaryReport('ΑΝΑΛΥΣΗ ΤΑΜΕΙΟΥ:', lastColeDate[0].day_closure_datetime, formattedSummaries)

    res.send({ status: 200, data: { mail: mailResponse, print: printResponse } })
})

router.get('/Z', async (req, res) => {
    const lastColeDate = await db.query('SELECT day_closure_datetime FROM day_closure ORDER BY day_closure_id DESC LIMIT 1;', [])
    const summary = await db.query(
        'SELECT \
        usr.user_name as user_name, \
        ord.order_payment_method as order_payment_method, \
        sum(ord.order_subtotal) as order_subtotal, \
        sum(ord.order_discount) as order_discount, \
        sum(ord.order_total) as order_total, \
        count(*) as customers_count \
        FROM orders as ord \
        JOIN users as usr on ord.order_user_id = usr.user_id \
        WHERE ord.order_date_created > ? \
        GROUP BY user_name, order_payment_method',
        [lastColeDate[0].day_closure_datetime]
    )
    let formattedSummaries = helpers.changeSummariesFormat(summary)
    let mailResponse = false
    let printResponse = false
    if (global.parameters.summaries.print == true) {
        printResponse = await printMng.printSummaryReport('ΚΛΕΙΣΙΜΟ ΤΑΜΕΙΟΥ:', lastColeDate[0].day_closure_datetime, formattedSummaries)
    }
    if (global.parameters.summaries.email == true) {
        mailResponse = await mailMng.mailSummaryReport('ΚΛΕΙΣΙΜΟ ΤΑΜΕΙΟΥ:', lastColeDate[0].day_closure_datetime, formattedSummaries)
    }
    await db.query('INSERT INTO day_closure (day_closure_datetime) VALUES (?)', [helpers.getDateTimeNowMysql()])
    if (global.parameters.summaries.clear) {
        await db.query('DELETE FROM orders', [])
        await db.query('DELETE FROM order_products', [])
    }

    res.send({ status: 200, data: { mail: mailResponse, print: printResponse } })
})
module.exports = router
