const fs = require('fs')

// All the functions created in note are by default async
function writeInFile(data) {
    fs.writeFile('file1.txt', data, error => console.log(error))
}

writeInFile("Cdac courses are designed as per industry standard")