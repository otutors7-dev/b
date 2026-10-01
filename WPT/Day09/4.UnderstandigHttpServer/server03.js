const http = require('http')

const server = http.createServer((req, res) => {

    const path = req.url;
    const method = req.method;
    // console.log('method - ' + method)
    // console.log('path - ' + path)

    // routes
    if (method == 'GET' && path == '/user') {
        // to get all users from database
        res.end('All Users Data')
    }
    else if (method == 'POST' && path == '/user') {
        // inserting the user in database
        res.end('user inserted')
    }
    else if (method == 'PUT' && path == '/user') {
        // updating the user in database
        res.end('user updated')
    }
    else if (method == 'DELETE' && path == '/user') {
        // deleting the user from database
        res.end('user deleted')
    } else {
        res.end('Invalid path or method')
    }
})

server.listen(4000, 'localhost', () => {
    console.log('server started on 4000')
})