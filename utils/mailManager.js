const axios = require("axios")
const helpers = require("./helpers")

async function mailSummaryReport(subject, lastCloseData, summaries) {
    let emailData = {
        emailData: {
            storeName: global.parameters.store.name,
            subject: subject,
            lastCloseDate: helpers.changeMysqlDateToNormal(lastCloseData),
            closeDate: helpers.getDateTimeNow(),
            summaries: summaries,
            recipients: global.parameters.summaries.recipients
        },
    }
    return new Promise((resolve, reject) => {
        axios
            .post(`${global.parameters.server.remoteUrl}Mail/SendEmail`, emailData)
            .then((response) => {
                if (response.status == 200) resolve(true)
                resolve(false)
            })
            .catch((error) => {
                helpers.log(error.message)
                reject(error)
            })
    })
}

module.exports = {
    mailSummaryReport,
}
