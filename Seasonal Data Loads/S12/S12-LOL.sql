USE [LiveOutThere]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_LOL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_LOL](
	Category [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Division [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CountryOfOrigin [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gender [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Color  [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Quality [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UnitPrice [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ListPrice [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_LOL_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_LOL_Additional](
	SKU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ShortDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_LOL_Keywords]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_LOL_Keywords] (
	[SKU] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Keywords] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_LOL_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_LOL_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

/*
UPDATE a SET Color = (SELECT DISTINCT image_label FROM tbl_LoadFile_S12_LOL WHERE image_label IS NOT NULL AND type = 'simple' AND SUBSTRING(a.Filename, CHARINDEX('-', a.Filename) + 1, 100) LIKE vendor_color_code + '%')
FROM tbl_RawData_S12_LOL_Photos as a
*/

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_LOL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_LOL]

CREATE TABLE [dbo].[tbl_LoadFile_S12_LOL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_manufacturer]  DEFAULT ('Lole'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_LOL_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_LOL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_LOL] ON [dbo].[tbl_LoadFile_S12_LOL] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_S12_LOL (
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
SELECT  dbo.getMagentoSimpleSKU('LOLE', a.Style, dbo.getLOLEColorCode(a.Color), a.Size) AS sku,
		a.Style AS vendor_product_id,
		'Women''s ' + dbo.ProperCase(a.Description) AS productname,
		'Women''s' AS gender,
		dbo.getLOLEColorName(a.Color) AS choose_color,
		a.Size AS choose_size,
		dbo.getLOLEColorCode(a.Color) AS vendor_color_code,
		a.Size AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(a.ListPrice AS float) - 0.01 AS price,
		(CAST(a.ListPrice AS float) / 2) AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 filename FROM tbl_RawData_S12_LOL_Photos WHERE filename LIKE '%' + a.Style + '%' + dbo.getLOLEColorCode(a.Color) + '%') AS image,
		CASE WHEN (SELECT TOP 1 filename FROM tbl_RawData_S12_LOL_Photos WHERE filename LIKE '%' + a.Style + '%' + dbo.getLOLEColorCode(a.Color) + '%') IS NOT NULL THEN dbo.getLOLEColorName(a.Color) END AS image_label,
		'' AS hs_tariff,
		a.CountryOfOrigin AS origin,
		'' AS weight
FROM tbl_RawData_S12_LOL AS a
WHERE ListPrice <> ''

INSERT INTO tbl_LoadFile_S12_LOL (
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
	weight,
	origin
)
SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('LOLE', a.Style) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.Style AS model,
		'Lole/' + a.Category + ';;' + d.categories AS categories,
		'Women''s ' + dbo.ProperCase(a.Description) AS productname,
		'Women''s' AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_LOL WHERE vendor_product_id = a.Style) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_LOL WHERE vendor_product_id = a.Style) AS cost,
		c.ShortDescription AS short_description,
		c.Description AS description,
		'1' AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		d.videos,
		'' AS weight,
		a.CountryOfOrigin AS origin
FROM tbl_RawData_S12_LOL AS a
LEFT OUTER JOIN tbl_RawData_S12_LOL_Additional AS c ON a.Style = c.SKU
LEFT OUTER JOIN tbl_RawData_F11_Magento_Products AS d ON a.Style = d.style

UPDATE a SET
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_LOL_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' ORDER BY Color DESC),
	image_label = (SELECT TOP 1 color FROM tbl_RawData_S12_LOL_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' ORDER BY Color DESC),
	media_gallery = dbo.getLOLEMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_LOL AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_LOL SET image = 'lole.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_LOL SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_LOL SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'lole.jpg'

DELETE FROM tbl_LoadFile_S12_LOL WHERE price IS NULL

UPDATE tbl_LoadFile_S12_LOL SET media_gallery = REPLACE(media_gallery,image+'::'+image_label+';','') WHERE type = 'configurable'
UPDATE tbl_LoadFile_S12_LOL SET media_gallery = REPLACE(media_gallery,image+'::'+image_label,'') WHERE type = 'configurable'
UPDATE a SET
	categories = dbo.getCategory(a.name,ISNULL(a.short_description,'')+' '+ISNULL(a.description,''),a.features,a.fabric,a.activities)
FROM tbl_LoadFile_S12_LOL AS a
WHERE type = 'configurable' AND categories IS NULL
UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_S12_LOL_Photos WHERE Caption <> 'Back' AND Filename LIKE '%' + a.vendor_product_id + '%' + a.vendor_color_code + '%' ORDER BY Filename DESC ),
	image_label = (SELECT TOP 1 Color FROM tbl_RawData_S12_LOL_Photos WHERE Caption <> 'Back' AND Filename LIKE '%' + a.vendor_product_id + '%' + a.vendor_color_code + '%' ORDER BY Filename DESC )
FROM tbl_LoadFile_S12_LOL AS a
WHERE type = 'simple'

UPDATE tbl_LoadFile_S12_LOL SET small_image = image, thumbnail = image WHERE image IS NOT NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_S12_LOL_Photos WHERE Caption <> 'Back' AND Filename LIKE '%' + a.vendor_product_id + '%' ORDER BY Filename DESC ),
	image_label = (SELECT TOP 1 Color FROM tbl_RawData_S12_LOL_Photos WHERE Caption <> 'Back' AND Filename LIKE '%' + a.vendor_product_id + '%' ORDER BY Filename DESC ),
	media_gallery = dbo.getLOLEMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_S12_LOL AS a
WHERE type = 'configurable'