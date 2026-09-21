// constructor function -> 
function Person(name = '', age = 0) {
    this.name = name
    this.age = age
}

let p1 = new Person()
console.log(p1)

let p2 = new Person('anil', 30)
console.log(p2)

let p3 = new Person('mukesh', 32)
console.log(p3)

let p4 = new Person('ramesh', 34)
p4.mobile = '9876543210'
p4['city'] = 'pune'
console.log(p4)