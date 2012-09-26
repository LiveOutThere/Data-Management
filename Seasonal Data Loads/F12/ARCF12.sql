USE LOT_Inventory

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_ARC]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_ARC]

CREATE TABLE [dbo].[tbl_LoadFile_F12_ARC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_store]  DEFAULT ('admin'),
	[websites] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_season]  DEFAULT (N'FW12A'),
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
	[manufacturer] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_manufacturer]  DEFAULT ('Arc''teryx'),
	[qty] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_is_in_stock]  DEFAULT ((0)),
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
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_merchandise_priority]  DEFAULT (('Z')),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_ARC_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_F12_ARC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'view_RawData_ARC_Photos')
	DROP VIEW view_RawData_ARC_Photos
GO

CREATE VIEW [dbo].[view_RawData_ARC_Photos] AS
	SELECT DISTINCT LOWER(image) AS image, vendor_product_id, choose_color FROM (
		SELECT image, vendor_product_id, choose_color FROM tbl_LoadFile_S12_ARC WHERE type = 'simple' AND image IS NOT NULL AND image <> ''
		UNION ALL
		SELECT image, vendor_product_id, LEFT(colorsize, CHARINDEX(' - ', colorsize) - 1) FROM tbl_LoadFile_F11_ARC WHERE type = 'simple' AND image IS NOT NULL AND image <> ''
		UNION ALL
		SELECT image, vendor_product_id, LEFT(colorsize, CHARINDEX(' - ', colorsize) - 1) FROM tbl_LoadFile_S11_ARC WHERE type = 'simple' AND image IS NOT NULL AND image <> ''
	) AS tmp
GO

INSERT INTO tbl_LoadFile_F12_ARC (  
		sku,
		vendor_product_id,
		name,
		gender,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		type,
		image_label,
		hs_tariff,
		origin,
		weight,
		url_key
)
SELECT DISTINCT
		dbo.getMagentoSimpleSKU('FW12A-ARC', model, b.[Color Code], size) AS sku,
		a.model AS vendor_product_id,
		dbo.getARCName(a.description) AS description,
		dbo.getARCGenderFromName(a.description) AS gender,
		LTRIM(RTRIM(color)) AS choose_color,
		LTRIM(RTRIM(size)) AS choose_size,
		LTRIM(RTRIM(b.[Color Code])) AS vendor_color_code,
		LTRIM(RTRIM(size)) AS vendor_size_code,
		upc AS vendor_sku,
		CAST(REPLACE([Suggested Retail],',','') AS float) - 0.01 AS price,
		CAST(REPLACE([Wholesale],',','') AS float) AS price,
		0 AS has_options,
		'simple' AS type,
		RTRIM(LTRIM(color)) AS image_label,
		[HS Tariff] AS hs_tariff,
		[Country of Origin] AS origin,
		REPLACE(a.weight,',','') AS weight,
		dbo.getUrlKey(dbo.getARCName(a.description), 'Arc''teryx', LTRIM(RTRIM(color)) + ' - ' + LTRIM(RTRIM(size))) + '-fw12a' AS url_key
FROM tbl_RawData_F12_ARC AS a INNER JOIN tbl_RawData_F12_ARC_Color_Codes AS b ON a.Color = b.[Color Name]
WHERE color NOT LIKE 'SMU%' AND [Description] NOT LIKE '%Replacement%' AND [Description] NOT LIKE '%CMH%' AND [Description] NOT LIKE '%Heli%' AND [Description] NOT LIKE '%Parks%' AND [Description] NOT LIKE '%Patrol%'

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(a.name,' & ',' '),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(a.name,' ','-'),'Women''s-',''),'Men''s-','') + '-Backpack-' + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(a.name,' ','-'),'Women''s-',''),'Men''s-','') + '-Toque-' + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(a.name,' Toque',''),' Backpack',''),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(a.name,' Tshirt',' T-Shirt'),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(a.name,' Tshirt',' SS T-Shirt'),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(a.name,' T-Shirt',' T-Shirt SS'),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 Filename FROM tbl_RawData_F12_ARC_Photos WHERE Filename LIKE '%' + REPLACE(REPLACE(REPLACE(REPLACE(a.name,' SS',''),' ','-'),'Women''s-',''),'Men''s-','') + CASE WHEN a.gender = 'Women' THEN '-W-' ELSE '-' END + REPLACE(REPLACE(a.choose_color,' ','-'),'/','-') + '%')
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

UPDATE a SET
	image = (SELECT TOP 1 image FROM view_RawData_ARC_Photos WHERE vendor_product_id = a.vendor_product_id AND choose_color = a.choose_color ORDER BY RIGHT(image,3) DESC)
FROM tbl_LoadFile_F12_ARC AS a
WHERE image IS NULL

INSERT INTO tbl_LoadFile_F12_ARC (
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
	origin,
	weight,
	manage_stock
)
SELECT DISTINCT
		dbo.getMagentoConfigurableSKU('FW12A-ARC', a.vendor_product_id) AS sku,
		'choose_color,choose_size' AS config_attributes,
		a.vendor_product_id AS vendor_product_id,
		'Uncategorized',
		a.name AS name,
		a.gender AS gender,
		(SELECT MIN(price) FROM tbl_LoadFile_F12_ARC WHERE vendor_product_id = a.vendor_product_id) AS price,
		(SELECT MIN(cost) FROM tbl_LoadFile_F12_ARC WHERE vendor_product_id = a.vendor_product_id) AS price,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(a.name, 'Arc''teryx', '') + '-fw12a' AS url_key,
		'Catalog, Search' AS visibility,
		origin AS origin,
		a.weight AS weight,
		0 AS manage_stock
FROM tbl_LoadFile_F12_ARC AS a

UPDATE a SET
	short_description = b.[Short Design],
	description = b.Design,
	fit = b.Fit,
	fabric = b.Materials,
	features = REPLACE(REPLACE(b.Features,'&bull;','|'),'<br>','') + '|' + REPLACE(REPLACE(REPLACE(REPLACE(b.Volume,'<b>','|'),'</b>&nbsp;&nbsp;',''),'<br/>',''),'<br>',''),
	care_instructions = REPLACE(REPLACE(REPLACE(REPLACE(b.[Care Info],'</li>','|'),'<li>',''), '</ul><a href="pdf/Harness-Hangtag-Web.pdf" target="_blank">Click Here to view Harness Instruction Book PDF</a> - 1.45 Mb',''), '<ul>', ''),
	media_gallery = dbo.getARCMediaGallery(a.vendor_product_id),
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_ARC WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_ARC WHERE type = 'simple' AND vendor_product_id = a.vendor_product_id ORDER BY image_label DESC),
	simples_skus = dbo.getARCAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_ARC AS a
LEFT JOIN (SELECT DISTINCT model, [Short Design], [Design], Features, Materials, Volume, [Care Info], Fit FROM tbl_RawData_F12_ARC_Additional) AS b ON a.vendor_product_id = b.Model
WHERE type = 'configurable'

UPDATE tbl_LoadFile_F12_ARC SET image = REPLACE(image,'+',''), small_image = REPLACE(small_image,'+',''), thumbnail = REPLACE(thumbnail,'+','') WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_ARC SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_ARC SET image = '+' + image WHERE image IS NOT NULL
GO

CREATE VIEW [dbo].[view_LoadFile_F12_ARC]
AS
SELECT  '"magmi:delete"' AS magmi, '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"super_attribute_pricing"' AS super_attribute_pricing, '"videos"' AS videos, '"hs_tariff_id"' AS hs_tariff_id, '"origin"' AS origin, '"weight"' AS weight, '"us_skus"' AS us_skus, '"cs_skus"' AS cs_skus, '"xre_skus"' AS xre_skus, '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock
UNION ALL
SELECT  '0', '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.short_description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_F12_ARC AS a WHERE a.image IS NOT NULL
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_ARC" queryout "C:\Data\Shared\ARC.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_F12_ARC