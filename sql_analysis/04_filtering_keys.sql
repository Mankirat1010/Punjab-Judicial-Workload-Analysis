SET SQL_SAFE_UPDATES = 0;
	DELETE FROM cases_court_key
	WHERE state_name <> 'Punjab';
SET SQL_SAFE_UPDATES = 1;

select * from cases_court_key
order by year, dist_code;


SET SQL_SAFE_UPDATES = 0;
	DELETE FROM cases_district_key
	WHERE state_name <> 'Punjab';
SET SQL_SAFE_UPDATES = 1;

DELETE FROM cases_district_key
WHERE district_name = 'Hoshiarpur';

ALTER TABLE cases_district_key
ADD PRIMARY KEY (year, state_code, dist_code);

select * from cases_district_key
order by dist_code;






SET SQL_SAFE_UPDATES = 0;
	DELETE FROM cases_state_key
	WHERE state_name <> 'Punjab';
SET SQL_SAFE_UPDATES = 0;

select * from cases_state_key
order by year;


select * from disp_name_key;

select disp_name_s, count(*)
from disp_name_key
group by disp_name_s;



select * from type_name_key;

select year, count(*) from type_name_key
group by year;





select * from judge_case_merge_key;

select count(*) 
from judge_case_merge_key
where ddl_filing_judge_id != ddl_decision_judge_id;




select * from judges;

select count(*), count(distinct ddl_judge_id) 
from judges;



select * from punjab_data; 







