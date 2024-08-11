const dal = require("./animals_db.js");

async function addLogin(name, email, password, uuidv4) {
    let SQL = `INSERT INTO public."User"(username, password, email, uuid)
      VALUES ($1, $2, $3, $4) RETURNING username;`
    try {
      let results = await dal.query(SQL, [name, password, email, uuidv4]);
      return results.rows[0].username;
    } catch (error) {
      if(error.code === '23505') // duplicate username
        return error;
      
    } 
  };

  async function getLoginByUsername(username) {
    let SQL = `SELECT id AS id, username, password, email FROM public."User" WHERE username = $1`;
    try {
      let results = await dal.query(SQL, [username]);
      if(DEBUG) console.log(`results after query: ${JSON.stringify(results.rows[0])}`);
      return results.rows[0];
    } catch (error) {
      console.log(error);
    }  
  };

  async function updateUser(id,username, password, email) {
    let SQL = "UPDATE public.\"User\" SET \"username\"=$2, \"password\"=$3 , \"email\"=$4 WHERE \"id\"=$1;";
    try {
      let results = await dal.query(SQL, [id, username, password, email]);
      return results
    } catch (error) {
      return error
    }  
  };



  module.exports = {
    addLogin,
    getLoginByUsername,
    updateUser
  }