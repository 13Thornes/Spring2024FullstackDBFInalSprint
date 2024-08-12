const { ObjectId } = require("mongodb");
const dal = require("./m.db");

async function geAnimals(keyword) {
  if(DEBUG) console.log("mongo.dal.getFullText()");
  try {
    
    await dal.connect();
    const database = dal.db("ZooAnimals");
    const collection = database.collection("animals");
    const result = await collection.find({ $text: {$search: keyword} }).toArray();
    return result;
  } catch(err) {
    console.error('Error occurred while connecting to MongoDB:', err);
    
  } finally {
    dal.close();
  }
};

module.exports = {
  geAnimals
  }