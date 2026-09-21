const arr = [1, 2, 3, 4, 5, 6, 7]
// Array Destructuring
// const [SUN, MON, TUE, WED, THU, FRI, SAT] = arr
const [SUN, MON, , , THU] = arr

console.log(THU)
