const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// display square of odd numbers
// for (e of arr) { // Iteration -> forEach()
//     if (e % 2 != 0) { // Condition -> filter()
//         const sq = e * e // sq operation -> map()
//         console.log('Square - ' + sq)
//     }
// }

// display square of odd numbers
arr.filter(e => e % 2 != 0).map(e => e * e).forEach(e => console.log(e))


// for (e of arr) { // Iteration -> forEach()
//     if (e % 2 == 0) { // Condition -> filter()
//         const s = e + ' - sunbeam' // concat operation -> map()
//         console.log(s)
//     }
// }

// display even numbers suffixed with sunbeam (2 - sunbeam)
arr.filter(e => e % 2 == 0).map(e => e + " - sunbeam").forEach(e => console.log(e))