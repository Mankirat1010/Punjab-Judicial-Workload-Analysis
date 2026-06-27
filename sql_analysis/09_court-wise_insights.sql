-- =====================================================
-- court-wise insight: top 5 most efficient courts
-- purpose: identifies courts handling high case volume
-- while resolving cases quickly
-- =====================================================

select
    concat(d.district_name, ' - court ', p.court_no) as court_name,

    count(*) as total_cases,

    sum(
        case
            when year(p.date_of_decision) != 0 then 1
            else 0
        end
    ) as resolved_cases,

    round(
        avg(
            case
                when year(p.date_of_decision) != 0
                then datediff(p.date_of_decision, p.date_of_filing)
            end
        ),
        2
    ) as avg_resolution_days,

    round(
        sum(
            case
                when year(p.date_of_decision) != 0 then 1
                else 0
            end
        ) /
        avg(
            case
                when year(p.date_of_decision) != 0
                then datediff(p.date_of_decision, p.date_of_filing)
            end
        ),
        4
    ) as efficiency_score

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name, p.dist_code, p.court_no

having count(*) >= 1000

order by efficiency_score desc
limit 50;



-- =====================================================
-- court-wise insight: top 5 least efficient courts
-- purpose: identifies courts handling high case volume
-- but resolving cases slowly
-- =====================================================

select
    concat(d.district_name, ' - court ', p.court_no) as court_name,

    count(*) as total_cases,

    sum(
        case
            when year(p.date_of_decision) != 0 then 1
            else 0
        end
    ) as resolved_cases,

    round(
        avg(
            case
                when year(p.date_of_decision) != 0
                then datediff(p.date_of_decision, p.date_of_filing)
            end
        ),
        2
    ) as avg_resolution_days,

    round(
        sum(
            case
                when year(p.date_of_decision) != 0 then 1
                else 0
            end
        ) /
        avg(
            case
                when year(p.date_of_decision) != 0
                then datediff(p.date_of_decision, p.date_of_filing)
            end
        ),
        4
    ) as efficiency_score

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name, p.dist_code, p.court_no

having count(*) >= 1000

order by efficiency_score asc
limit 50;


-- =====================================================
-- court-wise insight: highest share of long-pending cases
-- purpose: identifies courts with severe backlog
-- =====================================================

select
    concat(d.district_name, ' - court ', p.court_no) as court_name,

    count(*) as total_cases,

    sum(
        case
            when year(p.date_of_decision) = 0
            and datediff('2018-12-31', p.date_of_filing) > 730
            then 1
            else 0
        end
    ) as long_pending_cases,

    round(
        sum(
            case
                when year(p.date_of_decision) = 0
                and datediff('2018-12-31', p.date_of_filing) > 730
                then 1
                else 0
            end
        ) * 100.0 / count(*),
        2
    ) as long_pending_percentage

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name, p.dist_code, p.court_no
having count(*) >= 1000
order by long_pending_percentage desc
limit 10;



-- =====================================================
-- court-wise insight: highest case load per judge
-- purpose: identifies courts where each judge handles
-- unusually high number of cases
-- =====================================================

with court_cases as (
    select
        dist_code,
        court_no,
        count(*) as total_cases
    from punjab_data
    group by dist_code, court_no
),

court_judges as (
    select
        dist_code,
        court_no,
        count(distinct ddl_judge_id) as total_judges
    from judges
    group by dist_code, court_no
)

select
    concat(d.district_name, ' - court ', c.court_no) as court_name,
    c.total_cases,
    j.total_judges,

    round(
        c.total_cases / j.total_judges,
        2
    ) as cases_per_judge

from court_cases c
join court_judges j
on c.dist_code = j.dist_code
and c.court_no = j.court_no

join cases_district_key d
on c.dist_code = d.dist_code

where j.total_judges > 0
and c.total_cases >= 1000

order by cases_per_judge desc
limit 20;