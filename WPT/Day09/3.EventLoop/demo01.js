// Synchronous execution
console.log('Program started')

function task1() {
    let n1 = 10;
    console.log('Task1 Started')
    console.log('Task1 in progress')
    console.log('Task1 Finished')
}

function task2() {
    console.log('Task2 Started')
    console.log('Task2 in progress')
    console.log('Task2 Finished')
}

function task3() {
    console.log('Task3 Started')
    console.log('Task3 in progress')
    console.log('Task3 Finished')
}

task1()
task2()
task3()
console.log('Program Ended')
