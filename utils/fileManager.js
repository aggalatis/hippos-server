const fs = require("fs")
var iconv = require("iconv-lite")
const helpers = require("./helpers")

function createReceipt(receiptNumber, orderData) {
    let receiptHeader = global.parameters.receipt.header.join("\r\n")
    receiptHeader = receiptHeader.replace("{userName}", "tameio")
    receiptHeader = receiptHeader.replace("{receiptNumber}", receiptNumber)
    receiptHeader = receiptHeader.replace("{dateTime}", helpers.getReceiptDate())
    let productsArr = []
    for (let pr of orderData.products) {
        let prStr = ""
        let quan = pr.product_quantity.toString().padEnd(5, " ")
        let name = pr.product_name.substring(0, 10).padEnd(10, " ")
        let price = pr.product_price.toString().replace(".", ",").padStart(7, " ")
        let value = ((pr.product_price - pr.product_discount) * pr.product_quantity)
            .toFixed(2)
            .toString()
            .replace(".", ",")
            .padStart(7, " ")
        let vat = pr.product_vat_percent.padStart(5, " ")
        prStr = " " + quan + name + price + value + vat
        productsArr.push(prStr)
    }

    let receiptFooter = global.parameters.receipt.footer.join("\r\n")
    receiptFooter = receiptFooter.replace(
        "{synolo}",
        orderData.totals.sumStartPrice.toString().replace(".", ",").padStart(7, " ")
    )
    receiptFooter = receiptFooter.replace(
        "{discount}",
        orderData.totals.sumDiscount.toString().replace(".", ",").padStart(7, " ")
    )
    receiptFooter = receiptFooter.replace(
        "{finalPrice}",
        orderData.totals.sumTotal.toString().replace(".", ",").padStart(7, " ")
    )
    let paymentType = orderData.order_payment_method == "cash" ? "μετρητά" : "πιστωτική κάρτα"
    receiptFooter = receiptFooter.replace("{typeOfReceipt}", paymentType)
    let buff = iconv.encode(
        receiptHeader + "\r\n" + productsArr.join("\r\n") + "\r\n" + receiptFooter,
        "win1253"
    )
    fs.writeFile(
        `${global.parameters.receipt.path}hippos_${orderData.user_name.replace(
            " ",
            ""
        )}_${receiptNumber}.txt`,
        buff,
        (err) => helpers.log(err)
    )
}

module.exports = {
    createReceipt,
}
