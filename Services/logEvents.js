const fs = require('fs');
const fsPromises = require('fs').promises;
const path = require('path');

const { format, getYear } = require('date-fns');
const { v4: uuid } = require('uuid'); //guid

const EventEmitter = require('events');
const myEmitter = new EventEmitter(); 

myEmitter.on('event', async (event, level, message) => {
  const dateTime = `${format(new Date(), 'yyyyMMdd\tHH:mm:ss')}`;
  const logItem = `${dateTime}\t${level}\t${event}\t${message}\t${uuid()}`;
  try {
      
      const currFolder = '../logs/' + getYear(new Date());
      if(!fs.existsSync(path.join(__dirname, '../logs/'))) {
          
          await fsPromises.mkdir(path.join(__dirname, '../logs/'));
          if(!fs.existsSync(path.join(__dirname, currFolder))) {
              
              await fsPromises.mkdir(path.join(__dirname, currFolder));
          }
      }
      else {
          if(!fs.existsSync(path.join(__dirname, currFolder))) {
              
              await fsPromises.mkdir(path.join(__dirname, currFolder));
          }
      }
      
      if(DEBUG) console.log(logItem);
      const fileName = `${format(new Date(), 'yyyyMMdd')}` + '_http_events.log';
      await fsPromises.appendFile(path.join(__dirname, currFolder, fileName), logItem + '\n');
  } catch (err) {
      console.log(err);
  };
}); 

module.exports = myEmitter;