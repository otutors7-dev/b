
const user = {
    username: 'bond-007',
    name: 'anil',
    mobile: '9876543210',
    email: 'anil@gmail.com',
    city: 'pune'
}

// const un = user.username
// const e = user.email
// Object Destructuring
const { username, email } = user
// console.log(`${un} - ${e}`)
console.log(`${username} - ${email}`)