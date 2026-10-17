// let p1: { name: string, age: number } = { name: 'anil', age: 30 }
// let p2: { name: string, age: number } = { name: 'anil', age: 30, mobile: '9876543210' }
// let p3: { name: string, age: number } = { name: 'anil' }

type person = { name: string, age: number }

let p1: person = { name: 'anil', age: 30 }
// let p2: person = { name: 'anil', age: 30, mobile: '9876543210' } // cannot add mobile
// let p3: person = { name: 'anil' } // age must be added


// union types
let n1: string | undefined = undefined
n1 = 'sunbeam'
console.log(n1)

// example from java rto compare
// try{}catch(ArithmeticException | InputMismatchException e ){}

let n2: string | number | boolean = 10
n2 = 'sunbeam'
n2 = true 