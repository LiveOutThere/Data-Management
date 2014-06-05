USE LOT_Inventory
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW14_NAT]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW14_NAT]

CREATE TABLE [dbo].[tbl_LoadFile_FW14_NAT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_season]  DEFAULT (N'FW14 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_manufacturer]  DEFAULT ('Nathan'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_NAT_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW14_NAT] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW14_NAT] ON [dbo].[tbl_LoadFile_FW14_NAT] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

TRUNCATE TABLE tbl_LoadFile_FW14_NAT
GO

INSERT INTO tbl_LoadFile_FW14_NAT (
		[type]		
		,sku
		,[name]
		,has_options
		,department 
		,image_label
		,choose_color
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code
		,manage_stock
		,never_backorder
		,price
		,cost)

SELECT DISTINCT
	'simple' AS type
	,'FW14-NAT-' + [Product Number] + CASE WHEN Size = 'OFA' THEN + '' ELSE + '-' + Size END AS sku	
	,dbo.ProperCase(Name)									AS name
	,0														AS has_options
	,NULL													AS department
	,dbo.ProperCase([Romantic Color])						AS image_label 
	,dbo.ProperCase([Romantic Color])						AS choose_color
	,Size													AS choose_size
	,CAST(UPC AS bigint)									AS vendor_sku
	,CAST(LEFT(([Product Number]),5) AS varchar(255))		AS vendor_product_id
	--,CASE WHEN CAST(F5 AS varchar(255)) = '0' THEN '000' ELSE CAST(F5 AS varchar(255)) END AS vendor_color_code
	,[Color Code]											AS vendor_color_code	
	,Size													AS vendor_size_code
	,1														AS manage_stock
	,0														AS never_backorder
	,CAST(MSRP AS float) - 0.01 AS price
	,CAST(Wholesale AS float) AS cost
FROM tbl_RawData_FW14_NAT_UPC_Price
GO

--UPDATE a SET 
--	a.image = b.image 
--FROM tbl_LoadFile_FW14_NAT AS a
--INNER JOIN tbl_LoadFile_FW13_NAT AS b
--ON a.vendor_sku = b.vendor_sku
--WHERE a.type = 'simple'
	 
--UPDATE a SET 
--	a.image = b.image 
--FROM tbl_LoadFile_FW14_NAT AS a
--INNER JOIN tbl_LoadFile_SS14_NAT AS b
--ON a.vendor_sku = b.vendor_sku
--WHERE a.type = 'simple'
	 
--UPDATE a SET
--	a.image = b.Filename
--FROM tbl_LoadFile_SS14_NAT AS a 
--INNER JOIN [tbl_RawData_FW14_NAT_Photos] AS b 
--ON b.Filename LIKE '%' + dbo.ProperCase(REPLACE(LTRIM(RTRIM(a.name)),' ','_')) + '_' + SUBSTRING(a.choose_color,0,CHARINDEX(' ',a.choose_color)) + '%'
--WHERE a.type = 'simple' AND a.image IS NULL AND b.Brand = 'NAT'
		
INSERT INTO tbl_LoadFile_FW14_NAT (
		[type]
		,sku  		
		,name
		,configurable_attributes
		,has_options
		,price
		,cost
		,department
		,visibility 
		,vendor_product_id
		,qty
		,is_in_stock 
		,url_key
		,meta_title
		,merchandise_priority
		,never_backorder
		,use_config_backorders
		,manage_stock
		,use_config_manage_stock)
		
SELECT DISTINCT 
	'configurable'												AS type
	,'NAT-' + vendor_product_id									AS sku
	,name														AS name
	,'choose_color,choose_size'									AS configurable_attributes
	,1															AS has_options
	,price														AS price
	,cost														AS cost
	,department													AS department
	,'Catalog, Search'											AS visibility
	,vendor_product_id											AS vendor_product_id
	,NULL														AS qty
	,NULL 														AS is_in_stock
	,dbo.getUrlKey(name,'Nathan','',department)					AS url_key 
	,'Nathan ' + REPLACE(REPLACE(department + '''s ','Men|Women''s ',''),'Boy|Girls''s ','') + name AS meta_title
	,'F'														AS merchandise_priority 
	,0															AS never_backorder
	,0															AS use_config_backorders
	,0															AS manage_stock
	,0															AS use_config_manage_stock
FROM tbl_LoadFile_FW14_NAT
GO

UPDATE a SET 
	categories = dbo.getMagentoCategories(a.vendor_product_id),
	features = dbo.getNATFeatures(a.vendor_product_id),
	description = (SELECT TOP 1 Description FROM tbl_RawData_FW14_NAT_Marketing WHERE Style = a.vendor_product_id),
	simples_skus = dbo.getNATAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_FW14_NAT AS a
WHERE a.type = 'configurable'
GO


--UPDATE tbl_LoadFile_FW14_NAT SET videos = (SELECT TOP 1 SUBSTRING(Youtube,CHARINDEX('=',Youtube)+1,LEN(Youtube)) FROM tbl_RawData_FW13_NAT_Video WHERE Style1 = vendor_product_id AND type = 'configurable')
UPDATE tbl_LoadFile_FW14_NAT SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW14_NAT SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW14_NAT SET small_image = image, thumbnail = image
GO

--CREATE VIEW [dbo].[view_LoadFile_FW14_NAT]
--AS
--SELECT  '"store"' AS store,'"websites"' AS websites, 
--		'"type"' AS type, 
--		'"sku"' AS sku, 
--		'"name"' AS name, 
--		'"categories"' AS categories, 
--		'"attribute_set"' AS attribute_set, 
--        '"configurable_attributes"' AS configurable_attributes, 
--        '"has_options"' AS has_options, 
--        '"price"' AS price, 
--        '"cost"' AS cost, 
--        '"status"' AS status, 
--        '"tax_class_id"' AS tax_class_id, 
--        '"department"' AS department, 
--        '"visibility"' AS visibility, 
--        '"image"' AS image, 
--        '"image_label"' AS image_label, 
--        '"small_image"' AS small_image, 
--        '"thumbnail"' AS thumbnail,
--        '"choose_color"' AS choose_color, 
--        '"choose_size"' AS choose_size, 
--        '"vendor_sku"' AS vendor_sku, 
--        '"vendor_product_id"' AS vendor_product_id, 
--        '"vendor_color_code"' AS vendor_color_code, 
--        '"vendor_size_code"' AS vendor_size_code, 
--        '"season_id"' AS season_id, 
--        '"short_description"' AS short_description, 
--        '"description"' AS description, 
--        '"features"' AS features, 
--        '"activities"' AS activities, 
--        '"weather"' AS weather, 
--        '"layering"' AS layering, 
--        '"care_instructions"' AS care_instructions,
--        '"fabric"' AS fabric, 
--        '"fit"' AS fit, 
--        '"volume"' AS volume, 
--        '"manufacturer"' AS manufacturer, 
--        '"qty"' AS qty, 
--        '"is_in_stock"' AS is_in_stock, 
--        '"simples_skus"' AS simples_skus, 
--        '"url_key"' AS url_key,
--        '"videos"' AS videos, 
--        '"weight"' AS weight, 
--        '"merchandise_priority"' AS merchandise_priority, 
--        '"backorders"' AS backorders, 
--        '"manage_stock"' AS manage_stock, 
--        '"never_backorder"' AS never_backorder, 
--        '"use_config_manage_stock"' AS use_config_manage_stock, 
--        '"use_config_backorders"' AS use_config_backorders, 
--        '"meta_title"' AS meta_title
--UNION ALL
--SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
--		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
--		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
--		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
--		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
--		'"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.meta_title,'"','""'))) + '"'
--FROM dbo.tbl_LoadFile_FW14_NAT AS a
--GO

--DECLARE @sql varchar(1024)
--SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW14_NAT" queryout "C:\Data\Shared\FW14NAT.csv" -w -t , -T -S ' + @@servername
--EXEC master..xp_cmdshell @sql

--DROP VIEW view_LoadFile_FW14_NAT
	
