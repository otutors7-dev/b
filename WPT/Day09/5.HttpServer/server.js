const http = require('http')
const userRouter = require('./routes/user')
const productRouter = require('./routes/product')

const server = http.createServer((req, res) => {
    const path = req.url
    if (path == '/user')
        userRouter(req, res)
    else if (path == '/product')
        productRouter(req, res)
    else
        res.end('Invalid path')
})


server.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})