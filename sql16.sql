use amaresh;
select*from lele;
show indexes from lele;
-- select*from lele where email="mohapatraamaresh@125" and gender="male";
-- create index idx_email on lele (gender);
-- select*from lele where emil="mohapatraamaresh@125";
-- create index idx_gender_salary on lele(gender,salary);
drop index idx_email on lele;
-- select count(*) lele;
select avg(salary)from lele;
select*from lele where salary>(select avg(salary)from lele);
select*from lele where salary<(select avg(salary) from lele);
select id from lele where salary>40000;
select id,name,referred_by_id 
from lele
where referred_by_id in(select id from lele where salary<(select avg(salary)from lele));


