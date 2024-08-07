const express = require('express');
const router = express.Router();
// const {setToken, authenticateJWT} = require('../services/auth');
const myEventEmitter = require('../services/logEvents.js');

const pDal = require('../Services/pg.animals.dal')

router.get('/', async (req, res) => {
    const theAnimals = [];
    myEventEmitter.emit('event', 'app.get /search', 'INFO', 'search page (search.ejs) was displayed.');
    res.render('search', {status: req.session.status, theAnimals});
});

router.post('/', async (req, res) => {
    let theAnimals = await pDal.getFullText(req.body.keyword); 
    myEventEmitter.emit('event', 'app.post /search', 'INFO', 'search page (search.ejs) was displayed.');
    res.render('search', {status: req.session.status, theAnimals});
});

module.exports = router;