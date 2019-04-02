const fs = require('fs')

const main = () => {
	const i = 5;
	if (i >= 0)
		fs.writeFileSync(`Sully${i - 1}`, `const fs = require('fs')\n\nconst main = ${main.replace(i, i - 1)}\n\nmain()`)
}

main()
