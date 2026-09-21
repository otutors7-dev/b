let arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
console.log(arr)

// for (e of arr)
//     if (e % 2 == 0) // condition
//         console.log(e)

// const arr2 = arr.filter(e => e % 2 == 0)
// console.log(arr2)
// arr2.forEach((e => console.log(e))

// stream programming
arr.filter(e => e % 2 == 0).forEach(e => console.log(e));
