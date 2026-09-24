use amaresh;
create table lele(
id int auto_increment primary key,
name varchar(100) not null,
email varchar(100) unique not null,
gender enum('male','female','others'),
date_of_birth date,
salary int);
-- alter table masuka add column salary int;
-- alter table masuka modify column id int not null auto_increment primary key;
-- alter table masuka modify column salary int  not null primary key;
insert into lele (id,email,name,gender,date_of_birth,salary)values
(1,'mohapatraamaresh@125','Amaresh','male','2003-01-19','20000'),
(2,'mohapatrabhabesh@127','Bhabesh','male','2000-03-01','30000'),
(3,'moahapatraminati@124','Minati','female','1972-09-20','34000'),
(4,'mohapatrajibanana@122','Jibanananda','male','1970-01-26','54000'),
(5,'mohapatraabhishek@113','Abhishek','male','2009-01-29','230000'),
(6,'mohapatraommprakash@123','Ommprakash','male','2000-03-01','4389990'),
(7,'moahapatrasulagna@133','Sulagana','female','2006-09-20','346654650'),
(8,'mohapatrasaiprakash@143','Saiprakash','male','2001-01-26','986546'),
(9,'mohapatrasunkhai@153','Sunakhi','female','2008-01-19','5240100'),
(10,'mohapatratamanna@163','Tamanna','female','2000-06-01','5154512');
select*from lele;
-- drop table cuku;