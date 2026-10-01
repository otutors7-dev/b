const http = require('http')

const server = http.createServer((req, res) => {
    const method = req.method
    const path = req.url
    if (path == '/user') {
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
    else if (path == '/product') {
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
    else {
        res.end('invalid path')
    }


})

server.listen(4000, 'localhost', () => {
    console.log('server started on 4000')
})