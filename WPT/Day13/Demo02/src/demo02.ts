// tuple 
let p1: [number, number] = [1, 2]

let p2: [number, string]
p2 = [1, 'sunbeam']
// p2 = ['sunbeam', 1] // NOT OK

// named tuples
let p3: readonly [name: string, age: number]
p3 = ['anil', 32]
// p3.push('9876543210') // NOT OK only if tuple is declared as read only
console.log(p3)