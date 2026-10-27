const express = require('express')
const mysql = require('mysql2/promise')
const app = express()

app.use(express.json())

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'manager',
    database: 'a1'
})


app.get('/product', async (req, res) => {
    const sql = 'SELECT * FROM products'
    try {
        const data = await pool.query(sql)
        res.send(data[0])
    } catch (error) {
        res.send(error)
    }
})

app.post('/product', async (req, res) => {
    const { name, price, details } = req.body
    const sql = 'INSERT INTO products(name,price,details) VALUES (?,?,?)'
    try {
        const data = await pool.query(sql, [name,price,details])
        res.send(data[0])
    }
    catch (error) {
        res.send(error)
    }
})

// app.put('/product/:pid', async (req,res) =>
// {
//     const sql = 'UPDATE products SET price = ? WHERE pid = ?'
//     const {price} = req.body
//     const pid=req.params.pid
//     try{
//         const data = await pool.query(sql, [price,pid])
//         res.send(data[0])
//     }
//     catch(error){
//         res.send(error)
//     }
// })

app.put('/product', async (req, res) => {
    const sql = 'UPDATE products SET price = ? WHERE pid = ?'
    const { price, pid } = req.body
    try {
        const data = await pool.query(sql, [price, pid])
        res.send(data[0])
    } catch (error) {
        res.send( error)
    }
})


app.delete('/product/:pid', async (req,res) =>
{
    const sql = 'DELETE FROM products where pid = ?'
    const pid = req.params.pid
    try{
        const data = await pool.query(sql,[pid])
        res.send(data[0])
    }
    catch(error)
    {
        res.send(error)
    }
})

app.listen(4000,'localhost', () =>
{
    console.log('server started')
})