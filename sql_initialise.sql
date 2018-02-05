/* SQL CODE GOES HERE*/

create database if not exists factBk;


create TABLE if not exists factBk.user(
ID INT(10) PRIMARY KEY,
email VARCHAR(30) NOT NULL,
password VARCHAR(50) NOT NULL
);

create TABLE if not exists factBk.location(
locationID INT(10) PRIMARY KEY,
locationX FLOAT(3,10) NOT NULL,
locationY FLOAT(3,10) NOT NULL,
imgReference TEXT(50) NOT NULL
);

create TABLE if not exists factBk.facts(
factID INT(10) PRIMARY KEY,
factText TEXT(5000) NOT NULL,
locationID INT(10) NOT NULL,
CONSTRAINT fkLocation FOREIGN KEY (locationID) REFERENCES location(locationID)
);

