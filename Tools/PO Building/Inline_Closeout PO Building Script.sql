USE LOT_Purchasing
GO

ALTER PROCEDURE Inline_Closeout_PO_Building
	@po_num varchar(30), 
	@po_type nvarchar(30), 
	@brand nvarchar(30),
	@brand_code nvarchar(30)
AS
BEGIN
	--This initial line allows for multiple executions of the procedure without polluting tbl_Purchase_Order with duplicate rows:
	DELETE FROM tbl_Purchase_Order WHERE PO_NUM = @po_num
	
	--The beginning section is where the relevant data gets inserted into #PO_DATA & @config_string so that it can be referenced later:
	IF OBJECT_ID('tempdb..#PO_DATA') IS NOT NULL BEGIN
		DROP TABLE #PO_DATA
	END		

	CREATE TABLE #PO_DATA (style_color_size nvarchar(255), vendor_product_id nvarchar(255), config_sku nvarchar(255))
	INSERT INTO #PO_DATA (style_color_size) (
	SELECT '5067-001-S' UNION ALL
	SELECT '5067-001-M' UNION ALL
	SELECT '5067-001-L' UNION ALL
	SELECT '5067-001-XL' UNION ALL
	SELECT '5067-2079-M' UNION ALL
	SELECT '5067-2079-L' UNION ALL
	SELECT '5067-2079-XL' UNION ALL
	SELECT '30380-001-S' UNION ALL
	SELECT '30380-001-M' UNION ALL
	SELECT '30380-001-L' UNION ALL
	SELECT '30380-001-XL' UNION ALL
	SELECT '30380-2740-S' UNION ALL
	SELECT '30380-2740-M' UNION ALL
	SELECT '30380-2740-L' UNION ALL
	SELECT '30380-2740-XL' UNION ALL
	SELECT '30380-6278-S' UNION ALL
	SELECT '30380-6278-M' UNION ALL
	SELECT '30380-6278-L' UNION ALL
	SELECT '30380-6278-XL' UNION ALL
	SELECT '81030-1452-S' UNION ALL
	SELECT '81030-1452-M' UNION ALL
	SELECT '81030-1452-L' UNION ALL
	SELECT '81030-1452-XL' UNION ALL
	SELECT '81030-6359-S' UNION ALL
	SELECT '81030-6359-M' UNION ALL
	SELECT '81030-6359-L' UNION ALL
	SELECT '81030-6359-XL' UNION ALL
	SELECT '83250-001-S' UNION ALL
	SELECT '83250-001-M' UNION ALL
	SELECT '83250-001-L' UNION ALL
	SELECT '83250-001-XL' UNION ALL
	SELECT '83250-1440-S' UNION ALL
	SELECT '83250-1440-M' UNION ALL
	SELECT '83250-1440-L' UNION ALL
	SELECT '83250-1440-XL' UNION ALL
	SELECT '72460-1440-S' UNION ALL
	SELECT '72460-1440-M' UNION ALL
	SELECT '72460-1440-L' UNION ALL
	SELECT '72460-1440-XL' UNION ALL
	SELECT '80190-001-S' UNION ALL
	SELECT '80190-001-M' UNION ALL
	SELECT '80190-001-L' UNION ALL
	SELECT '80190-001-XL' UNION ALL
	SELECT '64440-066-S' UNION ALL
	SELECT '64440-066-M' UNION ALL
	SELECT '64440-066-L' UNION ALL
	SELECT '64440-066-XL' UNION ALL
	SELECT '64440-2775-S' UNION ALL
	SELECT '64440-2775-M' UNION ALL
	SELECT '64440-2775-L' UNION ALL
	SELECT '64440-2775-XL' UNION ALL
	SELECT '61380-2376-S' UNION ALL
	SELECT '61380-2376-M' UNION ALL
	SELECT '61380-2376-L' UNION ALL
	SELECT '61380-2376-XL' UNION ALL
	SELECT '61380-001-S' UNION ALL
	SELECT '61380-001-M' UNION ALL
	SELECT '61380-001-L' UNION ALL
	SELECT '61380-001-XL' UNION ALL
	SELECT '64940-1440-30' UNION ALL
	SELECT '64940-1440-32' UNION ALL
	SELECT '64940-1440-34' UNION ALL
	SELECT '64940-1440-36' UNION ALL
	SELECT '64940-1440-38' UNION ALL
	SELECT '64940-1440-40' UNION ALL
	SELECT '64940-7284-30' UNION ALL
	SELECT '64940-7284-32' UNION ALL
	SELECT '64940-7284-34' UNION ALL
	SELECT '64940-7284-36' UNION ALL
	SELECT '64940-7284-38' UNION ALL
	SELECT '80950-001-30' UNION ALL
	SELECT '80950-001-32' UNION ALL
	SELECT '80950-001-34' UNION ALL
	SELECT '80950-001-36' UNION ALL
	SELECT '80950-001-38' UNION ALL
	SELECT '1586-6355-OS' UNION ALL
	SELECT '1586-4502-OS' UNION ALL
	SELECT '1586-1460-OS' UNION ALL
	SELECT '89570-001-XS' UNION ALL
	SELECT '89570-001-S' UNION ALL
	SELECT '89570-001-M' UNION ALL
	SELECT '89570-001-L' UNION ALL
	SELECT '89570-001-XL' UNION ALL
	SELECT '89570-169-XS' UNION ALL
	SELECT '89570-169-S' UNION ALL
	SELECT '89570-169-M' UNION ALL
	SELECT '89570-169-L' UNION ALL
	SELECT '89570-169-XL' UNION ALL
	SELECT '75190-001-XS' UNION ALL
	SELECT '75190-001-S' UNION ALL
	SELECT '75190-001-M' UNION ALL
	SELECT '75190-001-L' UNION ALL
	SELECT '75190-001-XL' UNION ALL
	SELECT '75190-2692-XS' UNION ALL
	SELECT '75190-2692-S' UNION ALL
	SELECT '75190-2692-M' UNION ALL
	SELECT '75190-2692-L' UNION ALL
	SELECT '75190-2692-XL' UNION ALL
	SELECT '88030-001-XS' UNION ALL
	SELECT '88030-001-S' UNION ALL
	SELECT '88030-001-M' UNION ALL
	SELECT '88030-001-L' UNION ALL
	SELECT '88030-001-XL' UNION ALL
	SELECT '88030-3048-XS' UNION ALL
	SELECT '88030-3048-S' UNION ALL
	SELECT '88030-3048-M' UNION ALL
	SELECT '88030-3048-L' UNION ALL
	SELECT '88030-3048-XL' UNION ALL
	SELECT '78090-001-XS' UNION ALL
	SELECT '78090-001-S' UNION ALL
	SELECT '78090-001-M' UNION ALL
	SELECT '78090-001-L' UNION ALL
	SELECT '78090-001-XL' UNION ALL
	SELECT '78090-3048-XS' UNION ALL
	SELECT '78090-3048-S' UNION ALL
	SELECT '78090-3048-M' UNION ALL
	SELECT '78090-3048-L' UNION ALL
	SELECT '78090-3048-XL' UNION ALL
	SELECT '78090-001-XS' UNION ALL
	SELECT '78090-001-S' UNION ALL
	SELECT '78090-001-M' UNION ALL
	SELECT '78090-001-L' UNION ALL
	SELECT '78090-001-XL' UNION ALL
	SELECT '78090-1132-XS' UNION ALL
	SELECT '78090-1132-S' UNION ALL
	SELECT '78090-1132-M' UNION ALL
	SELECT '78090-1132-L' UNION ALL
	SELECT '78090-1132-XL' UNION ALL
	SELECT '1154-001-XS' UNION ALL
	SELECT '1154-001-S' UNION ALL
	SELECT '1154-001-M' UNION ALL
	SELECT '1154-001-L' UNION ALL
	SELECT '1154-001-XL' UNION ALL
	SELECT '1154-2692-XS' UNION ALL
	SELECT '1154-2692-S' UNION ALL
	SELECT '1154-2692-M' UNION ALL
	SELECT '1154-2692-L' UNION ALL
	SELECT '1154-2692-XL' UNION ALL
	SELECT '1154-6778-XS' UNION ALL
	SELECT '1154-6778-S' UNION ALL
	SELECT '1154-6778-M' UNION ALL
	SELECT '1154-6778-L' UNION ALL
	SELECT '1154-6778-XL' UNION ALL
	SELECT '85310-001-4' UNION ALL
	SELECT '85310-001-6' UNION ALL
	SELECT '85310-001-8' UNION ALL
	SELECT '85310-001-10' UNION ALL
	SELECT '85310-001-12' UNION ALL
	SELECT '85310-001-14' UNION ALL
	SELECT '69100-1316-4' UNION ALL
	SELECT '69100-1316-6' UNION ALL
	SELECT '69100-1316-8' UNION ALL
	SELECT '69100-1316-10' UNION ALL
	SELECT '69100-1316-12' UNION ALL
	SELECT '69100-1316-14') 

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '5067' UNION ALL
	SELECT '30380' UNION ALL
	SELECT '81030' UNION ALL
	SELECT '83250' UNION ALL
	SELECT '72460' UNION ALL
	SELECT '80190' UNION ALL
	SELECT '64440' UNION ALL
	SELECT '61380' UNION ALL
	SELECT '64940' UNION ALL
	SELECT '80950' UNION ALL
	SELECT '1586' UNION ALL
	SELECT '89570' UNION ALL
	SELECT '75190' UNION ALL
	SELECT '88030' UNION ALL
	SELECT '78090' UNION ALL
	SELECT '1154' UNION ALL
	SELECT '85310' UNION ALL
	SELECT '69100')

	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''MAR-5067'''',''''MAR-30380'''',''''MAR-81030'''',''''MAR-83250'''',''''MAR-72460'''',''''MAR-80190'''',''''MAR-64440'''',''''MAR-61380'''',''''MAR-64940'''',''''MAR-80950'''',''''MAR-1586'''',''''MAR-89570'''',''''MAR-75190'''',''''MAR-88030'''',''''MAR-78090'''',''''MAR-1154'''',''''MAR-85310'''',''''MAR-69100'''''
	
	--Here #view_PO_LoadFile gets created and then populated with the desired rows from your desired loadfile:
	IF OBJECT_ID('tempdb..#view_PO_LoadFile') IS NOT NULL BEGIN
		DROP TABLE #view_PO_LoadFile
	END	
	
	CREATE TABLE #view_PO_LoadFile (id int,store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_sku nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),short_description nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),activities nvarchar(MAX),weather nvarchar(MAX),layering nvarchar(MAX),care_instructions nvarchar(MAX),fabric nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),videos nvarchar(MAX),weight nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX))
	
	DECLARE @sql varchar(MAX)
	SET @sql = '
	INSERT INTO #view_PO_LoadFile
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = b.style_color_size COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple''
	
	UNION ALL
	
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON a.vendor_product_id COLLATE Latin1_General_CI_AS = b.vendor_product_id COLLATE Latin1_General_CI_AS
	WHERE a.type = ''configurable''
	ORDER BY a.type DESC,a.department,a.vendor_product_id,a.vendor_color_code,a.vendor_size_code'
	EXEC (@sql)
	
	--Insert the contents of #view_PO_LoadFile into tbl_Purchase_Order, as well as a PO_NUM value:
	INSERT INTO tbl_Purchase_Order SELECT *, @po_num AS PO_NUM FROM #view_PO_LoadFile

	--Create the #missing_data table and insert rows for any and all issues:
	IF OBJECT_ID('tempdb..#missing_data') IS NOT NULL BEGIN
		DROP TABLE #missing_data
	END	

	CREATE TABLE #missing_data (id int IDENTITY(1,1), issue nvarchar(255),name nvarchar(MAX),vendor_product_id nvarchar(100),choose_color nvarchar(MAX),vendor_color_code nvarchar(MAX))
	INSERT INTO #missing_data
	SELECT DISTINCT 'Missing Image', name, vendor_product_id, choose_color, vendor_color_code
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'simple' AND image IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Description', name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'configurable' AND description IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Features', name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'configurable' AND features IS NULL
	
	UPDATE #missing_data SET issue = 'Missing Description & Features' WHERE name IN(
		SELECT DISTINCT name
		FROM #missing_data
		GROUP BY name
		HAVING COUNT(*) > 1 AND MAX(issue) <> 'Missing Image')
	
	DELETE FROM #missing_data WHERE id IN(
		SELECT MAX(id)
		FROM #missing_data
		GROUP BY name
		HAVING MAX(issue) = 'Missing Description & Features')
	
	/* BEGIN DATA MANIPULATION */
	
	--Update the categories values for configurables without categories:
	UPDATE a SET
		a.categories = CASE WHEN a.categories = 'Uncategorized' THEN LOT_Inventory.dbo.getCategory(b.categories,@brand,a.department) ELSE a.categories END
	FROM tbl_Purchase_Order AS a
	INNER JOIN LOT_Inventory.dbo.tbl_FW13_Final_Categorization AS b
	ON a.sku COLLATE SQL_Latin1_General_CP1_CI_AS = b.sku COLLATE SQL_Latin1_General_CP1_CI_AS
	WHERE a.PO_NUM = @po_num
	
	--Pull the SEO optimized product descriptions from the MYSQL database and assign them to the configurables from the loadfile:
	SET @sql = '
	UPDATE a SET
		a.description = b.description
	FROM tbl_Purchase_Order AS a
	INNER JOIN (SELECT sku, description FROM OPENQUERY(MAGENTO,''
		SELECT a.sku, b.value AS description
		FROM catalog_product_entity AS a
		INNER JOIN catalog_product_entity_text AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''description'''')
		WHERE a.sku IN(' + @config_string + ')'')) AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = ' + '''' + @po_num + '''' + ''
	EXEC (@sql)
	
	--Purchase Order Type-Specific correlated update:	
	UPDATE a SET
		a.never_backorder = '1',
		a.backorders = '0',
		a.manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_backorders = '1',
		a.merchandise_priority = CASE WHEN a.type = 'simple' THEN NULL
									  WHEN @po_type = 'Inline' THEN 'B'
									  WHEN @po_type = 'Inline' AND a.categories LIKE '%Accessories%' THEN 'C'
									  WHEN @po_type = 'Closeout' THEN 'E' END,
		a.status = 'Enabled',
		a.image = CASE WHEN a.image IS NOT NULL THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.small_image = a.image,
		a.thumbnail = a.image,
		a.sku = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.sku,'FW13A','FW13I') 
					 WHEN @po_type = 'Closeout' THEN REPLACE(a.sku,'FW13A','FW13C') END,
		a.url_key = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.url_key,'fw13a','fw13i') 
						 WHEN @po_type = 'Closeout' THEN REPLACE(a.url_key,'fw13a','fw13c') END,
		a.season_id = CASE WHEN @po_type = 'Inline' THEN 'FW13 Inline' 
						   WHEN @po_type = 'Closeout' THEN 'FW13 Closeout' END,
		a.simples_skus = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.simples_skus,'FW13A','FW13I') 
							  WHEN @po_type = 'Closeout' THEN REPLACE(a.simples_skus,'FW13A','FW13C') END
	FROM tbl_Purchase_Order AS a
	INNER JOIN tbl_Purchase_Order AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = @po_num
	 
	UPDATE a SET
		a.simples_skus = dbo.getAssociatedProducts(b.vendor_product_id,@po_num)
	FROM tbl_Purchase_Order AS a
	INNER JOIN tbl_Purchase_Order AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = @po_num AND a.type = 'configurable'

	--Begin simples_skus analysis:
	IF OBJECT_ID('tempdb..#po_style_color_size') IS NOT NULL BEGIN
	DROP TABLE #po_style_color_size
	END	
		
	CREATE TABLE #po_style_color_size (style varchar(155), color_code varchar(155), size_code varchar(155))
	
	SET @sql = '
	INSERT INTO #po_style_color_size (style, color_code, size_code)
	(SELECT DISTINCT a.vendor_product_id, a.vendor_color_code, a.vendor_size_code
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = REPLACE(b.style_color_size,'''''''','''') COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple'')'
	EXEC(@sql)
		
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code FROM OPENQUERY(MAGENTO,''
	SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, z.vendor_product_id AS style, color_code.value AS color_code, size_code.value AS size_code
	FROM
	(SELECT x.sku AS parent_sku, a.sku AS child_sku
	FROM catalog_product_entity AS a
	INNER JOIN (SELECT DISTINCT b.sku, a.product_id
				FROM catalog_product_super_link AS a
				INNER JOIN catalog_product_entity AS b
				ON a.parent_id = b.entity_id
				WHERE b.sku IN(' + @config_string + ')) AS x
	ON a.entity_id = x.product_id) AS simple_products
	INNER JOIN catalog_product_flat_1 AS z
	ON simple_products.child_sku = z.sku
	INNER JOIN catalog_product_entity_varchar AS color_code
	ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_color_code'''')
	INNER JOIN catalog_product_entity_varchar AS size_code
	ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_size_code'''')
	INNER JOIN cataloginventory_stock_item AS stock
	ON z.entity_id = stock.product_id AND stock.stock_id = 1'')) AS b
	ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code
	ORDER BY b.style, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1), CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END'
	EXEC(@sql)
	
	--Create #view_Export_PO and insert into it a header row, as well as the contents of tbl_Purchase_Order (for the PO in question):
	IF OBJECT_ID('tempdb..##view_Export_PO') IS NOT NULL BEGIN
		DROP TABLE ##view_Export_PO
	END	
	
	CREATE TABLE ##view_Export_PO (store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),fabric nvarchar(MAX),care_instructions nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX),vendor_sku nvarchar(MAX))
	
	INSERT INTO ##view_Export_PO
	SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
			'"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"super_attribute_pricing"' AS super_attribute_pricing, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
			'"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail,
			'"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
			'"vendor_size_code"' AS vendor_size_code, '"season_id"' AS season_id, '"description"' AS description, '"features"' AS features, '"fabric"' AS fabric, '"care_instructions"' AS care_instructions,
			'"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key, '"meta_title"' AS meta_title,
			'"merchandise_priority"' AS merchandise_priority, '"never_backorder"' AS never_backorder, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock, '"use_config_backorders"' AS use_config_backorders, '"use_config_manage_stock"' AS use_config_manage_stock, '"vendor_sku"' AS vendor_sku
	UNION ALL
	SELECT  '"' + RTRIM(LTRIM(REPLACE(store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(categories,'"','""'))) + '"','"default"','"' + RTRIM(LTRIM(REPLACE(configurable_attributes,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(image_label,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_product_id,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_size_code,'"','""'))) + '"','"FW13 Inline"','"' + RTRIM(LTRIM(REPLACE(description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fabric,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(care_instructions,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(qty,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(is_in_stock,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(url_key,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(meta_title,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_sku,'"','""'))) + '"'
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num
	ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code 
	
	--Return the contents of the #missing_data table at the end so that the final output of the procedure is as follows: simples_skus analysis -> Errors -> LINT output
	SELECT * FROM #missing_data
	
	--Begin final export and LINT process: (the same file is copied into C:\PHP\LoadFiles on FS01, and C:\Data\Shared also on FS01)
	DECLARE @cmd varchar(1024)
	
	SET @cmd = 'bcp "SELECT * FROM ##view_Export_PO ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code" queryout "C:\Data\Shared\' + @po_num + '.csv" -w -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'bcp "SELECT * FROM ##view_Export_PO ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code" queryout "C:\PHP\LoadFiles\' + @po_num + '.csv" -w -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'copy "C:\PHP\LoadFiles\' + @po_num + '.csv" "C:\PHP\LoadFiles\temp-' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'iconv -f UTF-16 -t UTF-8 "C:\PHP\LoadFiles\temp-' + @po_num + '.csv" > "C:\PHP\LoadFiles\' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'del "C:\PHP\LoadFiles\temp-' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'C:\PHP\php C:\PHP\LoadFiles\LINT.php C:\PHP\LoadFiles\' + @po_num + '.csv'
	EXEC master..xp_cmdshell @cmd
END
GO

/* START: */

EXEC Inline_Closeout_PO_Building 'MAR-F13-1', 'Inline', 'Marmot', 'MAR'

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/

