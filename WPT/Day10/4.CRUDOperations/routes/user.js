const express = require('express')
const mysql2 = require('mysql2/promise')
const router = express.Router()

const pool = mysql2.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'cpac_db'
})

// getting the user profile
router.get('/:uid', async (req, res) => {
    const sql = 'SELECT * FROM users WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.params.uid])
        const user = data[0][0]
        if (user) {
            user.password = ''
            res.send(user)
        }
        else
            res.send('Invalid user id')
    } catch (error) {
        res.send(error)
    }
})

// get all the users
router.get('/', async (req, res) => {
    const sql = 'SELECT * FROM users'
    try {
        const data = await pool.query(sql)
        res.send(data[0])
    } catch (error) {
        res.send(error)
    }
})

router.post('/signup', async (req, res) => {
    const { name, email, password, mobile } = req.body
    const sql = 'INSERT INTO users(name,email,password,mobile) VALUES(?,?,?,?)'
    try {
        const data = await pool.query(sql, [name, email, password, mobile])
        res.send(data)
    } catch (error) {
        res.send(error)
    }
})

router.post('/signin', async (req, res) => {
    const { email, password } = req.body
    const sql = 'SELECT * FROM users WHERE email = ? AND password = ?'
    try {
        const data = await pool.query(sql, [email, password])
        const user = data[0][0]
        if (user) {
            user.password = ''
            res.send(user)
        }
        else
            res.send('Invalid email or password')
    } catch (error) {
        res.send(error)
    }

})

// updating the mobile number
router.put('/', async (req, res) => {
    const sql = 'UPDATE users SET mobile = ?  WHERE uid = ?'
    const { uid, mobile } = req.body
    try {
        const data = await pool.query(sql, [mobile, uid])
        res.send(data)
    } catch (error) {
        res.send(error)
    }
})


module.exports = router