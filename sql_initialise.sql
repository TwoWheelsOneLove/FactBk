/* SQL CODE GOES HERE*/

create database if not exists factBk;


create TABLE if not exists factBk.user(
ID INT(10) PRIMARY KEY,
email VARCHAR(30) NOT NULL,
password VARCHAR(50) NOT NULL
);





