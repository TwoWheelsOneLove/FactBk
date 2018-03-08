'use strict';

const mysql = require('mysql');

const config = require('./config');

const sql = mysql.createConnection(config.mysql);

module.exports.checkLogin = (email, pass) =>{
  return new Promise((resolve, reject) => {

      sql.query(sql.format('select * from user where email = ? and password = ?', [email,pass]), (err, result) => {
        if (err) {
          reject(['failed sql query', err]);
          return;
        }

        const retval = [];

        result.forEach((row)=>{

          retval.push({
            email: row.email,
            pass:row.password
          });
        });


        resolve(retval);
      });
    });
};

module.exports.listFacts = () => {
  return new Promise((resolve, reject) => {
    let query = 'select fact.factTitle, fact.id, fact.text, fact.locX, fact.locY, fact.imgSrc from fact order by fact.id desc'



  sql.query(query, (err,data) =>{
    if (err) {
      reject(['failed to run the query', err]);
      return;
    }

    const retval = [];
       data.forEach((row)=>{
         retval.push({
           id: row.id,
           title:row.factTitle,
           x: row.locX,
           y: row.locY,
           text: row.text,
           imageSource: row.imgSrc,
         });
       });

       resolve(retval);
    });

  });

};

module.exports.addFact = (title, text, lat, long) => {
  return new Promise((resolve, reject) => {

    // now add the file to the DB
    const dbRecord = {
      factTitle: title,
      text: text,
      locX: lat,
      locY: long
    };

    sql.query(sql.format('INSERT INTO fact SET ?', dbRecord), (err, result) => {
      if (err) {
        reject(['failed sql insert', err]);
        return;
      }

      resolve({id: result.insertId, title: dbRecord.factTitle,text:dbRecord.text, x:dbRecord.locX, y:dbRecord.locY});
    });
    });
  };
