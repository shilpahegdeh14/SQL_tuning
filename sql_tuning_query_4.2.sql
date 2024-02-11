-- Question 2: Accomplished Authors
-- Write a SQL query to find all the authors who published at least 10 PVLDB papers and at least 10 SIGMOD papers. 
EXPLAIN	ANALYZE
SELECT
        ip.author,
		--ip.title,
		--p.booktitle AS Conferences,
        COUNT(*) AS PaperCount
    FROM
        inproceedings ip
	JOIN proceedings p ON ip.booktitle = p.booktitle AND ip.year = p.year
    WHERE (ip.title LIKE '%VLDB%' OR ip.title LIKE '%SIGMOD%')
    GROUP BY
        ip.author
		--ip.title,
		--p.booktitle
	--HAVING
        --COUNT(*) >= 10;
		
SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    schemaname = 'public'
ORDER BY
    tablename,
    indexname;

DROP INDEX IF EXISTS idx_ip_booktitle, idx_ip_year, idx_proc_booktitle, idx_proc_year;

		



