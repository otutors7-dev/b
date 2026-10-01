const path = require("node:path")

const users = [
    { uid: 1, name: 'anil', mobile: '9876543210', city: 'pune' },
    { uid: 2, name: 'mukesh', mobile: '9876543211', city: 'mumbai' },
    { uid: 3, name: 'ramesh', mobile: '9876543212', city: 'pune' },
    { uid: 4, name: 'suresh', mobile: '9876543213', city: 'mumbai' }
]
function userRouter(req, res) {
    const method = req.method
    if (method == 'GET') {
        res.setHeader('content-type', 'application/json')
        res.end(JSON.stringify(users))
    }
    else if (method == 'POST') {
        res.end('User Inserted successfully')
    }
    else if (method == 'PUT') {
        res.end('User Updated successfully')
    }
    else if (method == 'DELETE') {
        res.end('User DELETED successfully')
    } else {
        res.end('invalid Method')
    }
}

module.exports = userRouter