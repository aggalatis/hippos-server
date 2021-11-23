const axios = require("axios")
const helpers = require("./helpers")

async function mailSummaryReport(subject, lastCloseData, summaries) {
    let emailData = {
        emailData: {
            storeName: global.parameters.store.storeName,
            subject: "ΑΝΑΛΥΣΗ ΤΑΜΕΙΟΥ",
            lastCloseDate: helpers.changeMysqlDateToNormal(lastCloseData),
            closeDate: helpers.getDateTimeNow(),
            summaries: summaries,
        },
    }
    return new Promise((resolve, reject) => {
        axios
            .post(`${global.parameters.server.remoteUrl}/Mail/SendEmail`, emailData)
            .then((response) => {
                if (response.status == 200) resolve(true)
                resolve(false)
            })
            .catch((error) => reject(error))
    })

    console.log(data)
}

module.exports = {
    mailSummaryReport,
}
