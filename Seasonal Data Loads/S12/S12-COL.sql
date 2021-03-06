USE [LiveOutThere]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/*
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_COL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_COL](
	Name [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MSRP [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GenderCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	GenderName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorSize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Season [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Brand [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_COL_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_COL_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_COL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_COL]

CREATE TABLE [dbo].[tbl_LoadFile_S12_COL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_visibility]  DEFAULT ('Nowhere'),
	[image] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[media_gallery] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_manufacturer]  DEFAULT ('Columbia'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_COL_is_in_stock]  DEFAULT ((1)),
	[simples_skus] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hs_tariff] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[origin] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[us_skus] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cs_skus] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xre_skus] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
 CONSTRAINT [PK_tbl_LoadFile_S12_COL] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_COL] ON [dbo].[tbl_LoadFile_S12_COL] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/*
UPDATE tbl_RawData_S12_COL SET 
Name = LTRIM(RTRIM(Name)),
MSRP = LTRIM(RTRIM(MSRP)),
Cost = LTRIM(RTRIM(Cost)),
GenderCode = LTRIM(RTRIM(GenderCode)),
GenderName = LTRIM(RTRIM(GenderName)),
ColorName = LTRIM(RTRIM(ColorName)),
ColorSize = LTRIM(RTRIM(ColorSize)),
UPC = LTRIM(RTRIM(RIGHT(UPC,LEN(UPC)-1))),
Style = LTRIM(RTRIM(Style)),
ColorCode = LTRIM(RTRIM(RIGHT(ColorCode,LEN(ColorCode)-1))),
SizeCode = LTRIM(RTRIM(SizeCode)),
Season = LTRIM(RTRIM(Season)),
Brand = LTRIM(RTRIM(Brand)),
Description = LTRIM(RTRIM(Description))

UPDATE a SET Color = (SELECT DISTINCT TOP 1 ColorName FROM tbl_RawData_S12_COL WHERE ColorCode = SUBSTRING(a.Filename, 12, 3))
FROM tbl_RawData_S12_COL_Photos AS a
WHERE Color IS NULL

UPDATE tbl_RawData_S12_COL_Photos SET Caption = 'Back' WHERE (Filename LIKE '%[_]b.jpg')
*/

INSERT INTO tbl_LoadFile_S12_COL (
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
SELECT  dbo.getMagentoSimpleSKU('COL', dbo.getNameHash(dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName))), a.ColorCode, a.SizeCode) AS sku,
		'' AS vendor_product_id,
		dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName)) AS name,
		dbo.getCOLGender(a.GenderName) AS gender,
		dbo.ProperCase(a.ColorName) AS choose_color,
		REPLACE(a.ColorSize, a.ColorName + ' - ', '') AS choose_size,
		a.ColorCode AS vendor_color_code,
		REPLACE(a.ColorSize, a.ColorName + ' - ', '') AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(a.MSRP AS float) - 0.01 AS price,
		a.Cost AS float,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM tbl_RawData_S12_COL_Photos WHERE filename LIKE 'S12[_]' + a.Style + '[_]' + a.ColorCode + '%' AND Caption IS NULL) AS image,
		(SELECT TOP 1 color FROM tbl_RawData_S12_COL_Photos WHERE filename LIKE 'S12[_]' + a.Style + '[_]' + a.ColorCode + '%' AND Caption IS NULL) AS image_label,
		'' AS hs_tariff,
		'' AS origin,
		'' AS weight
FROM tbl_RawData_S12_COL AS a

INSERT INTO tbl_LoadFile_S12_COL (
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
		dbo.getMagentoConfigurableSKU('COL', dbo.getNameHash(dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName)))) AS sku,
		'choose_color,choose_size' AS config_attributes,
		'' AS model,
		b.categories AS categories,
		dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName)) AS name,
		dbo.getCOLGender(a.GenderName) AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_COL WHERE sku LIKE '%' + dbo.getNameHash(dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName))) + '%') AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_COL WHERE sku LIKE '%' + dbo.getNameHash(dbo.getCOLName(a.Name, dbo.getCOLGender(a.GenderName))) + '%') AS cost,
		a.Description AS short_description,
		'&nbsp;' AS description,
		'1' AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		b.videos,
		'' AS weight
FROM tbl_RawData_S12_COL AS a
LEFT OUTER JOIN tbl_RawData_F11_Magento_Products AS b ON a.Style = b.Style

-- Need to fill this in after the SELECT DISTINCT, otherwise it's not distinct!
UPDATE a SET vendor_product_id = (SELECT Style FROM tbl_RawData_S12_COL WHERE UPC = a.vendor_sku)
FROM tbl_LoadFile_S12_COL AS a
WHERE type = 'simple'

UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_COL WHERE type = 'simple' AND image <> '' AND sku LIKE '%' + dbo.getNameHash(a.name) + '%'),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_COL WHERE type = 'simple' AND image <> '' AND sku LIKE '%' + dbo.getNameHash(a.name) + '%'),
	media_gallery = dbo.getCOLMediaGallery(a.name),
	simples_skus = dbo.getCOLAssociatedProducts(a.name)/*,
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 2, a.sku)*/
FROM tbl_LoadFile_S12_COL AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_COL SET image = 'col.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_COL SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_COL SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'col.jpg'

--Finally, use this query to find and eliminate duplicate configurables:

SELECT *
FROM         tbl_LoadFile_S12_COL
WHERE     (type = 'configurable') AND (name IN
                          (SELECT     name
                            FROM          tbl_LoadFile_S12_COL AS a
                            WHERE      (type = 'configurable') AND
                                                       ((SELECT     COUNT(*) AS Expr1
                                                           FROM         tbl_LoadFile_S12_COL AS tbl_LoadFile_S12_COL_1
                                                           WHERE     (name = a.name) AND (type = 'configurable')) > 1)))
ORDER BY name

UPDATE a SET image_label = (SELECT TOP 1 Color FROM view_RawData_COL_Photos WHERE filename LIKE '%' + a.vendor_product_id + '[_]' + a.vendor_color_code + '%' AND (Caption IS NULL OR Caption = 'Front') ORDER BY filename DESC)
FROM tbl_LoadFile_S12_COL AS a
WHERE image_label IS NULL AND type = 'simple'

UPDATE a SET image = (SELECT TOP 1 Filename FROM view_RawData_COL_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' AND (Caption IS NULL OR Caption = 'Front') ORDER BY filename DESC),
image_label = (SELECT TOP 1 Color FROM view_RawData_COL_Photos WHERE filename LIKE '%' + a.vendor_product_id + '%' AND (Caption IS NULL OR Caption = 'Front') ORDER BY filename DESC)
FROM tbl_LoadFile_S12_COL AS a
WHERE (image IS NULL OR image = 'col.jpg') AND type = 'configurable'

UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_COL WHERE type = 'simple' AND image <> '' AND sku LIKE '%' + dbo.getNameHash(a.name) + '%'),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_COL WHERE type = 'simple' AND image <> '' AND sku LIKE '%' + dbo.getNameHash(a.name) + '%'),
	media_gallery = dbo.getCOLMediaGallery(a.name)FROM tbl_LoadFile_S12_COL AS a
WHERE type = 'configurable'

UPDATE a SET
	name = dbo.getCOLName((SELECT TOP 1 name FROM tbl_RawData_S12_COL WHERE style = a.vendor_product_id), a.gender)
FROM tbl_LoadFile_S12_COL AS a
WHERE type = 'simple'

UPDATE a SET
	name = (SELECT TOP 1 name FROM tbl_LoadFile_S12_COL WHERE type = 'simple' AND sku = (SELECT TOP 1 s FROM dbo.Split(',',a.simples_skus) WHERE pn = 1))
FROM tbl_LoadFile_S12_COL AS a 
WHERE type = 'configurable'
*/