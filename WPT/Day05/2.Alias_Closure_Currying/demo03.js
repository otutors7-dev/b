// Arrow functions
const add = (n1, n2) => {
    const res = n1 + n2
    console.log('Result - ' + res)
}

// Lambda Expression
const sub = (n1, n2) => n1 - n2

const sq = n => n * n

console.log(typeof add)
console.log(add)
add(10, 20)

const res = sub(40, 20)
console.log('Result - ' + res)

const res2 = sq(5)
console.log('Result - ' + res2)

console.log(typeof sub)
console.log(typeof sq)