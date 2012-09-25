USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_OR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_OR]

CREATE TABLE [dbo].[tbl_LoadFile_F12_OR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_season]  DEFAULT (N'FW12'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_manufacturer]  DEFAULT ('Outdoor Research'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_is_in_stock]  DEFAULT ((0)),
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
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_OR_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_F12_OR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_OR] ON [dbo].[tbl_LoadFile_F12_OR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_F12_OR (
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
		url_key		
)
SELECT  dbo.getMagentoSimpleSKU('OR',a.[Style #],dbo.getORColorCode(a.[Color Code]),dbo.getORSize(a.Size)) AS sku,
		a.[Style #] AS vendor_product_id,
		REPLACE(dbo.ProperCase(LTRIM(ISNULL(a.Gender, '') + ' ' + a.[Style Name])),'''S ','''s ') AS name,
		LTRIM(REPLACE((dbo.ProperCase(ISNULL(a.Gender, 'Men|Women'))),'''S','')) AS Gender,
		dbo.ProperCase(a.[Color Name]) AS choose_color,
		dbo.getORSize(a.Size) AS choose_size,
		dbo.getORColorCode(a.[Color Code]) AS vendor_color_code,
		REPLACE((a.Size),'1SIZE','O/S') AS vendor_size_code,
		CAST(a.UPC AS bigint) AS vendor_sku,
		CAST(a.Retail AS float) -.01 AS price,
		a.Wholsale AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM [tbl_RawData_F12_OR_Photos] WHERE Filename LIKE '%' + CAST(a.[Style #] AS varchar(5)) + '%' + dbo.getORColorCode(a.[Color Code]) + '%') AS image,
		dbo.ProperCase(a.[Color Name]) AS image_label,
		dbo.getUrlKey(REPLACE(dbo.ProperCase(LTRIM(ISNULL(a.Gender, '') + ' ' + a.[Style Name])),'''S ','''s '),'Outdoor Research',dbo.ProperCase(a.[Color Name]) + ' - ' + REPLACE((a.Size),'1SIZE','O/S')) AS url_key
FROM tbl_RawData_F12_OR AS a

UPDATE tbl_LoadFile_F12_OR SET image = 'M-FerrosiPants-Black-55525_001.jpg' WHERE name LIKE '%ferrosi%' AND gender = 'Men' AND vendor_color_code = '001'
UPDATE tbl_LoadFile_F12_OR SET image = 'M-FerrosiPants-Pewter-55525_008.jpg' WHERE name LIKE '%ferrosi%' AND gender = 'Men' AND vendor_color_code = '008'
UPDATE tbl_LoadFile_F12_OR SET image = 'M-RadiantHybridJacket-PewterCharcoal-52355_048.jpg' WHERE vendor_product_id = '52355' AND vendor_color_code = '045'
UPDATE tbl_LoadFile_F12_OR SET image = 'M-SparkJacket-Evergreen-50945_285.jpg' WHERE vendor_product_id = '50945' AND vendor_color_code = '646'
UPDATE tbl_LoadFile_F12_OR SET image = 'W-CoupGloves-TrilliumBlack-73200_327.jpg' WHERE vendor_product_id = '73205' AND vendor_color_code = '327'--
UPDATE tbl_LoadFile_F12_OR SET image = 'M-AdrenalineMitts-AbyssChar-71080_176.jpg' WHERE vendor_product_id = '71080' AND vendor_color_code = '286'
UPDATE tbl_LoadFile_F12_OR SET image = 'ExosBeanie-Glacier-80550_980.jpg' WHERE vendor_product_id = '80550' AND vendor_color_code = '940'
UPDATE tbl_LoadFile_F12_OR SET image = 'lateral dry bag group36680_909.jpg' WHERE name LIKE 'Lateral Dry Bag%'
UPDATE tbl_LoadFile_F12_OR SET image = 'Flat-Dry-Bag-Group-Alpenglow-37480_81_82_562.jpg' WHERE name LIKE 'Flat Dry Bag%'
UPDATE tbl_LoadFile_F12_OR SET image = 'window dry bag group.jpg' WHERE name LIKE 'Window Dry Bag%'

DELETE FROM tbl_LoadFile_F12_OR WHERE name IS NULL OR image IS NULL OR price IS NULL

INSERT INTO tbl_LoadFile_F12_OR (
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
	merchandise_priority,
	manage_stock
)
SELECT DISTINCT
	    dbo.getMagentoConfigurableSKU('OR',a.[Style #]) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.[Style #] AS vendor_product_id,
		'Uncategorized' AS categories,
		REPLACE(dbo.ProperCase(LTRIM(ISNULL(a.Gender, '') + ' ' + a.[Style Name])),'''S ','''s ') AS name,
		LTRIM(REPLACE((dbo.ProperCase(ISNULL(a.Gender, 'Men|Women'))),'''S','')) AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_OR WHERE vendor_product_id = a.[Style #]) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_OR WHERE vendor_product_id = a.[Style #]) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(REPLACE(dbo.ProperCase(LTRIM(ISNULL(a.Gender, '') + ' ' + a.[Style Name])),'''S ','''s '), 'Outdoor Research', '') AS url_key,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock
FROM tbl_RawData_F12_OR AS a

UPDATE a SET
	fabric = dbo.getORFabric(a.vendor_product_id),
	description = dbo.getORLDesc(a.vendor_product_id),
	features = dbo.getORFeatures(a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_OR WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_OR WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	simples_skus = dbo.getORAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_OR AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getORMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_F12_OR AS a
WHERE type = 'configurable'

DELETE FROM tbl_LoadFile_F12_OR WHERE image IS NULL AND type = 'configurable'

UPDATE tbl_LoadFile_F12_OR SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_OR SET image = '+' + image WHERE image IS NOT NULL
GO

CREATE VIEW [dbo].[view_LoadFile_F12_OR]
AS
SELECT  '"magmi:delete"' AS magmi, '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"super_attribute_pricing"' AS super_attribute_pricing, '"videos"' AS videos, '"hs_tariff_id"' AS hs_tariff_id, '"origin"' AS origin, '"weight"' AS weight, '"us_skus"' AS us_skus, '"cs_skus"' AS cs_skus, '"xre_skus"' AS xre_skus, '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock   
UNION ALL
SELECT  '0', '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.short_description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_F12_OR AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_OR" queryout "C:\Data\Shared\OR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_F12_OR