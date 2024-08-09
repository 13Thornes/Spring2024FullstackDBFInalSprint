
// set constants
const express = require('express');
const router = express.Router();
const animalsDal = require('../Services/pg.animals.dal')
const {setToken, authenticateJWT} = require('../services/auth');


router.use(setToken);
router.use(authenticateJWT);
// router call to render the animals page
router.get('/', async (req, res) => {
    try {
        let theAnimals = await animalsDal.getanimals();
        if(DEBUG) console.table(theAnimals);
        res.render('animals', {theAnimals});
    } catch {
        res.render('503')
    }
});

// router call to render the single animal page
router.get('/:id', async (req, res) => {
    try {
        const anAnimal = await animalsDal.getanimalbyanimalid(req.params.id);
        if(DEBUG) console.log(`animals.router.get/:id ${anAnimal}`);
        if (anAnimal)
            res.render('animal', {anAnimal});
        else
            res.render('norecord');
    } catch {
        res.render('503');
    }
});

module.exports = router