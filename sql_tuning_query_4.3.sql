--Question 3: Write a SQL query to find the total number of conference publications for each decade,
--starting from 1970 and ending in 2019. For instance, to find the total papers from the 1970s, 
--you would sum the totals from 1970, 1971, 1972, 1978, upto1979. Please do this for the decades 1970,1980,1990,2000,and2010. 
--Hint: You may want to create a temporary table with all the distinct years.

-- A temporary table with distinct years
CREATE TEMPORARY TABLE DistinctYears AS
SELECT DISTINCT year
FROM inproceedings;

-- Query to find the total number of conference publications for each decade
SELECT
    CONCAT(
        (FLOOR(CAST(dy.year AS INTEGER) / 10) * 10),
        '-',
        (FLOOR(CAST(dy.year AS INTEGER) / 10) * 10 + 9)
    ) AS decade_range,
    COUNT(*) AS total_publications
FROM DistinctYears dy
JOIN inproceedings ip ON dy.year = ip.year
WHERE ip.year BETWEEN '1970' AND '2019'


GROUP BY decade_range
ORDER BY decade_range;

