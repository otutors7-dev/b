// Asynchronous Behaviour with priority

console.log('Program started')

function task1() {
    console.log('Task1 Started')
    // normal callbacks are kept into Task queue(Macro)
    setTimeout(() => {
        console.log('Task1 in progress')
        console.log('Task1 Finished')
    }, 0)

}

function task2() {
    console.log('Task2 Started')
    // Promises are having highest priority
    // promises are kept into micro task queue
    Promise.resolve().then(() => {
        console.log('Task2 in progress')
        console.log('Task2 Finished')
    })
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
