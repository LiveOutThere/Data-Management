USE LOT_Inventory 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
 
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW14_SAL]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW14_SAL]
 
CREATE TABLE [dbo].[tbl_LoadFile_FW14_SAL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_store] DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_websites] DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_attribute_set] DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_status] DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_tax_class] DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_visibility] DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_season] DEFAULT ('FW14 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_manufacturer] DEFAULT ('Salomon'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_qty] DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_is_in_stock] DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_backorders] DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_use_config_backorders] DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW14_SAL_use_config_manage_stock] DEFAULT ((1)),
	[line] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	
 CONSTRAINT [PK_tbl_LoadFile_FW14_SAL] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW14_SAL] ON [dbo].[tbl_LoadFile_FW14_SAL] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
 
GO
 
TRUNCATE TABLE tbl_LoadFile_FW14_SAL
 
GO
INSERT INTO tbl_LoadFile_FW14_SAL (
		 type		
		,sku
		,name
		,has_options
		,price
		,cost
		,department  
		,image_label
		,choose_color 
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code 
		,never_backorder
		,manage_stock  
		,use_config_manage_stock
		,line
)

SELECT DISTINCT 
	'simple'										AS type
	,'FW14A-SAL-' + a.ITEM# + CASE WHEN a.SIZE IS NOT NULL THEN + '-' + a.SIZE ELSE '' END AS sku
	,UPPER(LEFT(b.[Model Name], LEN(b.[Model Name]) - 1))	AS name
	,0												AS has_options
	,CAST(a.MSRP AS float) - .01					AS price
	,a.COST											AS cost
	,b.Gender										AS department
	,a.COLOUR										AS image_label
	,a.COLOUR										AS choose_color
	,REPLACE(a.SIZE,'-','')							AS choose_size
	,CAST(a.UPC AS bigint)							AS vendor_sku
	,NULL											AS vendor_product_id
	,LEFT(a.ITEM#,6)								AS vendor_color_code
	,b.Visible										AS vendor_size_code
	,0												AS never_backorder
	,1												AS manage_stock  
	,1												AS use_config_manage_stock
	,CASE WHEN a.SIZE IS NULL THEN 'Bags/Accessories'
	WHEN LEFT(a.SIZE,2) = '1.' OR RIGHT(SIZE,1) = 'K' OR LEFT(a.[MODEL NAME],2) = 'XR' THEN 'Kids'
	WHEN dbo.RemoveNonAlphaCharacters(a.SIZE) IN ('XS','S','SM','M','ML','L','LXL','XL') THEN 'Apparel'
	WHEN RIGHT(a.[MODEL NAME],1) = 'W' OR RIGHT(a.[MODEL NAME],2) = 'W ' OR RIGHT(a.[MODEL NAME],2) = 'W+' OR a.[MODEL NAME] like '%lady%' THEN 'Women'
	WHEN a.[MODEL NAME] like '%s-lab%' OR a.[MODEL NAME] like '%spikecross%' THEN 'Men|Women'
	ELSE 'Men' END									AS line
FROM tbl_RawData_FW14_SAL_UPC_Price AS a
INNER JOIN tbl_RawData_FW14_SAL_Marketing AS b
ON a.[SIZE CODE] = b.Visible
GO 
/*The vendor_product_id was left null as we had to create our own codes, but in the future if Salomon provided their own codes
it would be easy to change. 
**Uses the new function "RemoveNonAlphaCharacters" which removes absolutely everything but alphabetic characters, including /,-,etc.*/

UPDATE a
	SET a.image = b.filename
FROM tbl_LoadFile_FW14_SAL AS a
INNER JOIN tbl_RawData_FW14_Image_Filenames AS b
ON REPLACE(LEFT(REPLACE(b.filename,'.jpg',''),13),'FOO_L','') = a.vendor_color_code + '00'
WHERE a.type = 'simple' AND b.brand = 'SAL' AND LEFT(b.filename,3) = 'FOO'

UPDATE a
	SET a.image = b.filename
FROM tbl_LoadFile_FW14_SAL AS a
INNER JOIN tbl_RawData_FW14_Image_Filenames AS b
ON REPLACE(LEFT(REPLACE(b.filename,'.jpg',''),13),'ERREUR_','') = a.vendor_color_code
WHERE a.type = 'simple' AND b.brand = 'SAL' AND LEFT(b.filename,3) = 'ERR'

UPDATE a
	SET a.image = b.filename
FROM tbl_LoadFile_FW14_SAL AS a
INNER JOIN tbl_RawData_FW14_Image_Filenames AS b
ON LEFT(b.filename,6) = vendor_color_code 
WHERE a.type = 'simple' AND b.brand = 'SAL'

INSERT INTO tbl_LoadFile_FW14_SAL (
		 type		
		,sku
		,name
		,configurable_attributes
		,has_options
		,price
		,cost
		,department  
		,visibility 
		,vendor_product_id
		,url_key
		,meta_title
		,merchandise_priority
		,never_backorder
		,manage_stock 
		,use_config_manage_stock
		,qty
		,is_in_stock
)
			 
SELECT DISTINCT 
	'configurable'											AS type
 	,'SAL-' + vendor_product_id								AS sku											
	,name													AS name
	,'choose_color,choose_size'								AS configurable_attributes
	,1														AS has_options
	,price													AS price
	,cost													AS cost
	,department												AS department	
	,'Catalog, Search'										AS visibility
	,vendor_product_id 										AS vendor_product_id
	,dbo.getUrlKey(name,'Salomon','',department)			AS url_key			
	,'Salomon ' + REPLACE(REPLACE(department + '''s ','Men|Women''s ',''),'Boy|Girl''s ','') + name AS meta_title
	,'F'													AS merchandise_priority												
	,0														AS never_backorder
	,0														AS manage_stock 
	,0														AS use_config_manage_stock
	,NULL													AS qty 
	,NULL													AS is_in_stock
FROM dbo.tbl_LoadFile_FW14_SAL
GO
 
UPDATE tbl_LoadFile_FW14_SAL SET
	categories		= dbo.getMagentoCategories(a.vendor_product_id),	
	simples_skus	= dbo.getSALAssociatedProducts(a.vendor_product_id),
	description		= (SELECT TOP 1 [Usp Trade] FROM tbl_RawData_FW14_SAL_Marketing WHERE LEFT([Model Name], LEN([Model Name]) - 1) = a.name),
	features		= (SELECT TOP 1 [Product Story] FROM tbl_RawData_FW14_SAL_Marketing WHERE LEFT([Model Name], LEN([Model Name]) - 1) = a.name),
	fabric			= (SELECT TOP 1 [upper material] FROM tbl_RawData_FW14_SAL_Marketing WHERE LEFT([Model Name], LEN([Model Name]) - 1) = a.name) 
FROM tbl_LoadFile_FW14_SAL AS a
WHERE a.type = 'configurable'
GO

UPDATE tbl_LoadFile_FW14_SAL SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW14_SAL SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW14_SAL SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

UPDATE tbl_LoadFile_FW14_SAL --Final update on descriptions for SEO keywords
SET description	= '<b><i>The ' + name + ' by ' + manufacturer + ' for ' + CASE WHEN department = 'Men|Women' THEN 'Men and Women' WHEN department = 'Boy|Girl' OR department IS NULL THEN 'Boys and Girls' ELSE department END + '</i></b><br>'
+ (SELECT TOP 1 [Usp Trade] FROM tbl_RawData_FW14_SAL_Marketing WHERE LEFT([Model Name], LEN([Model Name]) - 1) = name) where type = 'configurable'

/*
CREATE VIEW [dbo].[view_LoadFile_FW14_SAL]
AS
SELECT  '"store"' AS store, 
		'"websites"' AS websites, 
		'"type"' AS type, 
		'"sku"' AS sku, 
		'"name"' AS name, 
		'"categories"' AS categories, 
		'"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, 
        '"has_options"' AS has_options, 
        '"price"' AS price, 
        '"cost"' AS cost, 
        '"status"' AS status, 
        '"tax_class_id"' AS tax_class_id, 
        '"department"' AS department, 
        '"visibility"' AS visibility, 
        '"image"' AS image, 
        '"image_label"' AS image_label, 
        '"small_image"' AS small_image, 
        '"thumbnail"' AS thumbnail,
        '"choose_color"' AS choose_color, 
        '"choose_size"' AS choose_size, 
        '"vendor_sku"' AS vendor_sku, 
        '"vendor_product_id"' AS vendor_product_id, 
        '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, 
        '"season_id"' AS season_id, 
        '"short_description"' AS short_description, 
        '"description"' AS description, 
        '"features"' AS features, 
        '"activities"' AS activities, 
        '"weather"' AS weather, 
        '"layering"' AS layering, 
        '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, 
        '"fit"' AS fit, 
        '"volume"' AS volume, 
        '"manufacturer"' AS manufacturer, 
        '"qty"' AS qty, 
        '"is_in_stock"' AS is_in_stock, 
        '"simples_skus"' AS simples_skus, 
        '"url_key"' AS url_key,
        '"videos"' AS videos, 
        '"weight"' AS weight, 
        '"merchandise_priority"' AS merchandise_priority, 
        '"backorders"' AS backorders, 
        '"manage_stock"' AS manage_stock, 
        '"never_backorder"' AS never_backorder, 
        '"use_config_manage_stock"' AS use_config_manage_stock, 
        '"use_config_backorders"' AS use_config_backorders, 
        '"meta_title"' AS meta_title
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.meta_title,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_FW14_SAL AS a
GO
 
DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW14_SAL" queryout "C:\Data\Shared\FW14SAL.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql
 
DROP VIEW view_LoadFile_FW14_SAL
*/