const express = require('express')
const md5 = require('md5')
const _ = require('underscore')
const db = require('../utils/database')
const helpers = require('../utils/helpers')
const auth = require('../utils/auth')
const router = express.Router()

router.get('/', async (req, res) => {
    const users = await db.query('SELECT * FROM users WHERE user_deleted = ?', [0])
    res.send(helpers.validateArr(users))
})

router.post('/', async (req, res) => {
    const userData = req.body.userData
    const newUser = await db.query(
        'INSERT INTO users ' + '(user_fullname, user_name, user_password, user_role_id, user_deleted, user_date_created) ' + 'VALUES (?,?,?,?,?,?)',
        [
            userData.user_fullname,
            userData.user_name,
            md5(userData.user_password),
            userData.user_role_id,
            userData.user_deleted,
            userData.user_date_created,
        ]
    )
    if (_.isUndefined(newUser.insertId)) {
        res.send({ status: 500, message: 'Αδυναμία καταχώρησης χρήστη.' })
        return
    }
    res.send({ status: 200, message: 'Επιτυχής καταχώρηση χρήστη.' })
})

router.get('/all', async (req, res) => {
    const users = await db.query(`Select us.*, usr.user_role_name from users us
    JOIN user_roles usr on usr.user_role_id = us.user_role_id`)
    res.send(helpers.validateArr(users))
})

router.post('/authenticate', async (req, res) => {
    const user = req.body.userData
    const dbUsers = await db.query('SELECT * FROM users WHERE user_deleted = 0 AND user_name = ? AND user_password = ? LIMIT 1', [
        user.username,
        md5(user.password),
    ])
    let token = null
    if (dbUsers && dbUsers.length !== 0) {
        db.query('UPDATE users SET user_last_login = ? WHERE user_id = ?', [user.login_datetime, dbUsers[0].user_id])
        token = auth.createToken(dbUsers[0])
        res.send({ status: 200, data: token })
    } else {
        res.send({ status: 500, data: null })
    }
})

router.post('/authenticate/logout', async (req, res) => {
    const user = req.body.userData
    db.query('UPDATE users SET user_last_logout = now() WHERE user_id = ? LIMIT 1', [user.user_id])
    res.send({ status: 200 })
})
router.delete('/:id', async (req, res) => {
    const userId = req.params.id
    const response = await db.query('DELETE FROM users WHERE user_id = ? LIMIT 1', [userId])
    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία διαγραφής χρήστη.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχής διαγραφή χρήστη.',
        })
    }
})

router.put('/', async (req, res) => {
    let userData = req.body.userData
    const response = await db.query(
        `UPDATE users SET 
        user_fullname = ?,
        user_name = ?,
        user_password = ?,
        user_role_id = ?,
        user_deleted = ?
        WHERE user_id = ?`,
        [userData.user_fullname, userData.user_name, md5(userData.user_password), userData.user_role_id, userData.user_deleted, userData.user_id]
    )

    if (_.isUndefined(response.affectedRows) || response.affectedRows == 0) {
        res.send({
            status: 500,
            message: 'Αδυναμία επεξεργασίας χρήστη.',
        })
    } else {
        res.send({
            status: 200,
            message: 'Επιτυχία επεξεργασίας χρήστη.',
        })
    }
})
module.exports = router
