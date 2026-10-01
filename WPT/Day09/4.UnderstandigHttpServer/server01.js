// http server
const http = require('http')

const server = http.createServer((request, response) => {
    response.end('Hi from backend server')
})

server.listen(4000, 'localhost', () => {
    console.log('Server started on port 4000')
})