const user = {
    username: 'bond-007',
    name: 'anil',
    mobile: '9876543210',
    email: 'anil@gmail.com',
    city: 'pune'
}

const use2 = {
    username: 'bond-007',
    name: 'anil',
    mobile: '9876543210',
    email: 'anil@gmail.com',
    city: 'pune'
}
function UIOperation(user) {
    const username = user.username
    const email = user.email
    console.log('Welcome - ' + username)
    console.log('Email - ' + email)
}

UIOperation(user)
