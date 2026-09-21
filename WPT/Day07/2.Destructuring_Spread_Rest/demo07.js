// Java -> Variable Arity Method
// ... -> Arity Operator

// Rest Operator (...)
// function total(...arr) {
function total(n1) {
    let res = 0
    // for (e of arr)
    for (e of arguments)
        res += e
    console.log('Total - ' + res)
    console.log(n1)
}

total(10, 20, 30, 40, 50, 60)
total(10, 20, 30, 40, 50)
total(10, 20, 30, 40)
total(10, 20, 30)
total(10, 20)

