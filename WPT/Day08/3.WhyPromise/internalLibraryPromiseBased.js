const emps = [
    { empid: 1, name: 'Anil', salary: 10000, deptno: 10 },
    { empid: 2, name: 'Mukesh', salary: 20000, deptno: 20 },
    { empid: 3, name: 'Ramesh', salary: 30000, deptno: 40 }
]

const depts = [
    { deptno: 10, dname: 'DEV', loc: 'Pune' },
    { deptno: 20, dname: 'OPS', loc: 'Mumbai' },
    { deptno: 30, dname: 'QA', loc: 'Delhi' }
]

function searchEmployee(empid) {
    const promise = new Promise((resolve, reject) => {
        let emp = null
        for (e of emps) {
            if (e.empid == empid)
                emp = e
        }
        if (emp)
            resolve(emp)
        else
            reject('Employee not Found')
    })

    return promise
}


function searchDepartment(deptno) {
    const promise = new Promise((resolve, reject) => {
        let dept = null
        for (d of depts)
            if (d.deptno == deptno)
                dept = d
        if (dept)
            resolve(dept)
        else
            reject('Department is not found')
    })

    return promise

}