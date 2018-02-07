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
  text varchar(500) NOT NULL,
  locationID INT(10) NOT NULL,
  CONSTRAINT fkLocation FOREIGN KEY (locationID) REFERENCES location(id)
);


/* USER INSERTS*/
insert ignore into factBk.user values (1, "dan lincoln", "testPassword");

/* LOCATION INSERTS */
insert ignore into factBk.location values (1, 200.30, 200.10);
insert ignore into factBk.location values (2, 300.00, 500.10);
insert ignore into factBk.location values (3, 100.00, 250.00);

/* FACT INSERTS */
insert ignore into factBk.fact values (1,"A fact about a place", 1);
insert ignore into factBk.fact values (2,"Another Fact about a place", 2);
insert ignore into factBk.fact values (3,"Another Fact about a place", 3);
