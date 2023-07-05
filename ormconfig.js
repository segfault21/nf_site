require('dotenv').config()

module.exports = {
  port: 5432,
  type: 'postgres',
  host: 'localhost',
  database: process.env.DB_NAME,
  username: process.env.DB_LOGIN,
  password: process.env.DB_PASSWORD,
  migrationsTableName: 'migrations',
  migrations: ['dist/migration/*.js'],
  entities: ['dist/**/*.entity{.ts,.js}'],
  cli: {
    migrationsDir: 'migration',
  },
  // logging: true,
  maxQueryExecutionTime: 5000,
}
