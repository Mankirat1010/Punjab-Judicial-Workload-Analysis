-- =====================================================
-- gender insight 1: female judges appointed over years (%)
-- purpose: tracks female representation among new appointments
-- note: excludes unknown gender (-1)
-- =====================================================

select
    year(start_date) as year,

    round(
        sum(
            case
                when female_judge = 1 then 1
                else 0
            end
        ) * 100.0
        /
        sum(
            case
                when female_judge in (0,1) then 1
                else 0
            end
        ),
        2
    ) as female_judge_percentage

from judges
where year(start_date) >= 2010
group by year(start_date)
order by year;


-- =====================================================
-- gender insight 2: female petitioners over years (%)
-- purpose: shows whether more women are approaching courts
-- note: excludes unknown gender (-1)
-- =====================================================

select
    year,

    sum(
        case
            when female_petitioner = 1 then 1
            else 0
        end
    ) as female_petitioner_cases,

    round(
        sum(
            case
                when female_petitioner = 1 then 1
                else 0
            end
        ) * 100.0
        /
        sum(
            case
                when female_petitioner in (0,1) then 1
                else 0
            end
        ),
        2
    ) as female_petitioner_percentage

from punjab_data
group by year
order by year;


-- =====================================================
-- gender insight 3: district-wise female petitioner %
-- purpose: identifies districts where more women approach courts
-- note: excludes unknown gender (-1)
-- =====================================================

select
    d.district_name,

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
    ) as female_petitioner_percentage

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name
order by female_petitioner_percentage desc;



-- =====================================================
-- gender insight: courts with lowest female petitioner %
-- purpose: identifies courts where women approach least
-- =====================================================

select
    concat(d.district_name, ' - court ', p.court_no) as court_name,

    sum(
        case
            when p.female_petitioner in (0,1) then 1
            else 0
        end
    ) as total_known_petitioners,

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
    ) as female_petitioner_percentage

from punjab_data p
join cases_district_key d
on p.dist_code = d.dist_code

group by d.district_name, p.dist_code, p.court_no

having total_known_petitioners >= 500

order by female_petitioner_percentage asc
limit 10;