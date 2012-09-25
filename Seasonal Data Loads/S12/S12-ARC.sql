USE [LiveOutThere]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_ARC]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_ARC]

CREATE TABLE [dbo].[tbl_LoadFile_S12_ARC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_manufacturer]  DEFAULT ('Arc''teryx'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_ARC_is_in_stock]  DEFAULT ((1)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hs_tariff] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[origin] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[us_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cs_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xre_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
 CONSTRAINT [PK_tbl_LoadFile_S12_ARC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_ARC] ON [dbo].[tbl_LoadFile_S12_ARC] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_ARC_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE tbl_RawData_ARC_Additional

CREATE TABLE [dbo].[tbl_RawData_ARC_Additional](
	Season [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Model [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Descr [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MarketingName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Weight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gender [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ShortDesign [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Design [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Materials [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Volume [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeRun [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CareInfo [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fit [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activities [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	priority [int]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_RawData_ARC_Additional] ON [dbo].[tbl_RawData_ARC_Additional] 
(
	[Descr] ASC,
	[Gender] ASC,
	[priority] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_RawData_ARC_Additional
SELECT * FROM view_RawData_ARC_Additional

UPDATE tbl_RawData_ARC_Additional SET Descr = REPLACE(REPLACE(Descr,' Women''s',''),' Men''s','')

/* Parse gender and color out of filenames - this requires you to populate tbl_RawData_S12_ARC first so that we can query the color column to make sure that color actually exists
UPDATE tbl_RawData_S12_ARC_Photos SET gender = 'W' WHERE (CHARINDEX('-W-', filename) > 0)
UPDATE tbl_RawData_S12_ARC_Photos SET gender = 'M' WHERE (gender IS NULL)

DECLARE @s varchar(255), @orig varchar(255), @filename varchar(255)
DECLARE c2 CURSOR FOR
SELECT REPLACE(REPLACE(filename,'.png',''),'.jpg','') FROM tbl_RawData_S12_ARC_Photos

OPEN C2

FETCH NEXT FROM C2 INTO @filename
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR
	SELECT s, orig FROM dbo.Split('-',@filename)

	OPEN c1

	FETCH NEXT FROM c1 INTO @s, @orig

	WHILE @@FETCH_STATUS = 0 BEGIN
		IF (SELECT COUNT(*) FROM tbl_RawData_S12_ARC WHERE color = (REPLACE(SUBSTRING(@orig,CHARINDEX(@s,@orig),LEN(@orig)-CHARINDEX(@s,@orig)+1),'-',' '))) > 0 BEGIN
			UPDATE tbl_RawData_S12_ARC_Photos SET color = REPLACE(SUBSTRING(@orig,CHARINDEX(@s,@orig),LEN(@orig)-CHARINDEX(@s,@orig)+1),'-',' ') WHERE filename = @orig + '.png' OR filename = @orig + '.jpg'
		END
		ELSE IF (SELECT COUNT(*) FROM tbl_RawData_S11_ARC WHERE colordescription = (REPLACE(SUBSTRING(@orig,CHARINDEX(@s,@orig),LEN(@orig)-CHARINDEX(@s,@orig)+1),'-',' '))) > 0 BEGIN
			UPDATE tbl_RawData_S12_ARC_Photos SET color = REPLACE(SUBSTRING(@orig,CHARINDEX(@s,@orig),LEN(@orig)-CHARINDEX(@s,@orig)+1),'-',' ') WHERE filename = @orig + '.png' OR filename = @orig + '.jpg'
		END
		FETCH NEXT FROM c1 INTO @s, @orig
	END

	CLOSE c1
	DEALLOCATE c1

	FETCH NEXT FROM C2 INTO @filename
END

CLOSE c2
DEALLOCATE c2
*/

/*#### Random bits of useful SQL
	
	-- This will pull all products that have more than one model number
	-- Last run S12, looks like there are no dupes
	SELECT * FROM tbl_RawData_S12_ARC WHERE description IN (
	SELECT DISTINCT description
	FROM         tbl_RawData_S12_ARC AS a
	WHERE     ((SELECT     COUNT(DISTINCT model) AS Expr1
							 FROM         tbl_RawData_S12_ARC
							 WHERE     (description = a.description)) > 1))


	-- This go-around I decided to populate a 'Photo' column in the SKU table before I tried to merge. This makes it easier to do manual fixes, which is absolutely necessary with ARC
	-- I also did a second pass using REPLACE(SUBSTRING(a.description,0,CHARINDEX(' ',a.description,CHARINDEX(' ',a.description)+1)),' ','-') to reduce the specificity and then edited manually from there
	UPDATE     a  SET Photo = (SELECT TOP 1 filename FROM tbl_RawData_S12_ARC_Photos WHERE filename LIKE '%' + dbo.Fix_ARC_Description(a.description) + '%' + REPLACE(a.color,' ','-') + '%' AND gender = 'W')
	FROM   tbl_RawData_S12_ARC AS a
	WHERE Description LIKE '%Women%'

	UPDATE     a  SET Photo = (SELECT TOP 1 filename FROM tbl_RawData_S12_ARC_Photos WHERE filename LIKE '%' + dbo.Fix_ARC_Description(a.description) + '%' + REPLACE(a.color,' ','-') + '%' AND gender = 'M')
	FROM   tbl_RawData_S12_ARC AS a
	WHERE Description LIKE '%Men%' AND Description NOT LIKE '%Women%'

  #### */

INSERT INTO tbl_LoadFile_S12_ARC (  
		sku,
		vendor_product_id,
		name,
		gender,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		type,
		image,
		image_label,
		hs_tariff,
		origin,
		weight)

SELECT DISTINCT
		-- A note about when to use UDFs and when to use inline SQL: please don't over-normalize these routines. One or two operations is fine, like the prices - there's no reason
		-- to put this into a UDF. Once we start doing string manipulations that involve more than one or two steps, then you should think about putting it in a UDF.
	    dbo.getMagentoSimpleSKU('ARC', a.model, color, size) AS sku,
		a.model AS vendor_product_id,
		dbo.getARCName(a.description) AS description,
		dbo.getARCGenderFromName(a.description) AS gender,
		LTRIM(RTRIM(color)) AS choose_color,
		LTRIM(RTRIM(size)) AS choose_size,
		LTRIM(RTRIM(color)) AS vendor_color_code,
		LTRIM(RTRIM(size)) AS vendor_size_code,
		upc AS vendor_sku,
		CAST(REPLACE(retail,',','') AS float) - 0.01 AS price,
		CAST(REPLACE(wholesale,',','') AS float) AS price,
		0 AS has_options,
		'simple' AS type,
		Photo AS image,
		(SELECT Color FROM tbl_RawData_S12_ARC_Photos WHERE Filename = a.Photo) AS image_label,
		hstariff AS hs_tariff,
		countryoforigin AS origin,
		REPLACE(a.weight,',','') AS weight
FROM tbl_RawData_S12_ARC AS a
ORDER BY description

INSERT INTO tbl_LoadFile_S12_ARC (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	gender,
	price,
	cost,
	has_options,
	type,
	url_key,
	visibility,
	hs_tariff,
	origin,
	weight,
	videos
)

SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('ARC', a.model) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.model AS vendor_product_id,
		b.categories,
		dbo.getARCName(a.description) AS name,
		dbo.getARCGenderFromName(a.description) AS gender,
		CAST(REPLACE(retail,',','') AS float) - 0.01 AS price,
		CAST(REPLACE(wholesale,',','') AS float) AS price,
		'1' AS has_options,
		'configurable' AS type,
		b.url_key,
		'Catalog, Search' AS visibility,
		hstariff AS hs_tariff,
		countryoforigin AS origin,
		REPLACE(a.weight,',','') AS weight,
		b.videos
FROM tbl_RawData_S12_ARC AS a
LEFT JOIN tbl_RawData_F11_Magento_Products AS b ON a.model = b.style
LEFT JOIN tbl_RawData_S12_ARC_Additional AS c ON c.Model = a.Model

-- This is broken into a separate UPDATE statement because it is way more efficient/faster than running these queries inside the SELECT DISTINCT above
UPDATE a SET
	short_description = dbo.toHTMLEntities(dbo.getARCAdditional(a.name, 'ShortDesign')),
	description = dbo.toHTMLEntities(dbo.getARCAdditional(a.name, 'Design')),
	fit = dbo.toHTMLEntities(dbo.getARCAdditional(a.name, 'Fit')),
	volume = dbo.toHTMLEntities(dbo.getARCAdditional(a.name, 'Volume')),
	fabric = dbo.getARCMaterials(a.name),
	features = dbo.getARCFeatures(a.name),
	care_instructions = dbo.getARCGarmentCareInfo(a.name),
	media_gallery = dbo.getARCMediaGallery(a.name, LEFT(a.gender,1)),
	-- Don't forget to ORDER BY Color DESC so that we don't get mostly black thumbnails (because B is so close to the start of the alphabet)
	image = (SELECT DISTINCT TOP 1 Photo FROM tbl_RawData_S12_ARC WHERE model = a.vendor_product_id ORDER BY Color DESC),
	image_label = (SELECT Color FROM tbl_RawData_S12_ARC_Photos WHERE Filename = (SELECT DISTINCT TOP 1 Photo FROM tbl_RawData_S12_ARC WHERE model = a.vendor_product_id ORDER BY Color DESC)),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 2, a.sku)
FROM tbl_LoadFile_S12_ARC AS a
WHERE type = 'configurable'
		
-- Update categories with last season's categories
UPDATE tbl_LoadFile_S12_ARC SET categories =  (SELECT     TOP (1) categories
											   FROM          tbl_RawData_F11_Magento_Products
											   WHERE      (image LIKE REPLACE(tbl_LoadFile_S12_ARC.name, ' ', '-') + '%'))
WHERE categories IS NULL AND type = 'configurable'

-- Update any categories that are still NULL by matching lut_Keyword_Category
UPDATE tbl_LoadFile_S12_ARC SET categories =  (SELECT     TOP (1) Category
											   FROM          lut_Keyword_Category
											   WHERE      name LIKE '%' + Keyword + '%')
WHERE categories IS NULL AND type = 'configurable'

UPDATE tbl_LoadFile_S12_ARC SET image = 'arc.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_ARC SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_ARC SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'arc.jpg'

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_ARC_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE tbl_RawData_ARC_Additional

UPDATE tbl_LoadFile_S12_ARC SET
features = dbo.toHTMLEntities(REPLACE(REPLACE('<dl>' + REPLACE(REPLACE(REPLACE(REPLACE(features,'|','</dd><dd>'),'~','</dt><dd>'),'{','<dt>'),'}','</dd></dt><dt>') + '</dl>','<dt></dl>','</dl>'),'<dt><dt>','<dt>')),
fabric = dbo.toHTMLEntities(REPLACE(REPLACE('<dl>' + REPLACE(REPLACE(REPLACE(REPLACE(fabric,'|','</dd><dd>'),'~','</dt><dd>'),'{','<dt>'),'}','</dd></dt><dt>') + '</dl>','<dt></dl>','</dl>'),'<dt><dt>','<dt>')),
fit = dbo.toHTMLEntities(REPLACE(REPLACE('<dl>' + REPLACE(REPLACE(REPLACE(REPLACE(fit,'|','</dd><dd>'),'~','</dt><dd>'),'{','<dt>'),'}','</dd></dt><dt>') + '</dl>','<dt></dl>','</dl>'),'<dt><dt>','<dt>')),
volume = dbo.toHTMLEntities(REPLACE(REPLACE('<dl>' + REPLACE(REPLACE(REPLACE(REPLACE(volume,'|','</dd><dd>'),'~','</dt><dd>'),'{','<dt>'),'}','</dd></dt><dt>') + '</dl>','<dt></dl>','</dl>'),'<dt><dt>','<dt>'))
WHERE (type = 'configurable') AND features LIKE '%{%~%}%'

UPDATE tbl_LoadFile_S12_ARC SET features = REPLACE(features,'</dd></dt></dl>','</dd></dl>'), fabric = REPLACE(fabric,'</dd></dt></dl>','</dd></dl>'), fit = REPLACE(fit,'</dd></dt></dl>','</dd></dl>'), volume = REPLACE(volume,'</dd></dt></dl>','</dd></dl>')

UPDATE a SET
	media_gallery = dbo.getARCMediaGallery(a.name, LEFT(a.gender,1)),
	image = (SELECT DISTINCT TOP 1 Photo FROM tbl_RawData_S12_ARC WHERE model = a.vendor_product_id ORDER BY Photo DESC),
	image_label = (SELECT Color FROM tbl_RawData_S12_ARC_Photos WHERE Filename = (SELECT DISTINCT TOP 1 Photo FROM tbl_RawData_S12_ARC WHERE model = a.vendor_product_id ORDER BY Photo DESC))
FROM tbl_LoadFile_S12_ARC AS a
WHERE type = 'configurable' AND image = 'arc.jpg'

*/