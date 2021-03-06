USE [LOT_Inventory]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_SW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_SW](
	ProductGroup [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductSubCategory [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleColor [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SKU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CountryOfOrigin [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Price [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_SW_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_SW_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

UPDATE a SET Color =   (SELECT DISTINCT TOP (1) dbo.getSWColorName(ColorName) AS Expr1
                            FROM          tbl_RawData_S12_SW
                            WHERE      (ColorCode = SUBSTRING(a.Filename, 7, 3)))
FROM tbl_RawData_S12_SW_Photos AS a
WHERE Color IS NULL

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_SW_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_SW_Additional] (
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Name [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_SW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_SW]

CREATE TABLE [dbo].[tbl_LoadFile_S12_SW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_manufacturer]  DEFAULT ('SmartWool'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_SW_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_SW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_SW] ON [dbo].[tbl_LoadFile_S12_SW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
*/

INSERT INTO tbl_LoadFile_S12_SW (
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
SELECT  dbo.getMagentoSimpleSKU('SW', a.StyleCode, a.ColorCode, a.SizeCode) AS sku,
		a.StyleCode AS vendor_product_id,
		dbo.getSWName(b.Name) AS productname,
		dbo.getSWGenderFromName(b.name) AS gender,
		dbo.getSWColorName(a.ColorName) AS choose_color,
		a.SizeCode AS choose_size,
		a.ColorCode AS vendor_color_code,
		a.SizeCode AS vendor_size_code,
		a.UPC AS vendor_sku,
		(CAST(c.Price AS float) * 2) - 0.01 AS price,
		CAST(c.Price AS float) AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 filename FROM tbl_RawData_S12_SW_Photos WHERE filename LIKE '%' + a.StyleCode + '%' + a.ColorCode + '%p%') AS image,
		dbo.getSWColorName(a.ColorName) AS image_label,
		'' AS hs_tariff,
		dbo.ProperCase(a.CountryOfOrigin) AS origin,
		'' AS weight
FROM tbl_RawData_S12_SW AS a
INNER JOIN tbl_RawData_S12_SW_Additional AS b ON a.StyleCode = b.Style
INNER JOIN tbl_RawData_S12_SW_Price AS c ON a.StyleCode = c.Style
                      
INSERT INTO tbl_LoadFile_S12_SW (
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
	fit,
	has_options,
	type,
	url_key,
	visibility,
	videos,
	weight,
	origin
)
SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('SW', a.StyleCode) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.StyleCode AS model,
		c.categories AS categories,
		dbo.getSWName(b.Name) AS name,
		dbo.getSWGenderFromName(b.Name) AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_SW WHERE vendor_product_id = a.StyleCode) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_SW WHERE vendor_product_id = a.StyleCode) AS cost,
		b.Description AS short_description,
		'&nbsp;' AS description,
		CASE WHEN b.Feature1 LIKE '%fit%' THEN b.Feature1 ELSE '' END AS fit,
		'1' AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		c.videos,
		'' AS weight,
		dbo.ProperCase(a.CountryOfOrigin)
FROM tbl_RawData_S12_SW AS a
INNER JOIN tbl_RawData_S12_SW_Additional AS b ON a.StyleCode = b.Style
LEFT OUTER JOIN tbl_RawData_F11_Magento_Products AS c ON a.StyleCode = c.style
INNER JOIN tbl_RawData_S12_SW_Price AS d ON a.StyleCode = d.Style

UPDATE a SET
	features = dbo.getSWFeatures(a.vendor_product_id),
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_SW_Photos WHERE Filename LIKE '%' + a.vendor_product_id + '%p%' ORDER BY Filename DESC),
	image_label = (SELECT TOP 1 Color FROM tbl_RawData_S12_SW_Photos WHERE Filename LIKE '%' + a.vendor_product_id + '%p%' ORDER BY Filename DESC),
	media_gallery = dbo.getSWMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_SW AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_SW SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_SW SET Price = CAST(Price AS float) + 0.05 WHERE Price NOT LIKE '%.99'

UPDATE tbl_LoadFile_S12_SW SET origin = 'United States' WHERE origin = 'Usa'