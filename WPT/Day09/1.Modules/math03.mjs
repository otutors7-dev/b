function add(n1, n2) {
    console.log(`Addition - ${n1 + n2}`)
}

function sub(n1, n2) {
    console.log(`Substraction - ${n1 - n2}`)
}

function mul(n1, n2) {
    console.log(`Multiplication - ${n1 * n2}`)
}

export default add
export { sub, mul }
//module.exports = add
//module.exports.sub = sub
//module.exports.mul = mul