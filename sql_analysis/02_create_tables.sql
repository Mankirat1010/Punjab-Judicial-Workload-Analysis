CREATE TABLE punjab_data (
    ddl_case_id VARCHAR(50),
    year INT,
    state_code INT,
    dist_code INT,
    court_no INT,
    cino VARCHAR(100),
    judge_position VARCHAR(150) NULL,
    female_defendant VARCHAR(20) NULL,
    female_petitioner VARCHAR(20) NULL,
    female_adv_def INT NULL,
    female_adv_pet INT NULL,
    type_name INT NULL,
    purpose_name INT NULL,
    disp_name INT NULL,
    date_of_filing DATE,
    date_of_decision DATE NULL,
    date_first_list DATE NULL,
    date_last_list DATE NULL
);

CREATE TABLE cases_court_key (
    year INT,
    state_code INT,
    state_name VARCHAR(100),
    district_name VARCHAR(100),
    dist_code INT,
    court_no INT,
    court_name VARCHAR(255)
);

CREATE TABLE cases_district_key (
    year INT,
    state_code INT,
    state_name VARCHAR(100),
    dist_code INT,
    district_name VARCHAR(100)
);

CREATE TABLE cases_state_key (
    year INT,
    state_code INT,
    state_name VARCHAR(100)
);

CREATE TABLE disp_name_key (
    year INT,
    disp_name INT,
    disp_name_s VARCHAR(100)
);

CREATE TABLE purpose_name_key (
    year INT,
    purpose_name INT NULL,
    purpose_name_s VARCHAR(255) NULL
);

CREATE TABLE type_name_key (
    year INT,
    type_name INT,
    type_name_s VARCHAR(255)
);

CREATE TABLE judge_case_merge_key (
    ddl_case_id VARCHAR(50),
    ddl_filing_judge_id BIGINT NULL,
    ddl_decision_judge_id BIGINT NULL,
    PRIMARY KEY (ddl_case_id)
);

CREATE TABLE judges (
    ddl_judge_id BIGINT,
    state_code INT,
    dist_code INT,
    court_no INT,
    judge_position VARCHAR(100) NULL,
    female_judge VARCHAR(20),
    start_date DATE,
    end_date DATE NULL,
    PRIMARY KEY (ddl_judge_id)
);




