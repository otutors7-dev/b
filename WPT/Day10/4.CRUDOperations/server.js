const express = require('express')
const userRouter = require('./routes/user')
const productRouter = require('./routes/product')

const app = express()

// middleware
// json() will convert the received data from the body in the json object/array
app.use(express.json())
app.use('/product', productRouter)
app.use('/user', userRouter)

app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})

