USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_DEU]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_DEU]

CREATE TABLE [dbo].[tbl_LoadFile_F12_DEU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_season]  DEFAULT (N'FW12'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_manufacturer]  DEFAULT ('Deuter'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_is_in_stock]  DEFAULT ((0)),
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
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_DEU_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_F12_DEU] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_DEU] ON [dbo].[tbl_LoadFile_F12_DEU] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_F12_DEU (
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
SELECT  dbo.getMagentoSimpleSKU('FW12-DEU',a.Style,a.[Color Code],REPLACE(a.[Size Code],'OS','O/S')) AS sku,
		a.Style AS vendor_product_id,
		dbo.getDEUName(a.Name) AS name,
		dbo.getDEUGender(a.Name) AS gender,
		dbo.ProperCase(REPLACE(a.[Color & Size],'-','/')) AS choose_color,
		REPLACE(a.[Size Code],'OS','O/S') AS choose_size,
		a.[Color Code] AS vendor_color_code,
		REPLACE(a.[Size Code],'OS','O/S') AS vendor_size_code,
		CAST(a.UPC AS bigint) AS vendor_sku,
		CAST(a.MSRP AS float) -0.01 AS price,
		a.Cost AS cost,
		0 AS has_options,
		'simple' AS type,
		dbo.getDEUImage(a.Name,a.[Color Code]) AS image,
		dbo.ProperCase(REPLACE(a.[Color & Size],'-','/')) AS image_label,
		dbo.getUrlKey(dbo.getDEUName(a.Name),'Deuter',CAST(a.[Color Code] AS varchar(7)) + ' - ' + CAST(REPLACE(a.[Size Code],'OS','O/S') AS varchar(4))) + '-fw12' AS url_key
FROM tbl_RawData_F12_DEU AS a

UPDATE tbl_LoadFile_F12_DEU  SET image = 'MontanaGaiterM_3810_10 copy copy.jpg' WHERE name LIKE '%Montana%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'PamirGaiterM_4750_10.jpg' WHERE name LIKE '%Pamir%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Orbit-0_5520_10.jpg' WHERE name LIKE '%Orbit 0%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Orbit-5_4140_10.jpg' WHERE name LIKE '%Orbit -5%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'TSA-Smartlock_09.jpg' WHERE name LIKE '%TSA-Lock%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'BoulderGaiter_7000_10.jpg' WHERE name LIKE '%Boulder%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'LightSackDryAllSizes_9990_10.jpg' WHERE name LIKE '%Light Dry%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'PackSackS_9990_10.jpg' WHERE name LIKE 'Pack Sack S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'PackSackXL_9990_10.jpg' WHERE name LIKE 'Pack Sack XL'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'PackSackM_9990_10.jpg' WHERE name LIKE 'Pack Sack M'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'MeshSackS_9990_10.jpg' WHERE name LIKE 'Mesh Sack S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'MeshSackL_9990_10.jpg' WHERE name LIKE 'Mesh Sack L'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'MeshSackXL_9990_10.jpg' WHERE name LIKE 'Mesh Sack XL'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Raincover1_8008_10.jpg' WHERE sku LIKE 'DEU-39520-8008-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter2_7000_10.jpg' WHERE sku LIKE 'DEU-39460-7000-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter1_7000_10.jpg' WHERE sku LIKE 'DEU-39450-7000-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashBag2_4400_10.jpg' WHERE sku LIKE 'DEU-39430-4400-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashBag1_4400_10.jpg' WHERE sku LIKE 'DEU-39410-4400-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashBag2_3303_10.jpg' WHERE sku LIKE 'DEU-39430-3303-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashBag1_3303_10.jpg' WHERE sku LIKE 'DEU-39410-3303-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'PhoneBag_I_II_7000_10.jpg' WHERE name LIKE 'Phone Bag%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'SecurityWallet1_6102_d1_10.jpg' WHERE sku LIKE 'DEU-39200-6102-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'SecurityWallet2_6102_d1_10.jpg' WHERE sku LIKE 'DEU-39210-6102-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'SecurityWallet1_7410_10.jpg' WHERE sku LIKE 'DEU-39200-7410-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'SecurityWallet2_7410_10.jpg' WHERE sku = 'DEU-39210-7410-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Belt2_7410_10.jpg' WHERE sku = 'DEU-39010-7410-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'CompressionPacksack_S_M_L_9990_10.jpg' WHERE name LIKE 'Compression Packsack%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'CompressionPacksackXL_9990_10.jpg' WHERE sku = 'DEU-39790-7000-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Neosphereminus10REG_5520_11.jpg' WHERE name LIKE 'Neosphere -10%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Neosphereminus15REG_4140_11.jpg' WHERE name LIKE 'Neosphere -15%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'DreamLite500_4100_11.jpg' WHERE sku = 'DEU-37081-4100-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Schmusebaer_1030_11.jpg' WHERE sku = 'DEU-36009-AQUA-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Schmusebaer_5015_11.jpg' WHERE sku = 'DEU-36009-5015-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'Schmusebaer_9202_11.jpg' WHERE sku = 'DEU-36009-9202-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'ExosphereMinus8_4140_09.jpg' WHERE name LIKE 'Exosphere -8%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'ExosphereMinus4_5520_09_V.jpg' WHERE name LIKE 'Exosphere -4%'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'ExosphereMinus4SL_5520_09.jpg' WHERE sku LIKE 'DEU-37630%' 
UPDATE tbl_LoadFile_F12_DEU  SET image = 'guide30plussl_9810_08.jpg' WHERE sku LIKE 'DEU-33569-MASU-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'guide40plussl_2160_08.jpg' WHERE sku LIKE 'DEU-33589-MOTI-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'GuideLite28SL_8401_12.jpg' WHERE sku LIKE 'DEU-33533-8401-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'GuideLite32+_5580_12.jpg' WHERE sku LIKE 'DEU-33543-5580-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter1_5505_12.jpg' WHERE sku LIKE 'DEU-39450-5505-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter1_7005_12.jpg' WHERE sku LIKE 'DEU-39450-7005-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter1_3305_12.jpg' WHERE sku LIKE 'DEU-39450-3305-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter2_5505_12.jpg' WHERE sku LIKE 'DEU-39460-5505-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter2_7005_12.jpg' WHERE sku LIKE 'DEU-39460-7005-O/S'
UPDATE tbl_LoadFile_F12_DEU  SET image = 'WashCenter2_3305_12.jpg' WHERE sku LIKE 'DEU-39460-3305-O/S'

INSERT INTO tbl_LoadFile_F12_DEU (
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
	    dbo.getMagentoConfigurableSKU('DEU',a.Style) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.Style AS vendor_product_id,
		'Uncategorized' AS categories,
		dbo.getDEUName(a.Name) AS name,
		dbo.getDEUGender(a.Name) AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_DEU WHERE vendor_product_id = a.Style) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_DEU WHERE vendor_product_id = a.Style) AS cost,
		1 AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(dbo.getDEUName(a.Name), 'Deuter', '') + '-fw12' AS url_key,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock
FROM tbl_RawData_F12_DEU AS a

UPDATE a SET
	short_description = dbo.getDEUShortDesc(a.vendor_product_id),
	description = dbo.getDEULongDesc(a.vendor_product_id),
	origin = 'Vietnam',
	features = dbo.getDEUFeatures(a.vendor_product_id),
	fabric = dbo.getDEUFabric(a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_DEU WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_DEU WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	simples_skus = dbo.getDEUAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_DEU AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getDEUMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_F12_DEU AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_F12_DEU SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_DEU SET image = '+' + image WHERE image IS NOT NULL

SELECT * FROM tbl_LoadFile_F12_DEU WHERE type = 'configurable' ORDER BY name, type DESC
GO

CREATE VIEW [dbo].[view_LoadFile_F12_DEU]
AS
SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"super_attribute_pricing"' AS super_attribute_pricing, '"videos"' AS videos, '"hs_tariff_id"' AS hs_tariff_id, '"origin"' AS origin, '"weight"' AS weight, '"us_skus"' AS us_skus, '"cs_skus"' AS cs_skus, '"xre_skus"' AS xre_skus, '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_F12_DEU AS a WHERE a.image IS NOT NULL
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_DEU" queryout "C:\Data\Shared\DEU.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_F12_DEU

/* Next steps?

1. Use Magmi to load ONLY NEW SKUs so we don't overwrite existing categories to Uncategorized
2. Then move all new products into correct categories
3. Then use Magmi to load ONLY UPDATED skus but don't include the categories column so we don't overwrite it

*/