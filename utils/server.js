const _ = require("underscore")
const axios = require("axios")
const jwt = require("jsonwebtoken")
const helpers = require("./helpers")

async function validateRocketaxToken() {
    if (_.isEmpty(global.parameters.rocketaxToken)) {
        let rocketResponse = await getRocketServerToken()
        if (_.isEmpty(rocketResponse.data.token)) return null
        global.parameters.rocketaxToken = rocketResponse.data.token
        return rocketResponse.data.token
    }
    return global.parameters.rocketaxToken
}

async function getRocketServerToken() {
    return new Promise((resolve, reject) => {
        axios
            .post(`${global.parameters.server.aadeUrl}Clients/Authenticate`, {
                username: global.parameters.server.rocketUser,
                password: global.parameters.server.rocketPass,
            })
            .then(response => {
                if (response.status == 200) resolve(response.data)
                resolve(null)
            })
            .catch(error => {
                helpers.log(error.message)
                reject(error)
            })
    })
}

async function sendInvoiceToRocketax(invoiceNumber, orderData) {
    let token = await validateRocketaxToken()
    let userData = jwt.decode(token)
    const headers = {
        Authorization: token,
    }
    let invoiceData = helpers.formatOrderDataForRocket(orderData)
    let rocketMessage = {
        customer: {
            address: orderData.customer.customer_address,
            area: orderData.customer.customer_area,
            branch: orderData.customer.customer_branch,
            doy: orderData.customer.customer_tax_office,
            name: orderData.customer.customer_fullname,
            number: orderData.customer.customer_address_number,
            vat: orderData.customer.customer_vat_number,
            zipcode: orderData.customer.customer_postal_code,
        },
        general: {
            seira: global.parameters.server.rocketSeira,
            number: invoiceNumber,
            date: helpers.getDateWithFormat("DD/MM/YYYY"),
            type: "1",
            paymentType: "3",
            movementPurpose: "1",
            classificationCategory: "1",
            paymentTypeText: "3 - Μετρητά",
            typeText: "1.1 - Τιμολόγιο Πώλησης",
            clientId: userData.username.Id,
        },
        totals: {},
    }
}

module.exports = {
    sendInvoiceToRocketax,
    validateRocketaxToken,
}
