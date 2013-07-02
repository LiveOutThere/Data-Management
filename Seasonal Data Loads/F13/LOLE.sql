/** Load Syntax for the entire table **/
--                         ''~``
--                        ( o o )
--+------------------.oooO--(_)--Oooo.------------------+
--|                                                     |
--|            File Name: LOLEe FW13 Data Load		    |
--|            Author: Emily Luu                        |
--|            Creation Date: June 28 2013              |
--|			   Last Modified: July 2 2013               |
--|                    .oooO                            |
--|                    (   )   Oooo.                    |
--+---------------------\ (----(   )--------------------+
--                       \_)    ) /
--                             (_/
                                        
use LOT_SAIT
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
SET CONCAT_NULL_YIELDS_NULL OFF
GO
/** If the table exists, then drop the table **/
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_LOLE]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_LOLE]
GO
/** Create the LOADFILE TABLE for each brand **/
CREATE TABLE [dbo].[tbl_LoadFile_FW13_LOLE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_season]  DEFAULT (N'FW13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_manufacturer]  DEFAULT ('Lole'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_LOLE_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW13_LOLE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
/** Create the Keys **/
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/
CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_LOLE] ON [dbo].[tbl_LoadFile_FW13_LOLE] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/** Loading data, truncating table and starting from fresh**/

TRUNCATE TABLE tbl_LoadFile_FW13_LOLE
GO
/**Load Syntax**/

INSERT INTO tbl_LoadFile_FW13_LOLE (
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
/** The values we want to load the table with using select statements including the functions for data formatting **/	
SELECT DISTINCT
	'simple'																	AS type
	,REPLACE(('FW13A-LOLE-' +  CAST(a.style AS NVARCHAR) + '-' +  dbo.ProperCase(SUBSTRING(a.color,1,4)) + '-' +  a.Size),'--','-') AS sku
	,dbo.ProperCase(a.Description)												AS name
	,0																			AS has_options
	,CAST(a.list_price AS INTEGER) - .02										AS price
	,a.unit_price																AS cost
	,a.gender																	AS department
	,null																		AS image
	,dbo.ProperCase(SUBSTRING(a.color, CHARINDEX(' - ', a.color)+3,20))			AS image_label
	,dbo.ProperCase(SUBSTRING(a.color, CHARINDEX(' - ', a.color)+3,20))			AS choose_color
	,a.Size																		AS choose_size
	,CAST(a.UPC  AS bigint)														AS vendor_sku
	,a.style																	AS vendor_product_id
	,SUBSTRING(a.color,1,4)														AS vendor_color_code
	,a.Size																		AS vendor_size_code
	,dbo.getUrlKey(a.Description, 'LOLE', SUBSTRING(a.color, CHARINDEX(' - ', a.color)+3,20) + '-' + a.Size, a.gender) + '-fw13a' AS url_key
	,null																		AS weight
FROM tbl_RawData_FW13_LOLE_Marketing AS b
JOIN tbl_RawData_FW13_LOL_UPC_Price AS a
ON a.style = b.[Style Number]
GO	

/** Need to Load the Configurables **/
INSERT INTO tbl_LoadFile_FW13_LOLE (
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
/** Loading the Configurables in to the table with functions for formatting**/
SELECT DISTINCT
	'configurable'												AS type
	,SUBSTRING(SKU,1,18)										AS sku
	,Name														AS name
	,'Uncategorized' 											AS categories
	,'choose_color,choose_size' 								AS configurable_attributes
	,'1' 														AS has_options
	,price 														AS price
	,cost 														AS cost
	,department 												AS department
	,'Catalog, Search' 											AS visibility
	,vendor_product_id 											AS vendor_product_id
	, null 														AS is_in_stock
	,dbo.getUrlKey(Name,'LOLE','',department) + '-fw13a'		AS url_key
	,'Lole ' + Name + ' - ' + department + '''s'				AS meta_title
	,'F' 														AS merchandise_priority
	,0 															AS manage_stock
	,0 															AS use_config_manage_stock
FROM tbl_LoadFile_FW13_LOLE
GO	

/** After Loading, update the DATA **/
UPDATE tbl_LoadFile_FW13_LOLE 
SET
--	care_instructions = ,
	simples_skus	  = (SELECT top 1 dbo.getLOLAssociatedProducts([style number]) FROM tbl_RawData_FW13_LOLE_Marketing WHERE [style number]  COLLATE DATABASE_DEFAULT= a.vendor_product_id COLLATE DATABASE_DEFAULT),
	categories		  = (SELECT top 1 dbo.getMagentoCategories(vendor_product_id) FROM LOT_Inventory.dbo.tbl_Magento_Categories WHERE vendor_product_id = a.vendor_product_id COLLATE DATABASE_DEFAULT ),
--	fabric			  = ,
	description		  = (SELECT top 1 [long description] FROM tbl_RawData_FW13_LOLE_Marketing WHERE [style number] COLLATE DATABASE_DEFAULT = a.vendor_product_id COLLATE DATABASE_DEFAULT)
--	fit				  = 
--	volume			  = 
FROM tbl_LoadFile_FW13_LOLE AS a
WHERE type = 'configurable'
GO

/** Insert the image file names **/
UPDATE a
	SET a.image = b.image
FROM tbl_LoadFile_FW13_LOLE AS a
INNER JOIN LOT_Inventory.dbo.tbl_LoadFile_SS13_LOLE AS b
ON a.vendor_sku = b.vendor_sku 
WHERE a.type = 'simple'
GO

UPDATE a
	SET a.image = b.Filename 
FROM tbl_LoadFile_FW13_LOLE AS a
INNER JOIN LOT_INVENTORY.dbo.tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '-' + a.vendor_color_code + '%'
WHERE a.type = 'simple' AND a.image IS NULL
GO

/** More updates to the tables and checking the DATA **/	
UPDATE tbl_LoadFile_FW13_LOLE SET categories = dbo.getCategory(categories,'LOLEe',department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_FW13_LOLE SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW13_LOLE SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW13_LOLE SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

-------------- Will Address the rest of this later
/** Creating the table view for reference **/
CREATE VIEW [dbo].[view_LoadFile_FW13_LOLE]
AS
SELECT  '"store"' AS store, 
		'"websites"' AS websites, 
		'"type"' AS type, 
		'"sku"' AS sku, 
		'"name"' AS name, 
		'"categories"' AS categories, 
		'"attrLOLEute_set"' AS attrLOLEute_set, 
        '"configurable_attrLOLEutes"' AS configurable_attrLOLEutes, 
        '"has_options"' AS has_options, 
        '"price"' AS price, 
        '"cost"' AS cost, 
        '"status"' AS status, 
        '"tax_class_id"' AS tax_class_id, 
        '"department"' AS department, 
        '"visLOLEility"' AS visLOLEility, 
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
FROM dbo.tbl_LoadFile_FW13_LOLE AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW13_LOLE" queryout "C:\Data\Shared\FW13LOLE.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_FW13_LOLE