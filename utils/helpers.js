const fs = require("fs")
const moment = require("moment")

function getParameters() {
    return require("../parameters.json")
}
function log(string) {
    fs.appendFile(
        global.parameters.logFile,
        `${getDateTimeNow()} --> ${string}\n`,
        (err) => {
            if (err) throw err
        }
    )
}
function deleteFile(file) {
    fs.unlink(file, (err) => {
        if (err) console.log(`Unable to delete file...`)
    })
}

function getDateTimeNow() {
    return moment().format("DD-MM-YYYY HH:mm:ss")
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

module.exports = {
    getParameters,
    log,
    deleteFile,
    getDateTimeNow,
    validateArr,
}
