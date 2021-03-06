USE [LiveOutThere]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_TNF]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_TNF](
	itemnumber [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	productname [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ABM [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SBU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	directory [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	navcategory [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	subcategory [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	colorcode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	color [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sizecode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	vsize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	page [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	uom_cd [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	upc [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	sku [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	firstship_dt [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Whsl [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Retail [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Specs8 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features8 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features9 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features10 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features11 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features12 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features13 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features14 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features15 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Features16 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	weight [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

UPDATE tbl_RawData_S12_TNF SET weight = dbo.getTNFWeight(itemnumber)
UPDATE tbl_RawData_S12_TNF SET color = RIGHT(color,LEN(color)-2) WHERE RIGHT(LEFT(color, 2), 1) = ' '
UPDATE tbl_RawData_S12_TNF SET Description = NULL WHERE Description = '0'

-- The content for this table comes from an ls > filenames.txt of all ARC photos
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_TNF_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_TNF_Photos](
	[Filename] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [varchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

/*
-- Process image filenames
UPDATE tbl_RawData_S12_TNF SET ColorCode = '0' + ColorCode WHERE LEN(colorcode) = 2
UPDATE tbl_RawData_S12_TNF_Photos SET color = (SELECT DISTINCT TOP 1 color FROM tbl_RawData_S12_TNF WHERE colorcode = SUBSTRING(filename, 6, 3))
UPDATE tbl_RawData_S12_TNF_Photos SET caption = 'Top' WHERE filename LIKE '%top%'
UPDATE tbl_RawData_S12_TNF_Photos SET caption = 'Back' WHERE filename LIKE '%back%'
UPDATE tbl_RawData_S12_TNF_Photos SET caption = 'Front' WHERE filename LIKE '%front%'
UPDATE tbl_RawData_S12_TNF_Photos SET caption = 'Sole' WHERE filename LIKE '%sole%'
UPDATE tbl_RawData_S12_TNF_Photos SET caption = 'Fly' WHERE filename LIKE '%fly%'
*/

-- This is our main working table
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_TNF]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_TNF]

CREATE TABLE [dbo].[tbl_LoadFile_S12_TNF](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_manufacturer]  DEFAULT ('The North Face'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_TNF_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_TNF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_TNF] ON [dbo].[tbl_LoadFile_S12_TNF] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_S12_TNF (
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

SELECT  dbo.getMagentoSimpleSKU('TNF', itemnumber, ISNULL(colorcode,''), RTRIM(ISNULL(sizecode,'')) + CASE WHEN RTRIM(ISNULL(vsize,'')) <> '' THEN '-' + RTRIM(ISNULL(vsize,'')) ELSE '' END) AS sku,
		itemnumber AS model,
		dbo.getTNFName(productname) AS name,
		dbo.getTNFGenderFromName(productname) AS gender,
		ISNULL(RTRIM(color),'') AS choose_color,
		ISNULL(CASE WHEN RIGHT(RTRIM(sizecode),1) = 'H' THEN REPLACE(RTRIM(sizecode),'H','½') ELSE RTRIM(sizecode) END,'') + ISNULL(CASE WHEN vsize IS NOT NULL AND vsize <> '' THEN '-' + RTRIM(vsize) END,'') AS choose_size,
		RTRIM(colorcode),
		ISNULL(RTRIM(sizecode),'') + ISNULL(CASE WHEN vsize IS NOT NULL AND vsize <> '' THEN '-' + RTRIM(vsize) END,'') AS size,
		upc AS vendor_sku,
		CAST(REPLACE(REPLACE(retail,',',''),'$','') AS float) - 0.01 AS price,
		CAST(REPLACE(REPLACE(whsl,',',''),'$','') AS float) AS cost,
		0,
		'simple',
		(SELECT TOP 1 filename FROM tbl_RawData_S12_TNF_Photos WHERE filename LIKE '%' + itemnumber + '%' + colorcode + '%' AND filename NOT LIKE '%sole%' AND filename NOT LIKE '%[_]back%' ORDER BY filename DESC) AS image,
		(SELECT TOP 1 color + ISNULL(CASE WHEN caption IS NOT NULL THEN ' - ' + caption END,'') FROM tbl_RawData_S12_TNF_Photos WHERE filename LIKE '%' + itemnumber + '%' + colorcode + '%' AND filename NOT LIKE '%sole%'AND filename NOT LIKE '%[_]back%' ORDER BY filename DESC) AS image_label,
		NULL AS hs_tariff,
		NULL AS origin,
		dbo.getTNFWeight(itemnumber) AS weight
FROM tbl_RawData_S12_TNF AS a
ORDER BY productname

INSERT INTO tbl_LoadFile_S12_TNF (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	gender,
	price,
	cost,
	short_description,
	description,
	has_options,
	type,
	url_key,
	visibility,
	videos,
	weight
)

SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('TNF', itemnumber) AS sku,
		'choose_color,choose_size' AS config_attributes,
		itemnumber AS model,
		b.categories AS categories,
		dbo.getTNFName(productname) AS name,
		dbo.getTNFGenderFromName(productname) AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_TNF WHERE vendor_product_id = a.itemnumber) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_TNF WHERE vendor_product_id = a.itemnumber) AS cost,
		short_description = CASE WHEN description IS NOT NULL AND description <> '' THEN dbo.toHTMLEntities(LEFT(description,CHARINDEX('.',description))) ELSE dbo.toHTMLEntities(REPLACE(features1,'Fabric: ','')) END,
		dbo.toHTMLEntities(description) AS description,
		1 AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		b.videos,
		weight AS weight
FROM tbl_RawData_S12_TNF AS a
LEFT JOIN tbl_RawData_F11_Magento_Products AS b ON a.itemnumber = b.style
ORDER BY name

UPDATE a SET
	super_attribute_pricing = dbo.getSuperAttributePricing(a.vendor_product_id),
	features = dbo.toHTMLEntities(REPLACE((SELECT DISTINCT ISNULL(features1,'') + '|' + ISNULL(features2,'') + '|' + ISNULL(features3,'') + '|' + ISNULL(features4,'') + '|' + ISNULL(features5,'') + '|' + ISNULL(features6,'') + '|' + ISNULL(features7,'') + '|' + ISNULL(features8,'') + '|' + ISNULL(features9,'') + '|' + ISNULL(features10,'') + '|' + ISNULL(features11,'') + '|' + ISNULL(features12,'') + '|' + ISNULL(features13,'') + '|' + ISNULL(features14,'') + '|' + ISNULL(features15,'') + '|' + ISNULL(features16,'') FROM tbl_RawData_S12_TNF WHERE itemnumber = a.vendor_product_id),'|||||||||||||||','')),
	fabric = dbo.toHTMLEntities(REPLACE((SELECT DISTINCT ISNULL(specs1,'') + '|' + ISNULL(specs2,'') + '|' + ISNULL(specs3,'') + '|' + ISNULL(specs4,'') + '|' + ISNULL(specs5,'') + '|' + ISNULL(specs6,'') + '|' + ISNULL(specs7,'') + '|' + ISNULL(specs8,'') FROM tbl_RawData_S12_TNF WHERE itemnumber = a.vendor_product_id),'|||||||','')),
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_TNF_Photos WHERE LEFT(filename,4) = a.vendor_product_id AND filename NOT LIKE '%sole%' AND filename NOT LIKE '%[_]back%' ORDER BY filename),
	image_label = (SELECT TOP 1 color + CASE WHEN caption IS NOT NULL THEN ' (' + caption + ')' ELSE '' END FROM tbl_RawData_S12_TNF_Photos WHERE LEFT(filename,4) = a.vendor_product_id AND filename NOT LIKE '%sole%' AND filename NOT LIKE '%[_]back%' ORDER BY filename),
	media_gallery = dbo.getTNFMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_TNF AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_TNF SET image = 'tnf.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_TNF SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_TNF SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'tnf.jpg'