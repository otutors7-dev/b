const express = require('express')
const pool = require('../db/pool')
const result = require('../utils/result')
const config = require('../utils/config')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const router = express.Router()

router.post('/signup', async (req, res) => {
    const { name, email, password, mobile } = req.body
    const sql = 'INSERT INTO users(name,email,password,mobile) VALUES (?,?,?,?)'
    try {
        const hashedPassword = await bcrypt.hash(password, config.SALTROUNDS)
        const data = await pool.query(sql, [name, email, hashedPassword, mobile])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.post('/signin', async (req, res) => {
    const { email, password } = req.body
    const sql = 'SELECT * FROM users WHERE email=?'
    try {
        const data = await pool.query(sql, [email])
        const user = data[0][0]
        if (user) {
            const isPasswordCorrect = await bcrypt.compare(password, user.password)
            if (isPasswordCorrect) {
                const payload = {
                    uid: user.uid
                }
                // user.password = ''
                delete user.password
                delete user.uid
                const token = jwt.sign(payload, config.SECRET)
                user.token = token
                res.send(result.createSuccessResult(user))
            }
            else
                res.send(result.createErrorResult('Invalid Password'))
        } else
            res.send(result.createErrorResult('Invalid Email'))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.get('/', async (req, res) => {
    // const token = req.headers.token
    // if (token) {
    const sql = 'SELECT * FROM users WHERE uid = ?'
    try {
        //const payload = jwt.verify(token, config.SECRET)
        const data = await pool.query(sql, [req.headers.uid])
        const user = data[0][0]
        delete user.password
        delete user.uid
        res.send(result.createSuccessResult(user))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
    // }
    // else
    //     res.send(result.createErrorResult('User is not Authorized... Token Missing'))
})

router.delete('/', async (req, res) => {
    //const token = req.headers.token
    //if (token) {
    const sql = 'DELETE FROM users WHERE uid = ?'
    try {
        //const payload = jwt.verify(token, config.SECRET)
        const data = await pool.query(sql, [req.headers.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
    //}
    //else
    //  res.send(result.createErrorResult('Not Authorized... Token is Missing'))

})

module.exports = router