-- Create temp table that houses the distinct color names, as well as a column for the brand value
SELECT DISTINCT choose_color INTO #colors FROM view_Join_FW13_Loadfiles WHERE type = 'simple' AND manufacturer = 'Icebreaker'
	ALTER TABLE #colors
	ADD manufacturer nvarchar(255)
UPDATE #colors SET manufacturer = 'Icebreaker'

-- Query the temp table with reference to the loadfiles table in order to pull up example image filenames for each color
SELECT DISTINCT a.choose_color, MAX(b.image) AS filename
FROM #colors AS a
LEFT JOIN tbl_LoadFile_FW13_IB AS b
ON a.choose_color = b.choose_color AND a.manufacturer COLLATE SQL_Latin1_General_CP1_CI_AS = b.manufacturer COLLATE SQL_Latin1_General_CP1_CI_AS
GROUP BY a.choose_color
HAVING MAX(b.image) IS NOT NULL
ORDER BY a.choose_color

-- Useful lines for troubleshooting / investigation
DROP TABLE #colors
SELECT DISTINCT choose_color FROM view_Join_FW13_Loadfiles WHERE type = 'simple' AND manufacturer = 'Icebreaker' ORDER BY choose_color
SELECT * FROM view_Join_FW13_Loadfiles WHERE manufacturer = 'Icebreaker' AND choose_color = 'Big Sky'