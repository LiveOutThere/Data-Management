USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS13_DEU]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS13_DEU]

CREATE TABLE [dbo].[tbl_LoadFile_SS13_DEU](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_season]  DEFAULT (N'SS13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_manufacturer]  DEFAULT ('Deuter'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_DEU_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS13_DEU] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS13_DEU] ON [dbo].[tbl_LoadFile_SS13_DEU] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_SS13_DEU (
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
		[image],
		image_label,
		url_key,
		weight
)
SELECT  dbo.getMagentoSimpleSKU('SS13A-DEU', a.Style, a.[Color Code], a.[Size Code]) AS sku,
		a.Style AS vendor_product_id,
		REPLACE(a.Name,' + ','+') AS name,
		dbo.getDEUGender(REPLACE(a.Name,' + ','+')) AS gender,
		dbo.getDEUColor(a.[Color & Size]) AS choose_color,
		a.[Size Code] AS choose_size,
		a.[Color Code] AS vendor_color_code,
		a.[Size Code] AS vendor_size_code,
		CAST(a.UPC AS bigint) AS vendor_sku,
		CAST(a.MSRP AS float) - 0.01 AS price,
		a.Cost AS cost,
		0 AS has_options,
		'simple' AS type,
		dbo.getDEUImage(REPLACE(a.Name,' + ','+'), a.[Color Code]) AS image,
		dbo.getDEUColor(a.[Color & Size]) AS image_label,
		dbo.getUrlKey(REPLACE(a.Name,' + ','+'), 'Deuter', a.[Color & Size] + ' - ' + a.[Size Code], dbo.getDEUGender(REPLACE(a.Name,' + ','+'))) + '-ss13a' AS url_key,
		a.[WEIGHT] AS weight
FROM [tbl_RawData_SS13_DEU_UPC+Marketing] AS a
ORDER BY image

INSERT INTO tbl_LoadFile_SS13_DEU (
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
	   dbo.getMagentoConfigurableSKU('SS13A-DEU', a.Style) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.Style AS vendor_product_id,
		'Uncategorized' AS categories,
		REPLACE(a.Name,' + ','+') AS name,
		dbo.getDEUGender(REPLACE(a.Name,' + ','+')) AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_SS13_DEU WHERE vendor_product_id = a.Style) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_SS13_DEU WHERE vendor_product_id = a.Style) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(REPLACE(a.Name,' + ','+'), 'Deuter', '', dbo.getDEUGender(REPLACE(a.Name,' + ','+'))) + '-ss13a' AS url_key,
		(SELECT 'Deuter ' + REPLACE(a.Name,' + ','+') + CASE WHEN dbo.getDEUGender(REPLACE(a.Name,' + ','+')) = 'Men|Women' THEN ' - Unisex' WHEN dbo.getDEUGender(REPLACE(a.Name,' + ','+')) = 'Women' THEN ' - Women''s' WHEN dbo.getDEUGender(REPLACE(a.Name,' + ','+')) = 'Men' THEN ' - Men''s' WHEN dbo.getDEUGender(REPLACE(a.Name,' + ','+')) = 'Boy|Girl' THEN ' - Kids''' END) AS meta_title,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		0 AS use_config_manage_stock
FROM [tbl_RawData_SS13_DEU_UPC+Marketing] AS a

UPDATE a SET
	categories = (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id AND a.type = 'configurable'),
	short_description = (SELECT TOP 1 [Short Description] FROM [tbl_RawData_SS13_DEU_UPC+Marketing] WHERE Style = a.vendor_product_id),
	description = (SELECT TOP 1 dbo.getDEULongDesc([Long Description]) FROM [tbl_RawData_SS13_DEU_UPC+Marketing] WHERE Style = a.vendor_product_id),
	features = (SELECT TOP 1 dbo.getDEUFeatures([Long Description]) FROM [tbl_RawData_SS13_DEU_UPC+Marketing] WHERE Style = a.vendor_product_id),
	fabric = (SELECT TOP 1 REPLACE(Materials,'/','|') FROM [tbl_RawData_SS13_DEU_UPC+Marketing] WHERE Style = a.vendor_product_id),
	volume = (SELECT TOP 1 Capacity FROM [tbl_RawData_SS13_DEU_UPC+Marketing] WHERE Style = a.vendor_product_id),
	simples_skus = dbo.getDEUAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_SS13_DEU AS a
WHERE type = 'configurable'
GO

DECLARE @stylenumber varchar(1024), @styledesc varchar(1024), @color varchar(1024), @image varchar(1024), @sku varchar(1024)

DECLARE alike_styles CURSOR FOR
SELECT DISTINCT vendor_product_id, name, choose_color, image FROM tbl_LoadFile_SS13_DEU WHERE image IS NOT NULL

OPEN alike_styles

FETCH NEXT FROM alike_styles INTO @stylenumber, @styledesc, @color, @image

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @sku = sku FROM tbl_LoadFile_SS13_DEU WHERE name LIKE @styledesc + '%' AND choose_color = @color AND image IS NULL
	UPDATE tbl_LoadFile_SS13_DEU SET image = @image, small_image = @image, thumbnail = @image WHERE sku = @sku
	FETCH NEXT FROM alike_styles  INTO @stylenumber, @styledesc, @color, @image
END

CLOSE alike_styles
DEALLOCATE alike_styles
	GO

UPDATE tbl_LoadFile_SS13_DEU SET image = 'LightDrypack_AllSizes_d1_12.jpg' WHERE name LIKE 'Light Drypack%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'MeshSackAllSizes_9990_10.jpg' WHERE name LIKE 'Mesh Sack%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'MontanaGaiterM_3810_10.jpg' WHERE name LIKE 'Montana Gaiter%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'PamirGaiterM_4750_10.jpg' WHERE name LIKE 'Pamir Gaiter%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'PhoneBag_I_II_7000_10.jpg' WHERE name LIKE 'Phone Bag%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'orbit-0_5520_10.jpg' WHERE name LIKE 'Orbit 0%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'orbit-5_4140_10.jpg' WHERE name LIKE 'Orbit -5%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'Schmuseber_3006_13.jpg' WHERE sku = 'SS13A-DEU-36003-3006-O/S'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'Schmuseber_5040_13.jpg' WHERE sku = 'SS13A-DEU-36003-5040-O/S'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'Schmuseber_9000_13.jpg' WHERE sku = 'SS13A-DEU-36003-9000-O/S'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'neosphereminus10reg_5520_11.jpg' WHERE name LIKE 'Neosphere -10%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'neosphereminus15reg_4140_11.jpg' WHERE name LIKE 'Neosphere -15%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'exosphereminus4_5520.jpg' WHERE name LIKE 'Exosphere -4%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'exosphereminus8_4140.jpg' WHERE name LIKE 'Exosphere -8%'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'TrekLite250_1320_10.jpg' WHERE name = 'Trek Lite 250'
UPDATE tbl_LoadFile_SS13_DEU SET image = 'TrekLite300_1570_10.jpg' WHERE name = 'Trek Lite 300'
UPDATE tbl_LoadFile_SS13_DEU SET categories = dbo.getCategory(categories,manufacturer,department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_SS13_DEU SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_SS13_DEU SET small_image = image, thumbnail = image
UPDATE tbl_LoadFile_SS13_DEU SET categories = CASE WHEN type = 'simple' THEN NULL ELSE categories END
UPDATE tbl_LoadFile_SS13_DEU SET description = CASE WHEN description IS NULL AND short_description IS NOT NULL THEN short_description ELSE description END
GO

CREATE VIEW [dbo].[view_LoadFile_SS13_DEU]
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
FROM dbo.tbl_LoadFile_SS13_DEU AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS13_DEU" queryout "C:\Data\Shared\SS13DEU.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS13_DEU