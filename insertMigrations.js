const fs = require('fs')
const path = require('path')
const util = require('util')
const exec = util.promisify(require('child_process').exec)

const files = fs.readdirSync(path.join(process.cwd(), './migration'))

const main = async () => {
  for (const filename of files) {
    const [, timestamp, name] = filename.match(/^(\d+)-(.+)\.(ts|js)$/)
    const sql = `INSERT INTO migrations (timestamp, name) VALUES (${timestamp}, '${name}${timestamp}');`
    console.log(sql)
    await exec(`yarn typeorm:cli query "${sql}"`)
  }
}
main()
