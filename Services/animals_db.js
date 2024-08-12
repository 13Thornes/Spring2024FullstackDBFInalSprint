// Login to zooAnimals database

const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'ZooAnimals',
  password: 'Keyin2021',
  port: 5432,
});
module.exports = pool;