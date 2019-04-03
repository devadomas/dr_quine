/*
	Let me present you Grace
*/
const fs = require('fs')

const X = 1
const Y = 2
const Z = main = () => {
	try {
		fs.writeFileSync('Grace_kid.js', `/*\n\tLet me present you Grace\n*/\nconst fs = require('fs')\n\nconst X = 1\nconst Y = 2\nconst Z = main = ${main}\n\nZ()\n`)
	} catch (err) {
		
	}
}

Z()
