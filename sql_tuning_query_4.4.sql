--Write a SQL Query to find the 10 ten authors publishing in journals and conferences whose titles contain the word 'data'.
--These will likely be some of the people at the cutting edge of datascience and data analytics.

WITH split_authors AS (
  SELECT
    UNNEST(STRING_TO_ARRAY(author, '::')) AS single_author,
    title,
    year,
    journal
  FROM articles
)
SELECT sa.single_author, 
		--sa.year, sa.journal, 
		--ip.title,
		count(distinct ip.title) as distinct_ip_articles_count, 
		count(distinct sa.title) as num_articles
FROM split_authors sa
JOIN inproceedings ip 
ON sa.single_author = ip.author and sa.year = ip.year
WHERE (UPPER(ip.title) LIKE '%DATA%') OR (UPPER(sa.journal) LIKE '%DATA%')
GROUP BY sa.single_author
ORDER BY num_articles DESC
LIMIT 10;
