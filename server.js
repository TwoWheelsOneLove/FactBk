'use static';

const express = require('express');

const db = require('./databaseModel');

const config = require("./config");



const app = express();


//static pages
app.use('/', express.static(config.webpages, {extensions: ['html'] }));

//API FUNCTIONS
app.get('/api/facts', sendFacts);
app.post('/api/facts', addFact);
app.get('/api/login', validateLogin);

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

async function addFact(req,res){
  try {
      const retval = await db.addFact(req.query.title,req.query.text,req.query.lat,req.query.long);
      if (req.accepts('html')) {
          res.json(200);
        } else {
          // request that accepts JSON will instead get the data
          res.json(retval);
        }

      } catch (e) {
      error(res, e);
      }
    }



function deleteFact(){

}

function editFact(){

}

async function validateLogin(req,res){
  try {
    const retval = await db.checkLogin(req.query.email,req.query.pass);

    if (retval.length === 1){
      res.send(200);
    }else{
      res.send(401);
    }

  } catch (e) {
    error(res, e);
  }
}


function error(res, msg) {
  res.sendStatus(500);
  console.error(msg);
}
