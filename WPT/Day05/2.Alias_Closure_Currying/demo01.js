function add(n1, n2) {
    const res = n1 + n1
    console.log('Result - ' + (n1 + n2))
}

// function alias
const myadd = add

// myadd = 10 // NOT OK
add = 10

//add(10, 20)
//myadd(11, 22)

console.log(typeof myadd)
console.log(myadd)
console.log(add)
console.log(typeof add)
add(10, 20)