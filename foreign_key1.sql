use amaresh;
drop table if exists addresses;
create table addresses(
id int auto_increment primary key,
user_id int,
city varchar(100),
state varchar(100),
pincode varchar(100),
constraint fk_user foreign key(user_id) references lele(id) on delete cascade
);
insert into addresses(user_id,city,state,pincode)
values
(10,"balasore","bihar","756043"),
(1,"bhadrak","asam","756044"),
(3,"cuttuck","gujarat","756046"),
(8,"bhubaneswar","chennai","756049"),
(4,"baraghar","lakhnow","756045"),
(6,"mayuarvanj","delhi","756053"),
(5,"keonjhar","hariyana","756013"),
(7,"malakanagiri","manipur","756073"),
(2,"sundarghar","sikim","756089"),
(9,"nayaghar","mijuram","756345");
select* from addresses;
-- drop table addresses;