
require('dotenv').config();


// define constants
const express = require('express');
const methodOverride = require('method-override');
const app = express();
const session = require('express-session');
const PORT = 3000;
const path = require('path');

// Debug, set and use statements
global.DEBUG = true;
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true, }));
app.use(methodOverride('_method'));
app.use(express.json());

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
}));


// get games page
const animalsRouter = require('./Routes/animalspg')
app.use('/search', animalsRouter);

const authRouter = require('./Routes/auth');
app.use("/auth", authRouter);

app.get('/', async (req, res) => {
    //myEventEmitter.emit('event', 'app.get', 'INFO', 'landing page (index.ejs) was displayed.');
    
    res.render('index', {status: req.session.status});
});



// Error page
app.use((req, res) => {
    res.status(404).render('404');
});

const apiRouter = require('./Routes/api/auth')
app.use('/api', apiRouter);



// run the server
app.listen(PORT, () => {
    console.log(`App running on port ${PORT}.`)
});