let arr = []
arr.push(10)
arr.push(20)
arr.push(30)
arr.push(40)
arr.push(50)
arr.push(60)

// index based for loop
// for (let i = 0; i < arr.length; i++) {
//     console.log('Element - ' + arr[i])
// }

// for of loop
for (let e of arr) {
    console.log('Element - ' + e)
}

// for in loop
for (let i in arr) {
    console.log('Index - ' + i)
    console.log('Element - ' + arr[i])
}
