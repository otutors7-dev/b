type person = { name: string, age: number }
type address = { city: string, pincode: string }

let p1: person = { name: 'anil', age: 30 }
let a1: address = { city: 'pune', pincode: '411057' }

// Intersection
let p2: person & address = {
    name: 'anil',
    city: 'pune',
    age: 30,
    pincode: '411057'
}

// Union
let p3: person | address = {
    name: 'anil',
    age: 32
}