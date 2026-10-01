let a: any;
let b: unknown;

a = 10
a = 'sunbeam'

b = 10
b = 'sunbeam'

console.log('typeof a - ' + typeof a)
console.log('typeof b - ' + typeof b)

console.log(a.toUpperCase())
if (typeof b == 'string') // Type checking becomes mandatory while performing 
    // operations on the unknown types in type script
    console.log(b.toUpperCase())