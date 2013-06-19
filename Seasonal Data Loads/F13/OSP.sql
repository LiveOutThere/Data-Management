/** Load Syntax for the entire table **/
-- File Name: Osprey FW13 Data Load
-- Author: Brenda Mehler 
-- Creation Date: May 27 2013
-- Last Modified: June 14 2013

USE LOT_Inventory
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** If the table exists, then drop the table **/
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_OSP]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_OSP]

/** Create the LOADFILE TABLE for each brand **/
CREATE TABLE [dbo].[tbl_LoadFile_FW13_OSP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_season]  DEFAULT (N'FW13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_manufacturer]  DEFAULT ('Osprey'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OSP_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW13_OSP] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/
CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_OSP] ON [dbo].[tbl_LoadFile_FW13_OSP] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_FW13_OSP

/**Load Syntax**/
GO
INSERT INTO tbl_LoadFile_FW13_OSP (
		[type]		
		,sku
		,[name]
		,has_options
		,price
		,cost
		,department 
		,image 
		,image_label
		,choose_color
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code
		,url_key
		,manage_stock
		,never_backorder)
		
/** The values we want to load the table with using select statements including the functions for data formatting **/	
/*  
 * functions used:
 *			getOSPdepartment			- strips the gender from marketing.unique_features1
 *			getOSPimage					- gets the image files from tbl_RawData_FW13_OSP_Image
 *			getOSPsize					- strips the size values (eg. LG = L, etc)
 *			getOSPAssociatedProducts	- concatenates all simple skus for the configurable rows   
 */
SELECT  
	'simple' AS type
	,('FW13A-OSP-' + LEFT(us_internal_sku_and_style_number,6) + '-' +  SUBSTRING(us_internal_sku_and_style_number, 
      CHARINDEX('-', us_internal_sku_and_style_number) + 1, 
      LEN(us_internal_sku_and_style_number))+ '-' + dbo.getOSPSize(Size))AS sku
	,style												AS name
	,0														AS has_options
	,(SELECT CAST(b.MSRP as FLOAT) - .01 FROM tbl_RawData_FW13_OSP WHERE Style							AS price
	,b.Wholesale											AS cost
	,dbo.getOSPDepartment(c.unique_features1,a.Size)		AS department
	,dbo.getOSPImage(a.style,a.Color,a.UPC)					AS image
	,a.color												AS image_label 
	,a.color												AS choose_color
	,dbo.getOSPSize(a.Size)									AS choose_size
	,CAST(a.UPC AS bigint)									AS vendor_sku
	,c.style												AS vendor_product_id
	,SUBSTRING(us_internal_sku_and_style_number, 
      CHARINDEX('-', us_internal_sku_and_style_number) + 1, 
      LEN(us_internal_sku_and_style_number))				AS vendor_color_code
	,dbo.getOSPSize(a.Size)									AS vendor_size_code
	,dbo.getUrlKey(a.style,'Osprey',(a.color + '-' + dbo.getOSPSize(a.size) + '-'),dbo.getOSPDepartment(c.unique_features1,a.Size)) + '-fw13a'	AS url_key 
	,1														AS manage_stock
	,0														AS never_backorder
FROM tbl_RawData_FW13_OSP_UPC
GO
/* 
 * Now we need to load the configurables  - header rows for all simple rows
 */
INSERT INTO tbl_LoadFile_FW13_OSP (
		[type]
		,sku  		
		,name
		,categories 
		,has_options
		,price
		,cost
		,department
		,visibility 
		,vendor_product_id
		,description
		,features
		,fabric 
		,qty
		,is_in_stock 
		,simples_skus
		,url_key
		,meta_title
		,merchandise_priority
		,never_backorder
		,use_config_backorders
		,manage_stock
		,use_config_manage_stock)
		
/** The values we want to load the table with using select statements including the functions for data formatting **/	

SELECT  DISTINCT 
	'configurable'												AS type
	,('FW13A-OSP-' +  c.Style)									AS sku
	,a.style													AS name
	,dbo.getMagentoCategories(c.Style)							AS categories
	,1															AS has_options
	,CAST(b.MSRP as FLOAT) - .01								AS price
	,b.Wholesale												AS cost
	,dbo.getOSPDepartment(c.unique_features1,a.Size)			AS department
	,'Catalog, Search'											AS visibility
	,c.style													AS vendor_product_id
	,c.Description												AS description 
	,dbo.getOSPFeatures(c.Style)								AS features
	,dbo.getOSPFabric(c.Style)									AS fabric
	,NULL														AS qty
	,NULL 														AS is_in_stock
	,dbo.getOSPAssociatedProducts(c.style)						AS simples_skus
	,dbo.getUrlKey(a.Style,'Osprey','',dbo.getOSPdepartment(c.unique_features1,a.Size))	+ '-fw13a'						AS url_key 
	,'Osprey ' + a.Style + ' - ' + REPLACE(dbo.getOSPdepartment(c.unique_features1,a.Size) + '''s','Men|Women''s','Unisex')		AS meta_title
	,'F'														AS merchandise_priority 
	,0															AS never_backorder
	,0															AS use_config_backorders
	,0															AS manage_stock
	,0															AS use_config_manage_stock
FROM	tbl_RawData_FW13_OSP_UPC		AS a,
		tbl_RawData_FW13_OSP_Price_List AS b,
		tbl_RawData_FW13_OSP_Marketing	AS c 
WHERE  a.[style] = LTRIM(b.product_name_detail)
  AND  a.[style] = c.product
GO

UPDATE tbl_LoadFile_FW13_OSP SET videos = (SELECT TOP 1 SUBSTRING(Youtube,CHARINDEX('=',Youtube)+1,LEN(Youtube)) FROM tbl_RawData_FW13_OSP_Video WHERE Style1 = vendor_product_id AND type = 'configurable')
UPDATE tbl_LoadFile_FW13_OSP SET categories = dbo.getCategory(categories,'Osprey',department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_FW13_OSP SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW13_OSP SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW13_OSP SET small_image = image, thumbnail = image
GO

CREATE VIEW [dbo].[view_LoadFile_FW13_OSP]
AS
SELECT  '"store"' AS store,'"websites"' AS websites, 
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
FROM dbo.tbl_LoadFile_FW13_OSP AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW13_OSP" queryout "C:\Data\Shared\FW13OSP.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_FW13_OSP
	
