--Have not begun.

USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_SAL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_SAL]

CREATE TABLE [dbo].[tbl_LoadFile_F12_SAL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_season]  DEFAULT (N'Fall/Winter 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_manufacturer]  DEFAULT ('Salomon'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_SAL_is_in_stock]  DEFAULT ((1)),
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
	[stock_location] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
 CONSTRAINT [PK_tbl_LoadFile_F12_SAL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_SAL] ON [dbo].[tbl_LoadFile_F12_SAL] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_F12_SAL (
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
		url_key,
		stock_location
)
SELECT  dbo.getMagentoSimpleSKU('IB', LEFT(a.ItemNumber,6), SUBSTRING(a.ItemNumber,7,3), SUBSTRING(a.ItemNumber,10,3)) AS sku,
		LEFT(a.ItemNumber,6) AS vendor_product_id,
		dbo.getIBName(a.StyleName) AS name,
		CASE WHEN a.ColorGender1 = 'Womens' THEN 'Women' WHEN a.ColorGender1 = 'Mens' THEN 'Men' WHEN a.ColorGender1 = 'Girls' THEN 'Girl' WHEN a.ColorGender1 = 'Boys' THEN 'Boy' END AS gender,
		a.ColorName AS choose_color,
		SUBSTRING(a.ItemNumber,10,3) AS choose_size,
		SUBSTRING(a.ItemNumber,7,3) AS vendor_color_code,
		SUBSTRING(a.ItemNumber,10,3) AS vendor_size_code,
		CAST(a.Barcode AS bigint) AS vendor_sku,
		NULL AS price, 
		NULL AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM [view_RawData_SAL_Photos] WHERE Filename LIKE '%' + LEFT(a.ItemNumber,6) + '%' + SUBSTRING(a.ItemNumber,7,3) + '%1.jpg') AS image,
		a.ColorName AS image_label,
		dbo.getUrlKey(dbo.getIBName(a.StyleName), 'Salomon', a.ColorName + ' - ' + SUBSTRING(a.ItemNumber,10,3)) AS url_key,
		'Supplier'
FROM tbl_RawData_F12_SAL AS a

--DELETE FROM tbl_LoadFile_F12_SAL WHERE name IS NULL OR image IS NULL

INSERT INTO tbl_LoadFile_F12_SAL (
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
	visibility
)
SELECT DISTINCT
	   dbo.getMagentoConfigurableSKU('IB', LEFT(a.ItemNumber,6)) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		LEFT(a.ItemNumber,6) AS vendor_product_id,
		'Uncategorized',
		dbo.getIBName(a.StyleName) AS name,
		CASE WHEN a.ColorGender1 = 'Womens' THEN 'Women' WHEN a.ColorGender1 = 'Mens' THEN 'Men' WHEN a.ColorGender1 = 'Girls' THEN 'Girl' WHEN a.ColorGender1 = 'Boys' THEN 'Boy' END AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_SAL WHERE vendor_product_id = LEFT(a.ItemNumber,6)) AS price, -- the price for the configurable is always the highest-priced simple
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_SAL WHERE vendor_product_id = LEFT(a.ItemNumber,6)) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(dbo.getIBName(a.StyleName), 'Salomon', '') AS url_key,
		'Catalog, Search' AS visibility
FROM tbl_RawData_F12_SAL AS a

UPDATE a SET
	weather = dbo.getIBWeather(a.vendor_product_id),
	activities = dbo.getIBActivity(a.vendor_product_id),
	description = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 EnglishDescription FROM tbl_RawData_F12_SAL WHERE ItemNumber LIKE a.vendor_product_id + '%')),
	fit = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 FitType FROM tbl_RawData_F12_SAL WHERE ItemNumber LIKE a.vendor_product_id + '%')),
	layering = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 LayerType FROM tbl_RawData_F12_SAL WHERE ItemNumber LIKE a.vendor_product_id + '%')),
	features = dbo.getIBFeatures(a.vendor_product_id),
	fabric = dbo.getIBFabric(a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_SAL WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_SAL WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	media_gallery = dbo.getIBMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getIBAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_SAL AS a
WHERE type = 'configurable'

--DELETE FROM tbl_LoadFile_F12_SAL WHERE image IS NULL AND type = 'configurable'

UPDATE tbl_LoadFile_F12_SAL SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_SAL SET image = '+' + image WHERE image IS NOT NULL

SELECT * FROM tbl_LoadFile_F12_SAL WHERE type = 'configurable' ORDER BY name, type DESC

/* Next steps?

1. Use Magmi to load ONLY NEW SKUs so we don't overwrite existing categories to Uncategorized
2. Then move all new products into correct categories
3. Then use Magmi to load ONLY UPDATED skus but don't include the categories column so we don't overwrite it

*/