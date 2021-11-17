const express = require("express")
const db = require("../utils/database")
const helpers = require("../utils/helpers")
const router = express.Router()

router.get("/", async (req, res) => {
    const users = await db.query("SELECT * FROM users WHERE user_deleted = ?", [
        0,
    ])
    res.send(helpers.validateArr(users))
})

router.get("/All", async (req, res) => {
    const users = await db.query("Select * from users", [])
    res.send(helpers.validateArr(users))
})
router.delete("/:id", async (req, res) => {
    const userId = req.params.id
    const response = await db.query(
        "DELETE FROM users WHERE user_id = ? LIMIT 1",
        [userId]
    )
    if (response.affectedRows == 0) {
        res.send({
            status: 500,
            message: "Αδυναμία διαγραφής χρήση.",
        })
    } else {
        res.send({
            status: 200,
            message: "Επιτυχής διαγραφή χρήστη.",
        })
    }
})
module.exports = router
