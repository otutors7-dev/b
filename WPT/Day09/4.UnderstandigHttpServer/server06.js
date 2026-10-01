const http = require('http')

function userRouter(req, res) {
    const method = req.method
    if (method == 'GET') {
        res.end('All Users Data')
    }
    else if (method == 'POST') {
        res.end('User Inserted successfully')
    }
    else if (method == 'PUT') {
        res.end('User Updated successfully')
    }
    else if (method == 'DELETE') {
        res.end('User DELETED successfully')
    } else {
        res.end('invalid Method')
    }
}

function productRouter(req, res) {
    const method = req.method
    if (method == 'GET') {
        res.end('All Products Data')
    }
    else if (method == 'POST') {
        res.end('Product Inserted successfully')
    }
    else if (method == 'PUT') {
        res.end('Product Updated successfully')
    }
    else if (method == 'DELETE') {
        res.end('Product DELETED successfully')
    }
    else {
        res.end('invalid method')
    }
}

const server = http.createServer((req, res) => {
    const method = req.method
    const path = req.url
    if (path == '/user')
        userRouter(req, res)
    else if (path == '/product')
        productRouter(req, res)
    else
        res.end('invalid path')
})

server.listen(4000, 'localhost', () => {
    console.log('server started on 4000')
})