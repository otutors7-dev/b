const express = require('express')
const mysql2 = require('mysql2/promise')

const router = express.Router()

// pool instance that stores multiple connections for the mysql db
const pool = mysql2.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'cpac_db',
})


router.get('/', async (req, res) => {
    const sql = `SELECT * FROM products`
    try {
        const data = await pool.query(sql)
        res.send(data[0])
    } catch (error) {
        res.send(error)
    }
})

router.post('/', async (req, res) => {
    // prepared statements -> Avoid SQL Injection
    // const product = req.body
    const { name, price } = req.body // Destructuring
    const sql = `INSERT INTO products(name,price) VALUES(?,?)`
    try {
        const data = await pool.query(sql, [name, price])
        res.send(data)
    } catch (error) {
        res.send(error)
    }
})

router.put('/', async (req, res) => {
    const sql = 'UPDATE products SET price = ? WHERE pid = ?'
    const { pid, price } = req.body
    try {
        const data = await pool.query(sql, [price, pid])
        res.send(data)
    } catch (error) {
        res.send(error)
    }
})

router.delete('/:id', async (req, res) => {
    //const pid = req.params.id
    const sql = 'DELETE FROM products WHERE pid = ?'
    try {
        const data = await pool.query(sql, [req.params.id])
        res.send(data)
    } catch (error) {
        res.send(error)
    }
    res.send('Product Deleted')
})

module.exports = router