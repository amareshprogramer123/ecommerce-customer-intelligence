use amaresh;
create table customer(
id int auto_increment primary key,
name varchar(50) not null,
email varchar(50) unique not null,
gender enum('male','female','others'),
date_of_birth date);  
-- select*from customer;
-- rename table programmers to customer ; 
-- alter table customer add column salary;
-- alter table customer drop column is_active;
-- alter table customer modify column email varchar(50) after id;
-- alter table customer modify column date_of_birth date after gender;
select*from customer;