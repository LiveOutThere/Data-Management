USE LOT_Purchasing
GO

ALTER PROCEDURE Inline_Closeout_PO_Building
	@po_num varchar(30), 
	@po_type nvarchar(30), 
	@brand nvarchar(30),
	@brand_code nvarchar(30),
	@season_code nvarchar(30),
	@simple_count float,
	@config_count float
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
	SELECT 'A8K6-H4G-XS' UNION ALL
	SELECT 'A8K6-H4G-S' UNION ALL
	SELECT 'A8K6-H4G-M' UNION ALL
	SELECT 'A8K6-H4G-L' UNION ALL
	SELECT 'A8K6-JK3-XS' UNION ALL
	SELECT 'A8K6-JK3-S' UNION ALL
	SELECT 'A8K6-JK3-M' UNION ALL
	SELECT 'A8K6-JK3-L' UNION ALL
	SELECT 'A8K6-JK3-XL' UNION ALL
	SELECT 'AQBJ-H1F-XS' UNION ALL
	SELECT 'AQBJ-H1F-S' UNION ALL
	SELECT 'AQBJ-H1F-M' UNION ALL
	SELECT 'AQBJ-H1F-L' UNION ALL
	SELECT 'AQBJ-H1F-XL' UNION ALL
	SELECT 'AR9T-A7L-S' UNION ALL
	SELECT 'AR9T-A7L-M' UNION ALL
	SELECT 'AR9T-A7L-L' UNION ALL
	SELECT 'AR9T-A7L-XL' UNION ALL
	SELECT 'AR9T-JB4-S' UNION ALL
	SELECT 'AR9T-JB4-M' UNION ALL
	SELECT 'AR9T-JB4-L' UNION ALL
	SELECT 'AR9T-JB4-XL' UNION ALL
	SELECT 'A1HN-JK3-S-REG' UNION ALL
	SELECT 'A1HN-JK3-M-REG' UNION ALL
	SELECT 'A1HN-JK3-L-REG' UNION ALL
	SELECT 'A1HN-JK3-XL-REG' UNION ALL
	SELECT 'A3XY-173-30-REG' UNION ALL
	SELECT 'A3XY-173-32-REG' UNION ALL
	SELECT 'A3XY-173-34-REG' UNION ALL
	SELECT 'A3XY-173-36-REG' UNION ALL
	SELECT 'A3XY-173-38-REG' UNION ALL
	SELECT 'A3XY-174-30-REG' UNION ALL
	SELECT 'A3XY-174-32-REG' UNION ALL
	SELECT 'A3XY-174-34-REG' UNION ALL
	SELECT 'A3XY-174-36-REG' UNION ALL
	SELECT 'A3XY-174-38-REG' UNION ALL
	SELECT 'A4P7-E7N-XS-REG' UNION ALL
	SELECT 'A4P7-E7N-S-REG' UNION ALL
	SELECT 'A4P7-E7N-M-REG' UNION ALL
	SELECT 'A4P7-E7N-L-REG' UNION ALL
	SELECT 'A4P7-JK3-XS-REG' UNION ALL
	SELECT 'A4P7-JK3-S-REG' UNION ALL
	SELECT 'A4P7-JK3-M-REG' UNION ALL
	SELECT 'A4P7-JK3-L-REG' UNION ALL
	SELECT 'A4W4-174-4-REG' UNION ALL
	SELECT 'A4W4-174-6-REG' UNION ALL
	SELECT 'A4W4-174-8-REG' UNION ALL
	SELECT 'A4W4-174-10-REG' UNION ALL
	SELECT 'A4W4-174-12-REG' UNION ALL
	SELECT 'A4W4-H1F-4-REG' UNION ALL
	SELECT 'A4W4-H1F-6-REG' UNION ALL
	SELECT 'A4W4-H1F-8-REG' UNION ALL
	SELECT 'A4W4-H1F-10-REG' UNION ALL
	SELECT 'A4W4-H1F-12-REG' UNION ALL
	SELECT 'A4W8-FN4-XS' UNION ALL
	SELECT 'A4W8-FN4-S' UNION ALL
	SELECT 'A4W8-FN4-M' UNION ALL
	SELECT 'A4W8-FN4-L' UNION ALL
	SELECT 'A4W8-FN4-XL' UNION ALL
	SELECT 'A4W8-H2E-XS' UNION ALL
	SELECT 'A4W8-H2E-S' UNION ALL
	SELECT 'A4W8-H2E-M' UNION ALL
	SELECT 'A4W8-H2E-L' UNION ALL
	SELECT 'A4W8-H2E-XL' UNION ALL
	SELECT 'A5L7-044-4-REG' UNION ALL
	SELECT 'A5L7-044-6-REG' UNION ALL
	SELECT 'A5L7-044-8-REG' UNION ALL
	SELECT 'A5L7-044-10-REG' UNION ALL
	SELECT 'A5L7-044-12-REG' UNION ALL
	SELECT 'A7H1-J1W-XS-REG' UNION ALL
	SELECT 'A7H1-J1W-S-REG' UNION ALL
	SELECT 'A7H1-J1W-M-REG' UNION ALL
	SELECT 'A7H1-J1W-L-REG' UNION ALL
	SELECT 'A7H1-T4C-XS-REG' UNION ALL
	SELECT 'A7H1-T4C-S-REG' UNION ALL
	SELECT 'A7H1-T4C-M-REG' UNION ALL
	SELECT 'A7H1-T4C-L-REG' UNION ALL
	SELECT 'A7L9-A0M-S' UNION ALL
	SELECT 'A7L9-A0M-M' UNION ALL
	SELECT 'A7L9-A0M-L' UNION ALL
	SELECT 'A7L9-A0M-XL' UNION ALL
	SELECT 'A7L9-H8F-S' UNION ALL
	SELECT 'A7L9-H8F-M' UNION ALL
	SELECT 'A7L9-H8F-L' UNION ALL
	SELECT 'A7L9-H8F-XL' UNION ALL
	SELECT 'A7P4-BH6-XS' UNION ALL
	SELECT 'A7P4-BH6-S' UNION ALL
	SELECT 'A7P4-BH6-M' UNION ALL
	SELECT 'A7P4-BH6-L' UNION ALL
	SELECT 'A7P4-H1F-XS' UNION ALL
	SELECT 'A7P4-H1F-S' UNION ALL
	SELECT 'A7P4-H1F-M' UNION ALL
	SELECT 'A7P4-H1F-L' UNION ALL
	SELECT 'A7V5-0C5-S' UNION ALL
	SELECT 'A7V5-0C5-M' UNION ALL
	SELECT 'A7V5-0C5-L' UNION ALL
	SELECT 'A7V5-0C5-XL' UNION ALL
	SELECT 'A7V5-254-S' UNION ALL
	SELECT 'A7V5-254-M' UNION ALL
	SELECT 'A7V5-254-L' UNION ALL
	SELECT 'A7V5-254-XL' UNION ALL
	SELECT 'A9CD-BH6-XS-REG' UNION ALL
	SELECT 'A9CD-BH6-S-REG' UNION ALL
	SELECT 'A9CD-BH6-M-REG' UNION ALL
	SELECT 'A9CD-BH6-L-REG' UNION ALL
	SELECT 'A9CD-BH6-XL-REG' UNION ALL
	SELECT 'A9CD-H1F-XS-REG' UNION ALL
	SELECT 'A9CD-H1F-S-REG' UNION ALL
	SELECT 'A9CD-H1F-M-REG' UNION ALL
	SELECT 'A9CD-H1F-L-REG' UNION ALL
	SELECT 'A9CD-H1F-XL-REG' UNION ALL
	SELECT 'A9MK-A7L-O/S' UNION ALL
	SELECT 'A9MK-D9V-O/S' UNION ALL
	SELECT 'A9MK-JK3-O/S' UNION ALL
	SELECT 'A5A3-ZB4-S' UNION ALL
	SELECT 'A5A3-ZB4-M' UNION ALL
	SELECT 'A5A3-ZB4-L' UNION ALL
	SELECT 'A5A3-ZB4-XL' UNION ALL
	SELECT 'A5A9-JK3-S' UNION ALL
	SELECT 'A5A9-JK3-M' UNION ALL
	SELECT 'A5A9-JK3-L' UNION ALL
	SELECT 'A5A9-JK3-XL' UNION ALL
	SELECT 'A9JZ-H2E-XS' UNION ALL
	SELECT 'A9JZ-H2E-S' UNION ALL
	SELECT 'A9JZ-H2E-M' UNION ALL
	SELECT 'A9JZ-H2E-L' UNION ALL
	SELECT 'A9JZ-H3E-XS' UNION ALL
	SELECT 'A9JZ-H3E-S' UNION ALL
	SELECT 'A9JZ-H3E-M' UNION ALL
	SELECT 'A9JZ-H3E-L' UNION ALL
	SELECT 'A9JZ-H9F-XS' UNION ALL
	SELECT 'A9JZ-H9F-S' UNION ALL
	SELECT 'A9JZ-H9F-M' UNION ALL
	SELECT 'A9JZ-H9F-L' UNION ALL
	SELECT 'A2T2-15Q-S' UNION ALL
	SELECT 'A2T2-15Q-M' UNION ALL
	SELECT 'A2T2-15Q-L' UNION ALL
	SELECT 'A2T2-15Q-XL' UNION ALL
	SELECT 'A2T2-H1G-S' UNION ALL
	SELECT 'A2T2-H1G-M' UNION ALL
	SELECT 'A2T2-H1G-L' UNION ALL
	SELECT 'A2T2-H1G-XL' UNION ALL
	SELECT 'A2T3-H2E-XS' UNION ALL
	SELECT 'A2T3-H2E-S' UNION ALL
	SELECT 'A2T3-H2E-M' UNION ALL
	SELECT 'A2T3-H2E-L' UNION ALL
	SELECT 'A2T3-H9K-XS' UNION ALL
	SELECT 'A2T3-H9K-S' UNION ALL
	SELECT 'A2T3-H9K-M' UNION ALL
	SELECT 'A2T3-H9K-L')

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT 'A8K6' UNION ALL
	SELECT 'AQBJ' UNION ALL
	SELECT 'AR9T' UNION ALL
	SELECT 'A1HN' UNION ALL
	SELECT 'A3XY' UNION ALL
	SELECT 'A4P7' UNION ALL
	SELECT 'A4W4' UNION ALL
	SELECT 'A4W8' UNION ALL
	SELECT 'A5L7' UNION ALL
	SELECT 'A7H1' UNION ALL
	SELECT 'A7L9' UNION ALL
	SELECT 'A7P4' UNION ALL
	SELECT 'A7V5' UNION ALL
	SELECT 'A9CD' UNION ALL
	SELECT 'A9MK' UNION ALL
	SELECT 'A5A3' UNION ALL
	SELECT 'A5A9' UNION ALL
	SELECT 'A9JZ' UNION ALL
	SELECT 'A2T2' UNION ALL
	SELECT 'A2T3')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''TNF-A8K6'''',''''TNF-AQBJ'''',''''TNF-AR9T'''',''''TNF-A1HN'''',''''TNF-A3XY'''',''''TNF-A4P7'''',''''TNF-A4W4'''',''''TNF-A4W8'''',''''TNF-A5L7'''',''''TNF-A7H1'''',''''TNF-A7L9'''',''''TNF-A7P4'''',''''TNF-A7V5'''',''''TNF-A9CD'''',''''TNF-A9MK'''',''''TNF-A5A3'''',''''TNF-A5A9'''',''''TNF-A9JZ'''',''''TNF-A2T2'''',''''TNF-A2T3'''''
	
	--SELECT DISTINCT CASE WHEN department = 'Men' THEN 'M-' WHEN department = 'Women' THEN 'W-' WHEN department = 'Men|Women' THEN 'U-' END + name FROM tbl_Purchase_Order WHERE type = 'configurable' AND PO_NUM = 'TNF-S14-A2-S2'
	
	DECLARE @config_string_verbose varchar(MAX)
	SET @config_string_verbose = '''''M-Apex Washoe Short'''',''''M-L/S Cool Horizon Woven'''',''''M-Resolve Jacket'''',''''M-S/S Hills And Trails Tee'''',''''M-S/S Orangahang Woven'''',''''M-S/S Ranger Tee'''',''''M-Verto Jacket'''',''''M-Voracious Dual Short 7�'''',''''U-Mudder Trucker Hat'''',''''W-Bloom Burnout V-Neck'''',''''W-Cypress Skirt'''',''''W-Kambra Striped Dress'''',''''W-L/S Cool Horizon Woven'''',''''W-Pinecrest Roll-Up Pant'''',''''W-Reflex Core Short'''',''''W-Resolve Jacket'''',''''W-S/S Reaxion Amp V-Neck Tee'''',''''W-Stella Grace Jacket'''',''''W-Taggart Dress'''',''''W-Verto Jacket'''''
	
	--Here #view_PO_LoadFile gets created and then populated with the desired rows from your desired loadfile:
	IF OBJECT_ID('tempdb..#view_PO_LoadFile') IS NOT NULL BEGIN
		DROP TABLE #view_PO_LoadFile
	END	
	
	CREATE TABLE #view_PO_LoadFile (id int,store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_sku nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),short_description nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),activities nvarchar(MAX),weather nvarchar(MAX),layering nvarchar(MAX),care_instructions nvarchar(MAX),fabric nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),videos nvarchar(MAX),weight nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX))
	
	DECLARE @sql varchar(MAX)
	SET @sql = '
	INSERT INTO #view_PO_LoadFile
	SELECT DISTINCT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = b.style_color_size COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple''
	
	UNION ALL
	
	SELECT DISTINCT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON a.vendor_product_id COLLATE Latin1_General_CI_AS = b.vendor_product_id COLLATE Latin1_General_CI_AS
	WHERE a.type = ''configurable''
	ORDER BY a.type DESC,a.department,a.vendor_product_id,a.vendor_color_code,a.vendor_size_code'
	EXEC (@sql)
	
	IF @@ROWCOUNT = 0 BEGIN
		SELECT 'Nothing from #PO_DATA is matching LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + CAST(@brand_code AS varchar(155)) + '!!!' AS ERROR
		RETURN 
	END
	
	--Determine whether the PO procedure is building a complete PO, otherwise end the procudure and troubleshoot:
	IF OBJECT_ID('tempdb..#missing_rows') IS NOT NULL BEGIN
	DROP TABLE #missing_rows
	END	
	
	CREATE TABLE #missing_rows (sku nvarchar(255), style nvarchar(255))
	
	INSERT INTO #missing_rows (sku)	
	SELECT a.style_color_size
	FROM #PO_DATA AS a
	FULL JOIN #view_PO_LoadFile AS b
	ON a.style_color_size = b.vendor_product_id + '-' + b.vendor_color_code + '-' + b.vendor_size_code
	WHERE a.style_color_size IS NOT NULL AND b.sku IS NULL
	
	INSERT INTO #missing_rows (style)
	SELECT a.vendor_product_id
	FROM #PO_DATA AS a
	FULL JOIN #view_PO_LoadFile AS b
	ON a.vendor_product_id = b.vendor_product_id
	WHERE a.vendor_product_id IS NOT NULL AND b.vendor_product_id IS NULL
	
	IF OBJECT_ID('tempdb..#content_match') IS NOT NULL BEGIN
	DROP TABLE #content_match
	END	
	
	CREATE TABLE #content_match (type nvarchar(255),po_type_count float, expected_type_count float)
	
	INSERT INTO #content_match (type, po_type_count)
	SELECT type, COUNT(*) AS po_type_count
	FROM #view_PO_LoadFile
	GROUP BY type
	
	UPDATE #content_match SET expected_type_count = @simple_count WHERE type = 'simple'
	UPDATE #content_match SET expected_type_count = @config_count WHERE type = 'configurable'
	
	IF (SELECT po_type_count FROM #content_match WHERE type = 'simple') <> (SELECT expected_type_count FROM #content_match WHERE type = 'simple') OR
	   (SELECT po_type_count FROM #content_match WHERE type = 'configurable') <> (SELECT expected_type_count FROM #content_match WHERE type = 'configurable') BEGIN 
		SELECT * FROM (
			SELECT (SELECT 'There are ' + CAST((expected_type_count - po_type_count) AS varchar(255)) + ' simple products from the Purchase Order that are not being matched!!!' WHERE type = 'simple') AS error_message FROM #content_match
			UNION ALL
			SELECT (SELECT 'There are ' + CAST((expected_type_count - po_type_count) AS varchar(255)) + ' configurable products from the Purchase Order that are not being matched!!!' WHERE type = 'configurable') AS error_message FROM #content_match
		) AS x WHERE x.error_message IS NOT NULL
		SELECT sku FROM #missing_rows WHERE sku IS NOT NULL
		SELECT style FROM #missing_rows WHERE style IS NOT NULL
		RETURN	   
	END
		
	--Insert the contents of #view_PO_LoadFile into tbl_Purchase_Order, as well as a PO_NUM value:
	INSERT INTO tbl_Purchase_Order SELECT *, @po_num AS PO_NUM FROM #view_PO_LoadFile

	--Pull the SEO optimized product descriptions from the MYSQL database and assign them to the configurables from the loadfile:
	SET @sql = '
	UPDATE a SET
		a.description = b.description,
		a.features = b.features
	FROM tbl_Purchase_Order AS a
	INNER JOIN (SELECT sku, description, features FROM OPENQUERY(MAGENTO,''
		SELECT a.sku, b.value AS description, c.value AS features
		FROM catalog_product_entity AS a
		LEFT JOIN catalog_product_entity_text AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''description'''')
		LEFT JOIN catalog_product_entity_text AS c
		ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''features'''')
		WHERE a.sku IN(' + @config_string + ')'')) AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = ' + '''' + @po_num + '''' + ''
	EXEC (@sql)

	--Create the #missing_data table and insert rows for any and all issues:
	IF OBJECT_ID('tempdb..#missing_data') IS NOT NULL BEGIN
		DROP TABLE #missing_data
	END	
	CREATE TABLE #missing_data (id int IDENTITY(1,1), issue nvarchar(255),gender nvarchar(255),name nvarchar(MAX),vendor_product_id nvarchar(100),choose_color nvarchar(MAX),vendor_color_code nvarchar(MAX))
	INSERT INTO #missing_data
	SELECT DISTINCT 'Missing Image', department, name, vendor_product_id, choose_color, vendor_color_code
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'simple' AND image IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Description', department, name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND description IS NULL OR type = 'configurable' AND description = '')
	UNION ALL
	SELECT DISTINCT 'Missing Features', department, name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND features IS NULL OR type = 'configurable' AND features = '')
	
	IF OBJECT_ID('tempdb..##dupe_finder') IS NOT NULL BEGIN
		DROP TABLE ##dupe_finder
	END
	
	SET @sql = '
	SELECT * INTO ##dupe_finder FROM OPENQUERY(MAGENTO,''
		SELECT DISTINCT a.sku, b.value AS name, CASE WHEN c.value = ''''17215,17216'''' THEN ''''U'''' 
												     WHEN c.value = ''''17215'''' THEN ''''M'''' 
													 WHEN c.value = ''''17216'''' THEN ''''W'''' ELSE ''''K'''' END AS department
		FROM catalog_product_entity AS a
		INNER JOIN catalog_product_entity_varchar AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''name'''')
		INNER JOIN catalog_product_entity_varchar AS c
		ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''department'''')
		WHERE a.type_id = ''''configurable'''' AND a.sku LIKE ''''' + @brand_code + '%''''
		'')'
	EXEC(@sql)
	
	INSERT INTO #missing_data
	SELECT 'Introducing Duplicate!', a.department AS magento_department, a.name AS magento_name, a.sku AS magento_sku, '', ''
	FROM ##dupe_finder AS a
	FULL JOIN (SELECT DISTINCT s AS po_name_department FROM dbo.Split(',',REPLACE(@config_string_verbose,'''',''))) AS b
	ON (a.department + '-' + a.name) = b.po_name_department
	FULL JOIN (SELECT DISTINCT s AS po_sku FROM dbo.Split(',',REPLACE(@config_string,'''',''))) AS c
	ON a.sku = c.po_sku
	WHERE b.po_name_department IS NOT NULL AND a.name IS NOT NULL AND c.po_sku IS NULL
	
	/*
	SET @sql = '
	INSERT INTO #missing_data
	SELECT DISTINCT ''Missing ALT Image(s)'', a.name, a.vendor_product_id, '''', ''''
	FROM OPENQUERY(MAGENTO,''
		SELECT b.value AS name, c.value AS vendor_product_id
		FROM catalog_product_entity AS a
		INNER JOIN catalog_product_entity_varchar AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''name'''')
		INNER JOIN catalog_product_entity_varchar AS c
		ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_product_id'''')
		INNER JOIN catalog_product_entity_varchar AS d
		ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''image_alt1_label'''')
		WHERE a.sku IN(' + @config_string + ') AND d.value IS NULL'') AS a'
	EXEC(@sql)*/
	
	
	UPDATE #missing_data SET issue = 'Missing Description & Features' WHERE name IN(
		SELECT DISTINCT name
		FROM #missing_data
		GROUP BY name,vendor_product_id
		HAVING COUNT(*) > 1 AND MAX(issue) <> 'Missing Image')
	
	DELETE FROM #missing_data WHERE id IN(
		SELECT MAX(id)
		FROM #missing_data
		GROUP BY name,vendor_product_id
		HAVING MAX(issue) = 'Missing Description & Features')
	
	/* BEGIN DATA MANIPULATION */
	
	--Update the categories values for configurables without categories:
	UPDATE a SET
		a.categories = b.categories
	FROM tbl_Purchase_Order AS a
	INNER JOIN LOT_Inventory.dbo.tbl_Magento_Categories AS b
	ON a.sku COLLATE SQL_Latin1_General_CP1_CI_AS = b.sku COLLATE SQL_Latin1_General_CP1_CI_AS
	WHERE a.PO_NUM = @po_num AND a.type = 'configurable'
	
	--Assign an image value for all configs by picking a random image from its children
	DECLARE @sku nvarchar(255), @style nvarchar(255)
	
	DECLARE c1 CURSOR FOR
	SELECT DISTINCT sku, vendor_product_id FROM tbl_Purchase_Order WHERE PO_NUM = @po_num AND type = 'configurable'
	OPEN c1
	FETCH NEXT FROM c1 INTO @sku, @style
	WHILE @@FETCH_STATUS = 0 BEGIN
	
		SET @sql = '
		UPDATE tbl_Purchase_Order SET image = ISNULL((SELECT TOP 1 image FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' WHERE vendor_product_id = ''' + @style + ''' AND type = ''simple''),NULL) WHERE sku = ''' + @sku + ''''
		EXEC(@sql)
			
		FETCH NEXT FROM c1 INTO @sku, @style
	END
	CLOSE c1
	DEALLOCATE c1
		
	--Purchase Order Type-Specific correlated update:	
	UPDATE a SET
		a.never_backorder = '1',
		a.backorders = '0',
		a.manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_backorders = '1',
		a.merchandise_priority = CASE WHEN a.type = 'simple' THEN NULL ELSE 'Z' END,
		a.status = 'Enabled',
		a.image = CASE WHEN a.image IS NOT NULL AND a.image <> '' THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.small_image = CASE WHEN a.image IS NOT NULL THEN a.image WHEN a.type = 'configurable' THEN NULL ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.thumbnail = CASE WHEN a.image IS NOT NULL THEN a.image WHEN a.type = 'configurable' THEN NULL ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.sku = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.sku,@season_code + 'A',@season_code + 'I') 
					 WHEN @po_type = 'Closeout' THEN REPLACE(a.sku,@season_code + 'A',@season_code + 'C') END,
		a.url_key = CASE WHEN a.type = 'simple' THEN NULL ELSE a.url_key END,
		a.season_id = CASE WHEN @po_type = 'Inline' THEN @season_code + ' Inline' 
						   WHEN @po_type = 'Closeout' THEN @season_code + ' Closeout'
						   WHEN a.type = 'configurable' THEN NULL END,
		a.simples_skus = CASE WHEN @po_type = 'Inline' AND a.type = 'configurable' THEN REPLACE(a.simples_skus,@season_code + 'A',@season_code + 'I') 
							  WHEN @po_type = 'Closeout' AND a.type = 'configurable' THEN REPLACE(a.simples_skus,@season_code + 'A',@season_code + 'C') 
							  WHEN a.type = 'simple' THEN NULL END,
		a.price = CASE WHEN a.price LIKE '%0.99%' THEN CAST(a.price AS float) - 1 ELSE a.price END
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
		
	CREATE TABLE #po_style_color_size (style varchar(155), color_code nvarchar(155), size_code varchar(155))
	
	SET @sql = '
	INSERT INTO #po_style_color_size (style, color_code, size_code)
	(SELECT DISTINCT a.vendor_product_id, a.vendor_color_code, a.vendor_size_code
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = REPLACE(b.style_color_size,'''''''','''') COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple'')'
	EXEC(@sql)
	
	IF OBJECT_ID('tempdb..##association_sku_discreps') IS NOT NULL BEGIN
		DROP TABLE ##association_sku_discreps
	END	
	IF OBJECT_ID('tempdb..##association_name_gender_discreps') IS NOT NULL BEGIN
		DROP TABLE ##association_name_gender_discreps
	END	
		
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand, b.sku AS sku
	INTO ##association_sku_discreps
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code FROM OPENQUERY(MAGENTO,''
	SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, style_code.value AS style, color_code.value AS color_code, size_code.value AS size_code
	FROM
	(SELECT x.sku AS parent_sku, a.sku AS child_sku
	FROM catalog_product_entity AS a
	INNER JOIN (SELECT DISTINCT b.sku, a.product_id
				FROM catalog_product_super_link AS a
				INNER JOIN catalog_product_entity AS b
				ON a.parent_id = b.entity_id
				WHERE b.sku IN(' + @config_string + ')) AS x
	ON a.entity_id = x.product_id) AS simple_products
	INNER JOIN catalog_product_entity AS z
	ON simple_products.child_sku = z.sku AND z.type_id = ''''simple''''
	INNER JOIN catalog_product_entity_varchar AS style_code
	ON z.entity_id = style_code.entity_id AND style_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_product_id'''')
	INNER JOIN catalog_product_entity_varchar AS color_code
	ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_color_code'''')
	INNER JOIN catalog_product_entity_varchar AS size_code
	ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_size_code'''')
	INNER JOIN cataloginventory_stock_item AS stock
	ON z.entity_id = stock.product_id AND stock.stock_id = 1'')) AS b
	ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code
	WHERE (b.qty - b.qty_reserved) > 0'
	EXEC(@sql)
	
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand, b.sku AS sku
	INTO ##association_name_gender_discreps
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code 
	FROM OPENQUERY(MAGENTO,''
		SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, style_code.value AS style, color_code.value AS color_code, size_code.value AS size_code
		FROM
			(SELECT x.sku AS parent_sku, a.sku AS child_sku
			FROM catalog_product_entity AS a
			INNER JOIN (SELECT DISTINCT b.sku, a.product_id
						FROM catalog_product_super_link AS a
						INNER JOIN catalog_product_entity AS b
						ON a.parent_id = b.entity_id
						INNER JOIN catalog_product_entity_varchar AS c
						ON b.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''name'''')
						INNER JOIN catalog_product_entity_varchar AS d
						ON b.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''department'''')
						WHERE CONCAT(CASE WHEN d.value = ''''17215,17216'''' THEN ''''U-'''' 
										  WHEN d.value = ''''17215'''' THEN ''''M-'''' 
										  WHEN d.value = ''''17216'''' THEN ''''W-'''' ELSE '''''''' END,CAST(c.value AS CHAR(255))) IN(' + @config_string_verbose + ')) AS x
			ON a.entity_id = x.product_id) AS simple_products
			INNER JOIN catalog_product_entity AS z
			ON simple_products.child_sku = z.sku AND z.type_id = ''''simple''''
			INNER JOIN catalog_product_entity_varchar AS style_code
			ON z.entity_id = style_code.entity_id AND style_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_product_id'''')
			INNER JOIN catalog_product_entity_varchar AS color_code
			ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_color_code'''')
			INNER JOIN catalog_product_entity_varchar AS size_code
			ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_size_code'''')
			INNER JOIN cataloginventory_stock_item AS stock
			ON z.entity_id = stock.product_id AND stock.stock_id = 1'')) AS b
	ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code
	WHERE (b.qty - b.qty_reserved) > 0'
	EXEC(@sql)
	
	SELECT DISTINCT a.* FROM (
	SELECT a.*
	FROM ##association_sku_discreps AS a
	LEFT JOIN ##association_name_gender_discreps AS b
	ON a.sku = b.sku
	UNION ALL
	SELECT b.*
	FROM ##association_sku_discreps AS a
	RIGHT JOIN ##association_name_gender_discreps AS b
	ON a.sku = b.sku) AS a
	
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
			'"' + RTRIM(LTRIM(REPLACE(vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_size_code,'"','""'))) + '"','"' + @season_code + ' Inline"','"' + RTRIM(LTRIM(REPLACE(description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fabric,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(care_instructions,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(qty,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(is_in_stock,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(url_key,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(meta_title,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_sku,'"','""'))) + '"'
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num
	ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code 
	
	--Return the contents of the #missing_data table at the end so that the final output of the procedure is as follows: simples_skus analysis -> Errors -> LINT output
	SELECT * FROM #missing_data ORDER BY issue
	
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

EXEC Inline_Closeout_PO_Building 'TNF-S14-A2-S2', 'Inline', 'The North Face', 'TNF', 'SS14', 150, 20

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/
