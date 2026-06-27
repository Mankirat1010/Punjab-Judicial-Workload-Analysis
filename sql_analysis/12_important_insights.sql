-- =====================================================
-- final insight 1: judge workload imbalance
-- purpose: highest vs lowest district workload
-- =====================================================

with district_cases as (
    select
        dist_code,
        count(*) as total_cases
    from punjab_data
    group by dist_code
),

district_judges as (
    select
        dist_code,
        count(distinct ddl_judge_id) as total_judges
    from judges
    group by dist_code
)

select
    d.district_name,
    c.total_cases,
    j.total_judges,
    round(c.total_cases / j.total_judges, 2) as cases_per_judge
from district_cases c
join district_judges j
on c.dist_code = j.dist_code
join cases_district_key d
on c.dist_code = d.dist_code
order by cases_per_judge desc;


-- =====================================================
-- final insight 2: backlog concentration
-- purpose: pending cases concentrated in top courts
-- =====================================================

with court_pending as (
    select
        dist_code,
        court_no,
        sum(
            case
                when year(date_of_decision) = 0 then 1
                else 0
            end
        ) as pending_cases
    from punjab_data
    group by dist_code, court_no
)

select *
from court_pending
order by pending_cases desc;


-- =====================================================
-- final insight 3: female participation gap
-- purpose: highest vs lowest female petitioner districts
-- =====================================================

select
    d.district_name,

    sum(
        case
            when p.female_petitioner = 1 then 1
            else 0
        end
    ) as female_petitioners,

    round(
        sum(
            case
                when p.female_petitioner = 1 then 1
                else 0
            end
        ) * 100.0
        /
        sum(
            case
                when p.female_petitioner in (0,1) then 1
                else 0
            end
        ),
        2
    ) as female_percentage

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name
order by female_percentage desc;


-- =====================================================
-- final insight 4: case growth vs judge growth
-- purpose: compare growth from 2010 to 2018
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
        year(start_date) as year,
        count(*) as judges_joined
    from judges
    where year(start_date) between 2010 and 2018
    group by year(start_date)
)

select
    c.year,
    c.total_cases,
    coalesce(j.judges_joined, 0) as judges_joined
from yearly_cases c
left join yearly_judges j
on c.year = j.year
order by c.year;