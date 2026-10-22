const express = require('express')
const cors = require('cors')
const mysql = require('mysql2/promise')
const app = express()

app.use(express.json())
app.use(cors())

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'foodordering_db'
})

function createResult(data, error) {
    const result = {}
    if (data) {
        result.status = 'success'
        result.data = data
    }
    else {
        result.status = 'error'
        result.error = error
    }
    return result
}

app.get('/product', async (req, res) => {
    const sql = 'SELECT * FROM products'
    try {
        const data = await pool.query(sql)
        res.send(createResult(data[0]))
    } catch (error) {
        res.send(createResult(null, error))
    }
})

app.post('/product', async (req, res) => {
    const { name, price } = req.body
    const sql = 'INSERT INTO products(name,price) VALUES (?,?)'
    try {
        const data = await pool.query(sql, [name, price])
        res.send(createResult(data[0]))
    } catch (error) {
        res.send(createResult(null, error))
    }
})

app.put('/product', async (req, res) => {
    const sql = 'UPDATE products SET price = ? WHERE pid = ?'
    const { price, pid } = req.body
    try {
        const data = await pool.query(sql, [price, pid])
        res.send(createResult(data[0]))
    } catch (error) {
        res.send(createResult(null, error))
    }
})

app.delete('/product/:pid', async (req, res) => {
    const sql = 'DELETE FROM products WHERE pid = ?'
    const pid = req.params.pid
    try {
        const data = await pool.query(sql, [pid])
        res.send(createResult(data[0]))
    } catch (error) {
        res.send(createResult(null, error))
    }

})

app.listen(4000, 'localhost', () => {
    console.log('server started on port 4000')
})