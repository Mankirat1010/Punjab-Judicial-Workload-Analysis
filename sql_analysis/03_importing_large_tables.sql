LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/Projects/Judicial_DA/processed/export/type_name_key_cleaned.csv'
INTO TABLE type_name_key
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/Projects/Judicial_DA/processed/export/purpose_name_key_cleaned.csv'
INTO TABLE purpose_name_key
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/Projects/Judicial_DA/processed/export/judges_cleaned.csv'
INTO TABLE judges
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/Projects/Judicial_DA/processed/export/judge_case_merge_key_cleaned.csv'
INTO TABLE judge_case_merge_key
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;



LOAD DATA LOCAL INFILE 'C:/Users/HP/OneDrive/Desktop/Projects/Judicial_DA/processed/export/Punjab_Data_Cleaned.csv'
INTO TABLE punjab_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@dummy, ddl_case_id, year, state_code, dist_code, court_no, cino,
 judge_position, female_defendant, female_petitioner, female_adv_def,
 female_adv_pet, type_name, purpose_name, disp_name,
 date_of_filing, date_of_decision, date_first_list, date_last_list);




