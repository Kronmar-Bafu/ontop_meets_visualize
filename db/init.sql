
-- Create a table
CREATE TABLE co2data (
    jahr INTEGER,
    energietraeger text,
    gerundet FLOAT
);

-- Only after creating database and table:
COPY co2data (jahr, energietraeger, gerundet)
FROM '/docker-entrypoint-initdb.d/data.csv'
DELIMITER ','
CSV HEADER;


-- Create a second table for metadata cube
CREATE TABLE cube_table (
    identifier text,
    name_de text,
    name_fr text,
    name_it text,
    name_en text,
    descriptions text
);

COPY cube_table(identifier,name_de,name_fr,name_it,name_en,descriptions)
FROM '/docker-entrypoint-initdb.d/cube.csv'
DELIMITER ','
CSV HEADER;

-- -- Create a third table for metadata shape
-- CREATE TABLE shape_table (
--     id INTEGER,
--     name_de text,
--     name_fr text,
--     name_it text,
--     name_en text,
--     descriptions text,
--     predicate_path text,
--     dim_type text,
--     data_type text
-- );

-- COPY shape_table(id, name_de, name_fr, name_it, name_en, descriptions, predicate_path, dim_type, data_type)
-- FROM '/docker-entrypoint-initdb.d/shape.csv'
-- DELIMITER ','
-- CSV HEADER;