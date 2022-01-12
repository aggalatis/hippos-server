const mysql = require('mysql2/promise')
const helpers = require('./helpers')

const configuration = {
    host: global.parameters.database.host,
    port: global.parameters.database.port,
    user: global.parameters.database.user,
    password: global.parameters.database.pass,
    database: global.parameters.database.database,
    connectTimeout: 50000,
    dateStrings: true,
}

async function query(sql, params = []) {
    try {
        const conn = await mysql.createConnection(configuration)
        const [rows, fields] = await conn.execute(sql, params)
        conn.end()
        return rows
    } catch (ex) {
        helpers.log(`Query exx: ${ex}`)
        return []
    }
}

async function getDocumentCurrentNumber(documentId) {
    const document = await query('SELECT document_number FROM documents WHERE document_id = ? LIMIT 1', [documentId])
    return document[0].document_number
}

async function updateDocumentNumber(documentId) {
    const document = await query('UPDATE documents SET document_number = document_number + 1 WHERE document_id = ? LIMIT 1', [documentId])
}

async function createProductsForOrder(orderId, orderData) {
    for (let i = 0; i < orderData.products.length; i++) {
        let prod = orderData.products[i]

        let productSubtotal = prod.product_price * prod.product_quantity
        let productDiscount = prod.product_discount
        let productTotal = productSubtotal - productDiscount * prod.product_quantity
        const insert = await query(
            'INSERT INTO order_products (order_product_order_id, order_product_product_id, order_product_name, order_product_quantity, order_product_price, order_product_vat_id, order_product_subtotal, order_product_discount, order_product_total, order_product_date_created) ' +
                'VALUES (?,?,?,?,?,?,?,?,?,?)',
            [
                orderId,
                prod.product_id,
                prod.product_name,
                prod.product_quantity,
                prod.product_price,
                prod.product_vat_id,
                productSubtotal,
                productDiscount,
                productTotal,
                helpers.getDateTimeNowMysql(),
            ]
        )
        if (insert == []) return false
    }
    return true
}

module.exports = {
    query,
    getDocumentCurrentNumber,
    createProductsForOrder,
    updateDocumentNumber,
}
