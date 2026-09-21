// let o1 = {}
// let o1 = new Object()

// let arr = new Array() // array
let arr = [] // array
console.log(typeof arr)

arr.push(10)
arr.push(20)
arr.push(30)
arr[4] = 50
arr['6'] = 70
arr[-1] = 80

console.log(arr)
console.log('length of arr - ' + arr.length)

console.log(arr[1])
console.log(arr[3])
console.log(arr[6])