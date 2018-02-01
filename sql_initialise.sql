/* SQL CODE GOES HERE*/

create database if not exists factBk;

create table if not exists factBk.fact (

);



create table if not exists factBk.user (
  id int primary key auto_increment,
  username varchar(20),
  password varchar(20)
);

insert ignore into factBk.user values(1, 'DanLincoln', 'testPassword123');
