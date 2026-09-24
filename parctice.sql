create database lulu;
use lulu;
create table students(
id int primary key,
name varchar(50) not null,
roll_no varchar(50),
regd_no bigint unique,
email varchar(50) unique not null,
gender enum("male","female","other"),
date_of_birth date);
insert into students(id,name,roll_no,regd_no,email,gender,date_of_birth,scholarship)value
(01,"Amaresh Mohapatra","23-CS/08","2301225023","mohapatraamaresh@141gmail.com","male","2005-01-19","65000"),
(02,"Abhisekh Mohanty","23-CS/03","2301225018","mohantyabhisekh@144gmail.com","male","2005-09-16","20000"),
(03,"Amit ku. Jena","23-CS/10","2301225025","jenaamit@123gmail.com","male","2005-03-24","28500"),
(04,"Krishaa Priyadarshini","23-CS/49","2301225060","priyadarshinikrishaa@141gmail.com","female","2005-12-31","72000"),
(05,"Aditi Sahu","23-CS/07","2301225022","sahuaditi@999gmail.com","female","2005-04-05","80000"),
(06,"Amarjyoti Sahoo","23-CS/09","2301225024","sahooamarjyoti@134gmail.com","male","2005-10-22","56000");

select*from students;
-- drop table students;
