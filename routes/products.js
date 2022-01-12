const express = require('express')
const _ = require('underscore')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const router = express.Router()

router.get('/', async (req, res) => {
    const products = await db.query('SELECT * FROM products WHERE product_deleted = 0')
    res.send(helpers.validateArr(products))
})

router.get('/all', async (req, res) => {
    const products = await db.query('SELECT p.*, c.category_name FROM products p JOIN categories c ON c.category_id = p.product_category_id ')
    res.send(helpers.validateArr(products))
})

router.delete('/:id', async (req, res) => {
    const productId = req.params.id
    const response = await db.query('DELETE FROM products WHERE product_id = ? LIMIT 1', [productId])
    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία διαγραφής προϊόντος.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής διαγραφή προϊόντος.',
        })
    }
})

router.post('/', async (req, res) => {
    const productData = req.body.productData
    const newUser = await db.query(
        'INSERT INTO products ' +
            '(product_category_id, product_name, product_free_price, product_price, product_vat_id, product_vat_percent, product_font_size, product_color, product_order, product_date_created, product_deleted) ' +
            'VALUES (?,?,?,?,?,?,?,?,?,?,?)',
        [
            productData.productCategory,
            productData.productName,
            productData.productFreePrice,
            productData.productPrice,
            productData.productVatID,
            productData.prouductVatPercent,
            productData.productFontSize,
            productData.productColor,
            productData.productOrder,
            helpers.getDateTimeNowMysql(),
            productData.productDeleted,
        ]
    )
    if (_.isUndefined(newUser.insertId)) {
        res.send({ status: 500, message: 'Αδυναμία καταχώρησης προϊόντος.' })
        return
    }
    res.send({ status: 200, message: 'Επιτυχής καταχώρηση προϊόντος.' })
})

router.delete('/:id', async (req, res) => {
    const productsId = req.params.id
    const response = await db.query('DELETE FROM products WHERE product_id = ? LIMIT 1', [productsId])
    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία διαγραφής προϊόντος.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής διαγραφή προϊόντος.',
        })
    }
})

router.put('/', async (req, res) => {
    let productData = req.body.productData
    const response = await db.query(
        `UPDATE products SET 
        product_name = ?,
        product_category_id = ?,
        product_free_price = ?,
        product_price = ?,
        product_vat_id = ?,
        product_vat_percent = ?,
        product_font_size = ?,
        product_color = ?,
        product_order = ?,
        product_deleted = ?
        WHERE product_id = ?`,
        [
            productData.productName,
            productData.productCategory,
            productData.productFreePrice,
            productData.productPrice,
            productData.productVatID,
            productData.prouductVatPercent,
            productData.productFontSize,
            productData.productColor,
            productData.productOrder,
            productData.productDeleted,
            productData.productID,
        ]
    )

    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία επεξεργασίας προϊόντος.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχία επεξεργασίας προϊόντος.',
        })
    }
})

module.exports = router
