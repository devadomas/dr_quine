const fs = require('fs')
const exec = require('child_process').exec

const main = () => {
	const i = 5;
	if (i >= 0) {
		const str = `const fs = require('fs')\nconst exec = require('child_process').exec\n\nconst main = ${main}\n\nmain()\n`
		fs.writeFileSync(`Sully_${i}.js`, str.replace(i, i - 1))
		exec(`node Sully_${i}.js`)
	}
}

main()
