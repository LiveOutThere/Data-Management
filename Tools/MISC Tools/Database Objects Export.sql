DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT name, type_desc FROM LOT_Reporting.sys.objects WHERE type NOT IN(''S'',''L'',''PK'',''IT'',''D'',''UQ'',''SQ'',''TT'',''TR'') ORDER BY type_desc" queryout "C:\Data\Shared\LOT_Reporting.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql