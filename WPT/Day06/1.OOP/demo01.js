function Date(day = 0, month = 0, year = 2000) {
    this.day = day
    this.month = month
    this.year = year
    this.displayDate = function () {
        console.log(`Date - ${this.day}/${this.month}/${this.year}`)
    }

}


function Employee(empid = 0, name = "", salary = 0.0) {
    this.empid = empid
    this.name = name
    this.salary = salary
    this.doj = new Date()
}

// const d1 = new Date()
// const d2 = new Date(2, 2, 2002)
// console.log(d1)
// console.log(d2)


const d1 = new Date(1, 1, 2001)
console.log(d1)
// displayDate(d1)
// console.log(d1.displayDate)
d1.displayDate()


// const e1 = new Employee()
// const e2 = new Employee(1, "Anil", 10000)
// console.log(e1)
// console.log(e2)