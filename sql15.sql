use akm;
select*from ipl3;
select*from ipl3 where Nationality="Indian";
select*from ipl3 where Stumps>4 and Catches>50 and Nationality="Indian" order by Runs desc ;
select*from ipl3 where Stumps>4 and Catches>50 and Team="Chennai" order by Runs desc;
select*from ipl3 where Runs>3000 and Team="Chennai";
select*from ipl3 where Runs>1000 and Team="Chennai" and Strike_Rate>100;
update ipl3 set Run_outs=63 and Catches=63 where player_no=115;
set sql_safe_update=0;