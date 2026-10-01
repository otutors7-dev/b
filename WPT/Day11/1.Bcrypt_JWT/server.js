const express = require('express')
const userRouter = require('./routes/user')
const jwt = require('jsonwebtoken')
const result = require('./utils/result')
const config = require('./utils/config')

const app = express()

app.use(express.json())
app.use((req, res, next) => {
    const path = req.path
    if (path == '/user/signup' || path == '/user/signin')
        next()
    else {
        const token = req.headers.token
        if (token) {
            try {
                const payload = jwt.verify(token, config.SECRET)
                req.headers.uid = payload.uid
                next()
            } catch (error) {
                res.send(result.createErrorResult('Invalid Token'))
            }

        } else
            res.send(result.createErrorResult('Token is Missing'))
    }
})
app.use('/user', userRouter)

app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})