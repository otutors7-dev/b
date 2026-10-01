const express = require('express')

const server = express()

server.listen(4000, 'localhost', () => {
    console.log('Express server started on port 4000')
})