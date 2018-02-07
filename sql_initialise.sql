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
insert ignore into factBk.location values (1, 50.802164, -1.108874);
insert ignore into factBk.location values (2, 50.800484, -1.109455);
insert ignore into factBk.location values (3, 50.800840, -1.110010);
insert ignore into factBk.location values (4, 50.801741, -1.110687);
insert ignore into factBk.location values (5, 50.798218, -1.109280);
insert ignore into factBk.location values (6, 50.798937, -1.094129);
insert ignore into factBk.location values (7, 50.800284, -1.094795);
insert ignore into factBk.location values (8, 50.797571, -1.092923);
insert ignore into factBk.location values (9, 50.796490, -1.093246);
insert ignore into factBk.location values (10, 50.788978, -1.104003);
insert ignore into factBk.location values (11, 50.779638, -1.089424);
insert ignore into factBk.location values (12, 50.777992, -1.088841);
insert ignore into factBk.location values (13, 50.800523, -1.109459);

/* FACT INSERTS */
insert ignore into factBk.fact values (1,"A fact about a place", 1);
insert ignore into factBk.fact values (2,"Another Fact about a place", 2);
insert ignore into factBk.fact values (3,"Another Fact about a place", 3);
