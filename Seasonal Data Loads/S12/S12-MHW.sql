USE [LiveOutThere]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MHW_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MHW_Additional](
	jdeStyleID [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Language [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tagPDMNumber [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	collateralStyle [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	tagStatus [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	genderDisplay [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sizeList [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	AvgWeight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	HeightGaiters [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	colorListWeb [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	usage [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	body [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentBody [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	coating [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	insulation [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentInsulation [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	laminate [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentLaminate [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	liner [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentLiner [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	lining [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentLining [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	lower [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentLower [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	palmMaterial [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentPalmMaterial [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	panel [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentPanel [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	upper [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	contentUpper [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature01 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature02 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature03 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature04 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature05 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature06 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature07 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature08 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature09 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature10 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature11 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature12 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature13 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature14 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature15 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature16 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature17 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature18 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature19 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature20 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Origin [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	status [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	features [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	fabric [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MHW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MHW](
	StyleCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gender [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VendorSKU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VendorSKUPart [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Color [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MSRP [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MAP [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CountryofOrigin [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	HarmonizedCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ShortDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	LongDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MHW_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MHW_Photos] (
	[Filename] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_MHW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_MHW]

CREATE TABLE [dbo].[tbl_LoadFile_S12_MHW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_visibility]  DEFAULT ('Nowhere'),
	[image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[media_gallery] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_manufacturer]  DEFAULT ('Mountain Hardwear'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MHW_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_MHW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_MHW] ON [dbo].[tbl_LoadFile_S12_MHW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/*
UPDATE tbl_RawData_S12_MHW_Photos SET color = (SELECT DISTINCT TOP 1 Color FROM tbl_RawData_S12_MHW WHERE ColorCode = SUBSTRING(filename, 12, 3)) WHERE color IS NULL
UPDATE tbl_RawData_S12_MHW_Photos SET caption = 'Back' WHERE (Filename LIKE '%[_]b%')
UPDATE tbl_RawData_S12_MHW_Photos SET caption = 'Detail' WHERE (Filename LIKE '%[_]d%')
UPDATE tbl_RawData_S12_MHW_Photos SET caption = 'Inside' WHERE (Filename LIKE '%[_]LD%')
UPDATE tbl_RawData_S12_MHW_Photos SET caption = 'Alternate' WHERE (Filename LIKE '%[_]a%')

-- This code combines all the columns beginning with Fabric% and Features% into single columns so it's easier to parse later
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO

UPDATE tbl_RawData_S12_MHW_Additional SET features = '', fabric = ''

DECLARE @detail_column varchar(255), @column_name varchar(255), @productid varchar(255), @content varchar(1024)
DECLARE c CURSOR FOR SELECT DISTINCT jdeStyleID FROM tbl_RawData_S12_MHW_Additional
OPEN c

FETCH NEXT FROM c INTO @productid
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LiveOutThere.dbo.sp_columns ''tbl_RawData_S12_MHW_Additional''') AS tbl
	OPEN c1

	FETCH NEXT FROM c1 INTO @column_name
	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF (@column_name LIKE 'Feature%' AND @column_name <> 'features') BEGIN
			EXEC ('UPDATE tbl_RawData_S12_MHW_Additional SET features = features + ISNULL([' + @column_name + '],'''') + ''|'' WHERE Language = ''ENG'' AND jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		IF (@column_name LIKE 'Fabric%' AND @column_name <> 'fabric') BEGIN
			SET @detail_column = REPLACE(@column_name,'Fabric','Detail')
			EXEC ('UPDATE tbl_RawData_S12_MHW_Additional SET fabric = fabric + ISNULL([' + @column_name + '],'''') + CASE WHEN [' + @detail_column + '] <> '''' THEN '': '' + [' + @detail_column + '] ELSE '''' END + ''|'' WHERE Language = ''ENG'' AND jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END

		FETCH NEXT FROM c1 INTO @column_name
	END

	CLOSE c1
	DEALLOCATE c1

	UPDATE tbl_RawData_S12_MHW_Additional SET features = dbo.toHTMLEntities(features) WHERE jdeStyleID = @productid

	FETCH NEXT FROM c INTO @productid
END

CLOSE c
DEALLOCATE c
*/

INSERT INTO tbl_LoadFile_S12_MHW (
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
		image_label,
		hs_tariff,
		origin,
		weight
)

SELECT  dbo.getMagentoSimpleSKU('MHW', StyleCode, ColorCode, SizeCode + CASE WHEN Size2 <> '' THEN '-' + Size2 ELSE '' END) AS sku,
		StyleCode AS vendor_product_id,
		dbo.getMHWName(StyleName) AS name,
		dbo.getMHWGenderFromName(StyleName) AS gender,
		color AS choose_color,
		SizeCode + ISNULL(CASE WHEN Size2 = 'S' THEN ' (Short)' WHEN Size2 = 'L' THEN ' (Long)' WHEN Size2 = 'R' THEN ' (Regular)' WHEN Size2 <> '' THEN ' (' + Size2 + ')' END,'') AS choose_size,
		ColorCode AS vendor_color_code,
		SizeCode + CASE WHEN Size2 <> '' THEN '-' + Size2 ELSE '' END AS vendor_size_code,
		UPC AS vendor_sku,
		CAST(LTRIM(REPLACE(MSRP,'$','')) AS float) - 0.01 AS price,
		CAST(LTRIM(REPLACE(Cost,'$','')) AS float) AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 filename FROM tbl_RawData_S12_MHW_Photos WHERE filename LIKE '%' + a.StyleCode + '%' + a.ColorCode + '%' AND Caption IS NULL ORDER BY filename DESC) AS image,
		(SELECT TOP 1 color + CASE WHEN caption IS NOT NULL THEN ' (' + caption + ')' ELSE '' END FROM tbl_RawData_S12_MHW_Photos WHERE filename LIKE '%' + a.StyleCode + '%' + a.ColorCode + '%' AND Caption IS NULL ORDER BY filename DESC) AS image_label,
		'' AS hs_tariff,
		CountryofOrigin AS origin,
		(SELECT AvgWeight FROM tbl_RawData_S12_MHW_Additional WHERE jdeStyleID = StyleCode AND Language = 'ENG') AS weight
FROM tbl_RawData_S12_MHW AS a

INSERT INTO tbl_LoadFile_S12_MHW (
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
	videos,
	origin,
	weight
)

SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('MHW', a.StyleCode) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.StyleCode AS vendor_product_id,
		b.categories AS categories,
		dbo.getMHWName(StyleName) AS name,
		dbo.getMHWGenderFromName(StyleName) AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_MHW WHERE vendor_product_id = a.StyleCode) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_MHW WHERE vendor_product_id = a.StyleCode) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		b.url_key AS url_key,
		'Catalog, Search' AS visibility,
		videos,
		CountryofOrigin AS origin,
		(SELECT AvgWeight FROM tbl_RawData_S12_MHW_Additional WHERE jdeStyleID = a.StyleCode AND Language = 'ENG') AS weight
FROM tbl_RawData_S12_MHW AS a
LEFT JOIN tbl_RawData_F11_Magento_Products AS b ON a.StyleCode = b.Style

UPDATE a SET
	super_attribute_pricing = dbo.getSuperAttributePricing(a.vendor_product_id),
	short_description = dbo.toHTMLEntities((SELECT Usage FROM tbl_RawData_S12_MHW_Additional WHERE Language = 'ENG' AND jdeStyleId = a.vendor_product_id)),
	description = dbo.toHTMLEntities((SELECT description + CASE WHEN HeightGaiters <> '' THEN ' Gaiter height is ' + HeightGaiters + '.' ELSE '' END FROM tbl_RawData_S12_MHW_Additional WHERE Language = 'ENG' AND jdeStyleId = a.vendor_product_id)),
	features = dbo.toHTMLEntities((SELECT features FROM tbl_RawData_S12_MHW_Additional WHERE Language = 'ENG' AND jdeStyleId = a.vendor_product_id)),
	fabric = dbo.toHTMLEntities((SELECT fabric FROM tbl_RawData_S12_MHW_Additional WHERE Language = 'ENG' AND jdeStyleId = a.vendor_product_id)),
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_MHW_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' AND Caption IS NULL ORDER BY filename DESC),
	image_label = (SELECT TOP 1 color + CASE WHEN caption IS NOT NULL THEN ' (' + caption + ')' ELSE '' END FROM tbl_RawData_S12_MHW_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' AND Caption IS NULL ORDER BY filename DESC),
	media_gallery = dbo.getMHWMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_MHW AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_MHW SET image = 'mhw.jpg' WHERE (image IS NULL or image = '') AND type ='configurable'

UPDATE tbl_LoadFile_S12_MHW SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_MHW SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'mhw.jpg'

UPDATE tbl_LoadFile_S12_MHW SET name = LTRIM(RTRIM(name))

/*
-- Sleeping Bags
UPDATE a SET
	weight = (SELECT [Weight (Regular)] FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	fit = (SELECT [Bag Shape] + ': ' + [Shape Description] FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	short_description = (SELECT Insulation + ' bag keeps you comfortable down to ' + [Comfort Range]  FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	description = (SELECT description FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	features = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(features,'<ul class=''features''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	fabric = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(materials,'<ul class=''materials''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_S11_MHW_SleepingBags WHERE gender = CASE WHEN a.gender <> 'Women' THEN 'Undefined' ELSE 'Women''s' END AND REPLACE(name,'°','') = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ',''))
FROM tbl_LoadFile_S12_MHW AS a
WHERE type = 'configurable' AND description IS NULL

-- Apparel
UPDATE a SET
	fit = (SELECT fit FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	weight = (SELECT weight FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	short_description = (SELECT CASE WHEN usage NOT LIKE '% / %' THEN Usage END FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	activities = (SELECT CASE WHEN usage LIKE '% / %' THEN Usage END FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	description = (SELECT description FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	features = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(features,'<ul class=''features''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	fabric = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(materials,'<ul class=''materials''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_F11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ',''))
FROM tbl_LoadFile_S12_MHW AS a
WHERE type = 'configurable' AND description IS NULL
UPDATE a SET
	fit = (SELECT fit FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	weight = (SELECT weight FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	short_description = (SELECT CASE WHEN usage NOT LIKE '% / %' THEN Usage END FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	activities = (SELECT CASE WHEN usage LIKE '% / %' THEN Usage END FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	description = (SELECT description FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	features = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(features,'<ul class=''features''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ','')),
	fabric = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(materials,'<ul class=''materials''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_S11_MHW_Apparel WHERE genderDisplay LIKE CASE WHEN a.gender NOT LIKE '%|%' THEN a.gender + '''s' ELSE '%' END  AND name = REPLACE(REPLACE(a.name,'Women''s ',''),'Men''s ',''))
FROM tbl_LoadFile_S12_MHW AS a
WHERE type = 'configurable' AND description IS NULL

*/