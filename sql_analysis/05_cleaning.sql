SELECT date_of_filing, date_of_decision
FROM punjab_data
LIMIT 10;

-- this is all clean and in limits...
SELECT MIN(date_of_filing), MAX(date_of_filing)
FROM punjab_data;

-- unclean, values outside limits...
SELECT MIN(date_of_decision), MAX(date_of_decision)
FROM punjab_data;

-- 1,03,899 such rows... 
SELECT COUNT(*)
FROM punjab_data
WHERE YEAR(date_of_decision) > 2018;

-- deleting all corrupt rows...
DELETE FROM punjab_data
WHERE YEAR(date_of_decision) > 2018;


-- deleting all judges that joined after ->  31 December, 2018
-- there are total only 4,000 such judges out of 1,00,000 judges.. 
DELETE FROM judges
WHERE start_date > '2018-12-31';

-- deleting all judges that has left before ->  01 January, 2010
-- there are such 2500 approx judges.. so remove them..
delete from judges 
where end_date between '1900-01-01' and '2010-01-01';

-- cleaning judges table.. 
-- female_judge column has values like ->  | 0 nonfemale | 1 female | -99988 unclear |
-- let's update corresponding values to -> |     0       |     1    |      -1        |
update judges
set female_judge = '0'
where female_judge = '0 nonfemale';

update judges
set female_judge = '1'
where female_judge = '1 female';

update judges
set female_judge = '-1'
where female_judge like '-9998%';

select * from judges;


-- in punjab_data, female_defendant...
update punjab_data
set female_defendant = '0'
where female_defendant like '0%';

update punjab_data
set female_defendant = '1'
where female_defendant like '1%';

update punjab_data
set female_defendant = '-1'
where female_defendant in ('-9999', '-9998', '-99999', '-9998 unclear', '-9999 missing name');

-- in punjab_data, female_petitioner...
update punjab_data
set female_petitioner = '0'
where female_petitioner like '0%';

update punjab_data
set female_petitioner = '1'
where female_petitioner like '1%';

update punjab_data
set female_petitioner = '-1'
where female_petitioner in ('-9999', '-9998', '-99999', '-9998 unclear', '-9999 missing name');

-- in punjab_data, female_adv_def...
update punjab_data
set female_adv_def = '0'
where female_adv_def like '0%';

update punjab_data
set female_adv_def = '1'
where female_adv_def like '1%';

update punjab_data
set female_adv_def = '-1'
where female_adv_def in ('-9999', '-9998', '-99999');

-- in punjab_data, female_adv_pet...
update punjab_data
set female_adv_pet = '0'
where female_adv_pet like '0%';

update punjab_data
set female_adv_pet = '1'
where female_adv_pet like '1%';

update punjab_data
set female_adv_pet = '-1'
where female_adv_pet in ('-9999', '-9998');

select * from punjab_data;

