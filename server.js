'use static';

const express = require('express');

const db = require('/databaseModel');

const config = require("./config");



const app = express();


//static pages
app.use('/', express.static(config.webpaces, {extensions: ['html'] }));

//API FUNCTIONS
app.get('/factbk/facts', plotFacts);


// start server
app.listen(8080, (err) => {
  if (err) console.error('error starting server', err);
  else console.log('server started successfully');
});


//server functionality
async function plotFacts(){

}

async function deleteFact(){

}

async function editFact(){

}
