const express = require('express')
const app = express()

app.get('/user', (req, res) => {
    res.send('All users')
})

app.post('/user', (req, res) => {
    res.send('User added successfully')
})

app.put('/user', (req, res) => {
    res.send('user updated successfully')
})

app.delete('/user', (req, res) => {
    res.send('user deleted successfully')
})


app.get('/product', (req, res) => {
    res.send('All products')
})

app.post('/product', (req, res) => {
    res.send('Product added successfully')
})

app.put('/product', (req, res) => {
    res.send('Product updated successfully')
})

app.delete('/product', (req, res) => {
    res.send('Product deleted successfully')
})


app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})