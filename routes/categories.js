const express = require('express')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const _ = require('underscore')
const router = express.Router()

router.get('/', async (req, res) => {
    const categories = await db.query('SELECT * FROM categories WHERE category_deleted = 0')
    res.send(helpers.validateArr(categories))
})

router.get('/all', async (req, res) => {
    const categories = await db.query('SELECT * FROM categories;')
    res.send(helpers.validateArr(categories))
})

router.post('/', async (req, res) => {
    console.log(req.body)
    const categoryData = req.body.categoryData
    const newUser = await db.query(
        'INSERT INTO categories ' +
            '(category_name, category_font_size, category_color, category_order, category_date_created, category_deleted) ' +
            'VALUES (?,?,?,?,?,?)',
        [
            categoryData.categoryName,
            categoryData.categoryFontSize,
            categoryData.categoryColor,
            categoryData.categoryDeleted,
            helpers.getDateTimeNowMysql(),
            categoryData.categoryDeleted,
        ]
    )
    if (_.isUndefined(newUser.insertId)) {
        res.send({ status: 500, message: 'Αδυναμία καταχώρησης κατηγορίας.' })
        return
    }
    res.send({ status: 200, message: 'Επιτυχής καταχώρηση κατηγορίας.' })
})

router.delete('/:id', async (req, res) => {
    const categoryId = req.params.id
    const response = await db.query('DELETE FROM categories WHERE category_id = ? LIMIT 1', [categoryId])
    await db.query('DELETE FROM products WHERE product_category_id = ?', [categoryId])
    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία διαγραφής κατηγορίας.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής διαγραφή κατηγορίας.',
        })
    }
})

router.put('/', async (req, res) => {
    let categoryData = req.body.categoryData
    const response = await db.query(
        `UPDATE categories SET 
        category_name = ?,
        category_order = ?,
        category_font_size = ?,
        category_color = ?,
        category_deleted = ?
        WHERE category_id = ?`,
        [
            categoryData.categoryName,
            categoryData.categoryOrder,
            categoryData.categoryFontSize,
            categoryData.categoryColor,
            categoryData.categoryDeleted,
            categoryData.categoryID,
        ]
    )

    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία επεξεργασίας κατηγορίας.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχία επεξεργασίας κατηγορίας.',
        })
    }
})

module.exports = router
