const express = require('express')
const pool = require('../db/pool')
const result = require('../utils/result')
const router = express.Router()

router.post('/signup', async (req, res) => {
    const { name, email, password, mobile } = req.body
    const sql = 'INSERT INTO users(name,email,password,mobile) VALUES (?,?,?,?)'
    try {
        const data = await pool.query(sql, [name, email, password, mobile])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.post('/signin', async (req, res) => {
    const { email, password } = req.body
    const sql = 'SELECT * FROM users WHERE email = ? AND password = ?'
    try {
        const data = await pool.query(sql, [email, password])
        const user = data[0][0]
        res.send(result.createResult(user, 'Invalid Email or Password'))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.delete('/:uid', async (req, res) => {
    const sql = 'DELETE FROM users WHERE uid =  ?'
    try {
        const data = await pool.query(sql, [req.params.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

module.exports = router