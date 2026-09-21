
class Person {
    constructor(name = '', mobile = '') {
        this.name = name
        this.mobile = mobile
    }

    display() {
        console.log('Name - ' + this.name)
        console.log('Mobile - ' + this.mobile)
    }

}

// same in js and java
class Employee extends Person {
    constructor(empid, name, salary, mobile) {
        super(name, mobile)
        this.empid = empid;
        this.salary = salary
    }

    display() {
        console.log('Empid - ' + this.empid)
        super.display()
        console.log('Salary - ' + this.salary)
    }

}


const p1 = new Person('anil', '9876543210')
console.log(p1)
p1.display()

const e1 = new Employee(1, "anil", 10000, '9876543210')
console.log(e1)
e1.display()