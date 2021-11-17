const mysql = require("mysql2/promise")
const helpers = require("./helpers")

const configuration = {
    host: global.parameters.database.host,
    port: global.parameters.database.port,
    user: global.parameters.database.user,
    password: global.parameters.database.pass,
    database: global.parameters.database.database,
    connectTimeout: 50000,
}

async function query(sql, params) {
    try {
        const conn = await mysql.createConnection(configuration)
        const [rows, fields] = await conn.execute(sql, params)
        conn.end()
        return rows
    } catch (ex) {
        helpers.log(ex)
        return []
    }
}

module.exports = { query }
