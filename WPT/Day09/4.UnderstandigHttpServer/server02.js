const http = require('http')

const user = {
    name: 'anil',
    age: 30
}

const server = http.createServer((req, res) => {
    console.log('Request received')
    // res.setHeader('content-type', 'text/plain')
    // res.end('HI from backend server')

    // res.setHeader('content-type', 'text/html')
    // res.end('<h1>HI from backend server</h1>')

    res.setHeader('content-type', 'application/json')
    res.end(JSON.stringify(user))
})

server.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})