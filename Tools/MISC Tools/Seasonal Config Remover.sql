IF OBJECT_ID('tempdb...#sku_fix') IS NOT NULL BEGIN
	DROP TABLE #sku_fix
END

SELECT sku AS old_sku, SUBSTRING(sku,CHARINDEX('-',sku) + 1,LEN(sku)) AS new_sku INTO #sku_fix FROM OPENQUERY(MAGENTO,'
SELECT sku 
FROM catalog_product_entity
WHERE type_id = ''configurable'' AND (LENGTH(sku) - LENGTH(REPLACE(sku,''-'',''''))) > 1 AND LEFT(sku,4) <> ''MER-''
')

DECLARE @old_sku nvarchar(255), @new_sku nvarchar(255)

DECLARE sku_fix_sql CURSOR FOR
SELECT DISTINCT old_sku, new_sku FROM #sku_fix
 
OPEN sku_fix_sql

FETCH NEXT FROM sku_fix_sql INTO @old_sku, @new_sku
 
WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE @output nvarchar(4000)
	
	SET @output = 'UPDATE catalog_product_entity SET sku = ''' + @new_sku + ''' WHERE sku = ''' + @old_sku + ''''
	
	PRINT @output
		
	FETCH NEXT FROM sku_fix_sql INTO @old_sku, @new_sku
END
 
CLOSE sku_fix_sql
DEALLOCATE sku_fix_sql
GO

SELECT new_sku, '' AS season_id FROM #sku_fix