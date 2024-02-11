--Question 4.5 Highly Published June Conferences 
--Write a SQL query to find the names of all conferences, happening in 2017, 
--where the proceedings contain more than 100 publications.

SELECT 
		p.title AS conference_title,  
		p.year AS conf_year,
		p.publisher,
		COUNT(*) AS total_publications
FROM proceedings p
JOIN inproceedings ip ON p.booktitle = ip.booktitle AND p.year = ip.year
WHERE p.year = '2017'
GROUP BY p.title, p.year, p.publisher
HAVING COUNT(*) > 100
ORDER BY total_publications DESC;


