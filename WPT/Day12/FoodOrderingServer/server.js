// third party modules
const express = require('express')
const cors = require('cors')

// user defined modules
const foodRouter = require('./routes/food')
const orderRouter = require('./routes/orders')
const userRouter = require('./routes/user')
const authorization = require('./utils/authorization')

// creating the express application
const app = express()

// middlewares
app.use('/foodimage', express.static('images')) // static routing
app.use(cors())
app.use(express.json())
app.use(authorization)
app.use('/food', foodRouter)
app.use('/orders', orderRouter)
app.use('/user', userRouter)


// server started
app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})