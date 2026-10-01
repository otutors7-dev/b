const http = require('http')

const server = http.createServer((req, res) => {
    const method = req.method
    const path = req.url

    if (path == '/user' && method == 'GET') {
        res.end('All Users Data')
    }
    else if (path == '/user' && method == 'POST') {
        res.end('User Inserted successfully')
    }
    else if (path == '/user' && method == 'PUT') {
        res.end('User Updated successfully')
    }
    else if (path == '/user' && method == 'DELETE') {
        res.end('User DELETED successfully')
    }
    else if (path == '/product' && method == 'GET') {
        res.end('All Products Data')
    }
    else if (path == '/product' && method == 'POST') {
        res.end('Product Inserted successfully')
    }
    else if (path == '/product' && method == 'PUT') {
        res.end('Product Updated successfully')
    }
    else if (path == '/product' && method == 'DELETE') {
        res.end('Product DELETED successfully')
    }
    else {
        res.end('invalid api call')
    }

})

server.listen(4000, 'localhost', () => {
    console.log('server started on 4000')
})