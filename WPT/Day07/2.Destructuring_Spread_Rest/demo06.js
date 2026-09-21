// Rest Operator (...)
// Java -> Variable Arity Method

function total(arr) {
    let res = 0
    for (e of arr)
        res += e
    console.log('Total - ' + res)
}

total([10, 20, 30, 40, 50, 60])
total([10, 20, 30, 40, 50])
total([10, 20, 30, 40])
total([10, 20, 30])
total([10, 20])

