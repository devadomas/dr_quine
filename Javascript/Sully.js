const fs = require('fs')
const exec = require('child_process').exec

const main = () => {
	const i = 5;
	if (i > 0) {
		const str = `const fs = require('fs')\nconst exec = require('child_process').exec\n\nconst main = ${main}\n\nmain()\n`
		if (fs.existsSync(`Sully_${i}.js`)) {
			fs.writeFileSync(`Sully_${i - 1}.js`, str.replace(i, i - 1))
			fs.writeFileSync(`FakeSully${i - 1}`, 'Forget it')
			exec(`node Sully_${i - 1}.js`)
		}
		else {
			fs.writeFileSync(`Sully_${i}.js`, str)
			fs.writeFileSync(`FakeSully${i}`, 'Forget it')
			exec(`node Sully_${i}.js`)
		}
	}
}

main()
