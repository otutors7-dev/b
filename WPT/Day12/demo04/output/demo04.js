"use strict";
function f1() {
    console.log('parameterless functions');
}
function f2() {
    console.log('parameterless f2 function');
    return 'sunbeam';
}
function f3() {
    while (true) {
        console.log('inside while');
    }
    console.log('End of Function');
}
f1();
console.log(f2());
