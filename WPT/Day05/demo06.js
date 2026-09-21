// constructor function -> 
function Person(name = '', age = 0) {
    this.name = name
    this.age = age
}

let p1 = {}
console.log(p1)

let p2 = new Object()
console.log(p2)

let p3 = new Person()
console.log(p3)

let p4 = new Person('mukesh', 32)
console.log(p4)
console.log(p4.display())
