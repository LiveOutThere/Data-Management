USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS13_MER]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS13_MER]

CREATE TABLE [dbo].[tbl_LoadFile_SS13_MER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_season]  DEFAULT (N'SS13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_manufacturer]  DEFAULT ('Merrell'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MER_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS13_MER] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS13_MER] ON [dbo].[tbl_LoadFile_SS13_MER] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_SS13_MER (
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
SELECT  dbo.getMagentoSimpleSKU('SS13A-MER', LEFT(a.Material,8), RIGHT(a.Material,3), a.SKU) AS sku,
		LEFT(a.Material,8) AS vendor_product_id,
		a.Model AS name,
		dbo.getMERGender(a.Category) AS gender,
		a.[Color-Couleur] AS choose_color,
		a.SKU AS choose_size,
		RIGHT(a.Material,3) AS vendor_color_code,
		a.SKU AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(REPLACE(a.[S# Retail],'$','') AS float) - 0.01 AS price,
		REPLACE(a.Wholesale,'$','') AS cost,
		0 AS has_options,
		'simple' AS type,
		a.[Color-Couleur] AS image_label,
		dbo.getUrlKey(a.Model, 'Merrell', a.[Color-Couleur] + ' - ' + a.SKU,dbo.getMERGender(a.Category)) + '-ss13a' AS url_key
FROM tbl_RawData_SS13_MER_APP_UPC AS a

INSERT INTO tbl_LoadFile_SS13_MER (
		sku,
		vendor_product_id,
		[name],
		department,
		choose_color,
		choose_size,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		[type],
		image_label,
		url_key
)
SELECT  'SS13A-MER-' + a.Material + '-' + RIGHT(a.SKU,4) AS sku,
		a.Material AS vendor_product_id,
		REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(a.[Final Pattern name])),' Kids',''),'Wtpf','Waterproof'),' Mj ',' MJ '),'WTPF','Waterproof') AS name,
		CASE WHEN [Men's sizes] <> '' THEN 'Men' WHEN [Women's sizes] <> '' THEN 'Women' WHEN [Men's sizes] = '' AND [Women's sizes] = '' THEN 'Boy|Girl' END AS gender,
		a.[Final Color] AS choose_color,
		RIGHT(a.SKU,4) AS choose_size,
		RIGHT(a.SKU,4) AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(REPLACE(a.[Retail price],'$','') AS float) - 0.01 AS price,
		REPLACE(a.[WHLS Price],'$','') AS cost,
		0 AS has_options,
		'simple' AS type,
		a.[Final Color] AS image_label,
		dbo.getUrlKey(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(a.[Final Pattern name])),' Kids',''),'Wtpf','Waterproof'),' Mj ',' MJ '),'WTPF','Waterproof'), 'Merrell', a.[Final Color] + ' - ' + RIGHT(a.SKU,4), CASE WHEN [Men's sizes] <> '' THEN 'Men' WHEN [Women's sizes] <> '' THEN 'Women' WHEN [Men's sizes] = '' AND [Women's sizes] = '' THEN 'Boy|Girl' END) + '-ss13a' AS url_key
FROM tbl_RawData_SS13_MER_FOOT_UPC AS a

-- This method of matching images is going to be a lot faster than a sub-select since tbl_RawData_SS13_Image_Filenames is really big:
UPDATE a SET image = b.Filename
FROM tbl_LoadFile_SS13_MER AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Brand = 'MER' AND (
	b.Filename LIKE vendor_product_id + '-' + vendor_color_code + '%P%'
	OR
	b.Filename LIKE vendor_product_id + '-' + vendor_color_code + '%F%'
)
WHERE a.type = 'simple' AND image IS NULL

UPDATE a SET image = b.Filename
FROM tbl_LoadFile_SS13_MER AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE vendor_product_id + '%' AND b.Brand = 'MER'
WHERE a.type = 'simple' AND a.image IS NULL

UPDATE a SET image = b.image
FROM tbl_LoadFile_SS13_MER AS a
INNER JOIN tbl_LoadFile_F12_MER AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type = 'simple' AND a.image IS NULL

UPDATE a SET image = b.image
FROM tbl_LoadFile_SS13_MER AS a
INNER JOIN tbl_LoadFile_S12_MER AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type = 'simple' AND a.image IS NULL

INSERT INTO tbl_LoadFile_SS13_MER (
	sku,
	configurable_attributes,
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
		-- What I've done here is generate a random number for a "style" since Merrell doesn't have common style numbers for their footwear. The way it works it will always generate the same number given the same Name and Gender input
	   'SS13A-MER-' + CAST(ABS(CAST(HASHBYTES('MD5', a.name + a.department) AS smallint)) AS varchar(50)) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		'Uncategorized' AS categories,
		a.name AS name,
		a.department AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_SS13_MER WHERE vendor_product_id = a.vendor_product_id) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_SS13_MER WHERE vendor_product_id = a.vendor_product_id) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(a.name, 'Merrell', '', a.department) + '-ss13a' AS url_key,
		'Merrell ' + a.name + CASE WHEN a.department = 'Men' THEN ' - Men''s' WHEN a.department = 'Women' THEN ' - Women''s' WHEN a.department = 'Men|Women' THEN ' - Unisex' ELSE '' END AS meta_title,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		0 AS use_config_manage_stock
FROM tbl_LoadFile_SS13_MER AS a

UPDATE a SET
	categories = ISNULL((SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = REPLACE(a.name,' ','') + '-' + CASE WHEN a.department = 'Men' THEN 'M' WHEN a.department = 'Women' THEN 'W' END), 'Uncategorized'),
	-- I've modified this function to take the Name and the Gender/Department as inputs, this allows us to associate simples to configurables even though the vendor_product_id isn't the same
	simples_skus = dbo.getMERAssociatedProducts(a.name, a.department) 
FROM tbl_LoadFile_SS13_MER AS a
WHERE type = 'configurable'
GO

-- Create a temp table to store features and description for each style. We aren't using a view because a view in this case would be really slow.
CREATE TABLE #temp_RawData_MER_Description_Features (name varchar(max), description varchar(max), features varchar(max), gender varchar(max))

INSERT INTO #temp_RawData_MER_Description_Features
SELECT DISTINCT b.Model AS name, ISNULL(RTRIM(a.Description) + '. ','') + a.[tech bullets- English] AS description, '' AS features, dbo.getMERGender(b.Category) AS gender
FROM tbl_RawData_SS13_MER_APP_Marketing AS a
INNER JOIN tbl_RawData_SS13_MER_APP_UPC AS b ON a.[Stock #] = b.Material
WHERE a.Description IS NOT NULL OR a.[tech bullets- English] IS NOT NULL

INSERT INTO #temp_RawData_MER_Description_Features
SELECT DISTINCT REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(b.[Final Pattern name])),' Kids',''),'Wtpf','Waterproof'),' Mj ',' MJ '),'WTPF','Waterproof') AS name, a.[Intro-Anglais] AS description, REPLACE(REPLACE(REPLACE(a.[Tech Bullet-Anglais],'UPPER/LINING',''),'MIDSOLE/OUTSOLE',''),'•','|') AS features, CASE WHEN [Men's sizes] <> '' THEN 'Men' WHEN [Women's sizes] <> '' THEN 'Women' WHEN [Men's sizes] = '' AND [Women's sizes] = '' THEN 'Boy|Girl' END AS gender
FROM tbl_RawData_SS13_MER_FOOT_Marketing AS a
INNER JOIN tbl_RawData_SS13_MER_FOOT_UPC AS b ON a.Material = b.Material
WHERE a.[Tech Bullet-Anglais] IS NOT NULL OR a.[Intro-Anglais] IS NOT NULL

-- Notice the keys to the temp table are now Name and Gender:
UPDATE a SET
	description = (SELECT TOP 1 description FROM #temp_RawData_MER_Description_Features WHERE name = a.name COLLATE Latin1_General_CI_AS AND gender = a.department COLLATE Latin1_General_CI_AS),
	features = (SELECT TOP 1 features FROM #temp_RawData_MER_Description_Features WHERE name = a.name COLLATE Latin1_General_CI_AS AND gender = a.department COLLATE Latin1_General_CI_AS)
FROM tbl_LoadFile_SS13_MER AS a
WHERE type = 'configurable'

DROP TABLE #temp_RawData_MER_Description_Features
GO

UPDATE tbl_LoadFile_SS13_MER SET categories = CASE WHEN categories <> 'Uncategorized' THEN categories + ';;' + manufacturer + '/' + REPLACE(categories,';;',';;' + manufacturer + '/') ELSE 'Uncategorized' END WHERE type = 'configurable'
UPDATE tbl_LoadFile_SS13_MER SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_SS13_MER SET thumbnail = image, small_image = image
GO

CREATE VIEW [dbo].[view_LoadFile_SS13_MER]
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
FROM dbo.tbl_LoadFile_SS13_MER AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS13_MER" queryout "C:\Data\Shared\SS13MER.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS13_MER