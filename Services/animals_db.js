// Login to videogames database

const Pool = require('pg').Pool
const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'zooanimals',
  password: 'Keyin2021',
  port: 5432,
});
module.exports = pool;