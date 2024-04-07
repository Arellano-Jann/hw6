\COPY food_update_log_entry FROM './food_update_log_entry.csv' DELIMITER ',' CSV HEADER;

\COPY measure_unit FROM './measure_unit.csv' DELIMITER ',' CSV HEADER;

\COPY food_portion FROM './food_portion.csv' DELIMITER ',' CSV HEADER;

\COPY food_nutrient FROM './food_nutrient.csv' DELIMITER ',' CSV HEADER;

\COPY nutrient FROM './nutrient.csv' DELIMITER ',' CSV HEADER;