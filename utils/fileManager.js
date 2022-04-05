const fs = require('fs')
const iconv = require('iconv-lite')
const helpers = require('./helpers')
const _ = require('underscore')

function createReceipt(receiptNumber, orderData) {
    if (global.parameters.receipt.print != true) return
    let receiptHeader = global.parameters.receipt.header.join('\r\n')
    receiptHeader = receiptHeader.replace('{userName}', orderData.user_name)
    receiptHeader = receiptHeader.replace('{receiptNumber}', receiptNumber)
    receiptHeader = receiptHeader.replace('{dateTime}', helpers.getReceiptDate())
    let productsArr = []
    for (let pr of orderData.products) {
        if (typeof pr.product_price === 'string') pr.product_price = parseFloat(pr.product_price)
        let prStr = ''
        let quan = pr.product_quantity.toString().padEnd(5, ' ')
        let name = pr.product_name.substring(0, 10).padEnd(10, ' ')
        let price = pr.product_price.toFixed(2).toString().replace('.', ',').padStart(7, ' ')
        let value = ((pr.product_price - pr.product_discount) * pr.product_quantity).toFixed(2).toString().replace('.', ',').padStart(7, ' ')
        let vat = pr.product_vat_percent.padStart(5, ' ')
        prStr = ' ' + quan + name + price + value + vat
        productsArr.push(prStr)
    }

    let receiptFooter = global.parameters.receipt.footer.join('\r\n')
    receiptFooter = receiptFooter.replace('{synolo}', orderData.totals.sumStartPrice.toString().replace('.', ',').padStart(7, ' '))
    receiptFooter = receiptFooter.replace('{discount}', orderData.totals.sumDiscount.toString().replace('.', ',').padStart(7, ' '))
    receiptFooter = receiptFooter.replace('{finalPrice}', orderData.totals.sumTotal.toString().replace('.', ',').padStart(7, ' '))
    let paymentType = orderData.order_payment_method == 'cash' ? 'μετρητά' : 'πιστωτική κάρτα'
    receiptFooter = receiptFooter.replace('{typeOfReceipt}', paymentType)
    let buff = iconv.encode(receiptHeader + '\r\n' + productsArr.join('\r\n') + '\r\n' + receiptFooter, 'win1253')
    fs.writeFile(`${global.parameters.receipt.path}hippos_${orderData.user_name.replace(' ', '')}_${receiptNumber}.txt`, buff, err => {
        if (err) helpers.log(`Print err: ${err}`)
    })
}

async function createInvoice(invoiceNumber, orderData, orderMark, vats) {
    if (global.parameters.invoice.print != true) return
    let invoiceHeader = global.parameters.invoice.header.join('\r\n')
    invoiceHeader = invoiceHeader.replace('{invoiceNumber}', invoiceNumber)
    invoiceHeader = invoiceHeader.replace('{invoiceMark}', orderMark)
    invoiceHeader = invoiceHeader.replace('{invoiceSeira}', global.parameters.server.rocketSeira)
    invoiceHeader = invoiceHeader.replace('{dateTime}', helpers.getReceiptDate())
    invoiceHeader = invoiceHeader.replace('{userName}', orderData.user_name)
    invoiceHeader = invoiceHeader.replace('{customerFullname}', orderData.customer.customer_fullname)
    invoiceHeader = invoiceHeader.replace('{customerBussiness}', orderData.customer.customer_bussiness)
    invoiceHeader = invoiceHeader.replace('{customerAddress}', orderData.customer.customer_address)
    invoiceHeader = invoiceHeader.replace('{customerAddressNumber}', orderData.customer.customer_address_number)
    invoiceHeader = invoiceHeader.replace('{customerArea}', orderData.customer.customer_area)
    invoiceHeader = invoiceHeader.replace('{customerPostalCode}', orderData.customer.customer_postal_code)
    invoiceHeader = invoiceHeader.replace('{customerVat}', orderData.customer.customer_vat_number)
    invoiceHeader = invoiceHeader.replace('{customerDoy}', orderData.customer.customer_tax_office)
    invoiceHeader = invoiceHeader.replace('{customerLoad}', orderData.customer.customer_load)
    invoiceHeader = invoiceHeader.replace('{customerDestination}', orderData.customer.customer_destination)

    let invoiceFooter = global.parameters.invoice.footer.join('\r\n')
    invoiceFooter = invoiceFooter.replace('{paymentType}', orderData.order_payment_method == 'cash' ? 'μετρητά' : 'πιστωτική κάρτα')

    let invoiceData = helpers.formatOrderDataForRocket(orderData, vats)
    let prodArr = []
    for (let ln of invoiceData.lines) {
        let lnStr = ''
        let quan = ln.quantity.toString().padEnd(5, ' ')
        let name = ln.comment.substring(0, 10).padEnd(10, ' ')
        let price = ln.netValue.toString().replace('.', ',').padStart(14, ' ')
        let vat = ln.vatPercent.toString().replace('%', '').padStart(5, ' ')
        lnStr = ' ' + quan + name + price + vat
        prodArr.push(lnStr)
    }

    let vatsArr = []
    let vatKeys = _.keys(invoiceData.vatTotals)
    for (let lnVat of vatKeys) {
        let vatLn = ''
        let vatType = lnVat.toString().padEnd(5, ' ')
        let vatNet = invoiceData.vatTotals[lnVat].netValue.toFixed(2).toString().replace('.', ',').padStart(12, ' ')
        let vatTax = invoiceData.vatTotals[lnVat].taxValue.toFixed(2).toString().replace('.', ',').padStart(17, ' ')
        vatLn = ' ' + vatType + vatNet + vatTax
        vatsArr.push(vatLn)
    }
    let invoiceVatAnalysis = global.parameters.invoice.vatAnalysis.join('\r\n')
    invoiceVatAnalysis = invoiceVatAnalysis.replace(
        '{synolo}',
        (parseFloat(invoiceData.totals.discount) + parseFloat(invoiceData.totals.subtotal)).toString().replace('.', ',').padStart(5, ' ')
    )
    invoiceVatAnalysis = invoiceVatAnalysis.replace('{discount}', invoiceData.totals.discount.toString().replace('.', ',').padStart(5, ' '))
    invoiceVatAnalysis = invoiceVatAnalysis.replace('{totalNet}', invoiceData.totals.subtotal.toString().replace('.', ',').padStart(5, ' '))
    invoiceVatAnalysis = invoiceVatAnalysis.replace('{totalVat}', invoiceData.totals.vatTotal.toString().replace('.', ',').padStart(5, ' '))
    invoiceVatAnalysis = invoiceVatAnalysis.replace('{totalGross}', invoiceData.totals.total.toString().replace('.', ',').padStart(5, ' '))

    let buff = iconv.encode(
        invoiceHeader + '\r\n' + prodArr.join('\r\n') + '\r\n' + invoiceVatAnalysis + '\r\n' + vatsArr.join('\r\n') + '\r\n' + invoiceFooter + '\r\n',
        'win1253'
    )
    fs.writeFile(`${global.parameters.invoice.path}hippos_${orderData.user_name.replace(' ', '')}_${invoiceNumber}.txt`, buff, err => {
        if (err) helpers.log(`Print err: ${err}`)
    })
}

module.exports = {
    createReceipt,
    createInvoice,
}
