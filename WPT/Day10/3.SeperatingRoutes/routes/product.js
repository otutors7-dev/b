const express = require('express')
const router = express.Router()

const products = [
    { pid: 1, name: 'product1', price: 20 },
    { pid: 2, name: 'product2', price: 30 },
    { pid: 3, name: 'product3', price: 40 },
    { pid: 4, name: 'product4', price: 50 },
    { pid: 5, name: 'product5', price: 60 }
]

router.get('/', (req, res) => {
    res.send(products)
})

router.post('/', (req, res) => {
    res.send('Product Added')
})

router.put('/', (req, res) => {
    res.send('Product Updated')
})

router.delete('/', (req, res) => {
    res.send('Product Deleted')
})

module.exports = router