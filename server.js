'use static';

const express = require('express');

const db = require('./databaseModel');

const config = require("./config");



const app = express();


//static pages
app.use('/', express.static(config.webpages, {extensions: ['html'] }));

//API FUNCTIONS
app.get('/api/facts', sendFacts);

// start server
app.listen(8080, (err) => {
  if (err) console.error('error starting server', err);
  else console.log('server started successfully');
});


//server functionality
async function sendFacts(req, res){
  try{
    const facts = await db.listFacts();
    res.json(facts);
  }catch(e){
    error(res,e);
  }
}

async function deleteFact(){

}

async function editFact(){

}



function error(res, msg) {
  res.sendStatus(500);
  console.error(msg);
}
