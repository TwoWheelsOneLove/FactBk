'use strict';

const mysql = require('mysql');

const config = require('./config');

const sql = mysql.createConnection(config.mysql);


module.exports.listFacts = () => {
  return new Promise((resolve, reject) => {
    let query = 'select fact.id, fact.text, fact.locX, fact.locY from fact'



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


function addFact(text, lat, long){
  return new Promise((resolve, reject) => {

    // now add the file to the DB
    const dbRecord = {
      locX: lat,
      locY: long
    };

    sql.query(sql.format('INSERT INTO fact SET ?', dbRecord), (err, result) => {
      if (err) {
        reject(['failed sql insert', err]);
        return;
      }

      resolve({ id: result.insertId, title: dbRecord.title, file: config.webimg + dbRecord.filename });
    });
  });
});
};
