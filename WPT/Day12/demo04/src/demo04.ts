function f1(): void {
    console.log('parameterless functions')
}

function f2(): string {
    console.log('parameterless f2 function')
    return 'sunbeam'
}

function f3(): never {
    while (true) {
        console.log('inside while')
    }
    console.log('End of Function')
}

f1()
console.log(f2())