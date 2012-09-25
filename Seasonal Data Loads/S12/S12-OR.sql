USE LOT_Inventory
GO
/*
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OR_Additional]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	CREATE TABLE [dbo].[tbl_RawData_S12_OR_Additional](
		sku [nvarchar](1024) NULL,
		fall_11 [nvarchar](1024) NULL,
		spring_12 [nvarchar](1024) NULL,
		name [nvarchar](1024) NULL,
		short_description [nvarchar](1024) NULL,
		description [nvarchar](1024) NULL,
		features [nvarchar](1024) NULL,
		weight_oz [nvarchar](1024) NULL,
		weight_grams [nvarchar](1024) NULL,
		weight_text [nvarchar](1024) NULL,
		dimensions_inches [nvarchar](1024) NULL,
		dimensions_cm [nvarchar](1024) NULL
	) ON [PRIMARY]
	
	TRUNCATE TABLE [dbo].[tbl_RawData_S12_OR_Additional]

	INSERT INTO [dbo].[tbl_RawData_S12_OR_Additional]
	SELECT * FROM OPENDATASOURCE( 'Microsoft.ACE.OLEDB.12.0', 'Data Source="C:\Data\Shared\ExcelSourceFiles\Outdoor Research Spring 12 Copy FINAL.xlsx"; Extended properties=Excel 12.0')...Sheet1$

	DELETE  FROM  tbl_RawData_S12_OR_Additional WHERE sku IS NULL
END


IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OR]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	CREATE TABLE [dbo].[tbl_RawData_S12_OR](
		upc [nvarchar](1024) NULL,
		sku [nvarchar](1024) NULL,
		style_color [nvarchar](1024) NULL,
		category [nvarchar](1024) NULL,
		style [nvarchar](1024) NULL,
		description [nvarchar](1024) NULL,
		color [nvarchar](1024) NULL,
		size [nvarchar](1024) NULL,
		price [nvarchar](1024) NULL,
		retail [nvarchar](1024) NULL,	
	) ON [PRIMARY]
	
	TRUNCATE TABLE [dbo].[tbl_RawData_S12_OR]

	INSERT INTO [dbo].[tbl_RawData_S12_OR]
	SELECT * FROM OPENDATASOURCE( 'Microsoft.ACE.OLEDB.12.0', 'Data Source="C:\Data\Shared\ExcelSourceFiles\S12_UPC_CA.xls"; Extended properties=Excel 12.0')...Sheet1$

END

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_OR]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	DROP TABLE [dbo].[tbl_LoadFile_S12_OR]
END

CREATE TABLE [dbo].[tbl_LoadFile_S12_OR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_manufacturer]  DEFAULT ('Outdoor Research'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_is_in_stock]  DEFAULT ((0)),
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
	[stock_location] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_stock_location]  DEFAULT (('Unavailable'))
 CONSTRAINT [PK_tbl_LoadFile_S12] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12] ON [dbo].[tbl_LoadFile_S12_OR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OR_Photos]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) BEGIN
	CREATE TABLE [dbo].[tbl_RawData_S12_OR_Photos] (
		[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
END
GO

UPDATE a SET
	a.Color = dbo.ProperCase(RIGHT(b.Color,LEN(b.Color)-4))
FROM  tbl_RawData_S12_OR_Photos AS a
INNER JOIN  tbl_RawData_S12_OR AS b
ON a.Filename LIKE '%' + b.Style + '%' + LEFT(b.Color,3) + '%'
WHERE a.Color IS NULL
GO

DROP FUNCTION getORProductName
GO

CREATE FUNCTION dbo.getORProductName (
	@input nvarchar(128)
) RETURNS nvarchar(128)
BEGIN
	RETURN CASE WHEN @input LIKE '%Women%' THEN 'Women''s ' + dbo.ProperCase(LEFT(@input,CHARINDEX(',',@input)-1)) WHEN @input LIKE '%Men%' THEN 'Men''s ' + dbo.ProperCase(LEFT(@input,CHARINDEX(',',@input)-1)) WHEN @input LIKE '%Kid%' THEN 'Kids'' ' + dbo.ProperCase(LEFT(@input,CHARINDEX(',',@input)-1)) ELSE dbo.ProperCase(@input) END
END
GO

DROP FUNCTION getORAssociatedProducts
GO

CREATE FUNCTION [dbo].[getORAssociatedProducts] 
(
	@productid varchar(255)
)
RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @output nvarchar(4000)

	(SELECT @output = COALESCE(@output + ',', '') + sku FROM
	(SELECT sku AS sku
		FROM tbl_LoadFile_S12_OR WHERE (vendor_product_id = @productid) AND type = 'simple' AND image IS NOT NULL)
	 AS x)
	
	RETURN @output
END
GO

DROP FUNCTION getORMediaGallery
GO

CREATE FUNCTION [dbo].[getORMediaGallery] 
(
	@productid nvarchar(4000)
)
RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @output nvarchar(4000)
	
	(SELECT @output = COALESCE(@output + ';', '') + Photo FROM
	(SELECT DISTINCT image + CASE WHEN image_label IS NOT NULL THEN '::' + image_label ELSE '' END AS Photo FROM tbl_LoadFile_S12_OR WHERE type = 'simple' AND vendor_product_id = @productid AND image IS NOT NULL AND image <> (SELECT TOP 1 image FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND vendor_product_id = @productid)) AS x)
	 	
	RETURN @output

END
GO

INSERT INTO tbl_LoadFile_S12_OR
(
	store,
	websites,
	status, 
	tax_class_id,
	type,
	sku,
	department,
	has_options,
	visibility,
	vendor_sku,
	vendor_product_id,
	name,
	weight,
	vendor_color_code,
	choose_size,
	vendor_size_code,
	choose_color,
	cost,
	price,
	image,
	image_label,
	url_key
)
SELECT DISTINCT
		'admin'																as store,
		'base'																as websites,
		'Enabled'															as status, 
		'Taxable Goods'														as tax_class_id,
		'simple'															as type,
		'OR-' + style + '-' + LEFT(color,3) + '-' + size 					as sku,
		CASE WHEN description LIKE '%Women%' THEN 'Women' WHEN description LIKE '%Men%' THEN 'Men' WHEN description LIKE '%Kid%' THEN 'Boy|Girl' ELSE 'Men|Women' END AS department,		
		0																	as has_options,
		'Not Visible Individually'											as visibility,
		upc																	as vendor_sku,
		style																as vendor_product_id,
		dbo.getORProductName(description)									as name,
		''																	as weight, 
		LEFT(color, 3)														as vendor_color_code,
		size																as choose_size,
		size																as vendor_size_code,
		dbo.ProperCase(RIGHT(color,LEN(color)-4))							as choose_color,
		price																as cost,
		CAST(REPLACE(retail, 'N/A', 0) AS float) - 0.01						as price,
		(SELECT TOP 1 Filename FROM tbl_RawData_S12_OR_Photos WHERE Filename LIKE '%' + a.style + '%' + LEFT(a.color, 3) + '%' ORDER BY Color DESC) AS image,
		(SELECT TOP 1 Color FROM tbl_RawData_S12_OR_Photos WHERE Filename LIKE '%' + a.style + '%' + LEFT(a.color, 3) + '%'  ORDER BY Color DESC) AS image_label,
		dbo.getUrlKey(dbo.getORProductName(a.description), 'Outdoor Research', dbo.ProperCase(RIGHT(color,LEN(color)-4)) + '-' + size) AS url_key
FROM tbl_RawData_S12_OR AS a
WHERE category <> 'MARKETING'

DELETE FROM tbl_LoadFile_S12_OR WHERE image IS NULL

UPDATE tbl_LoadFile_S12_OR SET choose_size = REPLACE(choose_size, '1SIZE', 'As Shown')

INSERT INTO tbl_LoadFile_S12_OR
(
	store,									
	websites,
	status, 
	tax_class_id,
	type,
	sku,
	configurable_attributes,
	department,
	has_options,
	visibility,
	vendor_product_id,
	name,
	short_description,
	description,
	features,
	weight,
	cost,
	price,
	categories,
	url_key
)
SELECT DISTINCT
		'admin'																as store,
		'base'																as websites,
		'Enabled'															as status, 
		'Taxable Goods'														as tax_class_id,
		'configurable'														as type,
		'OR-' + a.style														as sku,
		'choose_color,choose_size'											as configurable_attributes,
		CASE WHEN a.description LIKE '%Women%' THEN 'Women' WHEN a.description LIKE '%Men%' THEN 'Men' WHEN a.description LIKE '%Kid%' THEN 'Boy|Girl' ELSE 'Men|Women' END AS department,		
		1																	as has_options,
		'Catalog, Search'													as visibility,
		a.style																as vendor_product_id,
		dbo.getORProductName(a.description)									as name,
		dbo.toHTMLEntities(b.short_description)								as short_description,
		dbo.toHTMLEntities(b.description)									as description,
		dbo.toHTMLEntities(REPLACE(b.features,'* ','|'))					as features,
		''																	as weight, 
		CAST(price AS float )												as cost,
		CAST(REPLACE(retail, 'N/A', 0) AS float) - 0.01						as price,
		''																	as categories,
		dbo.getUrlKey(dbo.getORProductName(a.description), 'Outdoor Research', '') AS url_key
FROM tbl_RawData_S12_OR AS a
LEFT OUTER JOIN tbl_RawData_S12_OR_Additional AS b ON a.style = b.sku
WHERE category <> 'MARKETING'
GO

UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_OR WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_OR WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	simples_skus = dbo.getORAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_S12_OR AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getORMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_S12_OR AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_OR SET small_image = image, thumbnail = image WHERE image IS NOT NULL
GO

/**
 * Almost done! Now we have to do some sanity checks and run some tests. The following routines all check
 * for data consistency and accuracy before we output to CSV and upload to Magento.
**/

DECLARE @output varchar(MAX), @count nvarchar(3)

-- Categories test
PRINT ''
SELECT @output = COALESCE(@output + CHAR(13) + '		', '') + name FROM
(SELECT name FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND categories IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND categories IS NULL)

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
(SELECT DISTINCT sku FROM tbl_LoadFile_S12_OR AS a WHERE (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE sku = a.sku) > 1) AS x

SET @count = (SELECT COUNT(DISTINCT sku) FROM tbl_LoadFile_S12_OR AS a WHERE (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE sku = a.sku) > 1)

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
(SELECT a.sku AS sku FROM tbl_LoadFile_S12_OR AS a LEFT JOIN tbl_LoadFile_S12_OR AS b
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
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL)) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND (image IS NULL or image_label IS NULL))

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
(SELECT vendor_product_id FROM tbl_LoadFile_S12_OR WHERE CAST(price AS float) <= 0 OR price IS NULL) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE CAST(price AS float) <= 0 OR price IS NULL)

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
(SELECT name + ' (' + vendor_product_id + ')' AS name FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND (short_description IS NULL OR short_description = '')) AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND (short_description IS NULL OR short_description = ''))

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
(SELECT name FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%') AS x

SET @count = (SELECT COUNT(*) FROM tbl_LoadFile_S12_OR WHERE type = 'configurable' AND media_gallery LIKE '%' + image + '%')

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
(SELECT DISTINCT vendor_product_id + '-' + vendor_color_code  + ' (' + choose_color + ')' AS name FROM tbl_LoadFile_S12_OR WHERE type = 'simple' AND (image = '' OR image IS NULL)) AS x

SET @count = (SELECT COUNT(DISTINCT vendor_product_id + ' ' + choose_color) FROM tbl_LoadFile_S12_OR WHERE type = 'simple' AND (image = '' OR image IS NULL))

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
(SELECT DISTINCT image FROM tbl_LoadFile_S12_OR AS a LEFT JOIN tbl_RawData_S12_OR_Photos AS b ON a.image = b.filename WHERE b.filename IS NULL AND type = 'simple') AS x

SET @count = (SELECT COUNT(DISTINCT image) FROM tbl_LoadFile_S12_OR AS a LEFT JOIN tbl_RawData_S12_OR_Photos AS b ON a.image = b.filename WHERE b.filename IS NULL AND type = 'simple')

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
END
*/

UPDATE tbl_LoadFile_S12_OR SET categories = 'Equipment/Sacks' WHERE (name LIKE '%sack%' OR name LIKE '% dry bag%') AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Sleeping Bags/Bivvies' WHERE name LIKE '%bivy%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Footwear/Gaiters' WHERE name LIKE '%gaiters%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Tops/Tees' WHERE name LIKE '% tee%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Jackets' WHERE name LIKE '% jacket%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Bottoms/Shorts' WHERE name LIKE '% short%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Tops/Shirts' WHERE name LIKE '% shirt%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Tops/Hoodies & Sweaters' WHERE (name LIKE '% henley%' OR name LIKE '% hoody%') AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Bottoms/Pants' WHERE name LIKE '% pant%' AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Accessories/Mitts & Gloves' WHERE (name LIKE '% mitt%' OR name LIKE '% glove%') AND type = 'configurable'
UPDATE tbl_LoadFile_S12_OR SET categories = 'Accessories/Hats & Toques' WHERE (name LIKE '% beanie%' OR name LIKE '% cap%' OR name LIKE '% hat%') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_OR SET stock_location = '' WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_OR SET status = 'Disabled' WHERE image IS NULL OR (type = 'configurable' AND simples_skus IS NULL)

UPDATE tbl_LoadFile_S12_OR SET description = REPLACE(description, CHAR(10), ''), features = REPLACE(features, CHAR(10), '') WHERE type = 'configurable'


CREATE VIEW [dbo].[view_LoadFile_S12_OR]
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
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE('+' + a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE('+' + a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE('+' + a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.stock_location,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_S12_OR a WHERE status = 'Enabled'
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_S12_OR" queryout "C:\Data\Shared\SQL\outdoor-research-S12.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_S12_OR
GO