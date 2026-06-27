-- TOTAL CASES
select count(*) as total_cases
from punjab_data;

-- TOTAL DISTRICTS 
select count(dist_code) as total_districts
from cases_district_key;

-- TOTAL COURTS
select count(distinct concat(dist_code, '-', court_no)) as total_courts
from punjab_data;

-- TOTAL UNIQUE JUDGES
select count(distinct ddl_judge_id) as total_judges
from judges;

-- AVERAGE CASE RESOLUTION TIME 
select round(
    avg(datediff(date_of_decision, date_of_filing))/30,
    2
) as avg_resolution_months
from punjab_data
where year(date_of_decision) != 0;

