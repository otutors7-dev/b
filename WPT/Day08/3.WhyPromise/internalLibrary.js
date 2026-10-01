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

function searchEmployee(empid, callBackFn) {
    let emp = null
    for (e of emps) {
        if (e.empid == empid)
            emp = e
    }
    callBackFn(emp)
}


function searchDepartment(deptno, callBackFn) {
    let dept = null
    for (d of depts) {
        if (d.deptno == deptno)
            dept = d
    }
    callBackFn(dept)
}