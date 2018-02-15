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

  console.log("fact text:   " + req.query.text);
  console.log("fact Lattitude:   " + req.query.lat);
  console.log("fact Longitude:   " + req.query.long);

  res.json(200);
  try {
    const retval = await db.addFact(req.body.text, req.body.lat, req.body.long);
      if (req.accepts('html')) {
          // browser should go to the listing of pictures
          res.redirect(303, '/#' + retval.id);
        } else {
          // request that accepts JSON will instead get the data
          res.json(retval);
        }

      } catch (e) {
      error(res, e);
      }
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
