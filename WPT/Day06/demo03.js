let arr = []
arr.push(10)
arr.push(20)
arr.push(30)
arr.push(40)
arr.push(50)
arr.push(60)

arr.pop()
arr.pop()

//  It also adds the elements at specific position and alos used to delete
arr.splice(2, 1)
// used to create a subset array out of an existing array
// arr.slice()

// for of loop
for (let e of arr) {
    console.log('Element - ' + e)
}

console.log(arr)
