"use strict";
// let p1: { name: string, age: number } = { name: 'anil', age: 30 }
// let p2: { name: string, age: number } = { name: 'anil', age: 30, mobile: '9876543210' }
// let p3: { name: string, age: number } = { name: 'anil' }
let p1 = { name: 'anil', age: 30 };
// let p2: person = { name: 'anil', age: 30, mobile: '9876543210' } // cannot add mobile
// let p3: person = { name: 'anil' } // age must be added
// union types
let n1 = undefined;
n1 = 'sunbeam';
console.log(n1);
// example from java rto compare
// try{}catch(ArithmeticException | InputMismatchException e ){}
let n2 = 10;
n2 = 'sunbeam';
n2 = true;
