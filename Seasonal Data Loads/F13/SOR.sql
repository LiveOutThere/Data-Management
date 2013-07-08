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

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_SOR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_SOR]

CREATE TABLE [dbo].[tbl_LoadFile_FW13_SOR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_season]  DEFAULT (N'FW13 ASAP'),
	[short_description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[features] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[activities] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weather] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[layering] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[care_instructions] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fabric] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fit] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[volume] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_manufacturer]  DEFAULT ('Sorel'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_SOR_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW13_SOR] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_SOR] ON [dbo].[tbl_LoadFile_FW13_SOR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
TRUNCATE TABLE tbl_LoadFile_FW13_SOR

GO
INSERT INTO tbl_LoadFile_FW13_SOR (
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
		,weight)

SELECT DISTINCT
	'simple' AS type
	,'FW13A-SOR-' + LEFT(a.JDE_Style_Color,6) + '-' + a.Color_Code + '-' + a.Size AS sku
	,dbo.ProperCase(a.Style_Name) AS name
	,0 AS has_options
	,CAST(a.MSRP AS float) +.99 AS price
	,a.Wholesale AS cost
	,dbo.getSORDepartment(a.Gender) AS department
	,NULL AS image
	,a.Color_Description AS image_label
	,a.Color_Description AS choose_color
	,REPLACE(a.Size,'.5','½') AS choose_size
	,CAST(a.UPC AS bigint) AS vendor_sku
	,LEFT(a.JDE_Style_Color,6) AS vendor_product_id
	,a.Color_Code AS vendor_color_code
	,a.Size AS vendor_size_code
	,dbo.getUrlKey(dbo.ProperCase(a.Style_Name),'Sorel',a.Color_Description + '-' + a.Size,dbo.getSORDepartment(a.Gender)) + '-fw13a' AS url_key
	,NULL AS weight
FROM tbl_RawData_FW13_SOR_UPC_Marketing AS a
--INNER JOIN tbl_RawData_FW13_SOR_Price_List AS b
--ON LEFT(a.JDE_Style_Color,6) = b.JDE_Style_Number
GO
/*
UPDATE a
	SET a.image = b.Filename
FROM tbl_LoadFile_FW13_SOR AS a
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename = a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' 
WHERE b.Brand = 'SOR' AND a.type = 'simple'
*/
	
INSERT INTO tbl_LoadFile_FW13_SOR (
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
	,url_key
	,meta_title
	,merchandise_priority
	,manage_stock
	,use_config_manage_stock
	,qty
	,is_in_stock
)

SELECT DISTINCT
	'configurable' AS type
	,'SOR-' + vendor_product_id AS sku
	,name AS name
	,'Uncategorized' AS categories
	,'choose_color,choose_size' AS configurable_attributes
	,'1' AS has_options
	,price AS price
	,cost AS cost
	,department AS department
	,'Catalog, Search' AS visibility
	,vendor_product_id AS vendor_product_id
	,dbo.getUrlKey(name,'Sorel','',department) AS url_key
	,'Sorel ' + REPLACE(REPLACE(department + '''s ','Men|Women''s ',''),'Boy|Girl''s ','') + name AS meta_title
	,'F' AS merchandise_priority
	,0 AS manage_stock
	,0 AS use_config_manage_stock
	,NULL AS qty
	,NULL AS is_in_stock
FROM tbl_LoadFile_FW13_SOR
GO

UPDATE tbl_LoadFile_FW13_SOR SET
	 categories = dbo.getMagentoCategories(a.vendor_product_id)
	 /* inserting description + features into description value due to html formatting in raw data */
	,description = (SELECT TOP 1 Short_Description + '<br><br>' + Long_Description FROM tbl_RawData_FW13_SOR_UPC_Marketing WHERE LEFT(JDE_Style_Color,6) = a.vendor_product_id)
	,simples_skus = dbo.getSORAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_FW13_SOR AS a
WHERE type = 'configurable'

GO	
UPDATE tbl_LoadFile_FW13_SOR SET categories = dbo.getCategory(categories,'Sorel',department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_FW13_SOR SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW13_SOR SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW13_SOR SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

CREATE VIEW [dbo].[view_LoadFile_FW13_SOR]
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
        '"choose_color"' AS choose_SORor, 
        '"choose_size"' AS choose_size, 
        '"vendor_sku"' AS vendor_sku, 
        '"vendor_product_id"' AS vendor_product_id, 
        '"vendor_color_code"' AS vendor_SORor_code, 
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
FROM dbo.tbl_LoadFile_FW13_SOR AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW13_SOR" queryout "C:\Data\Shared\FW13SOR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_FW13_SOR	
	
	

