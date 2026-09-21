// default argument function
function add(n1 = 0, n2 = 0, n3 = 0, n4 = 0) {
    const res = n1 + n2 + n3 + n4
    console.log("result - " + res)
}
add()
add(10)
add(10, 20)
add(10, 20, 30)
add(10, 20, 30, 40)