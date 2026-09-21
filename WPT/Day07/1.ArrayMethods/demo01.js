const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// for (e of arr) {
//     console.log("Element - " + e)
// }

//arr.forEach(value => console.log("Value - " + value))


// Even numbers
// for (e of arr) {
//     if (e % 2 == 0) // condition
//     {
//         console.log("Even number - " + e)
//     }
// }

arr.filter(e => e % 2 == 0).forEach(e => console.log("Even number - " + e))