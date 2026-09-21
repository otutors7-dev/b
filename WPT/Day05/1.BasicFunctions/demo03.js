function f1(n1, n2) {
    // template string
    console.log(`value of n1 -  ${n1} , type of n1 -  ${typeof n1}`)
    console.log(`value of n2 - ${n2} , type of n2 - ${typeof n2}`)
}

f1(10, 20)
f1(10, 'sunbeam')
f1('sunbeam', true)

f1(11.22)
f1()
f1(10, 'sunbeam', true)
