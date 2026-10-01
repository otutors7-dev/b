const express = require('express')

const app = express()
const user = {
    uid: 1,
    name: 'user1',
    mobile: '9876543210'
}
//routes in http server
// if (method == 'GET' && path == '/user') {req,res}
// method + path + handler

// routes in express
app.get('/user', (req, res) => {
    // res.send('All users')
    // res.send('<h1>All users</h1>')
    res.send(user)
})

app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})