const fs = require('fs')


function readFromFile() {
    console.log('Reading Started')
    fs.readFile('file1.txt', (error, data) => {
        console.log('Reading Finished')
        if (data) {
            console.log('data - ' + data)
        }
        else
            console.log(error)
    })
}

function mathOperation() {
    console.log('Math Operation Started')
    console.log('Result - ' + (1261237 * 237864832))
    console.log('Math Operation Finished')
}



readFromFile()
mathOperation()
