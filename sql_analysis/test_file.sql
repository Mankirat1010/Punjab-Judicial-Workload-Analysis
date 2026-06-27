select * from cases_court_key where dist_code = 5 and court_no = 4;

select user();

SELECT user, host, plugin FROM mysql.user;

select count(*) from judge_case_merge_key where ddl_decision_judge_id = 5;

select female_judge, count(*) from judges group by female_judge;


select * from cases_district_key;

select dist_code, court_no, count(*)
from cases_court_key
group by dist_code, court_no
having count(*) > 1;


create table court_key_unique as
select
    dist_code,
    court_no,
    min(court_name) as court_name
from cases_court_key
group by dist_code, court_no;


select count(*) from court_key_unique;