USE [LiveOutThere]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_DEU]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_DEU](
	Name [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MSRP [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Cost [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Gender [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ImageFile [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ImageCaption [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorSize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeCode [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Season [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ShortDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_DEU_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_DEU_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_DEU]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_DEU]

CREATE TABLE [dbo].[tbl_LoadFile_S12_DEU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_season]  DEFAULT (N'Fall/Winter 2011'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_manufacturer]  DEFAULT ('Deuter'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_DEU_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_DEU] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_DEU] ON [dbo].[tbl_LoadFile_S12_DEU] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_S12_DEU (
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
SELECT  dbo.getMagentoSimpleSKU('DEU', a.Style, a.ColorCode, a.SizeCode) AS sku,
		a.Style AS vendor_product_id,
		CASE WHEN a.Gender = 'Women''s' THEN 'Women''s ' WHEN a.Gender = 'Kids' THEN 'Youth ' ELSE '' END + a.Name AS productname,
		CASE WHEN a.Gender = 'Women''s' THEN 'Women''s' WHEN a.Gender = 'Kids' THEN 'Youth' ELSE 'Women''s,Men''s' END AS gender,
		REPLACE(dbo.ProperCase(ColorSize), '-', '/') AS choose_color,
		a.SizeCode AS choose_size,
		a.ColorCode AS vendor_color_code,
		a.SizeCode AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(a.MSRP AS float) - 0.01 AS price,
		a.Cost AS cost,
		0 AS has_options,
		'simple' AS type,
		ImageFile AS image,
		REPLACE(dbo.ProperCase(ColorSize), '-', '/') AS image_label,
		'' AS hs_tariff,
		'' AS origin,
		'' AS weight
FROM tbl_RawData_S12_DEU AS a

INSERT INTO tbl_LoadFile_S12_DEU (
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
		dbo.getMagentoConfigurableSKU('DEU', a.Style) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.Style AS model,
		'Deuter' AS categories,
		CASE WHEN a.Gender = 'Women''s' THEN 'Women''s ' WHEN a.Gender = 'Kids' THEN 'Youth ' ELSE '' END + a.Name AS productname,
		CASE WHEN a.Gender = 'Women''s' THEN 'Women''s' WHEN a.Gender = 'Kids' THEN 'Youth' ELSE 'Women''s,Men''s' END AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_DEU WHERE vendor_product_id = a.Style) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_DEU WHERE vendor_product_id = a.Style) AS cost,
		a.ShortDescription AS short_description,
		a.Description AS description,
		'1' AS has_options,
		'configurable' AS type,
		'' AS url_key,
		'Catalog, Search' AS visibility,
		'' AS videos,
		'' AS weight
FROM tbl_RawData_S12_DEU AS a

UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_DEU WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_S12_DEU WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	media_gallery = dbo.getDEUMediaGallery((SELECT TOP 1 image FROM tbl_LoadFile_S12_DEU WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC)),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_DEU AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_DEU SET image = 'deu.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_DEU SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_DEU SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'deu.jpg'