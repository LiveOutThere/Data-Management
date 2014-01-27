USE LOT_Inventory 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

/** If the table exists, then drop the table **/
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS14_OR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS14_OR]

/** Create the LOADFILE TABLE for each brand **/
CREATE TABLE [dbo].[tbl_LoadFile_SS14_OR](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_visibility]  DEFAULT ('Not Visible Individually'),
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
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_season_id]  DEFAULT ('SS14 ASAP'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_manufacturer]  DEFAULT ('Outdoor Research'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_use_config_backorders]  DEFAULT ((0)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS14_OR_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS14_OR] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
/** Create the Index **/

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS14_OR] ON [dbo].[tbl_LoadFile_SS14_OR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

GO
/** Loading data, truncating table and starting from fresh**/
TRUNCATE TABLE tbl_LoadFile_SS14_OR

/**Load Syntax**/
GO
INSERT INTO tbl_LoadFile_SS14_OR (
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
		,weight
		,manage_stock
		,use_config_manage_stock)
			
SELECT DISTINCT
	'simple'												AS type
 	,'SS14A-OR-' + CAST(a.[Style #] AS nvarchar(255)) + '-' + dbo.getORColorCode(a.Color) + '-' + REPLACE(a.Size,'1SIZE','O/S') AS sku 												
	,dbo.getORProductName(ISNULL(b.name,a.[STYLE NAME]))	AS name
	,0														AS has_options
	,CAST(a.[MSRP (CAD)] AS float) - .01					AS price
	,a.[Wholesale Price (CAD)]								AS cost
	,dbo.getORDepartment(a.Gender)							AS department	
	,'Not Visible Individually'								AS visibility
	,dbo.ProperCase(a.[Color Name])							AS image_label
	,dbo.ProperCase(a.[Color Name])							AS choose_color 
 	,REPLACE(a.Size,'1SIZE','O/S')							AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,a.[Style #]											AS vendor_product_id
	,dbo.getORColorCode(a.Color)							AS vendor_color_code
	,REPLACE(a.Size,'1SIZE','O/S')				 			AS vendor_size_code
	,REPLACE(b.weight_g,' g','')							AS weight
	,1														AS manage_stock
	,1														AS use_config_manage_stock
FROM tbl_RawData_SS14_OR_UPC_Price			AS a
LEFT JOIN tbl_RawData_SS14_OR_Marketing	    AS b
ON a.[Style #] = b.style
GO

INSERT INTO tbl_LoadFile_SS14_OR (
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
		,merchandise_priority
		,manage_stock
		,qty
		,is_in_stock
		,use_config_manage_stock
		)

SELECT DISTINCT 
	'configurable'												AS type
	,'OR-' + vendor_product_id									AS sku 
	,name 														AS name
	,'choose_color,choose_size'									AS configurable_attributes
	,1															AS has_options
	,price														AS price
	,cost														AS cost
 	,department													AS department
	,'Catalog, Search'											AS visibility
	,vendor_product_id 											AS vendor_product_id
	,dbo.getUrlKey(name,'Outdoor Research','',department)		AS url_key		
	,'F'														AS merchandize_priority 
	,0															AS manage_stock
	,NULL														AS qty
	,NULL														AS is_in_stock
	,0															AS use_config_manage_stock
FROM tbl_LoadFile_SS14_OR
GO

UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_LoadFile_FW13_OR AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type ='simple'
GO

UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_LoadFile_SS13_OR AS b
ON a.vendor_sku = b.vendor_sku
WHERE a.type ='simple' AND a.image IS NULL
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_RawData_SS14_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'OR' AND a.type ='simple' AND a.image IS NULL
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'OR' AND a.type ='simple' AND a.image IS NULL
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_RawData_SS14_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + ('0' + LEFT(a.vendor_color_code,2)) + '%'
WHERE b.Brand = 'OR' AND a.type ='simple' AND a.image IS NULL AND RIGHT(a.vendor_color_code,1) = 'B'
GO

UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_SS14_OR AS a 
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + ('0' + LEFT(a.vendor_color_code,2)) + '%'
WHERE b.Brand = 'OR' AND a.type ='simple' AND a.image IS NULL AND RIGHT(a.vendor_color_code,1) = 'B'
GO

UPDATE tbl_LoadFile_SS14_OR SET
	categories		= dbo.getMagentoCategories(vendor_product_id),	
	simples_skus	= dbo.getORAssociatedProducts(vendor_product_id),
	meta_title		= a.manufacturer + ' ' + REPLACE(REPLACE(a.department + '''s ','Men|Women''s ',''),'Boy|Girl''s ','') + a.name,
	description		= (SELECT TOP 1 description FROM tbl_RawData_SS14_OR_Marketing WHERE Style = a.vendor_product_id),
	features		= (SELECT TOP 1 REPLACE(features,'*','|') FROM tbl_RawData_SS14_OR_Marketing WHERE Style = a.vendor_product_id)	
FROM tbl_LoadFile_SS14_OR AS a
WHERE type = 'configurable'
GO

DECLARE @stylenumber varchar(1024), @styledesc varchar(1024), @color varchar(1024), @features varchar(1024), @description varchar(1024), @sku varchar(1024)

DECLARE alike_styles CURSOR FOR
SELECT DISTINCT vendor_product_id, name, choose_color, features, description FROM tbl_LoadFile_SS14_OR

OPEN alike_styles

FETCH NEXT FROM alike_styles INTO @stylenumber, @styledesc, @color, @features, @description

WHILE @@FETCH_STATUS = 0
BEGIN
	SELECT @sku = sku FROM tbl_LoadFile_SS14_OR WHERE name LIKE @styledesc + '%' AND choose_color = @color AND features IS NULL OR description IS NULL
	UPDATE tbl_LoadFile_SS14_OR SET features = @features, description = @description WHERE sku = @sku
	FETCH NEXT FROM alike_styles  INTO @stylenumber, @styledesc, @color, @features, @description
END

CLOSE alike_styles
DEALLOCATE alike_styles
GO

UPDATE tbl_LoadFile_SS14_OR SET image = '34916_900.jpg' WHERE vendor_sku = '727602259369'
UPDATE tbl_LoadFile_SS14_OR SET image = '37532_008.jpg' WHERE vendor_sku = '727602258782'
UPDATE tbl_LoadFile_SS14_OR SET image = '37532_008.jpg' WHERE vendor_sku = '727602258799'
UPDATE tbl_LoadFile_SS14_OR SET image = '37532_008.jpg' WHERE vendor_sku = '727602258805'
UPDATE tbl_LoadFile_SS14_OR SET image = '37532_008.jpg' WHERE vendor_sku = '727602258768'
UPDATE tbl_LoadFile_SS14_OR SET image = '97590_986.jpg' WHERE vendor_sku = '727602302027'
UPDATE tbl_LoadFile_SS14_OR SET image = '97590_986.jpg' WHERE vendor_sku = '727602302034'
UPDATE tbl_LoadFile_SS14_OR SET image = '97590_986.jpg' WHERE vendor_sku = '727602302041'
UPDATE tbl_LoadFile_SS14_OR SET image = '97590_986.jpg' WHERE vendor_sku = '727602302058'
UPDATE tbl_LoadFile_SS14_OR SET image = '97590_986.jpg' WHERE vendor_sku = '727602302065'
UPDATE tbl_LoadFile_SS14_OR SET image = '57801_189.jpg' WHERE vendor_sku = '727602290584'
UPDATE tbl_LoadFile_SS14_OR SET image = '57801_189.jpg' WHERE vendor_sku = '727602290591'
UPDATE tbl_LoadFile_SS14_OR SET image = '57801_189.jpg' WHERE vendor_sku = '727602290607'
UPDATE tbl_LoadFile_SS14_OR SET image = '57801_189.jpg' WHERE vendor_sku = '727602290614'
UPDATE tbl_LoadFile_SS14_OR SET image = '57801_189.jpg' WHERE vendor_sku = '727602290621'
UPDATE tbl_LoadFile_SS14_OR SET image = '36006_890.jpg' WHERE vendor_sku = '727602258072'
UPDATE tbl_LoadFile_SS14_OR SET image = '36006_890.jpg' WHERE vendor_sku = '727602258041'
UPDATE tbl_LoadFile_SS14_OR SET image = '36006_890.jpg' WHERE vendor_sku = '727602258515'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_940.jpg' WHERE vendor_sku = '727602265902'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_545.jpg' WHERE vendor_sku = '727602306711'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_001.jpg' WHERE vendor_sku = '727602258539'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_545.jpg' WHERE vendor_sku = '727602258546'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_940.jpg' WHERE vendor_sku = '727602306728'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_001.jpg' WHERE vendor_sku = '727602258577'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_545.jpg' WHERE vendor_sku = '727602258584'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_940.jpg' WHERE vendor_sku = '727602306742'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_001.jpg' WHERE vendor_sku = '727602258591'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_940.jpg' WHERE vendor_sku = '727602265926'
UPDATE tbl_LoadFile_SS14_OR SET image = '36687_545.jpg' WHERE vendor_sku = '727602306759'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_001.jpg' WHERE vendor_sku = '727602258836'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_940.jpg' WHERE vendor_sku = '727602258843'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_001.jpg' WHERE vendor_sku = '727602258850'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_585.jpg' WHERE vendor_sku = '727602258867'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_001.jpg' WHERE vendor_sku = '727602258898'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_585.jpg' WHERE vendor_sku = '727602258904'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_001.jpg' WHERE vendor_sku = '727602258911'
UPDATE tbl_LoadFile_SS14_OR SET image = '37693_940.jpg' WHERE vendor_sku = '727602258928'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_10B.jpg' WHERE vendor_sku = '727602295961'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_10B.jpg' WHERE vendor_sku = '727602295978'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_10B.jpg' WHERE vendor_sku = '727602295985'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_10B.jpg' WHERE vendor_sku = '727602295992'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_11B.jpg' WHERE vendor_sku = '727602296005'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_11B.jpg' WHERE vendor_sku = '727602296012'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_11B.jpg' WHERE vendor_sku = '727602296029'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_11B.jpg' WHERE vendor_sku = '727602296036'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_12B.jpg' WHERE vendor_sku = '727602296043'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_12B.jpg' WHERE vendor_sku = '727602296050'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_12B.jpg' WHERE vendor_sku = '727602296067'
UPDATE tbl_LoadFile_SS14_OR SET image = '90165_12B.jpg' WHERE vendor_sku = '727602296074'
UPDATE tbl_LoadFile_SS14_OR SET image = '50921_049.jpg' WHERE vendor_sku = '727602232508'
UPDATE tbl_LoadFile_SS14_OR SET image = '50921_049.jpg' WHERE vendor_sku = '727602232515'
UPDATE tbl_LoadFile_SS14_OR SET image = '50921_049.jpg' WHERE vendor_sku = '727602232522'
UPDATE tbl_LoadFile_SS14_OR SET image = '50921_049.jpg' WHERE vendor_sku = '727602232539'
UPDATE tbl_LoadFile_SS14_OR SET image = '50921_049.jpg' WHERE vendor_sku = '727602232546'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_001.jpg' WHERE vendor_sku = '727602300832'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_001.jpg' WHERE vendor_sku = '727602300849'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_148.jpg' WHERE vendor_sku = '727602300887'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_148.jpg' WHERE vendor_sku = '727602300894'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_155.jpg' WHERE vendor_sku = '727602300900'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_155.jpg' WHERE vendor_sku = '727602300917'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_001.jpg' WHERE vendor_sku = '727602303079'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_001.jpg' WHERE vendor_sku = '727602303086'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_001.jpg' WHERE vendor_sku = '727602303093'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_148.jpg' WHERE vendor_sku = '727602303109'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_148.jpg' WHERE vendor_sku = '727602303116'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_155.jpg' WHERE vendor_sku = '727602303123'
UPDATE tbl_LoadFile_SS14_OR SET image = '97501_155.jpg' WHERE vendor_sku = '727602303130'
UPDATE tbl_LoadFile_SS14_OR SET image = '90852_171.jpg' WHERE vendor_sku = '727602296821'
UPDATE tbl_LoadFile_SS14_OR SET image = '90852_171.jpg' WHERE vendor_sku = '727602296838'
UPDATE tbl_LoadFile_SS14_OR SET image = '90852_171.jpg' WHERE vendor_sku = '727602296845'
UPDATE tbl_LoadFile_SS14_OR SET image = '90852_171.jpg' WHERE vendor_sku = '727602296852'
UPDATE tbl_LoadFile_SS14_OR SET image = '90852_171.jpg' WHERE vendor_sku = '727602296869'
UPDATE tbl_LoadFile_SS14_OR SET image = '97515_189.jpg' WHERE vendor_sku = '727602301129'
UPDATE tbl_LoadFile_SS14_OR SET image = '97515_189.jpg' WHERE vendor_sku = '727602301150'
UPDATE tbl_LoadFile_SS14_OR SET image = '97515_189.jpg' WHERE vendor_sku = '727602301167'
UPDATE tbl_LoadFile_SS14_OR SET image = '97515_189.jpg' WHERE vendor_sku = '727602303307'
UPDATE tbl_LoadFile_SS14_OR SET image = '97515_189.jpg' WHERE vendor_sku = '727602303314'
UPDATE tbl_LoadFile_SS14_OR SET image = '57811_189.jpg' WHERE vendor_sku = '727602290751'
UPDATE tbl_LoadFile_SS14_OR SET image = '57811_189.jpg' WHERE vendor_sku = '727602290768'
UPDATE tbl_LoadFile_SS14_OR SET image = '57811_189.jpg' WHERE vendor_sku = '727602290775'
UPDATE tbl_LoadFile_SS14_OR SET image = '57811_189.jpg' WHERE vendor_sku = '727602290782'
UPDATE tbl_LoadFile_SS14_OR SET image = '57811_189.jpg' WHERE vendor_sku = '727602290799'
UPDATE tbl_LoadFile_SS14_OR SET image = '86635_17B.jpg' WHERE vendor_sku = '727602306179'
UPDATE tbl_LoadFile_SS14_OR SET image = '86635_17B.jpg' WHERE vendor_sku = '727602306094'
UPDATE tbl_LoadFile_SS14_OR SET image = '86635_17B.jpg' WHERE vendor_sku = '727602306100'
UPDATE tbl_LoadFile_SS14_OR SET image = '36895_008.jpg' WHERE vendor_sku = '727602258676'
UPDATE tbl_LoadFile_SS14_OR SET image = '36895_008.jpg' WHERE vendor_sku = '727602258690'
UPDATE tbl_LoadFile_SS14_OR SET image = '36895_008.jpg' WHERE vendor_sku = '727602258713'
UPDATE tbl_LoadFile_SS14_OR SET image = '36896_940.jpg' WHERE vendor_sku = '727602265957'
UPDATE tbl_LoadFile_SS14_OR SET image = '36895_008.jpg' WHERE vendor_sku = '727602258737'
UPDATE tbl_LoadFile_SS14_OR SET image = '36897_660.jpg' WHERE vendor_sku = '727602258744'
UPDATE tbl_LoadFile_SS14_OR SET image = '34367_571.jpg' WHERE vendor_sku = '727602259314'
UPDATE tbl_LoadFile_SS14_OR SET image = '34367_571.jpg' WHERE vendor_sku = '727602259321'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_008.jpg' WHERE vendor_sku = '727602258959'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_940.jpg' WHERE vendor_sku = '727602258966'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_008.jpg' WHERE vendor_sku = '727602258973'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_545.jpg' WHERE vendor_sku = '727602258980'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_008.jpg' WHERE vendor_sku = '727602259017'
UPDATE tbl_LoadFile_SS14_OR SET image = '37648_545.jpg' WHERE vendor_sku = '727602259024'
UPDATE tbl_LoadFile_SS14_OR SET image = '86140_18B.jpg' WHERE vendor_sku = '727602306155'
UPDATE tbl_LoadFile_SS14_OR SET image = '72120_26B.jpg' WHERE vendor_sku = '727602309774'
UPDATE tbl_LoadFile_SS14_OR SET image = '72120_26B.jpg' WHERE vendor_sku = '727602309781'
UPDATE tbl_LoadFile_SS14_OR SET image = '72120_26B.jpg' WHERE vendor_sku = '727602309798'
UPDATE tbl_LoadFile_SS14_OR SET image = '72120_26B.jpg' WHERE vendor_sku = '727602309804'
UPDATE tbl_LoadFile_SS14_OR SET image = '72120_26B.jpg' WHERE vendor_sku = '727602309811'
UPDATE tbl_LoadFile_SS14_OR SET image = '36027_545.jpg' WHERE vendor_sku = '727602257976'
UPDATE tbl_LoadFile_SS14_OR SET image = '36027_890.jpg' WHERE vendor_sku = '727602257983'
UPDATE tbl_LoadFile_SS14_OR SET image = '86625_19B.jpg' WHERE vendor_sku = '727602306162'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_001.jpg' WHERE vendor_sku = '727602286594'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_001.jpg' WHERE vendor_sku = '727602286600'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_001.jpg' WHERE vendor_sku = '727602286617'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_001.jpg' WHERE vendor_sku = '727602286624'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_285.jpg' WHERE vendor_sku = '727602286631'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_285.jpg' WHERE vendor_sku = '727602286648'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_285.jpg' WHERE vendor_sku = '727602286655'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_285.jpg' WHERE vendor_sku = '727602286662'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_462.jpg' WHERE vendor_sku = '727602286679'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_462.jpg' WHERE vendor_sku = '727602286686'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_462.jpg' WHERE vendor_sku = '727602286693'
UPDATE tbl_LoadFile_SS14_OR SET image = '52210_462.jpg' WHERE vendor_sku = '727602286709'
UPDATE tbl_LoadFile_SS14_OR SET image = '52351_045.jpg' WHERE vendor_sku = '727602199511'
UPDATE tbl_LoadFile_SS14_OR SET image = '52351_045.jpg' WHERE vendor_sku = '727602199528'
UPDATE tbl_LoadFile_SS14_OR SET image = '52351_045.jpg' WHERE vendor_sku = '727602199535'
UPDATE tbl_LoadFile_SS14_OR SET image = '52351_045.jpg' WHERE vendor_sku = '727602199542'
UPDATE tbl_LoadFile_SS14_OR SET image = '50506_890.jpg' WHERE vendor_sku = '727602199856'
UPDATE tbl_LoadFile_SS14_OR SET image = '50506_890.jpg' WHERE vendor_sku = '727602199863'
UPDATE tbl_LoadFile_SS14_OR SET image = '50506_890.jpg' WHERE vendor_sku = '727602199870'
UPDATE tbl_LoadFile_SS14_OR SET image = '50506_890.jpg' WHERE vendor_sku = '727602199887'
UPDATE tbl_LoadFile_SS14_OR SET image = '71306_189.jpg' WHERE vendor_sku = '727602309637'
UPDATE tbl_LoadFile_SS14_OR SET image = '71306_189.jpg' WHERE vendor_sku = '727602309644'
UPDATE tbl_LoadFile_SS14_OR SET image = '71306_189.jpg' WHERE vendor_sku = '727602309651'
UPDATE tbl_LoadFile_SS14_OR SET image = '71306_189.jpg' WHERE vendor_sku = '727602309668'
UPDATE tbl_LoadFile_SS14_OR SET image = '76143_15B.jpg' WHERE vendor_sku = '727602293363'
UPDATE tbl_LoadFile_SS14_OR SET image = '76143_15B.jpg' WHERE vendor_sku = '727602293370'
UPDATE tbl_LoadFile_SS14_OR SET image = '76143_15B.jpg' WHERE vendor_sku = '727602293387'
UPDATE tbl_LoadFile_SS14_OR SET image = '76143_15B.jpg' WHERE vendor_sku = '727602293394'
UPDATE tbl_LoadFile_SS14_OR SET image = '76200_008.jpg' WHERE vendor_sku = '727602309729'
UPDATE tbl_LoadFile_SS14_OR SET image = '76200_008.jpg' WHERE vendor_sku = '727602309736'
UPDATE tbl_LoadFile_SS14_OR SET image = '76200_008.jpg' WHERE vendor_sku = '727602309743'
UPDATE tbl_LoadFile_SS14_OR SET image = '76200_008.jpg' WHERE vendor_sku = '727602309750'
UPDATE tbl_LoadFile_SS14_OR SET image = '76200_008.jpg' WHERE vendor_sku = '727602309767'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_050.jpg' WHERE vendor_sku = '727602258232'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_489.jpg' WHERE vendor_sku = '727602258249'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_050.jpg' WHERE vendor_sku = '727602258270'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_489.jpg' WHERE vendor_sku = '727602258287'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_050.jpg' WHERE vendor_sku = '727602258294'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_489.jpg' WHERE vendor_sku = '727602258300'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_050.jpg' WHERE vendor_sku = '727602258218'
UPDATE tbl_LoadFile_SS14_OR SET image = '37487_489.jpg' WHERE vendor_sku = '727602258225'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258393'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_571.jpg' WHERE vendor_sku = '727602258409'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258416'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_489.jpg' WHERE vendor_sku = '727602258423'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258331'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_489.jpg' WHERE vendor_sku = '727602258348'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258454'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_489.jpg' WHERE vendor_sku = '727602258461'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258355'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_571.jpg' WHERE vendor_sku = '727602258362'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258478'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_571.jpg' WHERE vendor_sku = '727602258485'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_050.jpg' WHERE vendor_sku = '727602258379'
UPDATE tbl_LoadFile_SS14_OR SET image = '37706_489.jpg' WHERE vendor_sku = '727602258386'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_050.jpg' WHERE vendor_sku = '727602259079'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_757.jpg' WHERE vendor_sku = '727602259086'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_050.jpg' WHERE vendor_sku = '727602259093'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_489.jpg' WHERE vendor_sku = '727602259109'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_050.jpg' WHERE vendor_sku = '727602259130'
UPDATE tbl_LoadFile_SS14_OR SET image = '36914_489.jpg' WHERE vendor_sku = '727602259147'
UPDATE tbl_LoadFile_SS14_OR SET image = '33420_909.jpg' WHERE vendor_sku = '727602259260'
UPDATE tbl_LoadFile_SS14_OR SET image = '33420_909.jpg' WHERE vendor_sku = '727602259284'
UPDATE tbl_LoadFile_SS14_OR SET image = '83120_426.jpg' WHERE vendor_sku = '727602294049'
UPDATE tbl_LoadFile_SS14_OR SET image = '83120_426.jpg' WHERE vendor_sku = '727602294056'
UPDATE tbl_LoadFile_SS14_OR SET image = '83120_426.jpg' WHERE vendor_sku = '727602294063'
UPDATE tbl_LoadFile_SS14_OR SET image = '36401_529.jpg' WHERE vendor_sku = '727602259192'
UPDATE tbl_LoadFile_SS14_OR SET image = '36401_529.jpg' WHERE vendor_sku = '727602259208'
UPDATE tbl_LoadFile_SS14_OR SET image = '36401_529.jpg' WHERE vendor_sku = '727602259178'
UPDATE tbl_LoadFile_SS14_OR SET image = '36401_529.jpg' WHERE vendor_sku = '727602259185'
GO

UPDATE tbl_LoadFile_SS14_OR SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_SS14_OR SET status = CASE WHEN type = 'simple' AND image IS NULL THEN 'Disabled' ELSE 'Enabled' END 
UPDATE tbl_LoadFile_SS14_OR SET thumbnail = image, small_image = image WHERE type = 'simple'
GO

CREATE VIEW [dbo].[view_LoadFile_SS14_OR]
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
FROM dbo.tbl_LoadFile_SS14_OR AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS14_OR" queryout "C:\Data\Shared\SS14OR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS14_OR