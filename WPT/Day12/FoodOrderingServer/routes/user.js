// third party modules
const express = require('express')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

// user defined modules
const pool = require('../db/pool')
const result = require('../utils/result')
const config = require('../utils/config')

// create router object
const router = express.Router()


// all user routes
router.post('/signup', async (req, res) => {
    const { name, email, password, mobile } = req.body
    const sql = 'INSERT INTO user(name, email, password, mobile) VALUES(?,?,?,?)'
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
    const sql = 'SELECT * FROM user WHERE email = ?'
    try {
        const data = await pool.query(sql, [email])
        const user = data[0][0]
        if (user) {
            const isPassword = await bcrypt.compare(password, user.password)
            if (isPassword) {
                const payload = { uid: user.uid }
                const token = jwt.sign(payload, config.SECRET)
                const userResponse = {
                    name: user.name,
                    email: user.email,
                    mobile: user.mobile,
                    token
                }
                res.send(result.createSuccessResult(userResponse))
            }
            else
                res.send(result.createErrorResult('Invalid Password'))
        }
        else
            res.send(result.createErrorResult('Invalid Email'))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})


router.get('/', async (req, res) => {
    const sql = 'SELECT * FROM user WHERE uid = ?'
    try {
        const data = await pool.query(sql, [req.headers.uid])
        const user = data[0][0]
        delete user.uid
        delete user.password
        res.send(result.createSuccessResult(user))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.put('/', async (req, res) => {
    const { mobile } = req.body
    const sql = 'UPDATE user SET mobile = ? WHERE uid = ?'
    try {
        const data = await pool.query(sql, [mobile, req.headers.uid])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})


// export the router
module.exports = router