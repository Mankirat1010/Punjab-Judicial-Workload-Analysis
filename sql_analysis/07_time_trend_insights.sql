-- CASES FILED YEAR-WISE                                                    interested..
select year, count(ddl_case_id)
from punjab_data
group by year
order by year;

-- AVERAGE RESOLUTION TIME YEAR-WISE                                         upper edge problem...
select 
    year(date_of_decision) as decision_year,
    round(avg(datediff(date_of_decision, date_of_filing)) / 30, 2) as avg_resolution_months
from punjab_data
where year(date_of_decision) >= 2010
group by year(date_of_decision)
order by decision_year;

-- FEMALE JUDGES APPOINTED OVER YEARS (%age)
select year(start_date) as 'year', count(*) as 'total female judges'
from judges
where female_judge = 1 
group by year(start_date)
order by year(start_date) desc
limit 9;

-- =====================================================
-- year-wise workload per judge (corrected)
-- active cases / unique judges handling those cases
-- =====================================================

with yearly_cases as (
    select
        year,
        count(*) as total_cases
    from punjab_data
    group by year
),

yearly_judges as (
    select
        p.year,
        count(distinct p.ddl_judge_id) as total_judges
    from punjab_data p
    where p.ddl_judge_id is not null
    group by p.year
)

select
    c.year,
    c.total_cases,
    j.total_judges,
    round(c.total_cases / j.total_judges, 2) as cases_per_judge
from yearly_cases c
join yearly_judges j
on c.year = j.year
order by c.year;