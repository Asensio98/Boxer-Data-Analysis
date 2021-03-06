-- BOXER DATA ANALYSIS--

/* Skills used : orderby,groupby,aggregate, aliasing,case */


-- OVERVIEW OF THE WHOLE DATA--
SELECT 
    *
FROM
    boxer_table;

-- SHOW AGGREGATES OF COLUMS FROM THE TABLE--
SELECT 
    COUNT(WEIGHT) AS WEIGHT,
    COUNT(COUNTRY) AS COUNTRY,
    COUNT(ACTION) AS ACTION,
    COUNT(BOXER) AS BOXER,
    COUNT(TRAINER) AS TRAINER
FROM
    BOXER_TABLE;

-- NUMBER OF BOXERS THAT ARE MALE--
SELECT DISTINCT
    (COUNT(BOXER)) AS MALE_BOXER
FROM
    BOXER_TABLE
WHERE
    SEX = 'MALE';

-- SELECTING MALE BOXERS,WITH THEIR COUNTRIES AND RESPECTIVE WEIGHT--
SELECT 
    boxer, country, weight
FROM
    boxer_table
WHERE
    SEX = 'MALE'
ORDER BY weight DESC;

-- NUMBER OF BOXERS THAT ARE FEMALE --
SELECT DISTINCT
    (COUNT(BOXER)) AS FEMALE_BOXER
FROM
    BOXER_TABLE
WHERE
    SEX = 'FEMALE';

-- SELECTING FEMALE BOXERS WITH THEIR COUNTRIES AND WEIGHT--
SELECT 
    boxer, country, weight
FROM
    boxer_table
WHERE
    SEX = 'FEMALE'
ORDER BY weight DESC;

-- FINDING TOTAL NUMBER OF TRAINERS PER COUNTRY--
SELECT 
    country, COUNT(trainer) AS Trainers
FROM
    Boxer_Table
GROUP BY country
ORDER BY trainers DESC;

-- FINDING NUMBER OF BOXERS PER COUNTRY--
SELECT 
    country, COUNT(BOXER) AS BOXERS
FROM
    Boxer_Table
GROUP BY country
ORDER BY BOXERS DESC;

-- Finding boxer with top ceiling--
SELECT 
    BOXER, MAX(CEILING) AS TOPCELLING
FROM
    Boxer_Table
GROUP BY BOXER
ORDER BY TOPCELLING DESC;

-- Finding boxer with top action --
SELECT 
    BOXER, MAX(ACTION) AS TOPACTION
FROM
    Boxer_Table
GROUP BY BOXER
ORDER BY TOPACTION DESC;

-- categorize each boxer by weight --

select boxer ,
case
 when weight >= 175 then 'heavyweight'
 when weight >= 160 THEN 'middleweight'
 when weight >= 135 then 'lightweight'
else 'minimumweight'
end as Weight_category
FROM boxer_table;
-- END--