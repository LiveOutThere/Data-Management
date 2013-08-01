USE LOT_Inventory
GO

CREATE VIEW [dbo].[view_Export_FW13_Loadfiles] AS
SELECT  
	'"store"' AS store, 
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
			'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(10),''),CHAR(13),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(10),''),CHAR(13),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.fabric,'"','""'),CHAR(10),''),CHAR(13),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.volume,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.meta_title,'"','""'))) + '"'
	FROM LOT_Inventory.dbo.tbl_FW13_LoadFiles AS a
	GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] ORDER BY type DESC" queryout "C:\Data\Shared\FW13DataLoad.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

/*	
DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE LEFT(manufacturer,4) = ''\"Arc'' AND RIGHT(manufacturer,6) = ''teryx\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13ARC.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DECLARE @sql1 varchar(1024)
SELECT @sql1 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Columbia\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13COL.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql1

DECLARE @sql2 varchar(1024)
SELECT @sql2 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Mountain Hardwear\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13MHW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql2

DECLARE @sql3 varchar(1024)
SELECT @sql3 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Sorel\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13SOR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql3

DECLARE @sql4 varchar(1024)
SELECT @sql4 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Deuter\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13DEU.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql4

DECLARE @sql5 varchar(1024)
SELECT @sql5 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Helly Hansen\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13HH.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql5

DECLARE @sql6 varchar(1024)
SELECT @sql6 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Icebreaker\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13IB.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql6

DECLARE @sql7 varchar(1024)
SELECT @sql7 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Patagonia\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13PAT.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql7

DECLARE @sql8 varchar(1024)
SELECT @sql8 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Lole\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13LOLE.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql8

DECLARE @sql9 varchar(1024)
SELECT @sql9 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Marmot\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13MAR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql9

DECLARE @sql10 varchar(1024)
SELECT @sql10 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Merrell\"'' AND sku LIKE ''%MERAPP%'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13MERAPP.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql10

DECLARE @sql11 varchar(1024)
SELECT @sql11 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Merrell\"'' AND sku LIKE ''%MERFOOT%'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13MERFOOT.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql11

DECLARE @sql12 varchar(1024)
SELECT @sql12 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Osprey\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13OSP.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql12

DECLARE @sql13 varchar(1024)
SELECT @sql13 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"Outdoor Research\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13OR.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql13

DECLARE @sql14 varchar(1024)
SELECT @sql14 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"SmartWool\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13SW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql14

DECLARE @sql15 varchar(1024)
SELECT @sql15 = 'bcp "SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles] WHERE manufacturer = ''\"manufacturer\"'' UNION ALL SELECT * FROM LOT_Inventory.dbo.[view_Export_FW13_Loadfiles]  WHERE manufacturer = ''\"The North Face\"'' ORDER BY type DESC" queryout "C:\Data\Shared\FW13TNF.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql15
*/

DROP VIEW view_Export_FW13_Loadfiles