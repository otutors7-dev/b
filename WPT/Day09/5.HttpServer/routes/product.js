const products = [
    { pid: 1, name: 'Pen', price: 20 },
    { pid: 2, name: 'Pencil', price: 10 },
    { pid: 3, name: 'Book', price: 50 },
    { pid: 4, name: 'Crayons', price: 30 }
]

function productRouter(req, res) {
    const method = req.method
    if (method == 'GET') {
        res.setHeader('content-type', 'application/json')
        res.end(JSON.stringify(products))
    }
    else if (method == 'POST') {
        res.end('Product Inserted successfully')
    }
    else if (method == 'PUT') {
        res.end('Product Updated successfully')
    }
    else if (method == 'DELETE') {
        res.end('Product DELETED successfully')
    }
    else {
        res.end('invalid method')
    }
}

module.exports = productRouter