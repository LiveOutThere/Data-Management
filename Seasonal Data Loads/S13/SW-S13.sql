USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS13_SW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS13_SW]

CREATE TABLE [dbo].[tbl_LoadFile_SS13_SW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_season]  DEFAULT (N'SS13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_manufacturer]  DEFAULT ('SmartWool'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_SW_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS13_SW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS13_SW] ON [dbo].[tbl_LoadFile_SS13_SW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_SS13_SW (
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
		url_key
		--weight
)
SELECT  dbo.getMagentoSimpleSKU('SS13A-SW', a.[Style Number], a.[Color Number], REPLACE(a.Size,'1SFM','O/S')) AS sku,
		a.[Style Number] AS vendor_product_id,
		dbo.getSWName(a.[Style Name]) AS name,
		dbo.getSWGender(a.[Style Name]) AS department,
		dbo.getSWColorName(a.[Color Name]) AS choose_color,
		REPLACE(a.Size,'1SFM','O/S') AS choose_size,
		a.[Color Number] AS vendor_color_code,
		REPLACE(a.Size,'1SFM','O/S') AS vendor_size_code,
		CAST(a.UPC AS bigint) AS vendor_sku,
		CAST(ROUND(a.Retail,0) AS float) - 0.01 AS price,
		a.Wholesale AS cost,
		0 AS has_options,
		'simple' AS type,
		dbo.getSWImage(a.[Style Number],a.[Color Number],a.UPC) AS image,
		dbo.getSWColorName(a.[Color Name]) AS image_label,
		dbo.getUrlKey(dbo.getSWName(a.[Style Name]), 'SmartWool', dbo.getSWColorName(a.[Color Name]) + ' - ' + REPLACE(a.Size,'1SFM','O/S'), dbo.getSWGender(a.[Style Name])) + '-ss13a' AS url_key
		--a.[WEIGHT] AS weight
FROM tbl_RawData_SS13_SW_UPC AS a

UPDATE tbl_LoadFile_SS13_SW SET choose_color = CASE WHEN vendor_color_code = '513' THEN 'Purple Dahlia' ELSE choose_color END
UPDATE tbl_LoadFile_SS13_SW SET image_label = CASE WHEN vendor_color_code = '513' THEN 'Purple Dahlia' ELSE image_label END

INSERT INTO tbl_LoadFile_SS13_SW (
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
	   dbo.getMagentoConfigurableSKU('SS13A-SW', a.[Style Number]) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.[Style Number] AS vendor_product_id,
		'Uncategorized' AS categories,
		dbo.getSWName(a.[Style Name]) AS name,
		dbo.getSWGender(a.[Style Name]) AS department,
		(SELECT MAX(price) FROM tbl_LoadFile_SS13_SW WHERE vendor_product_id = a.[Style Number]) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_SS13_SW WHERE vendor_product_id = a.[Style Number]) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(dbo.getSWName(a.[Style Name]), 'SmartWool', '',dbo.getSWGender(a.[Style Name])) + '-ss13a' AS url_key,
		(SELECT 'SmartWool ' + dbo.getSWName(a.[Style Name]) + CASE WHEN dbo.getSWGender(a.[Style Name]) LIKE '%|%' THEN  ' - ' + dbo.getSWGender(a.[Style Name]) ELSE ' - ' + dbo.getSWGender(a.[Style Name]) + '''s' END) AS meta_title,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		0 AS use_config_manage_stock
FROM tbl_RawData_SS13_SW_UPC AS a

UPDATE a SET
	categories = (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id AND a.type = 'configurable'),
	description = (SELECT TOP 1 dbo.getSWDesc([Style Number],[Style Name]) FROM tbl_RawData_SS13_SW_Marketing WHERE [Style Number] = a.vendor_product_id),
	features = (SELECT TOP 1 dbo.getSWFeatures([STYLE NUMBER]) FROM tbl_RawData_SS13_SW_Additional WHERE [STYLE NUMBER] = a.vendor_product_id),
	fabric = (SELECT TOP 1 dbo.getSWFabric([MERINO WOOL CONTENT],[NYLON CONTENT],[ELASTANE CONTENT],[POLYESTER CONTENT],[ACRYLIC CONTENT]) FROM tbl_RawData_SS13_SW_Additional WHERE [STYLE NUMBER] = a.vendor_product_id),
	care_instructions = (SELECT TOP 1 b.[ENGLISH TEXT] FROM tbl_RawData_SS13_SW_Additional AS c INNER JOIN tbl_RawData_SS13_SW_Care AS b ON c.CARE = b.CODE WHERE c.CARE IS NOT NULL AND c.[STYLE NUMBER] = a.vendor_product_id),
	simples_skus = dbo.getSWAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_SS13_SW AS a
WHERE type = 'configurable'
GO

UPDATE tbl_LoadFile_SS13_SW SET categories = CASE WHEN categories <> 'Uncategorized' AND type = 'configurable' THEN categories + ';;' + manufacturer + '/' + REPLACE(categories,';;',';;' + manufacturer + '/') ELSE 'Uncategorized' END
UPDATE tbl_LoadFile_SS13_SW SET small_image = image, thumbnail = image
UPDATE tbl_LoadFile_SS13_SW SET categories = CASE WHEN type = 'simple' THEN NULL ELSE categories END
UPDATE tbl_LoadFile_SS13_SW SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_SS13_SW SET name = name + ' (Pack of 6)' WHERE vendor_product_id IN('SC683','SC684','SC685','SW164','SW506','SW518','SW529','SW530','SW531','SW533','SW534','SW547','SW568','SW599','SW626','SW644','SW645','SW647','SW664','SW665','SW667','SW668','SW705','SW711','SW713','SW717','SW722','SW724','SW725','SW770','SW776','SW802','SW803','SW806','SW807','SW809','SW811','SW814','SW817','SW819','SW823','SW824','SW828','SW864','SW911','SW913','SW915','SW922','SW924','SW926','SW927','SW928','SW929','SW930','SW931','SW933')
UPDATE tbl_LoadFile_SS13_SW SET cost = (CEILING(CAST(cost AS float) * 6) - 0.01) WHERE vendor_product_id IN('SC683','SC684','SC685','SW164','SW506','SW518','SW529','SW530','SW531','SW533','SW534','SW547','SW568','SW599','SW626','SW644','SW645','SW647','SW664','SW665','SW667','SW668','SW705','SW711','SW713','SW717','SW722','SW724','SW725','SW770','SW776','SW802','SW803','SW806','SW807','SW809','SW811','SW814','SW817','SW819','SW823','SW824','SW828','SW864','SW911','SW913','SW915','SW922','SW924','SW926','SW927','SW928','SW929','SW930','SW931','SW933')
UPDATE tbl_LoadFile_SS13_SW SET price = (CEILING(CAST(price AS float) * 6) - 0.01) WHERE vendor_product_id IN('SC683','SC684','SC685','SW164','SW506','SW518','SW529','SW530','SW531','SW533','SW534','SW547','SW568','SW599','SW626','SW644','SW645','SW647','SW664','SW665','SW667','SW668','SW705','SW711','SW713','SW717','SW722','SW724','SW725','SW770','SW776','SW802','SW803','SW806','SW807','SW809','SW811','SW814','SW817','SW819','SW823','SW824','SW828','SW864','SW911','SW913','SW915','SW922','SW924','SW926','SW927','SW928','SW929','SW930','SW931','SW933')
GO

CREATE VIEW [dbo].[view_LoadFile_SS13_SW]
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
FROM dbo.tbl_LoadFile_SS13_SW AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS13_SW" queryout "C:\Data\Shared\SS13SW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS13_SW