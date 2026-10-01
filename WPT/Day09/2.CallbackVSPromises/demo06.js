// using promises
const { error } = require('console')
const fs = require('fs/promises')
// read a file and display
// append new content to the file
// read the file to verify the changes and display
function doWork() {
    fs.readFile('file3.txt')
        .then(data => {
            console.log("Initial data - " + data)
            return fs.appendFile('file3.txt', 'World')
        })
        .then(() => fs.readFile('file3.txt'))
        .then(data => console.log('Appended data - ' + data))
        .catch(error => console.log(error))
}

doWork()
doOperation()
