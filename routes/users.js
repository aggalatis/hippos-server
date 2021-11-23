const express = require("express")
const md5 = require("md5")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const router = express.Router()

router.get("/", async (req, res) => {
    const users = await db.query("SELECT * FROM users WHERE user_deleted = ?", [0])
    res.send(helpers.validateArr(users))
})

router.get("/all", async (req, res) => {
    const users = await db.query("Select * from users", [])
    res.send(helpers.validateArr(users))
})

router.post("/authenticate", async (req, res) => {
    const user = req.body.userData
    const dbUsers = await db.query(
        "SELECT * FROM users WHERE user_deleted = 0 AND user_name = ? AND user_password = ? LIMIT 1",
        [user.username, md5(user.password)]
    )
    if (dbUsers && dbUsers.length !== 0)
        db.query("UPDATE users SET user_last_login = ? WHERE user_id = ?", [
            user.login_datetime,
            dbUsers[0].user_id,
        ])
    res.send(helpers.validateObj(dbUsers[0]))
})

router.post("/authenticate/logout", async (req, res) => {
    const user = req.body.userData
    db.query(
        "UPDATE users SET user_last_logout = now() WHERE user_id = ? LIMIT 1",
        [user.user_id]
    )
    res.send({status: 200})
})
router.delete("/:id", async (req, res) => {
    const userId = req.params.id
    const response = await db.query("DELETE FROM users WHERE user_id = ? LIMIT 1", [userId])
    if (response.affectedRows == 0) {
        res.send({
            status: 500,
            message: "Αδυναμία διαγραφής χρήστη.",
        })
    } else {
        res.send({
            status: 200,
            message: "Επιτυχής διαγραφή χρήστη.",
        })
    }
})
module.exports = router
