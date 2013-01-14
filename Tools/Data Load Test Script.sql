DECLARE @output varchar(MAX), @count nvarchar(3)

PRINT 'Merrell'

-- Categories test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND categories IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND categories IS NULL)

IF @count <> 0 BEGIN
	PRINT 'Failed Categories test'
	PRINT '	There are ' + @count + ' styles missing categories:'
	PRINT '		' + @output
END
ELSE BEGIN
	PRINT 'Passed Categories test'
END
SET @output = NULL

-- Duplicate SKUs test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + sku FROM
(SELECT a.sku AS sku FROM tbl_LoadFile_F12_MER AS a INNER JOIN tbl_LoadFile_F12_MER AS b
 ON a.sku = b.sku
 WHERE a.id <> b.id) AS x
 
IF @output <> '' BEGIN
	PRINT 'Failed Duplicate SKUs test'
	PRINT '	These SKUs are duplicates:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Duplicate SKUs test'
END

/* Alterate (better) method of finding duplicates:
   SELECT sku FROM
   tbl_LoadFile_F12_MER AS a
   WHERE (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE sku = a.sku) > 1 */
	
-- Associated Simple/Configurables test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + sku FROM
(SELECT a.sku AS sku FROM tbl_LoadFile_F12_MER AS a LEFT JOIN tbl_LoadFile_F12_MER AS b
 ON b.type = 'configurable' AND b.simples_skus LIKE '%' + a.sku + '%'
 WHERE a.type = 'simple' AND b.sku IS NULL) AS x
 
IF @output <> '' BEGIN
	PRINT 'Failed Associated Simple/Configurables test'
	PRINT '	These SKUs are not associated to configurables:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Associated Simple/Configurables test'
END

-- Configurable Images test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL)) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL))

IF @count <> 0 BEGIN
	PRINT 'Failed Configurable Images test'
	PRINT '	There are ' + @count + ' styles missing a default image or image label:'
	PRINT '		' + @output
END
ELSE BEGIN
	PRINT 'Passed Configurable Images test'
END
SET @output = NULL

-- Prices test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + vendor_product_id FROM
(SELECT vendor_product_id FROM tbl_LoadFile_F12_MER WHERE CAST(price AS float) <= 0 OR price IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE CAST(price AS float) <= 0 OR price IS NULL)

IF @count <> 0 BEGIN
	PRINT 'Failed Prices test'
	PRINT '	There are ' + @count + ' styles missing a price:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Prices test'
END
SET @output = NULL

-- Descriptions test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND (short_description IS NULL OR short_description = '')) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND (short_description IS NULL OR short_description = ''))

IF @count <> 0 BEGIN
	PRINT 'Failed Descriptions test'
	PRINT '	There are ' + @count + ' styles missing a short description:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Descriptions test'
END
SET @output = NULL

-- Media Gallery test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%') AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_F12_MER WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%')

IF @count <> 0 BEGIN
	PRINT 'Failed Media Gallery formatting test'
	PRINT '	There are ' + @count + ' configurable styles that have the image included in the media gallery:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Media Gallery test'
END
SET @output = NULL

-- Simples Without Photos test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT DISTINCT vendor_product_id + '-' + vendor_color_code  + ' (' + choose_color + ')' AS name FROM tbl_LoadFile_F12_MER WHERE type = 'simple' AND (image = '' OR image IS NULL)) AS x

SET @count = (SELECT COUNT(DISTINCT vendor_product_id + ' ' + choose_color) FROM tbl_LoadFile_F12_MER WHERE type = 'simple' AND (image = '' OR image IS NULL))

IF @count <> 0 BEGIN
	PRINT 'Failed Simples Without Photos test'
	PRINT '	There are ' + @count + ' simple products that don''t have images:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Simples Without Photos test'
END
SET @output = NULL