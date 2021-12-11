const fs = require("fs")
const db = require("./database")
const moment = require("moment")
const _ = require("underscore")

function getParameters() {
    return require("C:\\hippos\\hippos_server\\parameters.json")
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
    return moment().format("DD-MM-YYYY HH:mm:ss")
}

function getDateTimeNowMysql() {
    return moment().format("YYYY-MM-DD HH:mm:ss")
}

function getReceiptDate() {
    return moment().format("DD/MM/YYYY HH:mm")
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
    let explodedDatetime = dateTime.split(" ")
    let dateArray = explodedDatetime[0].split("-")
    return dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0] + " " + explodedDatetime[1]
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
        if (sum.order_payment_method == "cash") {
            finalSum[sum.user_name].cash_income_count = sum.order_total
        }
        if (sum.order_payment_method == "card") {
            finalSum[sum.user_name].card_income_count = sum.order_total
        }
        finalSum[sum.user_name].sum_discount_count += sum.order_discount
        finalSum[sum.user_name].sum_customer_count += sum.customers_count
    }
    return _.values(finalSum)
}

function formatOrderDataForRocket(orderData) {
    console.log(orderData)
    const vats = await db.query("SELECT * FROM vats WHERE vat_deleted = 0")
    let prodTotal = 0
    let prodVatTotal = 0
    let grossTotal = 0
    let vatTotal = 0
    let cleanTotal = 0
    for (let prod of orderData.products) {
        let vatData = vats.find(el => el.vat_id == prod.product_vat_id)
        prodTotal = (parseFloat(prod.product_subtotal) - parseFloat(prod.product_discount)).toFixed(2)
        prodVatTotal = (prodTotal / vatData.vat_decimal_full).toFixed(2)
        grossTotal += prodTotal
        vatTotal += prodVatTotal
    }
    cleanTotal = grossTotal - vatTotal
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
