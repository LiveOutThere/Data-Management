USE LOT_Inventory 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_ARC]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_ARC]

CREATE TABLE [dbo].[tbl_LoadFile_FW13_ARC](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_store] DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_websites] DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_attribute_set] DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_status] DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_tax_class] DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_visibility] DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_season] DEFAULT ('FW13 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_manufacturer] DEFAULT ('Arc''teryx'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_qty] DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_is_in_stock] DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_backorders] DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_use_config_backorders] DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_FW13_ARC_use_config_manage_stock] DEFAULT ((1))

 CONSTRAINT [PK_tbl_LoadFile_fw13_ARC] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_fw13_ARC] ON [dbo].[tbl_LoadFile_fw13_ARC] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_fw13_ARC

/**Load Syntax**/
GO
INSERT INTO tbl_LoadFile_fw13_ARC (
		 type		
		,sku
		,name
		,has_options
		,price
		,cost
		,department  
		,visibility
		,image 
		,image_label
		,choose_color 
		,choose_size
		,vendor_sku
		,vendor_product_id
		,vendor_color_code
		,vendor_size_code
		,url_key 
		,weight
		,manage_stock 
		,use_config_manage_stock)
			
/** The values we want to load the table with using select statements including the functions for data formatting **/	

SELECT  
	'simple'												AS type
  ,'FW13A-ARC-' +  CAST(a.model AS nvarchar(155)) 
 				 + '-' 
 				 + a.color 
 				 + '-' + a.size								AS sku 											
	,b.[marketing name]										AS name
	,1														AS has_options
	,CAST(a.suggested_retail as FLOAT) - .01				AS price
	,a.wholesale											AS cost
	,dbo.getARCDepartment(b.gender)							AS department	
	,'Not Visible Individually'								AS visibility
	,lower(a.color)											AS image_label
	,upper(a.color)											AS choose_color 
 	,upper(size)											AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,a.model												AS vendor_product_id
	,a.Color												AS vendor_color_code
	,a.size										 			AS vendor_size_code 
	,a.description											AS description
	,dbo.getUrlKey(b.[marketing name],'arc''''tyrex','' 
				,dbo.getORDepartment(b.gender)) 
				+ '-fw13a'									AS url_key			 												
	,a.weight													AS weight 
	,1														AS manage_stock
	,1														AS use_config_manage_stock
FROM tbl_RawData_FW13_ARC_UPC_Price_List		AS a
INNER JOIN tbl_RawData_FW13_ARC_Marketing	AS b
ON  cast(a.model as nvarchar(255)) = b.model

GO
/* 
 * Now we need to load the configurables  - these are header rows for simple rows
 */
INSERT INTO tbl_LoadFile_fw13_ARC (
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
FROM tbl_LoadFile_fw13_ARC
/** 
 ** After Loading, update some data in each type (simple, configurable)
 **/
/** 
 ** Both tables need the status and the image updated
 **/
GO
UPDATE tbl_LoadFile_fw13_ARC SET
	status			= CASE WHEN (SELECT top 1 image_label FROM dbo.tbl_LoadFile_fw13_ARC WHERE ID = a.id)
					IS NULL THEN 'Disabled'
							ELSE 'Enabled'
					END,
	image			= (select top 1 filename 
						from lot_inventory.dbo.tbl_rawdata_fw13_image_filenames a
			                 inner join lot_sait.dbo.tbl_LoadFile_fw13_ARC b
			                 on a.Filename 
			                 like ('%' + b.vendor_product_id + '_' + b.vendor_color_code + '.jpg')
			   			where  a.Brand = 'OR' and b.type ='simple' and b.image IS NULL)									
FROM tbl_LoadFile_fw13_ARC AS a 
GO
/** 
 ** Now that we have created the image column, small-image and thumbnail need to be set to image
 **/
 UPDATE tbl_LoadFile_fw13_ARC SET
		small_image			= a.image,
		thumbnail			= a.image
  FROM tbl_LoadFile_fw13_ARC AS a
 GO
 /** 
 ** Configurables need other columns updated
 ** 				
 **/
 UPDATE tbl_LoadFile_fw13_ARC SET
	categories		= dbo.getMagentoCategories(vendor_product_id),	
	simples_skus	= dbo.getORAssociatedProducts(vendor_product_id),
	meta_title		= a.manufacturer + ' ' + a.name + ' - ' 
									 + REPLACE(REPLACE(a.department 
									 + '''s','Men|Women''s','Unisex'),'Boy|Girl''s','Kid''s'),
	features		= (select top 1 b.features 
						from dbo.tbl_RawData_FW13_ARC_Marketing b
						inner join dbo.tbl_LoadFile_fw13_ARC c 
						on  b.model = c.vendor_product_id 
						collate   Latin1_General_CI_AS
 						where c.type = 'simple' 
 						
 )	
FROM tbl_LoadFile_fw13_ARC AS a
WHERE type = 'configurable'
GO
 
  
 

