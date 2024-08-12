const dal = require("./animals_db");

async function addKeyword(login_id, keywords, source, hits) {
  let SQL = `INSERT INTO public."keywords"(\"user_id\", \"keywords\", \"data_source\", \"hit_count\")
    VALUES ($1, $2, $3, $4) RETURNING keyword_id;`
  try {
    let results = await dal.query(SQL, [login_id, keywords, source, hits]);
    return results.rows[0].keyword_id;
  } catch (error) {
    console.log(error);
  } 
};

async function deleteKeyword(user_id) {
  let SQL = "DELETE FROM public.\"keywords\" WHERE \"user_id\" = $1"
try {
  let results = await dal.query(SQL, [user_id]);
  return results;
} catch (error) {
  console.log(error);
} 
};


module.exports = {
    addKeyword,
    deleteKeyword
  }