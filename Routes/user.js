const express = require('express');
const bcrypt = require('bcrypt');
const router = express.Router();
const {setToken, authenticateJWT} = require('../Services/auth');
const { updateUser } = require('../Services/p.auth.dal');
const myEventEmitter = require('../Services/logEvents.js');


router.use(setToken);
router.use(authenticateJWT);

router.get('/', async (req, res) => {
    
    myEventEmitter.emit('event', 'user.get / ', 'INFO', 'search page (search.ejs) was user page was displayed.');
    res.render('user');
});

router.get('/edit', async (req, res) => {
    
    myEventEmitter.emit('event', 'user,get / edit', 'INFO', 'edit page was displayed.');
    res.render('edit', {theId: req.session.user.id, status: req.session.status});
});

router.patch('/edit', async (req, res) => {
    console.log("enter");
try{
    const hashedPassword = await bcrypt.hash(req.body.password, 10);
        if (req.body.email && req.body.username && req.body.password ) {
            var result = await updateUser(req.session.user.id, req.body.username,  hashedPassword, req.body.email,);
            if(result.code === "23505") {
                console.log("Enter error");
                let constraint;
                function setConstraint(indexName) {
                    const constraintsMap = {
                        "unique_username": "Username",
                    };
                    return constraintsMap[indexName] || indexName; // Default to indexName if not found
                }
                
               
                    myEventEmitter.emit('event', 'user.patch/edit', 'INFO', `PostgreSQL unique violation: 23505`);
                    constraint = setConstraint(req.body.username);
                
                if(DEBUG) console.log(`${constraint} already exists, please try another.`);
                req.session.status = `${constraint} already exists, please try another.`
                
                res.redirect('/user/edit')
                return;
            }
            
        myEventEmitter.emit('event', 'user.patch/edit ', 'INFO', `User edited data.`);
        req.session.status = 'Account updated.'
        res.redirect('/user/edit');
        return;
            
        } else {
            if(DEBUG) console.log('Not enough form fields completed.');
            
            res.redirect('/user/edit')
            return;
        }       
    }
  catch (error) {
        console.log(error);
        // log this error to an error log file.
        res.render('503');
        return;
        
    }
});

module.exports = router