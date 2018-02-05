'use strict';

const mysql = require('mysql');

const config = require('./config');

const sql = mysql.createConnection(config.mysql);


module.exports.listFacts = () => {
  return new Promise((resolve, reject) => {
    let query = 'SELECT id, locX, locY, text FROM fact';



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
           fact: row.text,
         });
    });

  resolve(retval);
  });

});

};
