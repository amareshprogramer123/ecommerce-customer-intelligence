use amaresh;
-- create table user_admin(
-- id int auto_increment primary key,
-- name varchar(100) not null,
-- email varchar(100) unique not null,
-- gender enum('male','female','others'),
-- date_of_birth date,
-- salary int);
-- insert into user_admin(id,name,email,gender,date_of_birth,salary)values
-- (101,"Subhadra Das","dassubhadra143@gmail.com","female",'2011-02-11','564465'),
-- (102,"Swatipriya Barik","barikswatipriya123@gmail.com","female",'2015-05-16','15000'),
-- (103,"Laxmipriya Panda","pandalaxmipriya124@gmail.com","female",'2011-02-13','124000'),
-- (104,"Dibyajyoti Samal","samaldibyajyoti156@gmail.com","male",'2016-11-12','125000'),
-- (105,"Abhijit Ojha","ojhaabhijit134@gmail.com","male",'2016-10-16','154000');
-- select*from user_admin;
use amaresh;
create table panda(
id int auto_increment primary key,
 name varchar(100) not null,
 email varchar(100) unique not null,
 gender enum('male','female','others'),
 date_of_birth date,
 salary int);
 insert into panda (id,email,name,gender,date_of_birth,salary)values
(1,'mohapatraamaresh@125','Amaresh','male','2003-01-19','20000'),
(2,'mohapatrabhabesh@127','Bhabesh','male','2000-03-01','30000'),
(3,'moahapatraminati@124','Minati','female','1972-09-20','34000'),
(4,'mohapatrajibanana@122','Jibanananda','male','1970-01-26','54000'),
(5,'mohapatraabhishek@113','Abhishek','male','2009-01-29','230000'),
(6,'mohapatraommprakash@123','Ommprakash','male','2000-03-01','4389990'),
(7,'moahapatrasulagna@133','Sulagana','female','2006-09-20','346654650'),
(8,'mohapatrasaiprakash@143','Saiprakash','male','2001-01-26','986546');
 select*from panda;