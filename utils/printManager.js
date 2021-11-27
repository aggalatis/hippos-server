const escpos = require("escpos")
const iconv = require("iconv-lite")
escpos.Network = require("escpos-network")
escpos.USB = require("escpos-usb")

const helpers = require("./helpers")

function printSummaryReport(subject, lastCloseDate, summaries) {
    let device = null
    if (global.parameters.summaries.printerType == "usb") {
        device = new escpos.USB(0x01, 0xff)
    } else {
        device = new escpos.Network(global.parameters.summaries.printerConn)
    }
    const printer = new escpos.Printer(device, { encoding: "cp737" })
    let printText = preparePrintString(subject, lastCloseDate, summaries)
    device.open(err => {
        if (err) helpers.log(`Printing error: ${err}`)
        printer.font("a").align("ct").size(0.5, 0.5).text(printText).feed().feed().feed().cut().close()
    })
    return true
}

function preparePrintString(subject, lastCloseDate, summaries) {
    let finalString = ""
    finalString += `ΗΜΕΡΟΜΗΝΙΑ: ${helpers.getDateTimeNow()}\n`
    finalString += `${subject} ${global.parameters.store.name}\n`
    finalString += `ΑΠΟ: ${helpers.changeMysqlDateToNormal(lastCloseDate)}\n`
    finalString += `ΕΩΣ: ${helpers.getDateTimeNow()}\n`
    finalString += `--------------------------------\n`
    let sumCash = 0
    let sumCards = 0
    let sumDiscount = 0
    let sumCustomers = 0
    for (let userSum of summaries) {
        finalString += `ΧΡΗΣΤΗΣ: ${userSum.user_name}\n`
        finalString += `ΜΕΤΡΗΤΑ: ${userSum.cash_income_count.toFixed(2)}\n`
        finalString += `ΚΑΡΤΕΣ: ${userSum.card_income_count.toFixed(2)}\n`
        finalString += `ΕΚΠΤΩΣΕΙΣ: ${userSum.sum_discount_count.toFixed(2)}\n`
        finalString += `ΣΥΟΛΟ: ${(userSum.cash_income_count + userSum.card_income_count).toFixed(2)}\n`
        finalString += `ΠΑΡΑΓΓΕΛΙΕΣ: ${userSum.sum_customer_count.toFixed(0)}\n`
        finalString += `-------------------------------------\n`
        sumCash = sumCash + userSum.cash_income_count
        sumCards = sumCards + userSum.card_income_count
        sumDiscount = sumDiscount + userSum.sum_discount_count
        sumCustomers = sumCustomers + userSum.sum_customer_count
    }
    finalString += `ΣΥΝΟΛΟ ΟΛΩΝ ΤΩΝ ΧΡΗΣΤΩΝ:\n`
    finalString += `ΜΕΤΡΗΤΑ: ${sumCash.toFixed(2)}\n`
    finalString += `ΚΑΡΤΕΣ: ${sumCards.toFixed(2)}\n`
    finalString += `ΕΚΠΤΩΣΕΙΣ: ${sumDiscount.toFixed(2)}\n`
    finalString += `ΣΥΟΛΟ: ${(sumCash + sumCards).toFixed(2)}\n`
    finalString += `ΠΑΡΑΓΓΕΛΙΕΣ: ${sumCustomers.toFixed(0)}\n`
    finalString += `-------------------------------------\n`
    return finalString
}

module.exports = {
    printSummaryReport,
}
