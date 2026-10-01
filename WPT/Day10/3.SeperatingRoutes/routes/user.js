const express = require('express')
const router = express.Router()

const users = [
    { uid: 1, name: 'user1', mobile: '9876543210' },
    { uid: 2, name: 'user2', mobile: '9876543211' },
    { uid: 3, name: 'user3', mobile: '9876543212' },
    { uid: 4, name: 'user4', mobile: '9876543213' }
]

router.get('/', (req, res) => {
    res.send(users)
})

router.post('/', (req, res) => {
    res.send('User Added')
})

router.put('/', (req, res) => {
    res.send('User Updated')
})

router.delete('/', (req, res) => {
    res.send('User Deleted')
})

module.exports = router