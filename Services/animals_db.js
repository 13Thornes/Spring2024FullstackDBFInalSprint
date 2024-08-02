// Login to videogames database

const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'ZooAnimals',
  password: 'Luke5341',
  port: 5432,
});
module.exports = pool;