/** Load Syntax for the entire Outdoor Research table **/
-- File Name: OR FW13 Data Load
-- Author: Brenda Mehler 
-- Creation Date: June 19 2013
-- Last Modified: June 19 2013

use LOT_SAIT 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** If the table exists, then drop the table **/
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_OR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_OR]

/** Create the LOADFILE TABLE for each brand **/
CREATE TABLE [dbo].[tbl_LoadFile_FW13_OR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- super attribute pricing null for both simple and configurable
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_season]  DEFAULT ('FW13ASAP'),
	[short_description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[features] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- activities null for both
	[activities] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- weather null for both
	[weather] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- layering null for both
	[layering] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- care instructions null for both
	[care_instructions] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- fabric null for both
	[fabric] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- fit null for both
	[fit] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- volume null for both
	[volume] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_manufacturer]  DEFAULT ('Outdoor Research'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
-- videos null for both
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_OR_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_FW13_OR] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_OR] ON [dbo].[tbl_LoadFile_FW13_OR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_FW13_OR

/**Load Syntax**/
GO
INSERT INTO tbl_LoadFile_FW13_OR (
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
		,manage_stock
		,use_config_manage_stock)
			
/** The values we want to load the table with using select statements including the functions for data formatting **/	
/*  
 * functions used:
 *	
 *			getORDepartment			- translates the gender
 *			getORAssociatedProducts	- concatenates all simple skus for the configurable rows 
 *			getURLKey				- strings the urlkey together  
 *			getMagentocategories	- strings the categories
 */
SELECT  
	'simple'												AS type
 	,'FW13A-OR-' +  CAST(a.Style_number AS varchar(155)) 
 				 + '-' + CAST(a.color_code AS varchar(155)) 
 				 + '-' + a.size 
															AS sku 												
	,b.name													AS name
	,0														AS has_options
	,CAST(a.MSRP_CAD as FLOAT) - .01						AS price
	,a.Wholesale_Price_CAD									AS cost
	,dbo.getORDepartment(a.gender)							AS department	
	,'Not Visible Individually'								AS visibility
	,lower(a.color_name)									AS image_label
	,upper(a.color_name)									AS choose_color 
 	,upper(size)											AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,a.style_number											AS vendor_product_id
	,a.Color_code											AS vendor_color_code
	,a.size										 			AS vendor_size_code
	,description											AS description
	,dbo.getUrlKey(b.name,'outdoor research','' 
				,dbo.getORDepartment(a.gender)) 
				+ '-fw13a'									AS url_key			 												
	,product_weight_gm										AS weight 
	,1														AS manage_stock
	,1														AS use_config_manage_stock
FROM tbl_RawData_FW13_OR_UPC_Price			AS a
INNER JOIN tbl_RawData_FW13_OR_Marketing	AS b
ON  a.style_number = b.style

GO
/* 
 * Now we need to load the configurables  - these are header rows for simple rows
 */
INSERT INTO tbl_LoadFile_FW13_OR (
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
		,url_key 
		,merchandise_priority
		,manage_stock)
/** 
 **   We load the configurable table with data loaded in 'simple' types 
 **			unless the values are different for 'configurables'
 **/	

SELECT  distinct 
	'configurable'												AS type
	,'OR-' +  vendor_product_id									AS sku 
	,name 														AS name
	,'choose-color,choose-size'									AS configurable_attributes
	,1															AS has_options
	,price														AS price
	,cost														AS cost
 	,department													AS department
	,'Catalog, Search'											AS visibility
	,vendor_product_id 											AS vendor_product_id
	,description												AS description
	,url_key 												    AS url_key	
	,'F'														AS merchandize_priority 
	,0															AS manage_stock
FROM tbl_LoadFile_FW13_OR

/** 
 ** After Loading, update some data in each type (simple, configurable)
 **/
/** 
 ** Both tables need the status and the image updated
 **/
GO
UPDATE tbl_LoadFile_FW13_OR SET
	status			= CASE WHEN (SELECT top 1 image_label FROM dbo.tbl_LoadFile_FW13_OR WHERE ID = a.id)
					IS NULL THEN 'Disabled'
							ELSE 'Enabled'
					END,
	image			= (select top 1 filename 
						from lot_inventory.dbo.tbl_rawdata_fw13_image_filenames a
			                 inner join lot_sait.dbo.tbl_LoadFile_FW13_OR b
			                 on a.Filename 
			                 like ('%' + b.vendor_product_id + '_' + b.vendor_color_code + '.jpg')
			   			where  a.Brand = 'OR' and b.type ='simple' and b.image IS NULL)									
FROM tbl_LoadFile_FW13_OR AS a 
GO
/** 
 ** Now that we have created the image column, small-image and thumbnail need to be set to image
 **/
 UPDATE tbl_LoadFile_FW13_OR SET
		small_image			= a.image,
		thumbnail			= a.image
  FROM tbl_LoadFile_FW13_OR AS a
 GO
 /** 
 ** Configurables need other columns updated
 ** 				
 **/
 UPDATE tbl_LoadFile_FW13_OR SET
	categories		= dbo.getMagentoCategories(vendor_product_id),	
	simples_skus	= dbo.getORAssociatedProducts(vendor_product_id),
	meta_title		= a.manufacturer + ' ' + a.name + ' - ' 
									 + REPLACE(REPLACE(a.department 
									 + '''s','Men|Women''s','Unisex'),'Boy|Girl''s','Kid''s'),
	features		= (select top 1 b.features 
						from dbo.tbl_RawData_FW13_OR_Marketing b
						inner join dbo.tbl_LoadFile_FW13_OR c 
						on b.style = c.vendor_product_id
						where c.type = 'simple' and b.features is not null)	
FROM tbl_LoadFile_FW13_OR AS a
WHERE type = 'configurable'
GO