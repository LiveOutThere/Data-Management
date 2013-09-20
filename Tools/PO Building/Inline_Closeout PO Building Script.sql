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
	SELECT '57502-001-O/S' UNION ALL
	SELECT '57502-204-O/S' UNION ALL
	SELECT '57502-990-O/S' UNION ALL
	SELECT '48900-990-S' UNION ALL
	SELECT '48900-990-M' UNION ALL
	SELECT '48900-990-L' UNION ALL
	SELECT '48900-990-XL' UNION ALL
	SELECT '48962-998-S' UNION ALL
	SELECT '48962-998-M' UNION ALL
	SELECT '48962-998-L' UNION ALL
	SELECT '48962-998-XL' UNION ALL
	SELECT '48635-222-XS' UNION ALL
	SELECT '48635-222-S' UNION ALL
	SELECT '48635-222-M' UNION ALL
	SELECT '48635-222-L' UNION ALL
	SELECT '48635-222-XL' UNION ALL
	SELECT '48635-570-XS' UNION ALL
	SELECT '48635-570-S' UNION ALL
	SELECT '48635-570-M' UNION ALL
	SELECT '48635-570-L' UNION ALL
	SELECT '48635-570-XL' UNION ALL
	SELECT '48635-998-XS' UNION ALL
	SELECT '48635-998-S' UNION ALL
	SELECT '48635-998-M' UNION ALL
	SELECT '48635-998-L' UNION ALL
	SELECT '48635-998-XL' UNION ALL
	SELECT '48416-990-S' UNION ALL
	SELECT '48416-990-M' UNION ALL
	SELECT '48416-990-L' UNION ALL
	SELECT '48416-990-XL' UNION ALL
	SELECT '48417-990-XS' UNION ALL
	SELECT '48417-990-S' UNION ALL
	SELECT '48417-990-M' UNION ALL
	SELECT '48417-990-L' UNION ALL
	SELECT '48417-990-XL' UNION ALL
	SELECT '48981-990-S' UNION ALL
	SELECT '48981-990-M' UNION ALL
	SELECT '48981-990-L' UNION ALL
	SELECT '48981-990-XL' UNION ALL
	SELECT '62167-258-XS' UNION ALL
	SELECT '62167-258-S' UNION ALL
	SELECT '62167-258-M' UNION ALL
	SELECT '62167-258-L' UNION ALL
	SELECT '62167-258-XL' UNION ALL
	SELECT '62167-991-XS' UNION ALL
	SELECT '62167-991-S' UNION ALL
	SELECT '62167-991-M' UNION ALL
	SELECT '62167-991-L' UNION ALL
	SELECT '62167-991-XL' UNION ALL
	SELECT '62157-204-S' UNION ALL
	SELECT '62157-204-M' UNION ALL
	SELECT '62157-204-L' UNION ALL
	SELECT '62157-204-XL' UNION ALL
	SELECT '62157-990-S' UNION ALL
	SELECT '62157-990-M' UNION ALL
	SELECT '62157-990-L' UNION ALL
	SELECT '62157-990-XL' UNION ALL
	SELECT '62246-535-XS' UNION ALL
	SELECT '62246-535-S' UNION ALL
	SELECT '62246-535-M' UNION ALL
	SELECT '62246-535-L' UNION ALL
	SELECT '62246-535-XL' UNION ALL
	SELECT '62246-990-XS' UNION ALL
	SELECT '62246-990-S' UNION ALL
	SELECT '62246-990-M' UNION ALL
	SELECT '62246-990-L' UNION ALL
	SELECT '62246-990-XL' UNION ALL
	SELECT '60359-990-S' UNION ALL
	SELECT '60359-990-M' UNION ALL
	SELECT '60359-990-L' UNION ALL
	SELECT '60359-990-XL' UNION ALL
	SELECT '62237-707-S' UNION ALL
	SELECT '62237-707-M' UNION ALL
	SELECT '62237-707-L' UNION ALL
	SELECT '62237-707-XL' UNION ALL
	SELECT '62237-990-S' UNION ALL
	SELECT '62237-990-M' UNION ALL
	SELECT '62237-990-L' UNION ALL
	SELECT '62237-990-XL' UNION ALL
	SELECT '51482-399-XS' UNION ALL
	SELECT '51482-399-S' UNION ALL
	SELECT '51482-399-M' UNION ALL
	SELECT '51482-399-L' UNION ALL
	SELECT '51482-399-XL' UNION ALL
	SELECT '51482-990-XS' UNION ALL
	SELECT '51482-990-S' UNION ALL
	SELECT '51482-990-M' UNION ALL
	SELECT '51482-990-L' UNION ALL
	SELECT '51482-990-XL' UNION ALL
	SELECT '48543-222-XS' UNION ALL
	SELECT '48543-222-S' UNION ALL
	SELECT '48543-222-M' UNION ALL
	SELECT '48543-222-L' UNION ALL
	SELECT '48543-222-XL' UNION ALL
	SELECT '48543-223-XS' UNION ALL
	SELECT '48543-223-S' UNION ALL
	SELECT '48543-223-M' UNION ALL
	SELECT '48543-223-L' UNION ALL
	SELECT '48543-223-XL' UNION ALL
	SELECT '48543-258-XS' UNION ALL
	SELECT '48543-258-S' UNION ALL
	SELECT '48543-258-M' UNION ALL
	SELECT '48543-258-L' UNION ALL
	SELECT '48543-258-XL' UNION ALL
	SELECT '48569-003-XS' UNION ALL
	SELECT '48569-003-S' UNION ALL
	SELECT '48569-003-M' UNION ALL
	SELECT '48569-003-L' UNION ALL
	SELECT '48569-003-XL' UNION ALL
	SELECT '48569-570-XS' UNION ALL
	SELECT '48569-570-S' UNION ALL
	SELECT '48569-570-M' UNION ALL
	SELECT '48569-570-L' UNION ALL
	SELECT '48569-570-XL' UNION ALL
	SELECT '48569-991-XS' UNION ALL
	SELECT '48569-991-S' UNION ALL
	SELECT '48569-991-M' UNION ALL
	SELECT '48569-991-L' UNION ALL
	SELECT '48569-991-XL' UNION ALL
	SELECT '48852-223-S' UNION ALL
	SELECT '48852-223-M' UNION ALL
	SELECT '48852-223-L' UNION ALL
	SELECT '48852-223-XL' UNION ALL
	SELECT '48852-990-S' UNION ALL
	SELECT '48852-990-M' UNION ALL
	SELECT '48852-990-L' UNION ALL
	SELECT '48852-990-XL' UNION ALL
	SELECT '48877-689-S' UNION ALL
	SELECT '48877-689-M' UNION ALL
	SELECT '48877-689-L' UNION ALL
	SELECT '48877-689-XL' UNION ALL
	SELECT '48877-981-S' UNION ALL
	SELECT '48877-981-M' UNION ALL
	SELECT '48877-981-L' UNION ALL
	SELECT '48877-981-XL' UNION ALL
	SELECT '50956-707-S' UNION ALL
	SELECT '50956-707-M' UNION ALL
	SELECT '50956-707-L' UNION ALL
	SELECT '50956-707-XL' UNION ALL
	SELECT '50956-991-S' UNION ALL
	SELECT '50956-991-M' UNION ALL
	SELECT '50956-991-L' UNION ALL
	SELECT '50956-991-XL' UNION ALL
	SELECT '51008-990-S' UNION ALL
	SELECT '51008-990-M' UNION ALL
	SELECT '51008-990-L' UNION ALL
	SELECT '51008-990-XL' UNION ALL
	SELECT '51457-689-S' UNION ALL
	SELECT '51457-689-M' UNION ALL
	SELECT '51457-689-L' UNION ALL
	SELECT '51457-689-XL' UNION ALL
	SELECT '51457-990-S' UNION ALL
	SELECT '51457-990-M' UNION ALL
	SELECT '51457-990-L' UNION ALL
	SELECT '51457-990-XL' UNION ALL
	SELECT '51425-980-XS' UNION ALL
	SELECT '51425-980-S' UNION ALL
	SELECT '51425-980-M' UNION ALL
	SELECT '51425-980-L' UNION ALL
	SELECT '51425-980-XL' UNION ALL
	SELECT '51260-980-30' UNION ALL
	SELECT '51260-980-32' UNION ALL
	SELECT '51260-980-34' UNION ALL
	SELECT '51260-980-36' UNION ALL
	SELECT '48800-536-S' UNION ALL
	SELECT '48800-536-M' UNION ALL
	SELECT '48800-536-L' UNION ALL
	SELECT '48800-536-XL' UNION ALL
	SELECT '48800-689-S' UNION ALL
	SELECT '48800-689-M' UNION ALL
	SELECT '48800-689-L' UNION ALL
	SELECT '48800-689-XL' UNION ALL
	SELECT '48800-998-S' UNION ALL
	SELECT '48800-998-M' UNION ALL
	SELECT '48800-998-L' UNION ALL
	SELECT '48800-998-XL')

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '48416' UNION ALL
	SELECT '48417' UNION ALL
	SELECT '48543' UNION ALL
	SELECT '48569' UNION ALL
	SELECT '48635' UNION ALL
	SELECT '48800' UNION ALL
	SELECT '48852' UNION ALL
	SELECT '48877' UNION ALL
	SELECT '48900' UNION ALL
	SELECT '48962' UNION ALL
	SELECT '48981' UNION ALL
	SELECT '50956' UNION ALL
	SELECT '51008' UNION ALL
	SELECT '51260' UNION ALL
	SELECT '51425' UNION ALL
	SELECT '51457' UNION ALL
	SELECT '51482' UNION ALL
	SELECT '57502' UNION ALL
	SELECT '60359' UNION ALL
	SELECT '62157' UNION ALL
	SELECT '62167' UNION ALL
	SELECT '62237' UNION ALL
	SELECT '62246')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''HH-48416'''',''''HH-48417'''',''''HH-48543'''',''''HH-48569'''',''''HH-48635'''',''''HH-48800'''',''''HH-48852'''',''''HH-48877'''',''''HH-48900'''',''''HH-48962'''',''''HH-48981'''',''''HH-50956'''',''''HH-51008'''',''''HH-51260'''',''''HH-51425'''',''''HH-51457'''',''''HH-51482'''',''''HH-57502'''',''''HH-60359'''',''''HH-62157'''',''''HH-62167'''',''''HH-62237'''',''''HH-62246'''''
	
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
	
	--Return the contents of the #missing_data table at the end so that the final output of the procedure is as follows: Errors -> LINT output
	SELECT * FROM #missing_data
	
	--Begin final export and LINT process: (the same file is copied into C:\PHP\LoadFiles on FS01, and C:\Data\Shared also on FS01)
	DECLARE @cmd varchar(1024)
	
	SET @cmd = 'bcp "SELECT * FROM ##view_Export_PO ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code" queryout "C:\Data\Shared\HH-F13-1.csv" -w -t , -T -S ' + @@servername
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

EXEC Inline_Closeout_PO_Building 'HH-F13-1', 'Inline', 'Helly Hansen', 'HH'
