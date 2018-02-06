'use strict';

const mysql = require('mysql');

const config = require('./config');

const sql = mysql.createConnection(config.mysql);


module.exports.listFacts = () => {
  return new Promise((resolve, reject) => {
    let query = 'select fact.id, fact.text, location.locX, location.locY from fact join location where fact.locationID = location.id'



  sql.query(query, (err,data) =>{
    if (err) {
      reject(['failed to run the query', err]);
      return;
    }

    const retval = [];
       data.forEach((row)=>{
         retval.push({
           id: row.id,
           x: row.locX,
           y: row.locY,
           text: row.text,
         });
    });

  resolve(retval);
  });

});

};
