USE [LOT_Inventory]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
/*
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OSP]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_OSP](
	Style [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPC  [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Model [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Color [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeightImperial [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WeightMetric [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VolumeImperial [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VolumeMetric [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OSP_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_OSP_Additional](
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Color [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Category [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Description [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Colors [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fabric1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fabric2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fabric3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Fabric4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature8 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature9 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	Feature21 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature8 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature9 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature10 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature11 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature12 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature13 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UniqueFeature14 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

DELETE FROM [tbl_RawData_S12_OSP_Additional] WHERE Description = '' OR Description IS NULL

UPDATE tbl_RawData_S12_OSP_Additional SET features = '', fabric = ''

DECLARE @column_name varchar(255), @productid varchar(255), @content varchar(1024)
DECLARE c CURSOR FOR SELECT DISTINCT StyleName FROM tbl_RawData_S12_OSP_Additional
OPEN c

FETCH NEXT FROM c INTO @productid
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LiveOutThere.dbo.sp_columns ''tbl_RawData_S12_OSP_Additional''') AS tbl
	OPEN c1

	FETCH NEXT FROM c1 INTO @column_name
	WHILE @@FETCH_STATUS = 0 BEGIN

		IF (@column_name LIKE 'Fabric%' AND @column_name <> 'Fabric') BEGIN
			EXEC ('UPDATE tbl_RawData_S12_OSP_Additional SET fabric = fabric + ISNULL([' + @column_name + '],'''') + ''|'' WHERE StyleName = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		IF (@column_name LIKE '%Feature%' AND @column_name <> 'Features') BEGIN
			EXEC ('UPDATE tbl_RawData_S12_OSP_Additional SET features = features + ISNULL([' + @column_name + '],'''') + ''|'' WHERE StyleName = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		FETCH NEXT FROM c1 INTO @column_name
	END

	CLOSE c1
	DEALLOCATE c1

	UPDATE tbl_RawData_S12_OSP_Additional SET fabric = dbo.toHTMLEntities(fabric), features = dbo.toHTMLEntities(features) WHERE StyleName = @productid

	FETCH NEXT FROM c INTO @productid
END

CLOSE c
DEALLOCATE c

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OSP_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_OSP_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_OSP_Prices]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_OSP_Prices] (
	[StyleName] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MSRP] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_OSP]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_OSP]

CREATE TABLE [dbo].[tbl_LoadFile_S12_OSP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_manufacturer]  DEFAULT ('Osprey'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_OSP_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_OSP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_OSP] ON [dbo].[tbl_LoadFile_S12_OSP] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_S12_OSP (
		sku,
		vendor_product_id,
		[name],
		gender,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		short_description,
		price,
		cost,
		has_options,
		[type],
		[image],
		image_label,
		hs_tariff,
		origin,
		volume,
		weight
)
SELECT  dbo.getMagentoSimpleSKU('OSP', LEFT(a.Style,6), RIGHT(a.Style,3), a.Size) AS sku,
		LEFT(a.Style,6) AS vendor_product_id,
		a.Model AS name,
		'Women|Men' AS gender,
		a.Color AS choose_color,
		a.Size AS choose_size,
		RIGHT(a.Style,3) AS vendor_color_code,
		a.Size AS vendor_size_code,
		a.UPC AS vendor_sku,
		b.Category AS short_description,
		CAST(c.MSRP AS float) - 0.01 AS price,
		c.Cost AS float,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM tbl_RawData_S12_OSP_Photos WHERE filename LIKE '%' + REPLACE(a.Model,' ','%') + '%' + REPLACE(a.Color,' ','%') + '%') AS image,
		CASE WHEN (SELECT TOP 1 Filename FROM tbl_RawData_S12_OSP_Photos WHERE filename LIKE '%' + REPLACE(a.Model,' ','%') + '%' + REPLACE(a.Color,' ','%') + '%') IS NOT NULL THEN a.Color END AS image_label,
		'' AS hs_tariff,
		'' AS origin,
		a.VolumeMetric + ' / ' + a.VolumeImperial AS volume,
		a.WeightMetric + ' / ' + a.WeightImperial AS weight
FROM tbl_RawData_S12_OSP AS a
LEFT OUTER JOIN tbl_RawData_S12_OSP_Additional AS b ON LEFT(a.Style,6) = b.Style
LEFT OUTER JOIN tbl_RawData_S12_OSP_Prices AS c ON LEFT(a.Style,6) = c.Style

INSERT INTO tbl_LoadFile_S12_OSP (
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
	volume,
	weight
)
SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('OSP', LEFT(a.Style,6)) AS sku,
		'choose_color,choose_size' AS config_attributes,
		LEFT(a.Style,6) AS vendor_product_id,
		c.categories AS categories,
		a.Model AS name,
		'Women|Men' AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_OSP WHERE vendor_product_id = LEFT(a.Style,6)) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_OSP WHERE vendor_product_id = LEFT(a.Style,6)) AS cost,
		b.Category AS short_description,
		b.Description AS description,
		'1' AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		c.videos,
		dbo.getOSPVolume(LEFT(a.Style,6)) AS volume,
		dbo.getOSPWeight(LEFT(a.Style,6)) AS weight
FROM tbl_RawData_S12_OSP AS a
LEFT OUTER JOIN tbl_RawData_S12_OSP_Additional AS b ON LEFT(a.Style,6) = b.Style
LEFT OUTER JOIN tbl_RawData_F11_Magento_Products AS c ON LEFT(a.Style,6) = c.style

UPDATE a SET
	features = (SELECT DISTINCT TOP 1 features FROM tbl_RawData_S12_OSP_Additional WHERE Style = a.vendor_product_id),
	fabric = (SELECT DISTINCT TOP 1 fabric FROM tbl_RawData_S12_OSP_Additional WHERE Style = a.vendor_product_id),
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_OSP_Photos WHERE Filename LIKE '%' + REPLACE(a.name,' ','%') + '%' ORDER BY Color DESC),
	image_label = (SELECT TOP 1 color FROM tbl_RawData_S12_OSP_Photos WHERE Filename LIKE '%' + REPLACE(a.name,' ','%') + '%' ORDER BY Color DESC),
	media_gallery = dbo.getOSPMediaGallery(a.name),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_OSP AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_OSP SET image = 'osp.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_OSP SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_OSP SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'osp.jpg'

DELETE FROM tbl_LoadFile_S12_OSP WHERE price IS NULL

UPDATE tbl_LoadFile_S12_OSP SET categories = 'Backpacks' WHERE type = 'configurable' AND categories IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM view_RawData_OSP_Photos WHERE filename LIKE '%' + dbo.getOSPMediaName(a.name) + '%' AND Color = REPLACE(a.choose_color,'Jet ','')),
	image_label = (SELECT TOP 1 Color FROM view_RawData_OSP_Photos WHERE filename LIKE '%' + dbo.getOSPMediaName(a.name) + '%' + REPLACE(a.choose_color,' ','%') + '%' AND Color = REPLACE(a.choose_color,'Jet ',''))
FROM tbl_LoadFile_S12_OSP AS a
WHERE type = 'simple' AND image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM view_RawData_OSP_Photos WHERE filename LIKE '%' + dbo.getOSPMediaName(a.name) + '%'),
	image_label =  (SELECT TOP 1 Color FROM view_RawData_OSP_Photos WHERE filename LIKE '%' + dbo.getOSPMediaName(a.name) + '%'),
	media_gallery = dbo.getOSPMediaGallery(dbo.getOSPMediaName(a.name))
FROM tbl_LoadFile_S12_OSP AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_OSP SET small_image = image, thumbnail = image WHERE image IS NOT NULL

UPDATE a SET
	categories = (SELECT Category FROM tbl_RawData_F11_OSP_Additional WHERE Product = a.name),
	features = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(Features,'<ul class=''features''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_F11_OSP_Additional WHERE Product = a.name),
	fabric = (SELECT REPLACE(REPLACE(REPLACE(REPLACE(Features,'<ul class=''materials''>',''),'<li>',''),'</li>','|'),'</ul>','') FROM tbl_RawData_F11_OSP_Additional WHERE Product = a.name)
FROM tbl_LoadFile_S12_OSP AS a
WHERE type = 'configurable' AND (features IS NULL OR features = '')
*/