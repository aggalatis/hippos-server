const express = require('express')
const _ = require('underscore')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const server = require('../utils/server')
const fileManager = require('../utils/fileManager')
const router = express.Router()

router.post('/receipt', async (req, res) => {
    const orderData = req.body.orderData
    const currentReceiptNumber = await db.getDocumentCurrentNumber(1)
    const newOrder = await db.query(
        'INSERT INTO orders ' +
            '(order_document_number, order_document_type, order_user_id, order_quantity, order_subtotal, order_discount, order_total, order_payment_method, order_date_created) ' +
            'VALUES (?,?,?,?,?,?,?,?,?)',
        [
            currentReceiptNumber + 1,
            1,
            orderData.user_id,
            orderData.totals.sumQt,
            orderData.totals.sumStartPrice,
            orderData.totals.sumDiscount,
            orderData.totals.sumTotal,
            orderData.order_payment_method,
            helpers.getDateTimeNowMysql(),
        ]
    )
    if (_.isUndefined(newOrder.insertId)) {
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης παραγγελίας.' })
        return
    }
    const productsAdded = await db.createProductsForOrder(newOrder.insertId, orderData)
    if (productsAdded != true) {
        db.query('DELETE FROM orders WHERE order_id = ? LIMIT 1', [newOrder.insertId])
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης παραγγελίας.' })
        return
    }
    db.updateDocumentNumber(1)
    fileManager.createReceipt(currentReceiptNumber + 1, orderData)
    res.send({ status: 200, data: 'Επιτυχής καταχώρηση παραγγελίας.' })
})

router.post('/invoice', async (req, res) => {
    const orderData = req.body.orderData
    const currentInvoiceNumber = await db.getDocumentCurrentNumber(2)
    let orderMark = null
    const vats = await db.query('SELECT * FROM vats WHERE vat_deleted = 0')
    if (global.parameters.invoice.myData == true) orderMark = await server.sendInvoiceToRocketax(currentInvoiceNumber + 1, orderData, vats)
    if (global.parameters.invoice.myData == true && orderMark == null) {
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης τιμολογίου στην ΑΑΔΕ' })
        return
    }
    const newOrder = await db.query(
        'INSERT INTO orders ' +
            '(order_document_number, order_customer_id, order_document_type, order_user_id, order_quantity, order_subtotal, order_discount, order_total, order_payment_method, order_date_created, order_mark) ' +
            'VALUES (?,?,?,?,?,?,?,?,?,?,?)',
        [
            currentInvoiceNumber + 1,
            orderData.customer.customer_id,
            2,
            orderData.user_id,
            orderData.totals.sumQt,
            orderData.totals.sumStartPrice,
            orderData.totals.sumDiscount,
            orderData.totals.sumTotal,
            orderData.order_payment_method,
            helpers.getDateTimeNowMysql(),
            orderMark,
        ]
    )
    if (_.isUndefined(newOrder.insertId)) {
        res.send({ status: 500, data: 'Αδυναμία καταχώρησης παραγγελίας.' })
        return
    }
    await db.createProductsForOrder(newOrder.insertId, orderData)
    db.updateDocumentNumber(2)
    fileManager.createInvoice(currentInvoiceNumber + 1, orderData, orderMark, vats)
    res.send({ status: 200, data: 'Επιτυχής καταχώρηση παραγγελίας.' })
})

module.exports = router
