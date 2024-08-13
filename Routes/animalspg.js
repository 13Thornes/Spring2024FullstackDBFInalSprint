

// set constants
const express = require('express');
const router = express.Router();
const pDal = require('../Services/pg.animals.dal')
const {setToken, authenticateJWT} = require('../Services/auth');
const keyDal = require('../Services/pg.keywords.dal');
const mDal = require('../Services/m.animals.dal')
const myEventEmitter = require('../Services/logEvents.js');


router.use(setToken);
router.use(authenticateJWT);
// router call to render the animals page
router.get('/', async (req, res) => {
    const theAnimals = [];
    myEventEmitter.emit('event', 'app.get /search', 'INFO', 'search page (search.ejs) was displayed.');
    res.render('search', {status: req.session.status, theAnimals});
});

// router call to render the single animal page
router.post('/', async (req, res) => {
    var theAnimals = [];
    console.log(req.body.database)
    if(req.body.database==="pg"){
        console.log("Enter");
     theAnimals = await pDal.getanimals(req.body.keyword);
    }
    else if(req.body.database==='mongo'){
        console.log('Enter mongo')
        theAnimals = await mDal.getAnimals(req.body.keyword)
    }

    else if(req.body.database==='both'){
        console.log('Enter mongo');
        theAnimals = await pDal.getanimals(req.body.keyword);
        console.log(theAnimals.length);
        let mongoAnimals = await mDal.getAnimals(req.body.keyword);

        mongoAnimals.forEach(animal=> {
        theAnimals.push(animal);
        })
    }
    else{
        req.session.status ='Please select a database'
    

    } 
    myEventEmitter.emit('event', 'app.post /search', 'INFO', 'search page (search.ejs) was displayed.');


    
    
    keyDal.addKeyword(req.session.user.id, req.body.keyword, req.body.database, theAnimals.length);
    res.render('search', {status: req.session.status, theAnimals});
});

module.exports = router
