DECLARE @category varchar(max)
CREATE TABLE #tmpCategory (category varchar(max))
DECLARE c CURSOR FOR SELECT DISTINCT categories FROM tbl_FW13_Final_Categorization
OPEN c
FETCH NEXT FROM c INTO @category
WHILE @@FETCH_STATUS = 0 BEGIN
	INSERT INTO #tmpCategory (category)
	SELECT s FROM dbo.Split(';',@category) WHERE s != ''
	FETCH NEXT FROM c INTO @category
END
CLOSE c
DEALLOCATE c

SELECT DISTINCT category FROM #tmpCategory
DROP TABLE #tmpCategory