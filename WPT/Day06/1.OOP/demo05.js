// Encapuslation
class Date {
    constructor(day = 0, month = 0, year = 2000) {
        this.day = day
        this.month = month
        this.year = year
    }
    displayDate() {
        console.log(`Date - ${this.day}/${this.month}/${this.year}`)
    }
}


class Employee {
    constructor(empid = 0, name = "", salary = 0.0, day, month, year) {
        this.empid = empid
        this.name = name
        this.salary = salary
        this.doj = new Date(day, month, year)
    }
    displayEmployee() {
        console.log("Empid - " + this.empid)
        console.log("Name - " + this.name)
        console.log("Salary - " + this.salary)
        console.log("Date of Joining - ")
        this.doj.displayDate()

    }
}


const d1 = new Date(1, 1, 2001)
console.log(d1)
const d2 = new Date(2, 2, 2002)
console.log(d2)
d1.displayDate()
d2.displayDate()


const e1 = new Employee(1, "Anil", 10000)
console.log(e1)
const e2 = new Employee(2, "Mukesh", 20000, 2, 2, 2002)
console.log(e2)

e1.displayEmployee()
e2.displayEmployee()