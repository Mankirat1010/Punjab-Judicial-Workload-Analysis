-- =====================================================
-- disposal insight: disposal reason percentage share
-- purpose: shows how most cases end (dismissed, settled, etc.)
-- =====================================================

select
    d.disp_name_s as disposal_reason,
    count(*) as total_cases,
    round(
        count(*) * 100.0 /
        sum(count(*)) over (),
        2
    ) as percentage_share
from punjab_data p
join disp_name_key d
on p.disp_name = d.disp_name
and p.year = d.year
where year(p.date_of_decision) != 0
group by d.disp_name_s
order by total_cases desc;




select count(*) from punjab_data where year(date_of_decision) = 0 and disp_name is not null;