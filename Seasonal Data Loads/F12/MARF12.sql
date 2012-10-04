USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_MAR]

CREATE TABLE [dbo].[tbl_LoadFile_F12_MAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_season]  DEFAULT (N'FW12A'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_manufacturer]  DEFAULT ('Marmot'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_is_in_stock]  DEFAULT ((0)),
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
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MAR_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_F12_MAR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

-- this index makes things faster when we query the table, we're kind of "hinting" to SQL Server which columns we'll use the most in WHERE statements
CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_MAR] ON [dbo].[tbl_LoadFile_F12_MAR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

-- insert all the simple SKUs into the load file table by selecting them out of the raw data table in the format we want
INSERT INTO tbl_LoadFile_F12_MAR (
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
SELECT  dbo.getMagentoSimpleSKU('FW12A-MAR', a.[Style Number], a.[Color Number], a.[Size]) AS sku,
		a.[Style Number] AS vendor_product_id,
		dbo.getMARName(a.[Style Description]) AS name,
		CASE WHEN a.[Style Description] LIKE 'Wm''s%' THEN 'Women' WHEN a.[Style Description] LIKE 'Girl''s%' THEN 'Girl' WHEN a.[Style Description] LIKE 'Boy''s%' THEN 'Boy' WHEN a.[Style Description] LIKE 'Kid%' THEN 'Boy|Girl' ELSE 'Men' END AS gender,
		a.[Color Description] AS choose_color,
		a.Size AS choose_size,
		a.[Color Number] AS vendor_color_code,
		a.Size AS vendor_size_code,
		CAST(a.[UPC Code] AS bigint) AS vendor_sku, -- cast it to prevent the barcode from helpfully turning into scientific notation... this forces MSSQL to treat it as a number
		CAST(a.[Retail Price] AS float) - 0.01 AS price,
		a.[Wholesale Price] AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM view_RawData_MAR_Photos WHERE Filename LIKE '%' + a.[Style Number] + '%' + a.[Color Number] + '%') AS image,
		a.[Color Description] AS image_label,
		dbo.getUrlKey(dbo.getMARName(a.[Style Description]), 'Marmot', a.[Color Description] + ' - ' + a.Size) + '-fw12a' AS url_key
FROM tbl_RawData_F12_MAR AS a

-- now let's insert configurable SKUs by doing a SELECT DISTINCT on the same data set, this gives us one configurable per product
INSERT INTO tbl_LoadFile_F12_MAR (
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
	   dbo.getMagentoConfigurableSKU('FW12A-MAR', a.[Style Number]) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.[Style Number] AS vendor_product_id,
		'Uncategorized' AS categories,
		dbo.getMARName(a.[Style Description]) AS name,
		CASE WHEN a.[Style Description] LIKE 'Wm''s%' THEN 'Women' WHEN a.[Style Description] LIKE 'Girl''s%' THEN 'Girl' WHEN a.[Style Description] LIKE 'Boy''s%' THEN 'Boy' WHEN a.[Style Description] LIKE 'Kid%' THEN 'Boy|Girl' ELSE 'Men' END AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_MAR WHERE vendor_product_id = a.[Style Number]) AS price, -- the price for the configurable is always the highest-priced simple
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_MAR WHERE vendor_product_id = a.[Style Number]) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(dbo.getMARName(a.[Style Description]), 'Marmot', '') + '-fw12a' AS url_key,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock
FROM tbl_RawData_F12_MAR AS a

DELETE FROM tbl_LoadFile_F12_MAR WHERE cost = '0.00'

UPDATE tbl_LoadFile_F12_MAR SET name = REPLACE(name,'Men''s ','') WHERE name LIKE '% 1P%' OR name LIKE '% 2P%' OR name LIKE '% 3P%' OR name LIKE '% 4P%' OR name LIKE '% 6P%' OR name LIKE '% 8P%' OR name LIKE '% Fly' OR name LIKE '% Footprint' OR name LIKE '% Tent %' OR name LIKE '% Sack' OR name LIKE '% Loft'

UPDATE       tbl_LoadFile_F12_MAR SET gender='Men|Women'
WHERE     (type = 'configurable') AND (gender = 'Men') AND (name NOT LIKE 'Men%')

UPDATE tbl_LoadFile_F12_MAR SET image = 'mar.jpg' WHERE (type = 'simple') AND (image IS NULL) AND (name LIKE '%footprint%')

-- Update this year's photos with photos from THIS season where the row has the same name but ignore some common minor variations in the name
UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_MAR WHERE name = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.name, ' - ','-'), '-Tall',''), '-Short',''), '-Long',''),'-Large',''),'-X Large',''),' Long X-Wide','') AND vendor_color_code = a.vendor_color_code ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'simple' AND image IS NULL AND (name LIKE '%long%' OR name LIKE '%short%' OR name LIKE '%tall%')

-- Update this year's photos with photos from S12 where the row has the same name but ignore some common minor variations in the name
UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_MAR WHERE name = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.name, ' - ','-'), '-Tall',''), '-Short',''), '-Long',''),'-Large',''),'-X Large',''),' Long X-Wide','') AND vendor_color_code = a.vendor_color_code ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'simple' AND image IS NULL AND (name LIKE '%long%' OR name LIKE '%short%' OR name LIKE '%tall%')

-- Update this year's photos with photos from S12 where the row has the same name and the vendor_color_codes are identical 
UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_MAR WHERE name = a.name AND vendor_color_code = a.vendor_color_code ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'simple' AND image IS NULL AND name NOT LIKE '%long%' AND name NOT LIKE '%short%' AND name NOT LIKE '%tall%' AND name NOT LIKE '%XXL-%'

-- Update this year's photos with photos from F11 where the row has the same name and the vendor_color_codes are identical 
UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F11_MAR WHERE name = REPLACE(a.name,'Men''s ','') AND vendor_color_code = a.vendor_color_code ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'simple' AND image IS NULL AND name NOT LIKE '%long%' AND name NOT LIKE '%short%' AND name NOT LIKE '%tall%' AND name NOT LIKE '%XXL-%'

-- Update this year's photos with photos from S12 where the row has the same name and the choose_color contains this year's choose_color - this solves True Black vs. Black issue
UPDATE a SET
	image = (SELECT TOP 1 image FROM tbl_LoadFile_S12_MAR WHERE name = a.name AND choose_color LIKE '%' + a.choose_color + '%' ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'simple' AND image IS NULL AND name NOT LIKE '%long%' AND name NOT LIKE '%short%' AND name NOT LIKE '%tall%' AND name NOT LIKE '%XXL-%'

UPDATE a SET
	description = (SELECT [Positioning Statement] FROM tbl_RawData_F12_MAR_Additional WHERE [Style] = a.vendor_product_id),
	features = dbo.getMARFeatures(a.vendor_product_id),
	fabric = (SELECT [Materials] FROM tbl_RawData_F12_MAR_Additional WHERE [Style] = a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_MAR WHERE vendor_product_id = a.vendor_product_id AND a.image IS NOT NULL ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_MAR WHERE vendor_product_id = a.vendor_product_id AND a.image IS NOT NULL ORDER BY choose_color DESC),
	media_gallery = dbo.getMARMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getMARAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_MAR AS a
WHERE type = 'configurable'

-- prepend plus signs to tell Magmi to include all images in the media gallery
UPDATE tbl_LoadFile_F12_MAR SET image = REPLACE(image,'+',''), small_image = REPLACE(small_image,'+',''), thumbnail = REPLACE(thumbnail,'+','') WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_MAR SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_MAR SET image = '+' + image WHERE image IS NOT NULL
GO

CREATE VIEW [dbo].[view_LoadFile_F12_MAR]
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
FROM dbo.tbl_LoadFile_F12_MAR AS a WHERE a.image IS NOT NULL
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_MAR" queryout "C:\Data\Shared\MAR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

--Remember to open the CSV up in TextMate and save with UTF-8 encoding and LF line breaks!

DROP VIEW view_LoadFile_F12_MAR