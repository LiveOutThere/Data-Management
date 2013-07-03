USE LOT_Inventory
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET CONCAT_NULL_YIELDS_NULL OFF
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_SW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_SW]
GO

CREATE TABLE [dbo].[tbl_LoadFile_FW13_SW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_season]  DEFAULT (N'FW13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_manufacturer]  DEFAULT ('SmartWool'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SW_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW13_SW] PRIMARY KEY CLUSTERED 
(
	[id] ASC

)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_SW] ON [dbo].[tbl_LoadFile_FW13_SW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

TRUNCATE TABLE tbl_LoadFile_FW13_SW
GO

INSERT INTO tbl_LoadFile_FW13_SW (
		[type]		
		,sku
		,[name]
		,has_options
		,price
		,cost
		,department
		,[image]
		,image_label
		,choose_color
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code
		,url_key
		)

SELECT DISTINCT
	 'simple'													AS type
	,'FW13A-SW-' + a.StyleNumber + '-' + a.ColorNumber + '-' + SUBSTRING(a.[SKU Number],11,LEN(a.[SKU Number])) AS sku
	,dbo.getSWName(b.name)										AS name
	,0															AS has_options
	,b.Retail													AS price
	,b.WholeSale												AS cost
	,dbo.getSWDepartment(b.name)								AS department
	,NULL														AS image
	,dbo.getSWColorName(a.ColorName)							AS image_label
	,dbo.getSWColorName(a.ColorName)							AS choose_color
	,SUBSTRING(a.[SKU Number],11,LEN(a.[SKU Number]))			AS choose_size
	,CAST(a.UPC AS bigint)										AS vendor_sku
	,a.StyleNumber												AS vendor_product_id
	,a.ColorNumber												AS vendor_color_code
	,SUBSTRING(a.[SKU Number],11,LEN(a.[SKU Number]))			AS vendor_size_code
	,dbo.getUrlKey(dbo.getSWName(b.name), 'Smartwool',dbo.getSWColorName(a.ColorName) + '-' + SUBSTRING(a.[SKU Number],11,LEN(a.[SKU Number])),dbo.getSWDepartment(b.name)) + '-fw13a' AS url_key
FROM tbl_RawData_FW13_SW_UPC AS a
INNER JOIN tbl_RawData_FW13_SW_Price AS b
ON a.StyleNumber = b.Style
GO	

DELETE FROM tbl_LoadFile_FW13_SW WHERE price IS NULL OR cost IS NULL

INSERT INTO tbl_LoadFile_FW13_SW (
	type
	,sku
	,name
	,categories
	,configurable_attributes
	,has_options
	,price
	,cost
	,department
	,visibility
	,vendor_product_id
	,is_in_stock
	,url_key
	,meta_title
	,merchandise_priority
	,manage_stock
	,use_config_manage_stock
)

SELECT DISTINCT
	'configurable'												AS type
	,'SW-' + vendor_product_id									AS sku
	,name														AS name
	,'Uncategorized' 											AS categories
	,'choose_color,choose_size' 								AS configurable_attributes
	,'1' 														AS has_options
	,price 														AS price
	,cost 														AS cost
	,department 												AS department
	,'Catalog, Search' 											AS visibility
	,vendor_product_id 											AS vendor_product_id
	,NULL														AS is_in_stock
	,dbo.getUrlKey(Name,'Smartwool','',department)				AS url_key
	,'SmartWool ' + REPLACE(REPLACE(department + '''s ','Men|Women''s ',''),'Boy|Girl''s ','') + name AS meta_title
	,'F' 														AS merchandise_priority
	,0 															AS manage_stock
	,0 															AS use_config_manage_stock
FROM tbl_LoadFile_FW13_SW
GO	

UPDATE a SET
	a.care_instructions	  = (SELECT TOP 1 care_instructions FROM tbl_RawData_FW13_SW_Marketing WHERE style_number = a.vendor_product_id),
	a.simples_skus		  = dbo.getSWAssociatedProducts(a.vendor_product_id),
	a.categories		  = dbo.getMagentoCategories(a.vendor_product_id),
	a.fabric			  = (SELECT TOP 1 content_for_workbook FROM tbl_RawData_FW13_SW_Marketing WHERE style_number = a.vendor_product_id),
--	a.description	      = 
	a.features		      = dbo.getSWFeatures(a.vendor_product_id)
FROM tbl_LoadFile_FW13_SW AS a
WHERE a.type = 'configurable'
GO

UPDATE a
	SET a.image = b.image
FROM tbl_LoadFile_FW13_SW AS a
INNER JOIN tbl_LoadFile_SS13_SW AS b
ON a.vendor_sku = b.vendor_sku 
WHERE a.type = 'simple'
GO

UPDATE a
	SET a.image = b.Filename 
FROM tbl_LoadFile_FW13_SW AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE a.vendor_product_id + '-' + a.vendor_color_code + '%' AND b.Brand = 'SW'
WHERE a.type = 'simple' AND a.image IS NULL
GO

UPDATE a
	SET a.image = b.image
FROM tbl_LoadFile_FW13_SW AS a
INNER JOIN tbl_LoadFile_F12_SW AS b
ON a.vendor_sku = b.vendor_sku 
WHERE a.type = 'simple' AND a.image IS NULL
GO

UPDATE a
	SET a.image = b.image
FROM tbl_LoadFile_FW13_SW AS a
INNER JOIN tbl_LoadFile_S12_SW AS b
ON a.vendor_sku = b.vendor_sku 
WHERE a.type = 'simple' AND a.image IS NULL
GO

UPDATE a
	SET a.image = b.Filename 
FROM tbl_LoadFile_FW13_SW AS a
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE a.vendor_product_id + '-' + a.vendor_color_code + '%' AND b.Brand = 'SW'
WHERE a.type = 'simple' AND a.image IS NULL
GO

UPDATE tbl_LoadFile_FW13_SW SET name = name + ' (3 Pack)' WHERE vendor_product_id IN('SC101','SC107','SC112','SC113','SC114','SC115','SC116','SC119','SC120','SC122','SC123','SC125','SC126','SC127','SC128','SC129','SC130','SC131','SC132','SC133','SC134','SC135','SC137','SC138','SC139','SC139','SC140','SC144','SC200','SC202','SC208','SC210','SC211','SC214','SC216','SC217','SC218','SC221','SC222','SC223','SC224','SC225','SC356','SC357','SC360','SC364','SC371','SC400','SC403','SC456','SC551','SC558','SC694','SC695','SC696','SC701','SC901','SC912','SC913','SC915','SC916','SC919','SC932','SC933','SC953','SC962','SC967','SC968','SC969','SC972','SC975','SC988','SW950','SW956')
UPDATE tbl_LoadFile_FW13_SW SET price = ROUND(CAST(price AS float) * 3,1) - 0.01 WHERE vendor_product_id IN('SC101','SC107','SC112','SC113','SC114','SC115','SC116','SC119','SC120','SC122','SC123','SC125','SC126','SC127','SC128','SC129','SC130','SC131','SC132','SC133','SC134','SC135','SC137','SC138','SC139','SC139','SC140','SC144','SC200','SC202','SC208','SC210','SC211','SC214','SC216','SC217','SC218','SC221','SC222','SC223','SC224','SC225','SC356','SC357','SC360','SC364','SC371','SC400','SC403','SC456','SC551','SC558','SC694','SC695','SC696','SC701','SC901','SC912','SC913','SC915','SC916','SC919','SC932','SC933','SC953','SC962','SC967','SC968','SC969','SC972','SC975','SC988','SW950','SW956')
UPDATE tbl_LoadFile_FW13_SW SET categories = dbo.getCategory(categories,'SmartWool',department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_FW13_SW SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW13_SW SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW13_SW SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

CREATE VIEW [dbo].[view_LoadFile_FW13_SW]
AS
SELECT  '"store"' AS store, 
		'"websites"' AS websites, 
		'"type"' AS type, 
		'"sku"' AS sku, 
		'"name"' AS name, 
		'"categories"' AS categories, 
		'"attrSWute_set"' AS attrSWute_set, 
        '"configurable_attrSWutes"' AS configurable_attrSWutes, 
        '"has_options"' AS has_options, 
        '"price"' AS price, 
        '"cost"' AS cost, 
        '"status"' AS status, 
        '"tax_class_id"' AS tax_class_id, 
        '"department"' AS department, 
        '"visSWility"' AS visSWility, 
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
FROM dbo.tbl_LoadFile_FW13_SW AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW13_SW" queryout "C:\Data\Shared\FW13SW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_FW13_SW