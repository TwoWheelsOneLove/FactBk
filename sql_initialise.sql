create database if not exists factBk;

create TABLE if not exists factBk.user(
  id int PRIMARY KEY auto_increment,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL
);

create TABLE if not exists factBk.location(
  id int PRIMARY KEY auto_increment,
  locX FLOAT(5,2) NOT NULL,
  locY FLOAT(5,2) NOT NULL
);

create TABLE if not exists factBk.fact(
  id int PRIMARY KEY auto_increment,
  text varchar(200) NOT NULL,
  locationID INT(10) NOT NULL,
  CONSTRAINT fkLocation FOREIGN KEY (locationID) REFERENCES location(id)
);


/* USER INSERTS*/
insert ignore into factBk.user values (1, "dan lincoln", "testPassword");

/* LOCATION INSERTS */
insert ignore into factBk.location values (1, 200.30, 200.10);

/* FACT INSERTS */
insert ignore into factBk.fact values (1,"SOME RANDOM FACT TEXT ABOUT SOME STUFF", 1);
