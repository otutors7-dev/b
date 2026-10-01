// third party modules
const jwt = require('jsonwebtoken')

// user defined modules
const result = require('./result')
const config = require('./config')

function userAuthorization(req, res, next) {
    //res.setHeader('Access-Control-Allow-Origin', '*')
    //res.setHeader('Access-Control-Allow-Headers', '*')
    const path = req.path
    if (path == '/user/signin' || path == '/user/signup' || path == '/food/menu')
        next()
    else {
        const bearerToken = req.headers.authorization
        if (bearerToken) {
            const token = bearerToken.split(" ")[1]
            try {
                const payload = jwt.verify(token, config.SECRET)
                req.headers.uid = payload.uid
                next()
            } catch (error) {
                res.send(result.createErrorResult('Token is Invalid'))
            }
        }
        else
            res.send(result.createErrorResult('Token is Missing'))
    }
}

module.exports = userAuthorization