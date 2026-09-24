use amaresh;
select*from lele;
select*from user_admin;
select*from panda;
select id,name from lele
union all
select id,name from panda
order by name desc;

select name,'user'as role from lele
union
select name,'admin' as role from user_admin;

select*from lele;
alter table lele add column referred_by_id int;

update lele set referred_by_id=1 where id in(1,3,5,7,9);
update lele set referred_by_id=2 where id in(2,4);

select email,name,date_of_birth,'user' as role from lele
union
select email,name,date_of_birth,'admin' as role from user_admin;

select*from lele where referred_by_id is null;
select*from lele;
select
a.id,
a.name as name,
b.name as referred_by_name
from lele a
left join lele b on a.referred_by_id=b.id;

create view rich_users as 
select*from lele where salary>70000;

select*from rich_users;
select name from lele where referred_by_id=null;
update lele set salary=4510240 where id=7;