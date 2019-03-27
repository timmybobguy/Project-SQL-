/* purge database video */
drop database video;

create database if not exists video; 

use  video; -- selecting the database
-- drop table 
drop table if exists tape;
drop table if exists director;
drop table if exists customer;
drop table if exists hire;

-- create table Tape
create table tape
(
tapeCode char(5) primary key,
title varchar (40),
tapeType varchar (15),
aaWon smallint,
tapeYear  integer,
dNum integer,
timesHired integer,
foreign key (dNum) references director (dNum)
) engine = Innodb;

create table director
(
dNum integer primary key,
LName varchar (30),
FName varchar (25),
born char(4),
died char(4)
) engine = innodb;

create table customer
(
custCode char(5) primary key,
LName varchar (30),
FName varchar (25),
address varchar (30),
rentals integer,
joinDate date
) engine = InnoDB;

create table hire
(
tapeCode char(5),
custCode char(5),
hireDate date,
foreign key (tapeCode) references tape (tapeCode),
foreign key (custCode) references customer (custCode)
) engine = innoDB;


select LName, FName from customer where rentals > 75;

select title from tape where SUBSTRING(title, 1, 3) = 'The';

select title from tape where tapeType = 'Drama' or tapeType = 'Epic';

select title from tape where tapeType = 'Drama' and aaWon > 3;

select director.FName, director.LName, tape.title from director INNER JOIN tape ON director.dNum = tape.dNum;

select tape.title, hire.hireDate from tape INNER JOIN hire ON tape.tapeCode = hire.tapeCode ORDER BY hire.hireDate; 

select customer.FName, customer.LName from customer INNER JOIN hire ON customer.custCode = hire.custCode AND hire.hireDate >= '2008-08-08';

select 

