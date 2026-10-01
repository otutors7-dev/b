const fs = require('fs')

// read a file and display
// append new content to the file
// read the file to verify the changes and display
function doWork() {
    fs.readFile('file2.txt', (error, data) => {
        if (data) {
            console.log("Initial data - " + data)
            fs.appendFile('file2.txt', 'World', (error) => {
                if (error)
                    console.log(error)
                else {
                    fs.readFile('file2.txt', (error, data) => {
                        if (data)
                            console.log('Appended data - ' + data)
                        else
                            console.log(error)
                    })
                }
            })
        }
        else
            console.log(error)
    })
}

doWork()
