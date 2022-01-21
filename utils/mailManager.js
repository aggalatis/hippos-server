const axios = require('axios')
const server = require('./server')
const helpers = require('./helpers')

async function mailSummaryReport(subject, lastCloseData, summaries) {
    let emailData = {
        emailData: {
            storeName: global.parameters.store.name,
            subject: subject,
            lastCloseDate: helpers.changeMysqlDateToNormal(lastCloseData),
            closeDate: helpers.getDateTimeNow(),
            summaries: summaries,
            recipients: global.parameters.summaries.recipients,
        },
    }
    return new Promise(async (resolve, reject) => {
        const token = await server.validateRocketaxToken()
        const headers = {
            Authorization: token,
        }
        axios
            .post(`${global.parameters.server.remoteUrl}Mail/SendEmail`, emailData, { headers: headers })
            .then(response => {
                if (response.status == 200) resolve(true)
                resolve(false)
            })
            .catch(error => {
                helpers.log(error)
                reject(error)
            })
    })
}

module.exports = {
    mailSummaryReport,
}
