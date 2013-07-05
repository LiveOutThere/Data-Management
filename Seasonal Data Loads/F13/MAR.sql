/** Load Syntax for the entire Outdoor Research table **/
-- File Name: OR FW13 Data Load
-- Author: Brenda Mehler 
-- Creation Date: July 2 2013
-- Last Modified: July 2 2013

use LOT_SAIT 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** If the table exists, then drop the table **/
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_MAR]

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
 CONSTRAINT [PK_tbl_LoadFile_FW13_MAR] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_MAR] ON [dbo].[tbl_LoadFile_FW13_MAR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_FW13_MAR

/**Load Syntax**/
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
		,description 
		,url_key  
		,weight 
		,never_backorder
		,manage_stock  
		,use_config_manage_stock)
			
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
	,b.Whole_sale											AS cost
	,dbo.getMARDepartment(b.gender)							AS department	
	,'Not Visible Individually'								AS visibility
	,a.Color_Description									AS image_label 
	,a.Color_Description									AS choose_color 
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
		,description
		,features 
		,url_key 
		,merchandise_priority
		,never_backorder
		,manage_stock 
		,use_config_manage_stock)
			
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
	,'F'													AS merchandize_priority												
	,0														AS never_backorder
	,0														AS manage_stock 
	,0														AS use_config_manage_stock
   
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

UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_FW13_MAR AS a 
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
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_FW13_MAR AS a 
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