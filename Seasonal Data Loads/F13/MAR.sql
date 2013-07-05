<<<<<<< HEAD
USE LOT_Inventory 
=======
/** Load Syntax for the entire Outdoor Research table **/
-- File Name: OR FW13 Data Load
-- Author: Brenda Mehler 
-- Creation Date: July 2 2013
-- Last Modified: July 2 2013

use LOT_SAIT 
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

<<<<<<< HEAD
=======
/** If the table exists, then drop the table **/
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_MAR]

<<<<<<< HEAD
CREATE TABLE [dbo].[tbl_LoadFile_FW13_MAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_store] DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_websites] DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_attribute_set] DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_status] DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_tax_class] DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_visibility] DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_season] DEFAULT ('FW13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_manufacturer] DEFAULT ('Marmot'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_qty] DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_is_in_stock] DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_backorders] DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_use_config_backorders] DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_use_config_manage_stock] DEFAULT ((1))
	
=======
/** Create the LOADFILE TABLE for the brand **/
CREATE TABLE [dbo].[tbl_LoadFile_FW13_MAR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_store]  
						DEFAULT ('admin'),
	[websites] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_websites]  
						DEFAULT ('base'),
	[type] [nvarchar](50) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_attribute_set]  
						DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_status]  
						DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_tax_class]  
						DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_visibility]  
						DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season_id] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_season]  
						DEFAULT ('FW13 ASAP'),
	[short_description] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[features] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[activities] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weather] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[layering] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[care_instructions] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fabric] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fit] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[volume] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[manufacturer] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_manufacturer]  
						DEFAULT ('Marmot'),
	[qty] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_qty]  
						DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_is_in_stock]  
						DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_backorders] 
						DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_use_config_backorders]  
						DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) 
						COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
						CONSTRAINT [DF_tbl_LoadFile_FW13_MAR_use_config_manage_stock]  
						DEFAULT ((1))
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
 CONSTRAINT [PK_tbl_LoadFile_FW13_MAR] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
<<<<<<< HEAD
=======
/** Create the Index **/
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_MAR] ON [dbo].[tbl_LoadFile_FW13_MAR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
<<<<<<< HEAD

TRUNCATE TABLE tbl_LoadFile_FW13_MAR

=======
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_FW13_MAR

/**Load Syntax**/
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
GO
INSERT INTO tbl_LoadFile_FW13_MAR (
		 type		
		,sku
		,name
		,has_options
		,price
		,cost
		,department  
		,visibility
		,image_label
		,choose_color 
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code 
<<<<<<< HEAD
=======
		,description 
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
		,url_key  
		,weight 
		,never_backorder
		,manage_stock  
		,use_config_manage_stock)
			
<<<<<<< HEAD
SELECT DISTINCT 
	'simple'												AS type
 	,'FW13A-MAR-' +  b.Style_number + '-' + a.Color_Number + '-' + dbo.getMARSize(a.Size) AS sku												
	,dbo.getMARName(b.product_name)						    AS name
	,0														AS has_options
	,CAST(b.MSRP AS float) - .01							AS price
=======
/** The values we want to load the table with using select statements including the functions for data formatting **/	

SELECT  distinct 
	'simple'												AS type
 	,'FW13A-MAR-' +  b.Style_number  
 			      + '-' + a.Color_Number 
 			      + '-' + lot_inventory.dbo.getMARSize(a.Size)
 															AS sku												
	,lot_inventory.dbo.getMARName(b.product_name)			AS name
	,0														AS has_options
	,CAST(b.MSRP as FLOAT) - .01							AS price
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
	,b.Whole_sale											AS cost
	,dbo.getMARDepartment(b.gender)							AS department	
	,'Not Visible Individually'								AS visibility
	,a.Color_Description									AS image_label 
	,a.Color_Description									AS choose_color 
<<<<<<< HEAD
 	,dbo.getMARSize(a.Size)									AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,b.style_number											AS vendor_product_id
	,a.color_number											AS vendor_color_code 
	,dbo.getMARSize(a.Size)			 						AS vendor_size_code 
	,dbo.getUrlKey(dbo.getMARName(b.product_name),'Marmot',a.Color_Description + '-' + dbo.getMARSize(a.Size),dbo.getMARDepartment(b.gender)) + '-fw13a' AS url_key 	 												
	,dbo.getMARWeight(b.style_number)					    AS weight 
    ,0														AS never_backorder
	,1														AS manage_stock 
	,1														AS use_config_manage_stock
FROM tbl_RawData_FW13_MAR_UPC AS a 
INNER JOIN tbl_RawData_FW13_MAR_Price_List AS b 
ON a.Style_number = b.Style_number
GO
=======
 	,lot_inventory.dbo.getMARSize(a.Size)					AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,b.style_number											AS vendor_product_id
	,a.color_number											AS vendor_color_code 
	,lot_inventory.dbo.getMARSize(a.Size)			 		AS vendor_size_code 
	,a.style_description										AS description
	,dbo.getUrlKey(lot_inventory.dbo.getMARName(b.product_name)		
			     ,'Marmot'
			   	 ,(a.Color_description + '-' + lot_inventory.dbo.getMARSize(a.Size)),'')
			   	 + '-' + lower(substring(dbo.getMARDepartment(b.gender),1,1))	
			   	 + '-fw13a'									AS url_key 	 												
	 ,lot_inventory.dbo.getMARWeight(b.style_number)		AS weight 
     ,0														AS never_backorder
	 ,1														AS manage_stock 
	 ,1														AS use_config_manage_stock
FROM lot_inventory.dbo.tbl_rawdata_fw13_mar_upc			AS a INNER JOIN
     lot_inventory.dbo.tbl_rawdata_fw13_mar_price_list	AS b 
			ON a.Style_number = b.Style_number				 INNER JOIN
     lot_inventory.dbo.tbl_rawdata_fw13_mar_marketing	AS c 
			ON cast(c.[style number] as nvarchar(255)) = b.style_number 
GO
/* Load configurables */
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb

INSERT INTO tbl_LoadFile_FW13_MAR (
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
<<<<<<< HEAD
=======
		,description
		,features 
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
		,url_key 
		,merchandise_priority
		,never_backorder
		,manage_stock 
		,use_config_manage_stock)
<<<<<<< HEAD
			 
SELECT DISTINCT 
	'configurable'											AS type
 	,'MAR-' + vendor_product_id								AS sku											
	,name													AS name
	,'Choose_color,Choose_size'								AS configurable_attributes
	,1														AS has_options
	,price													AS price
	,cost													AS cost
	,department												AS department	
	,'Catalog,Search'										AS visibility
	,vendor_product_id 										AS vendor_product_id
	,dbo.getUrlKey(name,'Marmot','',department)			    AS url_key			
=======
			
/** The values we want to load the table with using select statements including the functions for data formatting **/	
 
SELECT  distinct 
	'configurable'											AS type
 	,'MAR-' +  a.vendor_product_id							AS sku											
	,a.name													AS name
	,'Choose_color,Choose_size'								AS configurable_attributes
	,1														AS has_options
	,a.Price												AS price
	,a.cost													AS cost
	,a.department											AS department	
	,'Catalog,Search'										AS visibility
	,a.vendor_product_id 									AS vendor_product_id
	,a.description											AS description
	,LOT_Inventory.dbo.getMARFeatures(a.vendor_product_id)	AS features	
	,dbo.getUrlKey(a.name		
			     ,'Marmot','','')
			   	 + ' - '
			   	 + lower(substring(a.department,1,1))	    AS url_key			
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
	,'F'													AS merchandize_priority												
	,0														AS never_backorder
	,0														AS manage_stock 
	,0														AS use_config_manage_stock
   
<<<<<<< HEAD
FROM dbo.tbl_LoadFile_FW13_MAR
GO
=======
FROM         dbo.tbl_loadfile_fw13_mar	 AS a
GO
UPDATE tbl_LoadFile_FW13_MAR SET
	status			= CASE WHEN 
							(SELECT top 1 image_label 
							   FROM dbo.tbl_LoadFile_FW13_MAR 
							 WHERE ID = a.id )
							IS NULL THEN 'Disabled'
									ELSE 'Enabled'
						END															
FROM tbl_LoadFile_FW13_MAR AS a 
where type = 'simple'
GO
/**
 ** Find all the image file names that we can....
 **		- first, check the previous loadfile
 **
 */
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb

UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_FW13_MAR AS a 
<<<<<<< HEAD
INNER JOIN tbl_LoadFile_F12_MAR AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type = 'simple'
GO

UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_FW13_MAR AS a 
INNER JOIN tbl_LoadFile_SS13_MAR AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type ='simple' AND a.image IS NULL
=======
INNER JOIN lot_inventory.dbo.tbl_LoadFile_F12_MAR AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type ='simple' and a.manufacturer = 'Marmot' AND a.image IS NULL
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_FW13_MAR AS a 
INNER JOIN lot_inventory.dbo.tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'MAR' AND a.type ='simple' AND a.image IS NULL
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_FW13_MAR AS a 
<<<<<<< HEAD
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'MAR' AND a.type ='simple' AND a.image IS NULL
GO

UPDATE tbl_LoadFile_FW13_MAR SET
	categories		= dbo.getMagentoCategories(a.vendor_product_id),	
	simples_skus	= dbo.getMARAssociatedProducts(a.vendor_product_id),
	fabric			= (SELECT TOP 1 materials FROM tbl_RawData_FW13_MAR_Marketing WHERE CAST([Style Number] AS nvarchar(255)) = a.vendor_product_id),
	features	    = dbo.getMARFeatures(a.vendor_product_id),
	description		= (SELECT TOP 1 [Positioning Statement] FROM tbl_RawData_FW13_MAR_Marketing WHERE CAST([Style Number] AS nvarchar(255)) = a.vendor_product_id)
FROM tbl_LoadFile_FW13_MAR AS a
WHERE a.type = 'configurable'
GO

DECLARE @stylenumber varchar(1024), @styledesc varchar(1024), @color varchar(1024), @features varchar(1024), @description varchar(1024), @sku varchar(1024)

DECLARE alike_styles CURSOR FOR
SELECT DISTINCT vendor_product_id, name, choose_color, features, description FROM tbl_LoadFile_FW13_MAR

OPEN alike_styles

FETCH NEXT FROM alike_styles INTO @stylenumber, @styledesc, @color, @features, @description

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @sku = sku FROM tbl_LoadFile_FW13_MAR WHERE name LIKE @styledesc + '%' AND choose_color = @color AND features IS NULL OR description IS NULL
	UPDATE tbl_LoadFile_FW13_MAR SET features = @features, description = @description WHERE sku = @sku
	FETCH NEXT FROM alike_styles  INTO @stylenumber, @styledesc, @color, @features, @description
END

CLOSE alike_styles
DEALLOCATE alike_styles
GO
	
UPDATE tbl_LoadFile_FW13_MAR SET categories = dbo.getCategory(categories,'Marmot',department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_FW13_MAR SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_FW13_MAR SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_FW13_MAR SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

CREATE VIEW [dbo].[view_LoadFile_FW13_MAR]
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
FROM dbo.tbl_LoadFile_FW13_MAR AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_FW13_MAR" queryout "C:\Data\Shared\FW13MAR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_FW13_MAR
=======
INNER JOIN lot_inventory.dbo.tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'MAR' AND a.type ='simple' AND a.image IS NULL
GO
/** 
 ** Now that we have created the image column, small-image and thumbnail need to be set to image
 **  ONLY SIMPLES 
 **/
 UPDATE tbl_LoadFile_FW13_MAR SET
		small_image			= a.image,
		thumbnail			= a.image
  FROM tbl_LoadFile_FW13_MAR AS a
  where type = 'simple'
GO
/** 
 ** Configurables need other columns updated
 ** 				
 **/
 UPDATE tbl_LoadFile_FW13_MAR SET
	categories		= dbo.getMagentoCategories(a.vendor_product_id),	
	simples_skus	= dbo.getMARAssociatedProducts(a.vendor_product_id),
	meta_title		= a.manufacturer + ' ' + a.name + ' - ' + a.department,									
	status			= CASE WHEN 
					(SELECT top 1 image_label 
					   FROM dbo.tbl_LoadFile_FW13_MAR 
					 WHERE ID = a.id )
					IS NULL THEN 'Disabled'
							ELSE 'Enabled'
					 END,
	fabric			= (select materials  
						 from LOT_Inventory.dbo.tbl_rawdata_FW13_mar_marketing
					   where cast([style number] AS nvarchar(255)) = a.vendor_product_id)
FROM tbl_LoadFile_FW13_MAR AS a
WHERE a.type = 'configurable'

GO
>>>>>>> 2d242f1d39d9520cee148b063ad8d293203a55fb
