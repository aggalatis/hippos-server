const fs = require("fs")
const moment = require("moment")
const _ = require("underscore")

function getParameters() {
    return require("../parameters.json")
}
function log(string) {
    fs.appendFile(global.parameters.logFile, `${getDateTimeNow()} --> ${string}\n`, (err) => {
        if (err) throw err
    })
}
function deleteFile(file) {
    fs.unlink(file, (err) => {
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

module.exports = {
    getParameters,
    log,
    deleteFile,
    getDateTimeNow,
    getDateTimeNowMysql,
    validateArr,
    validateObj,
    getReceiptDate,
}
