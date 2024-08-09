
// set constants
const dal = require("./animals_db");

// GET all animals
var getanimals= function(text) {
  if(DEBUG) console.log("animals.pg.dal.getanimals()");
  return new Promise(function(resolve, reject) {

    const sql = `SELECT animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup FROM public.animals \
  WHERE nickname iLIKE '%'||$1||'%' \
        OR common_name iLIKE '%'||$1||'%' \
        OR scientific_name iLIKE '%'||$1||'%'`;
    
    if(DEBUG) console.log(sql);
    dal.query(sql, [text], (err, result) => {
      if (err) {
        if(DEBUG) console.log(err);
        reject(err);
      } else {
        if(DEBUG) console.log(`Row count: ${result.rowCount}`);
        resolve(result.rows);
      }
    }); 
  }); 
};

  // GET one animal by its animal_id
  var getanimalbyanimalid = function(id) {
    if(DEBUG) console.log("animals.pg.dal.getanimalbyanimalid()");
    return new Promise(function(resolve, reject) {
      const sql = "SELECT animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup FROM animals WHERE animal_id = $1";
      dal.query(sql, [id], (err, result) => {
        if (err) {
          if(DEBUG) console.log(err);
          reject(err);
        } else {
          resolve(result.rows);
        }
      }); 
    }); 
  };
  

// export modules
  module.exports = {
    getanimals,
    getanimalbyanimalid
  }