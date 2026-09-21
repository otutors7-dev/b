// closures -> Capturing lambdas
let count = 0;

function counter() {
    let count = 0;
    // Inner function
    return () => {
        count++;
        console.log('count - ' + count)
    }

}

const in_fn = counter()
in_fn()
in_fn()
in_fn()
in_fn()
in_fn()

const in_fn2 = counter();
in_fn2()

in_fn()
in_fn2()
in_fn2()