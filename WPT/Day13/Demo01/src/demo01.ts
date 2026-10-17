let p1: number
p1 = 10
// p1 = 'sunbeam'
console.log(p1)

let p2: unknown
p2 = 10
p2 = 'sunbeam'
if (typeof p2 == 'string') {
    console.log(p2.toUpperCase())
}