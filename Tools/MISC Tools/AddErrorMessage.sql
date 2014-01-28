DECLARE @msgnum int, @severity smallint, @msgtext nvarchar(255)

SET @msgnum = 50001
SET @severity = 9
SET @msgtext = 'ERROR!!! You need to eliminate duplicate associated simples!'

EXEC sp_addmessage @msgnum,@severity,@msgtext

--SELECT * FROM sys.messages