const jwt = require('jsonwebtoken')

function createToken(data) {
    return jwt.sign({ authData: data }, 'hippos-secret-key', { expiresIn: 60 * 60 * 24 * 7 })
}

function verifyToken(token) {
    try {
        let decoded = jwt.verify(token, 'hippos-secret-key')
        return decoded
    } catch (err) {
        return null
    }
}

module.exports = {
    createToken,
    verifyToken,
}
