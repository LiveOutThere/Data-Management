USE LOT_Inventory 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
 
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_FW13_MAR]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_FW13_MAR]
 
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
	
 CONSTRAINT [PK_tbl_LoadFile_FW13_MAR] PRIMARY KEY CLUSTERED 
(
		[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
 
CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_FW13_MAR] ON [dbo].[tbl_LoadFile_FW13_MAR] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
 
GO
 
TRUNCATE TABLE tbl_LoadFile_FW13_MAR
 
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
		,url_key  
		,weight 
		,never_backorder
		,manage_stock  
		,use_config_manage_stock)
			
SELECT DISTINCT 
	'simple'												AS type
 	,'FW13A-MAR-' +  b.Style_number + '-' + a.Color_Number + '-' + dbo.getMARSize(a.Size) AS sku												
	,dbo.getMARName(b.product_name)						    AS name
	,0														AS has_options
	,CAST(b.MSRP AS float) - .01							AS price
	,b.Whole_sale											AS cost
	,dbo.getMARDepartment(b.gender,b.product_name)			AS department	
	,'Not Visible Individually'								AS visibility
	,a.Color_Description									AS image_label 
	,a.Color_Description									AS choose_color 
 	,dbo.getMARSize(a.Size)									AS choose_size
 	,CAST(a.UPC AS bigint)									AS vendor_sku
	,b.style_number											AS vendor_product_id
	,a.color_number											AS vendor_color_code 
	,dbo.getMARSize(a.Size)			 						AS vendor_size_code 
	,dbo.getUrlKey(dbo.getMARName(b.product_name),'Marmot',a.Color_Description + '-' + dbo.getMARSize(a.Size),dbo.getMARDepartment(b.gender,b.product_name)) + '-fw13a' AS url_key 	 												
	,dbo.getMARWeight(b.style_number)					    AS weight 
    ,0														AS never_backorder
	,1														AS manage_stock 
	,1														AS use_config_manage_stock
FROM tbl_RawData_FW13_MAR_UPC AS a 
INNER JOIN tbl_RawData_FW13_MAR_Price_List AS b 
ON a.Style_number = b.Style_number
GO
 
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
 	,'MAR-' + vendor_product_id								AS sku											
	,name													AS name
	,'choose_color,choose_size'								AS configurable_attributes
	,1														AS has_options
	,price													AS price
	,cost													AS cost
	,department												AS department	
	,'Catalog, Search'										AS visibility
	,vendor_product_id 										AS vendor_product_id
	,dbo.getUrlKey(name,'Marmot','',department)			    AS url_key	
	,'Marmot ' + REPLACE(REPLACE(department + '''s ','Men|Women''s ',''),'Boy|Girl''s ','') + name AS meta_title		
	,'F'													AS merchandize_priority												
	,0														AS never_backorder
	,0														AS manage_stock 
	,0														AS use_config_manage_stock
	,NULL													AS qty
	,NULL													AS is_in_stock
   
FROM dbo.tbl_LoadFile_FW13_MAR
GO
 
UPDATE a SET
	a.image = b.image
FROM tbl_LoadFile_FW13_MAR AS a 
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
GO
 
UPDATE a SET
	a.image = b.Filename
FROM tbl_LoadFile_FW13_MAR AS a 
INNER JOIN tbl_RawData_FW13_Image_Filenames AS b
ON b.Filename LIKE '%' + a.vendor_product_id + '_' + a.vendor_color_code + '%'
WHERE b.Brand = 'MAR' AND a.type ='simple' AND a.image IS NULL
GO
 
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A22200_6169_alwayssummer_bag.jpg' WHERE vendor_sku = '785562390034'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A20120_6332_cmwmembrain_bag.jpg' WHERE vendor_sku = '785562982925'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A63160_1440_hatteras_pnt.jpg' WHERE vendor_sku IN('785562740143','785562740150','785562740167','785562740174','785562740181','785562740198','785562740211')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A20910_4462_w_anglefire.jpg' WHERE vendor_sku IN('785562407527','785562407534','785562407541','785562407558')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A73540_9227_isotherm_hdy.jpg' WHERE vendor_sku IN('785562672505','785562672512','785562672529','785562672536')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A70290_001_motion_pnt.jpg' WHERE vendor_sku IN('785562388000','785562388017','785562388024','785562388031')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21320_9512_neversummer_bag.jpg' WHERE vendor_sku = '785562407763'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21360_1229_neversummermem_bag.jpg' WHERE vendor_sku IN('785562407800','785562407817')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A20750_4724_neverwinter_bag.jpg' WHERE vendor_sku IN('785562407626','785562407633','785562407565','785562407572')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21140_9413_w_ouray_bag.jpg' WHERE vendor_sku IN('785562407824','785562407831','785562407848','785562407855')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A88640_001_w_powerstretch_jkt.jpg' WHERE vendor_sku IN('785562388420','785562388505','785562391857','785562391864','785562391871')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A88640_6778_w_powerstretch_jkt.jpg' WHERE vendor_sku IN('785562392335','785562392342','785562392359','785562392366','785562392373')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A88640_2692_w_powerstretch_jkt.jpg' WHERE vendor_sku IN('785562391932','785562391949','785562392304','785562392311','785562392328')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A88640_2381_w_powerstretch_jkt.jpg' WHERE vendor_sku IN('785562391888','785562391895','785562391901','785562391918','785562391925')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A88640_9185_w_powerstretch_jkt.jpg' WHERE vendor_sku IN('785562392380','785562392397','785562392557','785562392564','785562392571')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A55260_001_w_precip_fllzppnt.jpg' WHERE vendor_sku IN('785562041707','785562041714','785562041721','785562041738')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A30660_62778_ridgerock_jkt.jpg' WHERE vendor_sku IN('785562396197','785562396210','785562396227','785562396234','785562396241')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A50820_1415_rincon_jkt.jpg' WHERE vendor_sku IN('785562665415','785562665422','785562665439','785562665446','785562665460')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A50820_6278_rincon_jkt.jpg' WHERE vendor_sku IN('785562665583','785562665590','785562665613','785562665620','785562665637')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A20590_2759_sawtooth_bag.jpg' WHERE vendor_sku IN('785562407589','785562407596','785562407602','785562407619','785562407688','785562407695')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21840_1228_sawtoothmem_bag.jpg' WHERE vendor_sku = '785562407640'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A80950_001_scree_pnt.jpg' WHERE vendor_sku IN('785562230958','785562230965','785562230972','785562230989','785562230996','785562231009','785562231016','785562230743','785562230750','785562230767','785562230774','785562230781','785562230798','785562230804')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A85310_001_w_scree_pnt.jpg' WHERE vendor_sku IN('785562340183','785562340190','785562340343','785562340350','785562340367')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A85310_1132_w_scree_pnt.jpg' WHERE vendor_sku IN('785562340398','785562340404','785562340480','785562340497','785562340503','785562340510')
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21640_2717_w_sunset20_ba.jpg' WHERE vendor_sku = '785562659216'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21670_4462_w_sunset30_bag.jpg' WHERE vendor_sku = '785562659261'
UPDATE tbl_LoadFile_FW13_MAR SET image = 'A21240_2422_w_teton_bag.jpg' WHERE vendor_sku = '785562407725'

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