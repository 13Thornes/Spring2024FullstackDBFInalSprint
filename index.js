
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

const myEventEmitter = require('./Services/logEvents.js');

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
}));


// get animals search page
const animalsRouter = require('./Routes/animalspg')
app.use('/search', animalsRouter);

const authRouter = require('./Routes/auth');
app.use("/auth", authRouter);

const userRouter = require('./Routes/user');
app.use("/user", userRouter);

app.get('/', async (req, res) => {
    myEventEmitter.emit('event', 'app.get', 'INFO', 'landing page (index.ejs) was displayed.');
    res.render('index', {status: req.session.status});
});

// get about page
app.get('/about', (request, response) => {
    myEventEmitter.emit('event', 'app.get /about', 'INFO', 'about page (about.ejs) was displayed.');
    response.render('about.ejs');
});

app.get('/user', (request, response) => {
    myEventEmitter.emit('event', 'app.get /user', 'INFO', 'user page (about.ejs) was displayed.');
    response.render('user.ejs');
});



// Error page
app.use((req, res) => {
    res.status(404).render('404');
});





// run the server
app.listen(PORT, () => {
    myEventEmitter.emit('event', 'app.listen', 'SUCCESS', 'http search site successfully started.');
    console.log(`App running on port ${PORT}.`)
});