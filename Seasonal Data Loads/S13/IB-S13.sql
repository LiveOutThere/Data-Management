USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS13_IB]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS13_IB]

CREATE TABLE [dbo].[tbl_LoadFile_SS13_IB](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_visibility]  DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_season]  DEFAULT (N'SS13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_manufacturer]  DEFAULT ('Icebreaker'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_IB_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS13_IB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS13_IB] ON [dbo].[tbl_LoadFile_SS13_IB] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_SS13_IB (
		sku,
		vendor_product_id,
		[name],
		department,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		[type],
		image_label,
		url_key
)
SELECT  dbo.getMagentoSimpleSKU('SS13A-IB', a.Style, a.Colour, a.Size) AS sku,
		a.Style AS vendor_product_id,
		dbo.getIBName(a.[Style Description]) AS name,
		a.Sex AS gender,
		a.[Colour description] AS choose_color,
		REPLACE(a.Size,'OSO','O/S') AS choose_size,
		a.Colour AS vendor_color_code,
		a.Size AS vendor_size_code,
		a.[Sales Barcode] AS vendor_sku,
		CAST(a.[Retail Price] AS float) AS price,
		a.[WS price] AS cost,
		0 AS has_options,
		'simple' AS type,
		a.[Colour description] AS image_label,
		dbo.getUrlKey(dbo.getIBName(a.[Style Description]), 'Icebreaker', a.[Colour description] + ' - ' + REPLACE(a.Size,'OSO','O/S'),a.Sex) + '-ss13a' AS url_key
FROM tbl_RawData_SS13_IB_UPC AS a

UPDATE a SET
image = b.Filename
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE '%' + UPPER(a.vendor_product_id + a.vendor_color_code) + '%'
AND b.Brand = 'IB'
WHERE a.type = 'simple'

UPDATE a SET
image = b.Filename
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE '%' + LOWER(a.vendor_product_id + a.vendor_color_code) + '%'
AND b.Brand = 'IB'
WHERE a.type = 'simple'

UPDATE a SET
a.image = b.image
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_F12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.image IS NULL

UPDATE a SET
a.image = b.image
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_S12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.image IS NULL

UPDATE tbl_LoadFile_SS13_IB
SET name = CASE WHEN vendor_product_id IN('100615','100617','100654','100656','100616','100618','100655','100657','100627','100666','100633','100673','100619','100638','100658','100674','100620','100659','100621','100660','100650','100610','100966','100967','100634','100675','100635','100676','100639','100678','100640','100679','100641','100680','100642','100976','100681','100978','100643','100980','100683','100981','100644','100684','100645','100685','100625','100664','100626','100743','100665','100990','100677','100652','100653','100637','100636','100613','100648','100649') THEN name + ' (Pack of 6)' ELSE name END

INSERT INTO tbl_LoadFile_SS13_IB (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	department,
	price,
	cost,
	has_options,
	type,
	url_key,
	meta_title,
	visibility,
	merchandise_priority,
	manage_stock,
	use_config_manage_stock
)
SELECT DISTINCT
	   dbo.getMagentoConfigurableSKU('SS13A-IB', a.vendor_product_id) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.vendor_product_id AS vendor_product_id,
		'Uncategorized' AS categories,
		a.name AS name,
		a.department AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_SS13_IB WHERE vendor_product_id = a.vendor_product_id) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_SS13_IB WHERE vendor_product_id = a.vendor_product_id) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(a.name, 'Icebreaker', '',a.department) + '-ss13a' AS url_key,
		'Icebreaker ' + a.name + CASE WHEN a.department = 'Men' THEN ' - Men''s' WHEN a.department = 'Women' THEN ' - Women''s' WHEN a.department = 'Men|Women' THEN ' - Unisex' WHEN a.department = 'Boy' THEN ' - Boy''s' WHEN a.department = 'Girl' THEN ' - Girl''s' WHEN a.department = 'Boy|Girl' THEN ' - Kids''' END AS meta_title,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		0 AS use_config_manage_stock
FROM tbl_LoadFile_SS13_IB AS a

UPDATE a SET
	categories = CASE WHEN (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id) IS NULL THEN 'Uncategorized' ELSE (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id) END,
	description = (SELECT TOP 1 Description FROM tbl_RawData_SS13_IB_Marketing WHERE Style = a.vendor_product_id),
	care_instructions = (SELECT TOP 1 Care FROM tbl_RawData_SS13_IB_Marketing WHERE Style = a.vendor_product_id),
	fabric = (SELECT TOP 1 Fabric FROM tbl_RawData_SS13_IB_Marketing WHERE Style = a.vendor_product_id),
	simples_skus = dbo.getIBAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_SS13_IB AS a
WHERE type = 'configurable'
GO

UPDATE a SET
a.features = b.features
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_F12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.features IS NULL

UPDATE a SET
a.features = b.features
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_S12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.features IS NULL

UPDATE a SET
a.description = b.description
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_S12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.description IS NULL

UPDATE a SET
a.description = b.description
FROM tbl_LoadFile_SS13_IB AS a
INNER JOIN tbl_LoadFile_F12_IB AS b
ON b.vendor_sku = a.vendor_sku
WHERE a.type = 'simple' AND a.description IS NULL

UPDATE tbl_LoadFile_SS13_IB SET categories = CASE WHEN categories <> 'Uncategorized' THEN categories + ';;' + manufacturer + '/' + REPLACE(categories,';;',';;' + manufacturer + '/') ELSE 'Uncategorized' END
UPDATE tbl_LoadFile_SS13_IB SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_SS13_IB SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_SS13_IB SET thumbnail = image, small_image = image
GO

CREATE VIEW [dbo].[view_LoadFile_SS13_IB]
AS
SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail,
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season_id"' AS season_id, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"videos"' AS videos, '"weight"' AS weight, '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock, '"never_backorder"' AS never_backorder, '"use_config_manage_stock"' AS use_config_manage_stock, '"use_config_backorders"' AS use_config_backorders, '"meta_title"' AS meta_title
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.meta_title,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_SS13_IB AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS13_IB" queryout "C:\Data\Shared\SS13IB.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS13_IB