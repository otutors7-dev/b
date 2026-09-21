// Spread Operator (...)

const p1 = {
    name: 'anil',
    age: 30
}

// shallow copy
// const p2 = p1

// deep copy
// const p2 = {
//     name: p1.name,
//     age: p1.age
// }

// syntax simplification
const p2 = { ...p1 } // spread operator
p2.city = 'pune'

console.log(p1)
console.log(p2)

