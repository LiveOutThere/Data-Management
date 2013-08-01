IF OBJECT_ID('tempdb..##Category') IS NOT NULL BEGIN
	DROP TABLE ##Category
END
	
CREATE TABLE ##Category (
	sku nvarchar(MAX),
	name nvarchar(MAX), 
	attribute_set nvarchar(MAX), 
	description nvarchar(MAX), 
	features nvarchar(MAX), 
	image nvarchar(MAX)
)
INSERT INTO ##Category
SELECT  
	'"sku"' AS sku, 
	'"name"' AS name,
	'"attribute_set"' AS attribute_set,
	'"description"' AS description, 
	'"features"' AS features, 
	'"image"' AS image
UNION ALL
SELECT '"' + a.sku + '"', '"' + REPLACE(a.name,'"','""') + '"', '"' + a.attribute_set + '"', '"' + REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(13),''),CHAR(10),'') + '"', '"' + REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(13),''),CHAR(10),'') + '"', CASE WHEN 
		(SELECT TOP 1 image FROM tbl_FW13_LoadFiles WHERE vendor_product_id = a.vendor_product_id AND type = 'simple' AND image IS NOT NULL) IS NOT NULL
			THEN '"http://www.liveoutthere.com/media/import/' + (SELECT TOP 1 image FROM tbl_FW13_LoadFiles WHERE vendor_product_id = a.vendor_product_id AND type = 'simple' AND image IS NOT NULL) + '"' ELSE NULL END AS image
FROM tbl_FW13_LoadFiles AS a
FULL JOIN tbl_MechanicalTurk_Results AS b
ON a.sku = b.sku
WHERE b.Answer IS NULL AND a.type = 'configurable' AND a.categories = 'Uncategorized'

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Daypacks Backpacks ^& Luggage\"''" queryout "C:\Data\Shared\DaypacksBackpacksLuggage.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DECLARE @sql1 varchar(1024)
SELECT @sql1 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"default\"''" queryout "C:\Data\Shared\default.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql1

DECLARE @sql2 varchar(1024)
SELECT @sql2 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Footwear\"''" queryout "C:\Data\Shared\Footwear.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql2

DECLARE @sql4 varchar(1024)
SELECT @sql4 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Hats\"''" queryout "C:\Data\Shared\Hats.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql4

DECLARE @sql5 varchar(1024)
SELECT @sql5 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Jackets ^& Vests\"''" queryout "C:\Data\Shared\JacketsVests.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql5

DECLARE @sql6 varchar(1024)
SELECT @sql6 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Pants ^& Shorts\"''" queryout "C:\Data\Shared\PantsShorts.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql6

DECLARE @sql7 varchar(1024)
SELECT @sql7 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Shirts ^& Tops\"''" queryout "C:\Data\Shared\ShirtsTops.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql7

DECLARE @sql8 varchar(1024)
SELECT @sql8 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Skirts Skorts ^& Dresses\"''" queryout "C:\Data\Shared\SkirtsSkortsDresses.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql8

DECLARE @sql9 varchar(1024)
SELECT @sql9 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Sleeping Bags\"''" queryout "C:\Data\Shared\SleepingBags.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql9

DECLARE @sql10 varchar(1024)
SELECT @sql10 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Tents ^& Footprints\"''" queryout "C:\Data\Shared\TentsFootprints.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql10

DECLARE @sql11 varchar(1024)
SELECT @sql11 = 'bcp "SELECT sku, name, description, features, image FROM ##Category WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category WHERE attribute_set = ''\"Underwear\"''" queryout "C:\Data\Shared\Underwear.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql11


IF OBJECT_ID('tempdb..##Category1') IS NOT NULL BEGIN
	DROP TABLE ##Category1
END
	
CREATE TABLE ##Category1 (
	sku nvarchar(MAX),
	name nvarchar(MAX), 
	attribute_set nvarchar(MAX), 
	description nvarchar(MAX), 
	features nvarchar(MAX), 
	image nvarchar(MAX)
)
INSERT INTO ##Category1
SELECT  
	'"sku"' AS sku, 
	'"name"' AS name,
	'"attribute_set"' AS attribute_set,
	'"description"' AS description, 
	'"features"' AS features, 
	'"image"' AS image
UNION ALL
SELECT '"' + a.sku + '"', '"' + a.name + '"', '"' + a.attribute_set + '"', '"' + REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(13),''),CHAR(10),'') + '"', '"' + REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(13),''),CHAR(10),'') + '"', CASE WHEN 
		(SELECT TOP 1 image FROM tbl_FW13_LoadFiles WHERE vendor_product_id = a.vendor_product_id AND type = 'simple' AND image IS NOT NULL) IS NOT NULL
			THEN '"http://www.liveoutthere.com/media/import/' + (SELECT TOP 1 image FROM tbl_FW13_LoadFiles WHERE vendor_product_id = a.vendor_product_id AND type = 'simple' AND image IS NOT NULL) + '"' ELSE NULL END AS image
FROM tbl_FW13_LoadFiles AS a
INNER JOIN tbl_FW13_LoadFiles AS b
ON a.sku = b.sku
WHERE a.type = 'configurable' AND a.categories = 'Uncategorized' AND a.attribute_set = 'Gloves & Mitts'

DECLARE @sql12 varchar(1024)
SELECT @sql12 = 'bcp "SELECT sku, name, description, features, image FROM ##Category1 WHERE sku = ''\"sku\"'' UNION ALL SELECT sku, name, description, features, image FROM ##Category1" queryout "C:\Data\Shared\GlovesMitts.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql12