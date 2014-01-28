DECLARE @output varchar(MAX), @count nvarchar(3)

PRINT 'CMM'

-- Price/Cost test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + CAST(CAST(Material AS bigint) AS varchar(55)) FROM
(SELECT DISTINCT Material FROM tbl_RawData_SS14_CMM WHERE CAST([SAP MSRP] AS float) <= 0 OR [SAP MSRP] IS NULL OR [SAP Base] IS NULL) AS x

SET @count = (SELECT COUNT(DISTINCT Material) FROM tbl_RawData_SS14_CMM WHERE CAST([SAP MSRP] AS float) <= 0 OR [SAP MSRP] IS NULL OR [SAP Base] IS NULL)

IF @count <> 0 BEGIN
	PRINT 'Failed Price/Cost test'
	PRINT '	There are ' + @count + ' styles missing a price or a cost:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Price/Cost test'
END
SET @output = NULL

-- One-off Simples test (Single row for a color-way on UPC list)
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT CAST(CAST(Material AS bigint) AS varchar(55)) + ' (' + [Long Description] + ' - ' + CAST(ColorCode AS varchar(255)) + ')' AS name FROM tbl_RawData_SS14_CMM
			  WHERE Size <> 'O/S'
			  GROUP BY [Long Description], Material, ColorCode
			  HAVING COUNT(*) = 1) AS x
			  
SET @count = (SELECT COUNT(*) FROM (SELECT [Long Description], Material, ColorCode
			 FROM tbl_RawData_SS14_CMM
			 WHERE Size <> 'O/S'
			 GROUP BY [Long Description], Material, ColorCode
			 HAVING COUNT(*) = 1) AS y)

IF @count <> 0 BEGIN
	PRINT 'Failed One-off skus test'
	PRINT '	There are ' + @count + ' one-off skus:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed One-off skus test'
END
SET @output = NULL

-- Duplicate SKUs test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + item FROM
(SELECT (CAST(SKU AS nvarchar(50)) + ' ' + CAST(CAST(UPC AS bigint) AS nvarchar(50))) AS item
 FROM tbl_RawData_SS14_CMM AS a WHERE (SELECT COUNT(*) FROM tbl_RawData_SS14_CMM WHERE SKU = a.SKU) > 1) AS x
 
IF @output <> '' BEGIN
	PRINT 'Failed Duplicate SKUs test'
	PRINT '	These SKUs are duplicates:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Duplicate SKUs test'
END