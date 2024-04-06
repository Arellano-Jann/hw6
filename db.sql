CREATE TABLE measure_unit (
    measure_unit_id INTEGER NOT NULL PRIMARY KEY,
    name CHAR(255)
);
CREATE TABLE food_update_log_entry (
    fdc_id INTEGER PRIMARY KEY,
    description CHAR(255),
    last_updated DATE
);
CREATE TABLE nutrient (
    nutrient_id INTEGER NOT NULL PRIMARY KEY,
    name CHAR(255),
    unit_name CHAR(255),
    nutrient_nbr CHAR(255),
    rank CHAR(255)
);
CREATE TABLE food_portion (
    id INTEGER NOT NULL PRIMARY KEY,
    fdc_id INTEGER NOT NULL,
    seq_num CHAR(255),
    amount FLOAT,
    measure_unit_id INTEGER NOT NULL,
    portion_description CHAR(255),
    modifier CHAR(255),
    gram_weight FLOAT,
    data_points CHAR(255),
    footnote CHAR(255),
    min_year_acquired CHAR(255),
    FOREIGN KEY (fdc_id) REFERENCES food_update_log_entry(fdc_id),
    FOREIGN KEY (measure_unit_id) REFERENCES measure_unit(measure_unit_id)
);
CREATE TABLE food_nutrient (
    id INTEGER NOT NULL PRIMARY KEY,
    fdc_id INTEGER NOT NULL,
    nutrient_id INTEGER NOT NULL,
    amount CHAR(255),
    data_points CHAR(255),
    derivation_id CHAR(255),
    min CHAR(255),
    max CHAR(255),
    median CHAR(255),
    footnote CHAR(255),
    min_year_acquired CHAR(255),
    FOREIGN KEY (fdc_id) REFERENCES food_update_log_entry(fdc_id),
    FOREIGN KEY (nutrient_id) REFERENCES nutrient(nutrient_id)
);
CREATE TABLE entry (
    user_id INTEGER PRIMARY KEY,
    fdc_id INTEGER NOT NULL,
    name CHAR(255),
    date DATE,
    FOREIGN KEY (fdc_id) REFERENCES food_update_log_entry(fdc_id)
);