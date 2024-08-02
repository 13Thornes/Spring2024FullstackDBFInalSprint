
// set constants
const dal = require("./animals_db");

// GET all animals
var getanimals= function() {
    if(DEBUG) console.log("animals.pg.dal.getanimals()");
    return new Promise(function(resolve, reject) {
      const sql = "SELECT animal_id, nickname, common_name, scientific_name, age, date_arrived, last_checkup FROM public.animals ORDER BY animal_id;"
      dal.query(sql, [], (err, result) => {
        if (err) {
          if(DEBUG) console.log(err);
          reject(err);
        } else {
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