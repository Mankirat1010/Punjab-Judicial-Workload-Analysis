-- =====================================================
-- district-wise insight 1: total cases in each district
-- purpose: identifies busiest districts / workload distribution
-- =====================================================
select 
    d.district_name,
    count(*) as total_cases
from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code
group by d.district_name
order by total_cases desc;


-- =====================================================
-- district-wise insight 2: pending cases percentage
-- purpose: identifies districts with highest backlog
-- pending = cases with invalid / missing decision date
-- =====================================================
select
    d.district_name,
    round(
        sum(
            case
                when year(p.date_of_decision) = 0 then 1
                else 0
            end
        ) * 100.0 / count(*),
        2
    ) as pending_percentage
from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code
group by d.district_name
order by pending_percentage desc;


-- =====================================================
-- district-wise insight 3: average resolution time
-- purpose: identifies fastest and slowest districts in delivering justice
-- only resolved cases are included
-- =====================================================
select
    d.district_name,
    round(
        avg(datediff(p.date_of_decision, p.date_of_filing)) / 30,
        2
    ) as avg_resolution_months
from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code
where year(p.date_of_decision) != 0
group by d.district_name
order by avg_resolution_months desc;