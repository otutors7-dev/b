let p1 = {
    name: 'anil',
    age: 32
}
// p1.mobile = '9876543210' // NOT OK
console.log(p1)

let p2: { name: string, age: number } = { name: '', age: 0 }
p2.name = 'mukesh'
p2.age = 32
console.log(p2)