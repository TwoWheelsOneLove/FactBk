/* SQL CODE GOES HERE*/

create database if not exists factBk;

create table if not exists factBk.fact (
  
create TABLE user(
ID INT(10) PRIMARY KEY,
Email VARCHAR(30) NOT NULL,
Password VARCHAR(50) NOT NULL,
);


create TABLE location(
locationID INT(10) PRIMARY KEY,
locationX FLOAT(3,10) NOT NULL,
locationY FLOAT(3,10) NOT NULL,
LocationReference TEXT(50) NOT NULL,
);


create TABLE facts(
factID INT(10) PRIMARY KEY,
factText TEXT(5000) NOT NULL,
CONSTRAINT FOREIGN KEY (locationID)
);


create table if not exists factBk.user (


);
