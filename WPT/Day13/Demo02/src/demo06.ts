interface Person {
    name: string,
    age: number
}

let p1: Person
p1 = { name: 'anil', age: 32 }


type myType = number | string | undefined
let p2: number | string | undefined
let p3: myType

interface Employee {
    empid: number,
    name: string
    salary: number,
    commission?: number // Optional Properties
}

const e1: Employee = {
    empid: 1,
    name: 'anil',
    salary: 10000,
}

// e1.commission = 10

console.log(e1)
console.log(e1.name)
console.log(e1.salary)
console.log(e1.commission)