/**
 * @category LiveOutThere.com
 * @package ETL/Merrell
 * @author Drew and Tyler Gillson <drew@liveoutthere.com>
**/

USE LOT_Inventory
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MER2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	CREATE TABLE [dbo].[tbl_RawData_S12_MER2](
		Brand [nvarchar](4000) NULL,
		Category [nvarchar](4000) NULL,
		[Grouping] [nvarchar](4000) NULL,
		Gender [nvarchar](4000) NULL,
		Model [nvarchar](4000) NULL,
		Color [nvarchar](4000) NULL,
		Material [nvarchar](4000) NULL,
		SKU [nvarchar](4000) NULL,
		IntroTechBullet [nvarchar](4000) NULL,
		UPC [nvarchar](4000) NULL,
		Sizes [nvarchar](4000) NULL,
		Wholesale [nvarchar](4000) NULL,
		SRetail [nvarchar](4000) NULL,
		SizeNotes [nvarchar](4000) NULL
	) ON [PRIMARY]
	
	TRUNCATE TABLE [dbo].[tbl_RawData_S12_MER2]

	INSERT INTO [dbo].[tbl_RawData_S12_MER2]
	SELECT * FROM OPENDATASOURCE( 'Microsoft.ACE.OLEDB.12.0', 'Data Source="C:\Data\Shared\ExcelSourceFiles\S12MerrellFootwear.xlsx"; Extended properties=Excel 12.0')...matches$
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MER2_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	CREATE TABLE [dbo].[tbl_RawData_S12_MER2_Additional](
		Style [nvarchar](1024) NULL,
		ProductName [nvarchar](1024) NULL,
		EnglishDescription [nvarchar](4000) NULL
	) ON [PRIMARY]

	INSERT INTO [dbo].[tbl_RawData_S12_MER2_Additional] (Style, ProductName, EnglishDescription)
	SELECT [S12 Merrell Price List], F2, F11 FROM OPENDATASOURCE( 'Microsoft.ACE.OLEDB.12.0', 'Data Source="C:\Data\Shared\ExcelSourceFiles\S12MerrellFootwear.xlsx"; Extended properties=Excel 12.0')...Sheet1$
	WHERE F11 IS NOT NULL --AND F12 <> '0' AND F12 <> 'French Description'
END

UPDATE a SET
	a.Color = b.Color
FROM  tbl_RawData_S12_MER_Photos AS a
INNER JOIN  tbl_RawData_S12_MER2 AS b
ON 'J' + a.Filename LIKE '%' + b.Material + '%'
WHERE a.Color IS NULL
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_MER2]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	DROP TABLE [dbo].[tbl_LoadFile_S12_MER2]
END

CREATE TABLE [dbo].[tbl_LoadFile_S12_MER2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_visibility]  DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[media_gallery] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_season]  DEFAULT (N'Spring/Summer 2012'),
	[short_description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[features] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[activities] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weather] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[layering] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[care_instructions] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fabric] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fit] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[volume] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_manufacturer]  DEFAULT ('Merrell'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_is_in_stock]  DEFAULT ((1)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hs_tariff] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[origin] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[us_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cs_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xre_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[stock_location] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MER2_stock_location]  DEFAULT ('Supplier'),
 CONSTRAINT [PK_tbl_LoadFile_S12_MER2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_MER2] ON [dbo].[tbl_LoadFile_S12_MER2] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

TRUNCATE TABLE tbl_LoadFile_S12_MER2

INSERT INTO tbl_LoadFile_S12_MER2 (
		sku,
		vendor_product_id,
		[name],
		gender,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		[type],
		[image],
		image_label
)
SELECT DISTINCT
		dbo.getMagentoSimpleSKU('MER', REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1), REPLACE(a.Color,'/',''), REPLACE(REPLACE(a.SKU,'M   ',''),'W   ','')) AS sku,
		REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1) AS vendor_product_id,
		a.Gender + ' ' + a.Model AS productname,
		REPLACE(a.Gender,'''s','') AS gender,
		a.Color AS choose_color,
		CASE WHEN LEFT(a.SKU, 5) = 'W   0' OR LEFT(a.SKU, 5) = 'M   0' THEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.SKU,'M   ',''),'W   ',''),'.5','½'),'.0',''),'0','') ELSE REPLACE(REPLACE(REPLACE(REPLACE(a.SKU,'M   ',''),'W   ',''),'.5','½'),'.0','') END AS choose_size,
		'' AS vendor_color_code,
		REPLACE(REPLACE(a.SKU,'M   ',''),'W   ','') AS vendor_size_code,
		(SELECT TOP 1 UPC FROM tbl_RawData_S12_MER2 WHERE Model = a.Model AND Color = a.Color AND SKU = a.SKU) AS vendor_sku,
		CAST(a.SRetail AS float) - 0.01 AS price,
		CAST(a.Wholesale AS float) AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM tbl_RawData_S12_MER_Photos WHERE Filename LIKE '%' + RIGHT(a.Material,5) + '%' ORDER BY Color DESC) AS image,
		(SELECT TOP 1 Color FROM tbl_RawData_S12_MER_Photos WHERE Filename LIKE '%' + RIGHT(a.Material,5) + '%' ORDER BY Color DESC) AS image_label
FROM tbl_RawData_S12_MER2 AS a
WHERE (SELECT TOP 1 Filename FROM tbl_RawData_S12_MER_Photos WHERE Filename LIKE '%' + RIGHT(a.Material,5) + '%' ORDER BY Color DESC) IS NOT NULL
GO

ALTER FUNCTION getMER2Features (
	@input nvarchar(4000)
)
RETURNS nvarchar(4000)
AS BEGIN
	DECLARE @short_description varchar(4000), @size_position int
	SET @short_description = LEFT(@input, CHARINDEX(CHAR(10),@input))
	
	SET @input = REPLACE(@input, @short_description, '')
	SET @input = REPLACE(@input, 'UPPER / LINING', '')
	SET @input = REPLACE(@input, 'UPPER/LINING', '')
	SET @input = REPLACE(@input, 'UPPER /LINING', '')
	SET @input = REPLACE(@input, 'MIDSOLE/OUTSOLE', '')
	SET @input = REPLACE(@input, 'MIDSOLE / OUTSOLE', '')
	
	SET @input = REPLACE(@input,'•','|')
	SET @input = REPLACE(@input,',','')
	
	SET @size_position = CHARINDEX('Women’s Sizes:',@input)
	IF @size_position = 0 BEGIN
		SET @size_position = CHARINDEX('Men’s Sizes:',@input)
	END
	
	IF @size_position <> 0 BEGIN
		SET @input = LEFT(@input, @size_position - 1)
	END
	
	RETURN @input
END
GO

INSERT INTO tbl_LoadFile_S12_MER2 (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	gender,
	price,
	cost,
	short_description,
	features,
	description,
	has_options,
	type,
	visibility
)
SELECT DISTINCT
		'MER' + '-' + REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1) AS sku,
		'choose_color,choose_size' AS config_attributes,
		REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1) AS vendor_product_id,
		'Footwear' AS categories,
		a.Gender + ' ' + a.Model AS productname,
		REPLACE(a.Gender,'''s','') AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_MER2 WHERE vendor_product_id = REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1)) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_MER2 WHERE vendor_product_id = REPLACE(a.Model,' ','') + '-' + LEFT(a.Gender,1)) AS cost,
		'' AS short_description,
		dbo.toHTMLEntities(dbo.getMER2Features(IntroTechBullet)) AS features,
		dbo.toHTMLEntities(LEFT(IntroTechBullet, CHARINDEX(CHAR(10),IntroTechBullet))) AS description,
		'1' AS has_options,
		'configurable' AS type,
		'Catalog, Search' AS visibility
FROM tbl_RawData_S12_MER2 AS a
ORDER BY a.Gender + ' ' + a.Model

DELETE FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND price IS NULL

UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_MER2 WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_MER2 WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	simples_skus = dbo.getMERAssociatedProducts(a.vendor_product_id),
	url_key = LOWER(manufacturer) + '-' + LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name,'Women''s ',''),'Men''s ',''),' ','-'),'''',''),'/',''))
FROM tbl_LoadFile_S12_MER2 AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getMERMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_S12_MER2 AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_MER2 SET small_image = image, thumbnail = image WHERE image IS NOT NULL





/**
 * Almost done! Now we have to do some sanity checks and run some tests. The following routines all check
 * for data consistency and accuracy before we output to CSV and upload to Magento.
**/

DECLARE @output varchar(MAX), @count nvarchar(3)

-- Categories test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND categories IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND categories IS NULL)

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
(SELECT DISTINCT sku FROM tbl_LoadFile_S12_MER2 AS a WHERE (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE sku = a.sku) > 1) AS x

SET @count = (SELECT COUNT(DISTINCT sku) FROM tbl_LoadFile_S12_MER2 AS a WHERE (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE sku = a.sku) > 1)

IF @count <> 0 BEGIN
	PRINT 'Failed Duplicate SKUs test'
	PRINT '	There are ' + @count + ' styles with duplicate SKUs:'
	PRINT '		' + @output
END
ELSE BEGIN
	PRINT 'Passed Duplicate SKUs test'
END
SET @output = NULL
	
-- Associated Simple/Configurables test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + sku FROM
(SELECT a.sku AS sku FROM tbl_LoadFile_S12_MER2 AS a LEFT JOIN tbl_LoadFile_S12_MER2 AS b
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
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL)) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL))

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
(SELECT vendor_product_id FROM tbl_LoadFile_S12_MER2 WHERE CAST(price AS float) <= 0 OR price IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE CAST(price AS float) <= 0 OR price IS NULL)

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
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND (short_description IS NULL OR short_description = '')) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND (short_description IS NULL OR short_description = ''))

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
(SELECT name FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%') AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_MER2 WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%')

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
(SELECT DISTINCT vendor_product_id + '-' + vendor_color_code  + ' (' + choose_color + ')' AS name FROM tbl_LoadFile_S12_MER2 WHERE type = 'simple' AND (image = '' OR image IS NULL)) AS x

SET @count = (SELECT COUNT(DISTINCT vendor_product_id + ' ' + choose_color) FROM tbl_LoadFile_S12_MER2 WHERE type = 'simple' AND (image = '' OR image IS NULL))

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

-- Missing Photo Files test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + image FROM
(SELECT DISTINCT image FROM tbl_LoadFile_S12_MER2 AS a LEFT JOIN tbl_RawData_S12_MER_Photos AS b ON a.image = b.filename WHERE b.filename IS NULL AND type = 'simple') AS x

SET @count = (SELECT COUNT(DISTINCT image) FROM tbl_LoadFile_S12_MER2 AS a LEFT JOIN tbl_RawData_S12_MER_Photos AS b ON a.image = b.filename WHERE b.filename IS NULL AND type = 'simple')

IF @count <> 0 BEGIN
	PRINT 'Failed Missing Photo Files test'
	PRINT '	There are ' + @count + ' image filenames referenced that we don''t have the files for:'
	PRINT '		' + @output
	SET @output = ''
END
ELSE BEGIN
	PRINT 'Passed Missing Photo Files test'
END
SET @output = NULL
GO

UPDATE tbl_LoadFile_S12_MER2 SET description = REPLACE(description, CHAR(10), ''), features = REPLACE(features, CHAR(10), '') WHERE type = 'configurable' AND features LIKE '%' + CHAR(10) + '%'
UPDATE tbl_LoadFile_S12_MER2 SET stock_location = '' WHERE type = 'configurable'

DROP VIEW [dbo].[view_LoadFile_S12_MER2]
GO

CREATE VIEW [dbo].[view_LoadFile_S12_MER2]
AS
SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"super_attribute_pricing"' AS super_attribute_pricing, '"videos"' AS videos, '"hs_tariff_id"' AS hs_tariff_id, '"origin"' AS origin, '"weight"' AS weight, '"us_skus"' AS us_skus, '"cs_skus"' AS cs_skus, '"xre_skus"' AS xre_skus, '"stock_location"' AS stock_location
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE('+' + a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE('+' + a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE('+' + a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.stock_location,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_S12_MER2 AS a
GO

/**
 * Finally, we export our load file view to a CSV file using the BCP utility. Unfortunately BCP (at least the SQL Server 2008 verison)
 * does not output UTF-8, so you then need to open helly-hansen-spring-2012.csv in a text editor and re-save it with UTF-8 encoding
 * prior to using the file with MAGMI. MAGMI requires UTF-8.
**/

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_S12_MER2" queryout "C:\Data\Shared\SQL\merrell-footwear-S12.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql
