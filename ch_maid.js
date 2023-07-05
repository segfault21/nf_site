module.exports = {
  database: process.env.CH_DATABASE,
  // username: process.env.CH_USERNAME,
  // password: process.env.CH_PASSWORD,
  baseDir: 'clickhouse',
  schemaFile: 'schema.sql',
  migrationsDir: 'migrations',
  migrationsTable: 'migrations_maid',
  logLevel: 'debug',
}
