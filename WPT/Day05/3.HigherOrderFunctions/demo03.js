// Higher Order Function
function executeOperation(fn, n1, n2) {
    const result = fn(n1, n2)
    console.log("Result = " + result)
}

// executeOperation(add, 10, 20)
// executeOperation(sub, 10, 20)
executeOperation((n1, n2) => n1 + n2, 10, 20)
executeOperation((n1, n2) => n1 - n2, 10, 20)
executeOperation((n1, n2) => n1 * n2, 11, 22)
executeOperation((n, d) => n / d, 10, 2)

