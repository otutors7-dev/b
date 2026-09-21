const arr = ["Hello sunbeam", "How are you"]
let words = []
// for (e of arr) {
//     const data = e.split(' ') // op
//     for (w of data) {
//         words.push(w)
//     }
// }

words = arr.flatMap(e => e.split(' '))
console.log(words)// 1D Array words