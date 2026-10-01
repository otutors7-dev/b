"use strict";
let n1 = 10; // type is automatically inferred (type inference)
// n1 = 'sunbeam' // cannot assign any other value then string
console.log(typeof n1);
console.log(n1);
let n2; // by default the type is any
n2 = 10;
n2 = 'sunbeam';
console.log(typeof n2);
console.log(n2);
