// difference between let and const

let p1 = {
    name: 'anil',
    age: 30
}

const p2 = {
    name: 'mukesh',
    age: 32
}

p1.city = 'pune'
p2.city = 'mumbai'

p1 = {
    name: 'ramesh',
    age: 34
}

// p2 = {
//     name: 'ramesh',
//     age: 34
// }

console.log(p1)
console.log(p2)

