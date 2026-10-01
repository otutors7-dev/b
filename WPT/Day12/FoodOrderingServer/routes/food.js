// builtin modules
const fs = require('fs/promises')

// third party modules
const express = require('express')
const multer = require('multer')

// user defined modules
const pool = require('../db/pool')
const result = require('../utils/result')

// create router object
const router = express.Router()

// create the object for multer
const upload = multer({ dest: 'images' })

// all user routes
router.post('/add', upload.single('image'), async (req, res) => {
    const { name, price, description } = req.body
    const { originalname, destination, path } = req.file
    const sql = 'INSERT INTO food(name,price,description,image) VALUES(?,?,?,?)'
    try {
        await fs.rename(path, destination + '/' + originalname)
        const data = await pool.query(sql, [name, price, description, originalname])
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})

router.get('/menu', async (req, res) => {
    const sql = 'SELECT * FROM food'
    try {
        const data = await pool.query(sql)
        res.send(result.createSuccessResult(data[0]))
    } catch (error) {
        res.send(result.createErrorResult(error))
    }
})


// export the router
module.exports = router