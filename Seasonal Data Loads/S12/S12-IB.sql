USE [LiveOutThere]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_IB_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_IB_Photos] (
	[Filename] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_IB_Prices]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_IB_Prices] (
	[Currency] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SKU] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Retail] [varchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_IB_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_IB_Additional](
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WebsiteColor1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorGender1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorGender2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductCat1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductSubCat1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductCat2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductSubCat2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductCat3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductSubCat3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activity1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activity2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activity3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activity4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Activity5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Collection1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Collection2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BoysCategory1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	BoysCategory2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GirlsCategory1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GirlsCategory2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Layer [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fit [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeatherCondition1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeatherCondition2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeatherCondition3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeatherCondition4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeatherCondition5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Design [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	HeightSocks [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CushioningSocks [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FabricWeight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FabricType [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CountryOfOrigin [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DescriptionEnglish [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FeaturesEnglish [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DescriptionFrench [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FeaturesFrench [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	DescriptionGerman [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FeaturesGerman [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PhotoFront [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PhotoBack [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_IB_Range]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_IB_Range](
	ShortSKU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SKU [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gender [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ProductGroupCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CategoryCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	RangeDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColourName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_IB]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_IB](
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleColor [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleColorSize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Season [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	English [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	French [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	German [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_IB]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_IB]

CREATE TABLE [dbo].[tbl_LoadFile_S12_IB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_manufacturer]  DEFAULT ('Icebreaker'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_IB_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_IB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_IB] ON [dbo].[tbl_LoadFile_S12_IB] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


UPDATE tbl_RawData_S12_IB_Photos SET Color = NULL

INSERT INTO tbl_LoadFile_S12_IB (
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
SELECT  dbo.getMagentoSimpleSKU('IB', a.StyleCode, a.ColorCode, dbo.getIBSizeCode(b.StyleColorSize, a.StyleCode, a.ColorCode)) AS sku,
		a.StyleCode AS vendor_product_id,
		dbo.getIBName(c.Description) AS name,
		CASE WHEN c.Gender = 'Female' THEN 'Women''s' WHEN c.Gender = 'Male' THEN 'Men''s' WHEN c.Gender = 'Junior' THEN 'Boy''s,Girl''s' ELSE 'Women''s,Men''s' END AS gender,
		c.ColourName AS choose_color,
		dbo.getIBSizeCode(b.StyleColorSize, a.StyleCode, a.ColorCode) AS choose_size,
		a.ColorCode AS vendor_color_code,
		dbo.getIBSizeCode(b.StyleColorSize, a.StyleCode, a.ColorCode) AS vendor_size_code,
		b.UPC AS vendor_sku,
		d.Retail AS price,
		d.Price AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 filename FROM tbl_RawData_S12_IB_Photos WHERE filename LIKE '%' + a.StyleCode + a.ColorCode + '%' ORDER BY Filename) AS image,
		c.ColourName AS image_label,
		'' AS hs_tariff,
		a.CountryOfOrigin,
		'' AS weight
FROM tbl_RawData_S12_IB_Additional AS a
INNER JOIN tbl_RawData_S12_IB AS b ON b.StyleColor = a.StyleCode + a.ColorCode
INNER JOIN tbl_RawData_S12_IB_Range AS c ON b.StyleColor = c.SKU
LEFT JOIN tbl_RawData_S12_IB_Prices AS d ON b.StyleColorSize = d.SKU

INSERT INTO tbl_LoadFile_S12_IB (
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
	   dbo.getMagentoConfigurableSKU('IB', a.StyleCode) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.StyleCode AS vendor_product_id,
		CASE WHEN b.categories <> '' THEN b.categories + ';;' ELSE '' END + dbo.getIBCategory(a.StyleCode),
		dbo.getIBName(c.Description) AS name,
		CASE WHEN d.Gender = 'Female' THEN 'Women''s' WHEN d.Gender = 'Male' THEN 'Men''s' WHEN d.Gender = 'Junior' THEN 'Boy''s,Girl''s' ELSE 'Women''s,Men''s' END AS gender,
		e.Retail AS price,
		e.Price AS cost,
		'1' AS has_options,
		'configurable' AS type,
		b.url_key,
		'Catalog, Search' AS visibility,
		b.videos,
		a.CountryOfOrigin,
		'' AS weight
FROM tbl_RawData_S12_IB_Additional AS a
LEFT JOIN tbl_RawData_F11_Magento_Products AS b ON a.StyleCode = b.Style
INNER JOIN tbl_RawData_S12_IB AS c ON c.StyleColor = a.StyleCode + a.ColorCode
INNER JOIN tbl_RawData_S12_IB_Range AS d ON c.StyleColor = d.SKU
LEFT JOIN tbl_RawData_S12_IB_Prices AS e ON c.StyleColorSize = e.SKU
ORDER BY a.StyleCode

UPDATE a SET
	weather = dbo.getIBWeather(a.vendor_product_id),
	activities = dbo.getIBActivity(a.vendor_product_id),
	short_description = dbo.toHTMLEntities(dbo.getIBShortDescription((SELECT DISTINCT English + ',' + HeightSocks + ',' + CushioningSocks + ' cushioning' FROM tbl_RawData_S12_IB AS b INNER JOIN tbl_RawData_S12_IB_Additional AS c ON b.StyleColor = c.StyleCode + c.ColorCode WHERE Style = a.vendor_product_id))),
	description = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 DescriptionEnglish FROM tbl_RawData_S12_IB_Additional WHERE StyleCode = a.vendor_product_id)),
	fit = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 Fit FROM tbl_RawData_S12_IB_Additional WHERE StyleCode = a.vendor_product_id)),
	layering = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 Layer FROM tbl_RawData_S12_IB_Additional WHERE StyleCode = a.vendor_product_id)),
	features = dbo.getIBFeatures(a.vendor_product_id),
	fabric = dbo.getIBFabric(a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_IB WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_IB WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	media_gallery = dbo.getIBMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getIBProductsInCategory(a.vendor_product_id),
	xre_skus = dbo.getIBProductsInCollection(a.vendor_product_id)
FROM tbl_LoadFile_S12_IB AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_IB SET image = 'ib.jpg' WHERE (image IS NULL or image = '') AND type ='configurable'

UPDATE tbl_LoadFile_S12_IB SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_IB SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'ib.jpg'

UPDATE tbl_LoadFile_S12_IB SET name = LTRIM(RTRIM(name))