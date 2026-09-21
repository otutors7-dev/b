// currying
function multiply(factor) {
    // return factor * value
    return (value) => {
        return factor * value
    }
}

const hrToMin = multiply(60) // (value)=>{return 60*value}
console.log('hr to Min - ' + hrToMin(2));
console.log('hr to Min - ' + hrToMin(3));
console.log('hr to Min - ' + hrToMin(4));

const kmTom = multiply(1000) // (value)=> {return 1000*value}
console.log('Km to m - ' + kmTom(2))
console.log('Km to m - ' + kmTom(3))
console.log('Km to m - ' + kmTom(4))

// const feetTocm = multiply(30)
console.log('feet to cm - ' + multiply(30)(2))
console.log('feet to cm - ' + multiply(30)(3))