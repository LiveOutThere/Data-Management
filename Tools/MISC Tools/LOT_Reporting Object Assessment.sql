SELECT DISTINCT MAX(REPLACE(CAST(b.TextData AS nvarchar(MAX)),'dbo.','')) AS kili, MAX(CAST(b.StartTime AS date)) AS called, a.name, a.type_desc
FROM LOT_Reporting.sys.objects AS a
FULL JOIN tbl_Kili_Trace AS b
ON a.name = REPLACE(CAST(b.TextData AS nvarchar(MAX)),'dbo.','')
WHERE a.name IS NOT NULL AND LEFT(a.name,3) <> 'sp_' AND LEFT(a.name,6) <> 'sproc_' AND a.type IN('V','P')
GROUP BY a.name, a.type_desc
