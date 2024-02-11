-- Question 1: Highly Literate 2018 Conferences
-- Write a SQL Query to find all the conferences held in 2018 that have published at least 200 papers in a single decade. 
-- Please note,conferences may be annual conferences,such as KDD.(need month column to work on the query)
-- Each year a different number of conferences are held.You should list conferences multiple times if theyappearinmultipleyears.	
WITH ConferencePapers AS (
    SELECT
        p.booktitle AS conference_title,
        p.year AS conference_year,
        COUNT(ip.title) AS paperCount
    FROM
        proceedings p
    JOIN
        inproceedings ip ON p.booktitle = ip.booktitle AND p.year = ip.year
    WHERE
        ip.year = '2018'
    GROUP BY
        p.booktitle, p.year
)
SELECT
    conference_title,
    conference_year, 
	paperCount
FROM
    ConferencePapers
WHERE
    paperCount >= 200
	LIMIT 100;


	

	
	
	
	
	
	
	








 



