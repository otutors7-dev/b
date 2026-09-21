const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//let x = 0
// for (y of arr) {
// x = x + y
//     total = total + e
// }
// console.log('Total - ' + x)

const total = arr.reduce((x, y) => x + y, 0)
console.log('total - ' + total)