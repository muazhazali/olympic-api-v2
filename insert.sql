-- Table: public.temp_olympic_athlete_biography

-- DROP TABLE IF EXISTS public.temp_olympic_athlete_biography;

CREATE TABLE IF NOT EXISTS public.temp_olympic_athlete_biography
(
    athlete_id text COLLATE pg_catalog."default",
    name text COLLATE pg_catalog."default",
    sex text COLLATE pg_catalog."default",
    born text COLLATE pg_catalog."default",
    height text COLLATE pg_catalog."default",
    weight text COLLATE pg_catalog."default",
    country text COLLATE pg_catalog."default",
    country_noc text COLLATE pg_catalog."default",
    description text COLLATE pg_catalog."default",
    special_notes text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.temp_olympic_athlete_biography
OWNER to postgres;

-- insert data into temp_olympic_athlete_biography
INSERT INTO public.olympic_athlete_biography (athlete_id, name, sex, born, height, weight, country, country_noc, description, special_notes)
SELECT 
    athlete_id, 
    name, 
    sex, 
    CASE
        WHEN born ~ '^\d{2}/\d{2}/\d{4}$' THEN to_date(born, 'DD/MM/YYYY')  -- Matches DD/MM/YYYY
        WHEN born ~ '^\d{4}-\d{2}-\d{2}$' THEN to_date(born, 'YYYY-MM-DD')  -- Matches YYYY-MM-DD
        ELSE NULL  -- Handle invalid or unexpected formats
    END AS born,
    height, 
    weight, 
    country, 
    country_noc, 
    description, 
    special_notes
FROM temp_olympic_athlete_biography
WHERE born ~ '^\d{2}/\d{2}/\d{4}$' OR born ~ '^\d{4}-\d{2}-\d{2}$';  -- Optional: Filter out invalid rows