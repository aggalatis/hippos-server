const fs = require('fs')
const moment = require('moment')
const _ = require('underscore')

function getParameters() {
    return require('C:\\hippos\\hippos_server\\parameters.json')
}
function log(string) {
    fs.appendFile(global.parameters.server.logFile, `${getDateTimeNow()} --> ${string}\n`, err => {
        if (err) throw err
    })
}
function deleteFile(file) {
    fs.unlink(file, err => {
        if (err) console.log(`Unable to delete file...`)
    })
}

function getDateTimeNow() {
    return moment().format('DD/MM/YYYY HH:mm:ss')
}

function getDateTimeNowMysql() {
    return moment().format('YYYY-MM-DD HH:mm:ss')
}

function getReceiptDate() {
    return moment().format('DD/MM/YYYY HH:mm')
}
function getDateWithFormat(format) {
    return moment().format(format)
}

function validateArr(arr) {
    if (arr.length > 0) {
        return {
            status: 200,
            data: arr,
        }
    } else {
        return {
            status: 500,
            data: null,
        }
    }
}

function validateObj(obj) {
    if (!_.isEmpty(obj)) {
        return {
            status: 200,
            data: obj,
        }
    } else {
        return {
            status: 500,
            data: null,
        }
    }
}

function changeMysqlDateToNormal(dateTime) {
    let explodedDatetime = dateTime.split(' ')
    let dateArray = explodedDatetime[0].split('-')
    return dateArray[2] + '/' + dateArray[1] + '/' + dateArray[0] + ' ' + explodedDatetime[1]
}

function changeSummariesFormat(summaries) {
    if (_.isEmpty(summaries)) return []
    let finalSum = {}
    for (let sum of summaries) {
        if (_.isUndefined(finalSum[sum.user_name])) {
            finalSum[sum.user_name] = {
                user_name: sum.user_name,
                cash_income_count: 0,
                card_income_count: 0,
                sum_discount_count: 0,
                sum_customer_count: 0,
            }
        }
        if (sum.order_payment_method == 'cash') {
            finalSum[sum.user_name].cash_income_count = sum.order_total
        }
        if (sum.order_payment_method == 'card') {
            finalSum[sum.user_name].card_income_count = sum.order_total
        }
        finalSum[sum.user_name].sum_discount_count += sum.order_discount
        finalSum[sum.user_name].sum_customer_count += sum.customers_count
    }
    return _.values(finalSum)
}

function formatOrderDataForRocket(orderData, vats) {
    let pieceGrossValue = 0
    let pieceNetValue = 0
    let pieceVatvalue = 0
    let netTotal = 0
    let vatTotal = 0

    let pieceDiscount = 0
    let pieceNetDiscount = 0
    let discountTotal = 0
    let vatTotalsObj = {}
    let lines = []
    for (let prod of orderData.products) {
        let vatData = vats.find(el => el.vat_id == prod.product_vat_id)

        pieceGrossValue = (parseFloat(prod.product_price) - parseFloat(prod.product_discount)) * prod.product_quantity
        pieceNetValue = pieceGrossValue / vatData.vat_decimal_full
        pieceVatvalue = pieceGrossValue - pieceNetValue
        pieceDiscount = parseFloat(prod.product_discount)
        pieceNetDiscount = pieceDiscount / vatData.vat_decimal_full

        if (typeof vatTotalsObj[vatData.vat_percent] === 'undefined') vatTotalsObj[vatData.vat_percent] = { netValue: 0, taxValue: 0 }
        lines.push({
            quantity: prod.product_quantity,
            netValue: pieceNetValue.toFixed(2),
            taxValue: pieceVatvalue.toFixed(2),
            grossValue: pieceGrossValue.toFixed(2),
            vatCategory: vatData.vat_rocket_id,
            vatPercent: vatData.vat_percent,
            discountNetValue: pieceNetDiscount.toFixed(2),
            comment: prod.product_name,
            measurementUnit: '1',
        })
        vatTotalsObj[vatData.vat_percent].netValue += parseFloat(pieceNetValue.toFixed(2))
        vatTotalsObj[vatData.vat_percent].taxValue += parseFloat(pieceVatvalue.toFixed(2))

        netTotal += parseFloat(pieceNetValue.toFixed(2))
        vatTotal += parseFloat(pieceVatvalue.toFixed(2))
        discountTotal += parseFloat(pieceNetDiscount.toFixed(2))
    }
    return {
        lines: lines,
        totals: {
            subtotal: netTotal.toFixed(2),
            vatTotal: vatTotal.toFixed(2),
            total: (netTotal + vatTotal).toFixed(2),
            discount: discountTotal.toFixed(2),
        },
        vatTotals: vatTotalsObj,
    }
}
module.exports = {
    getParameters,
    log,
    deleteFile,
    getDateTimeNow,
    getDateTimeNowMysql,
    validateArr,
    validateObj,
    getReceiptDate,
    changeMysqlDateToNormal,
    changeSummariesFormat,
    getDateWithFormat,
    formatOrderDataForRocket,
}
