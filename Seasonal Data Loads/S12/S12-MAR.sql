USE [LiveOutThere]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MAR_Additional]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MAR_Additional](
	StyleNumber [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Associated [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleName [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Price [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PositioningStatement [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Colors [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Weight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Materials [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	AllFeatures [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature1 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature2 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature3 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature4 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature5 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature6 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature7 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Feature8 [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MinimumWeight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	MaximumWeight [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FloorArea [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	VestibuleArea [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	PackedSize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Volume [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeRange [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeOnShoulder [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeOnHip [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	SizeOnFoot [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

-- The data for this table comes from 'fall_2011_upc_label.xls'
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MAR](
	StyleNumber [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	StyleDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Size [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	UPCCode [nvarchar](128) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	ColorNumber [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	ColorDescription [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	WholesalePrice [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	RetailPrice [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FrenchColor [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	FrenchSize [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	Distribution [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_tbl_RawData_S12_MAR_UPC_Inline] PRIMARY KEY CLUSTERED 
(
	[UPCCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MAR_Price]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MAR_Price](
	[Product] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Style] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Cost] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_RawData_S12_MAR_Photos]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
CREATE TABLE [dbo].[tbl_RawData_S12_MAR_Photos] (
	[Filename] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Caption] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_S12_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_S12_MAR]

CREATE TABLE [dbo].[tbl_LoadFile_S12_MAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_visibility]  DEFAULT ('Nowhere'),
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
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_season]  DEFAULT (N'Spring/Summer 2012'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_manufacturer]  DEFAULT ('Marmot'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_qty]  DEFAULT ((10)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_S12_MAR_is_in_stock]  DEFAULT ((1)),
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
 CONSTRAINT [PK_tbl_LoadFile_S12_MAR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_S12_MAR] ON [dbo].[tbl_LoadFile_S12_MAR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/*
DECLARE @sku varchar(255), @color varchar(255),  @colordescription varchar(255)
DECLARE c1 CURSOR FOR
SELECT DISTINCT stylenumber, colornumber, colordescription FROM tbl_RawData_S12_MAR

OPEN c1

FETCH NEXT FROM c1 INTO @sku, @color, @colordescription
WHILE @@FETCH_STATUS = 0 BEGIN
	UPDATE tbl_RawData_S12_MAR_Photos SET color = @colordescription WHERE filename LIKE '%' + @sku + '_' + @color + '%'
	FETCH NEXT FROM c1 INTO @sku, @color, @colordescription
END

CLOSE c1
DEALLOCATE c1

UPDATE tbl_RawData_S12_MAR_Photos SET caption = 'Top' WHERE filename LIKE '%top%'
UPDATE tbl_RawData_S12_MAR_Photos SET caption = 'Back' WHERE filename LIKE '%back%'
UPDATE tbl_RawData_S12_MAR_Photos SET caption = 'Front' WHERE filename LIKE '%front%'
UPDATE tbl_RawData_S12_MAR_Photos SET caption = 'Sole' WHERE filename LIKE '%sole%'
UPDATE tbl_RawData_S12_MAR_Photos SET caption = 'Fly' WHERE filename LIKE '%fly%'
*/

INSERT INTO tbl_LoadFile_S12_MAR (
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
SELECT  dbo.getMagentoSimpleSKU('MAR', a.StyleNumber, a.ColorNumber, a.Size) AS sku,
		a.StyleNumber AS vendor_product_id,
		dbo.getMARName(a.StyleDescription) AS productname,
		dbo.getMARGenderFromName(a.StyleDescription) AS gender,
		a.ColorDescription AS choose_color,
		a.Size AS choose_size,
		a.ColorNumber AS vendor_color_code,
		a.Size AS vendor_size_code,
		a.UPCCode AS vendor_sku,
		CAST(b.Price AS float) - 0.01 AS price,
		CAST(b.Cost AS float) AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 filename FROM tbl_RawData_S12_MAR_Photos WHERE filename LIKE '%' + a.StyleNumber + '%' + a.ColorNumber + '%' AND filename NOT LIKE '%[_]back%' ) AS image,
		(SELECT TOP 1 color FROM tbl_RawData_S12_MAR_Photos WHERE filename LIKE '%' + a.StyleNumber + '%' + a.ColorNumber + '%' AND filename NOT LIKE '%[_]back%' ) AS image_label,
		'' AS hs_tariff,
		'' AS origin,
		c.Weight AS weight
FROM tbl_RawData_S12_MAR AS a
INNER JOIN tbl_RawData_S12_MAR_Price AS b ON a.StyleNumber = b.Style
LEFT OUTER JOIN tbl_RawData_S12_MAR_Additional AS c ON a.StyleNumber = c.StyleNumber

INSERT INTO tbl_LoadFile_S12_MAR (
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
		dbo.getMagentoConfigurableSKU('MAR', a.StyleNumber) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.StyleNumber AS model,
		d.categories AS categories,
		dbo.getMARName(a.StyleDescription) AS name,
		dbo.getMARGenderFromName(a.StyleDescription) AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_S12_MAR WHERE vendor_product_id = a.StyleNumber) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_S12_MAR WHERE vendor_product_id = a.StyleNumber) AS cost,
		c.PositioningStatement AS short_description,
		'&nbsp;' AS description,
		'1' AS has_options,
		'configurable' AS type,
		url_key,
		'Catalog, Search' AS visibility,
		d.videos,
		c.Weight
FROM tbl_RawData_S12_MAR AS a
INNER JOIN tbl_RawData_S12_MAR_Price AS b ON a.StyleNumber = b.Style
LEFT OUTER JOIN tbl_RawData_S12_MAR_Additional AS c ON a.StyleNumber = c.StyleNumber
LEFT OUTER JOIN tbl_RawData_F11_Magento_Products AS d ON a.StyleNumber = d.style

UPDATE a SET
	super_attribute_pricing = dbo.getSuperAttributePricing(a.vendor_product_id),
	features = dbo.toHTMLEntities((SELECT DISTINCT AllFeatures FROM tbl_RawData_S12_MAR_Additional WHERE StyleNumber = a.vendor_product_id)),
	fabric = dbo.toHTMLEntities((SELECT DISTINCT Materials FROM tbl_RawData_S12_MAR_Additional WHERE StyleNumber = a.vendor_product_id)),
	image = (SELECT TOP 1 filename FROM tbl_RawData_S12_MAR_Photos WHERE Filename LIKE '%' + a.vendor_product_id + '%' AND filename NOT LIKE '%[_]back%' ORDER BY Color DESC),
	image_label = (SELECT TOP 1 Color + CASE WHEN Caption <> '' THEN ' (' + Caption + ')' ELSE '' END FROM tbl_RawData_S12_MAR_Photos WHERE Filename LIKE '%' + a.vendor_product_id + '%' AND filename NOT LIKE '%[_]back%' ORDER BY Color DESC),
	media_gallery = dbo.getMARMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getAssociatedProducts(a.vendor_product_id),
	us_skus = dbo.getUpsellProducts(a.name),
	xre_skus = dbo.getRelatedProducts(a.name, 1, a.sku)
FROM tbl_LoadFile_S12_MAR AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_S12_MAR SET image = 'mar.jpg' WHERE (image IS NULL or image = '') AND type = 'configurable'

UPDATE tbl_LoadFile_S12_MAR SET thumbnail = image, small_image = image WHERE image IS NOT NULL

UPDATE tbl_LoadFile_S12_MAR SET image_label = dbo.toHTMLEntities('Sorry, we don''t have an image for this product.') WHERE image = 'mar.jpg'

UPDATE a SET
sku = dbo.[getMARCleanSKU](sku)
FROM tbl_LoadFile_S12_MAR AS a
WHERE sku LIKE '% %'

UPDATE a SET
simples_skus = dbo.[getMARCleanSKU](simples_skus)
FROM tbl_LoadFile_S12_MAR AS a
WHERE simples_skus LIKE '% %'