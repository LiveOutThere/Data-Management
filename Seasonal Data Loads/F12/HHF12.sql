USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_HH]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_HH]

CREATE TABLE [dbo].[tbl_LoadFile_F12_HH](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_season]  DEFAULT (N'FW12 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_manufacturer]  DEFAULT ('Helly Hansen'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_is_in_stock]  DEFAULT ((0)),
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
	[merchandise_priority] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_HH_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_F12_HH] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_HH] ON [dbo].[tbl_LoadFile_F12_HH] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_F12_HH (
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
		url_key,
		backorders
)
SELECT  dbo.getMagentoSimpleSKU('FW12A-HH', LEFT(a.SKU,5), SUBSTRING(a.SKU,7,3), dbo.getHHSize(SUBSTRING(a.SKU,11,7))) AS sku,
		LEFT(a.SKU,5) AS vendor_product_id,
		dbo.getHHName(a.StyleName, '') AS name,
		CASE WHEN a.Gender = 'Womens' THEN 'Women' WHEN a.Gender = 'Mens' THEN 'Men' WHEN a.Gender = 'Kid' THEN 'Boy|Girl' WHEN a.Gender = 'Junior' THEN 'Boy|Girl' WHEN a.Gender = 'Unisex' THEN 'Men|Women' END AS gender,
		REPLACE(dbo.ProperCase(dbo.getHHColorName(a.ColorName)),'Hh ','HH ') AS choose_color,
		dbo.getHHSize(SUBSTRING(a.SKU,11,7)) AS choose_size,
		SUBSTRING(a.SKU,7,3) AS vendor_color_code,
		dbo.getHHSize(SUBSTRING(a.SKU,11,7)) AS vendor_size_code,
		CAST(a.EAN AS bigint) AS vendor_sku,
		CAST(a.[RetailPrice CA] AS float) - .01 AS price,
		a.[WholeSaleCost CA] AS cost,
		0 AS has_options,
		'simple' AS type,
		dbo.getHHImage(a.SKU) AS image,
		REPLACE(dbo.ProperCase(dbo.getHHColorName(a.ColorName)),'Hh ','HH ') AS image_label,
		dbo.getUrlKey(dbo.getHHName(a.StyleName, a.Gender), 'Helly Hansen', a.ColorName + ' - ' + SUBSTRING(a.SKU,11,5)) + '-fw12a' AS url_key,
		1 AS backorders
FROM tbl_RawData_F12_HH_UPC2 AS a

INSERT INTO tbl_LoadFile_F12_HH (
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
	manage_stock,
	backorders
)
SELECT DISTINCT
	    dbo.getMagentoConfigurableSKU('FW12A-HH', LEFT(a.SKU,5)) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		LEFT(a.SKU,5) AS vendor_product_id,
		'Uncategorized' AS categories,
		dbo.getHHName(a.StyleName, '') AS name,
		CASE WHEN a.Gender = 'Womens' THEN 'Women' WHEN a.Gender = 'Mens' THEN 'Men' WHEN a.Gender = 'Kid' THEN 'Boy|Girl' WHEN a.Gender = 'Junior' THEN 'Boy|Girl' WHEN a.Gender = 'Unisex' THEN 'Men|Women' END AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_HH WHERE vendor_product_id = LEFT(a.SKU,5)) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_HH WHERE vendor_product_id = LEFT(a.SKU,5)) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(dbo.getHHName(a.StyleName, a.Gender), 'Helly Hansen', '') + '-fw12a' AS url_key,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		NULL AS backorders
FROM tbl_RawData_F12_HH_UPC2 AS a

UPDATE a SET
	description = dbo.ProperCase(dbo.toHTMLEntities(REPLACE((SELECT DISTINCT TOP 1 [Product Statement] FROM tbl_RawData_F12_HH WHERE LEFT(SKU,5) LIKE a.vendor_product_id),'#N/A',''))),
	features = dbo.toHTMLEntities((SELECT DISTINCT TOP 1 [Product Features] FROM tbl_RawData_F12_HH WHERE LEFT(SKU,5) LIKE a.vendor_product_id)),
	fabric = dbo.ProperCase(REPLACE(REPLACE(REPLACE(REPLACE((SELECT DISTINCT TOP 1 [Fabric Content] FROM tbl_RawData_F12_HH WHERE LEFT(SKU,5) LIKE a.vendor_product_id),',','|'),'WAYS','WAY'),' - ','|'),' / ','|')),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_HH WHERE vendor_product_id = a.vendor_product_id AND image IS NOT NULL ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_HH WHERE vendor_product_id = a.vendor_product_id AND image IS NOT NULL ORDER BY choose_color DESC),
	simples_skus = dbo.getHHAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_HH AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getHHMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_F12_HH AS a
WHERE type = 'configurable'

UPDATE tbl_LoadFile_F12_HH SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_HH SET image = '+' + image WHERE image IS NOT NULL
GO

CREATE VIEW [dbo].[view_LoadFile_F12_HH]
AS
SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features,
        '"fabric"' AS fabric, '"manufacturer"' AS manufacturer, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"' 
FROM dbo.tbl_LoadFile_F12_HH AS a --WHERE a.image IS NOT NULL
GO

DECLARE @sql varchar(1024), @Filename varchar(255)
SET @Filename = 'HH.csv'
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_HH" queryout "C:\Data\Shared\' + @Filename + '" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql, NO_OUTPUT

-- If this doesn't work, it's because the file is too large and wget isn't waiting long enough before returning control to sproc_run_MAGMI. In that case, just open cmd from the Start Menu > Run, and paste this:
-- wget "http://www.liveoutthere.com/utility_o23tsgf/magmi/web/magmi_run.php?mode=create&logfile=missing-skus.log&profile=Missing%20SKUs&engine=magmi_productimportengine:Magmi_ProductImportEngine"wget "http://www.liveoutthere.com/utility_o23tsgf/magmi/web/magmi_run.php?mode=create&logfile=missing-skus.log&profile=Missing%20SKUs&engine=magmi_productimportengine:Magmi_ProductImportEngine"
EXEC sproc_run_MAGMI @Filename, 0

DROP VIEW view_LoadFile_F12_HH