function Person(name = '', mobile = '') {
    this.name = name
    this.mobile = mobile
}

Person.prototype.display = function () {
    console.log('Name - ' + this.name)
    console.log('Mobile - ' + this.mobile)
}

function Employee(empid, name, salary, mobile) {
    // Property inheritance
    Person.call(this, name, mobile) // Inheritance in JS
    this.empid = empid;
    this.salary = salary
}

// prototype inheritance
Object.setPrototypeOf(Employee.prototype, Person.prototype)

Employee.prototype.display = function () {
    console.log('Empid - ' + this.empid)
    Object.getPrototypeOf(Employee.prototype).display.call(this)
    console.log('Salary - ' + this.salary)
}

const p1 = new Person('anil', '9876543210')
console.log(p1)
p1.display()

const e1 = new Employee(1, "anil", 10000, '9876543210')
console.log(e1)
e1.display()