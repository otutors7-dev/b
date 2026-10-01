const fs = require('fs')

//  Checking the asynchronus operation
function readFromFile() {
    console.log('Reading Started')
    const data = fs.readFileSync('file1.txt')
    console.log('data - ' + data)
    console.log('Reading Finished')

}

function mathOperation() {
    console.log('Math Operation Started')
    console.log('Result - ' + (1261237 * 237864832))
    console.log('Math Operation Finished')
}



readFromFile()
mathOperation()
