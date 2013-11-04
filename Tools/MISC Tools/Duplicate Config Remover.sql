/* This procedure is for removing duplicate configurable products from Magento. */

-- Drop all temp tables that get created later on so that the procedure can be run back-to-back
IF OBJECT_ID('tempdb..#duplicate_configs') IS NOT NULL BEGIN
	DROP TABLE #duplicate_configs
END	
	
IF OBJECT_ID('tempdb..#configs_reference') IS NOT NULL BEGIN
	DROP TABLE #configs_reference
END

IF OBJECT_ID('tempdb..#associated_products') IS NOT NULL BEGIN
	DROP TABLE #associated_products
END	

IF OBJECT_ID('tbl_Related_Products') IS NOT NULL BEGIN
	DROP TABLE tbl_Related_Products
END	

IF OBJECT_ID('tempdb..#oldest_configs') IS NOT NULL BEGIN
	DROP TABLE #oldest_configs
END

IF OBJECT_ID('tempdb..#middle_configs') IS NOT NULL BEGIN
	DROP TABLE #middle_configs
END	

IF OBJECT_ID('tempdb..#newest_configs') IS NOT NULL BEGIN
	DROP TABLE #newest_configs
END	

IF OBJECT_ID('tempdb..#new_simples') IS NOT NULL BEGIN
	DROP TABLE #new_simples
END	

IF OBJECT_ID('tempdb..#old_simples') IS NOT NULL BEGIN
	DROP TABLE #old_simples
END	

IF OBJECT_ID('tempdb..#combined_simples') IS NOT NULL BEGIN
	DROP TABLE #combined_simples
END	

IF OBJECT_ID('tempdb..#combined_simples_sku') IS NOT NULL BEGIN
	DROP TABLE #combined_simples_sku
END

IF OBJECT_ID('tbl_Combined_Simples_Sku') IS NOT NULL BEGIN
	DROP TABLE tbl_Combined_Simples_Sku
END

/* This SELECT returns each DISTINCT name + department combination from Magento where 
there are two or more configurable skus having said name + department combination */
SELECT * INTO #duplicate_configs FROM OPENQUERY(MAGENTO,'
SELECT b.value AS name, c.value AS department, COUNT(a.sku) AS num_skus
FROM catalog_product_entity AS a
INNER JOIN catalog_product_entity_varchar AS b
ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''name'')
INNER JOIN 
	(SELECT a.entity_id, b.value 
	FROM catalog_product_entity_varchar AS a
	INNER JOIN eav_attribute_option_value AS b
	ON a.value = b.option_id AND b.store_id = 0 AND a.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''department'')) AS c
ON a.entity_id = c.entity_id   
WHERE a.type_id = ''configurable'' AND a.created_at > (CURDATE() - 40)
GROUP BY b.value, c.value
HAVING COUNT(a.sku) = 2')

/* This SELECT returns information about each configurable product from Magento regardless of whether it has a duplicate Name + Department combination */
SELECT * INTO #configs_reference FROM OPENQUERY(MAGENTO,'
SELECT DISTINCT b.value AS name, c.value AS department, a.sku, a.entity_id, a.created_at
FROM catalog_product_entity AS a
INNER JOIN catalog_product_entity_varchar AS b
ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''name'')
INNER JOIN 
	(SELECT a.entity_id, b.value 
	FROM catalog_product_entity_varchar AS a
	INNER JOIN eav_attribute_option_value AS b
	ON a.value = b.option_id AND b.store_id = 0 AND a.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''department'')) AS c
ON a.entity_id = c.entity_id   
WHERE a.type_id = ''configurable'' AND a.created_at > (CURDATE() - 40)')

-- Here I replicate catalog_product_super_link as a temp table for optimization purposes and in order to avoid querying the live DB
SELECT * INTO #associated_products FROM OPENQUERY(MAGENTO,'SELECT * FROM catalog_product_super_link')

-- This select populates a temp table, identifying all of the configurable products that are duplicates, and the simple products associated to them
SELECT related_products.* INTO tbl_Related_Products FROM 
	(SELECT DISTINCT (a.name + ' (' + a.department + ')') AS name, a.sku, a.created_at, CAST(a.entity_id AS nvarchar(255)) AS entity_id, CAST(c.product_id AS nvarchar(255)) AS simples 
	FROM #configs_reference AS a
	INNER JOIN #duplicate_configs AS b
	ON a.name = b.name AND a.department = b.department
	INNER JOIN #associated_products AS c
	ON a.entity_id = c.parent_id) AS related_products

/* This select extracts all of the rows from the temp table created in the previous select for the OLDER of each 
set of duplicate configurable products */
SELECT oldest_configs.* INTO #oldest_configs FROM 
	(SELECT (a.name + ' (' + a.department + ')') AS name, MIN(a.created_at) AS oldest_created_at
	FROM #configs_reference AS a
	INNER JOIN #duplicate_configs AS b
	ON a.name = b.name AND a.department = b.department
	INNER JOIN #associated_products AS c
	ON a.entity_id = c.parent_id
	GROUP BY a.name, a.department) AS oldest_configs
/*	
/* This select extracts all of the rows from the temp table created in the previous select for the MIDDLE of each 
set of duplicate configurable products */ 
SELECT middle_configs.* INTO #middle_configs FROM 
	(SELECT (a.name + ' (' + a.department + ')') AS name, a.created_at AS middle_created_at
	FROM #configs_reference AS a
	INNER JOIN #duplicate_configs AS b
	ON a.name = b.name AND a.department = b.department
	INNER JOIN #associated_products AS c
	ON a.entity_id = c.parent_id
	INNER JOIN (SELECT name, MAX(created_at) AS max_date, MIN(created_at) AS min_date FROM #configs_reference GROUP BY name) AS d
	ON a.name = d.name
	WHERE a.created_at <> d.max_date AND a.created_at <> d.min_date
	) AS middle_configs */

/* This select extracts all of the rows from the temp table created in the previous select for the NEWER of each 
set of duplicate configurable products */
SELECT newest_configs.* INTO #newest_configs FROM 
	(SELECT (a.name + ' (' + a.department + ')') AS name, MAX(a.created_at) AS newest_created_at
	FROM #configs_reference AS a
	INNER JOIN #duplicate_configs AS b
	ON a.name = b.name AND a.department = b.department
	INNER JOIN #associated_products AS c
	ON a.entity_id = c.parent_id
	GROUP BY a.name, a.department) AS newest_configs

/* Here I begin making new temp tables for each record set: OLDER, MIDDLE (if applicable) & NEWER, concatenating the simple product
 rows from the previous record sets into the simples_skus column so as to have only one row per configurable product */
CREATE TABLE #new_simples (name nvarchar(255), sku nvarchar(255), simples_skus nvarchar(MAX))

INSERT INTO #new_simples (name, sku, simples_skus)
	SELECT DISTINCT a.name, b.sku, dbo.getAssociatedProducts(b.entity_id)
	FROM #newest_configs AS a
	INNER JOIN tbl_Related_Products AS b
	ON a.name = b.name AND a.newest_created_at = b.created_at
	
/*	
CREATE TABLE #middle_simples (name nvarchar(255), sku nvarchar(255), simples_skus nvarchar(MAX))

INSERT INTO #middle_simples (name, sku, simples_skus)
	SELECT DISTINCT (a.name + ' (' + a.department + ')') AS name, b.sku, dbo.getAssociatedProducts(b.entity_id)
	FROM #middle_configs AS a
	INNER JOIN tbl_Related_Products AS b
	ON a.name = b.name AND a.middle_created_at = b.created_at */
	
CREATE TABLE #old_simples (name nvarchar(255), sku nvarchar(255), simples_skus nvarchar(MAX))

INSERT INTO #old_simples (name, sku, simples_skus)
	SELECT DISTINCT a.name, b.sku, dbo.getAssociatedProducts(b.entity_id)
	FROM #oldest_configs AS a
	INNER JOIN tbl_Related_Products AS b
	ON a.name = b.name AND a.oldest_created_at = b.created_at

/* Now create a new table with the same schema as the previous two temp table, and initially populate
 it with the data from the NEWER configurable product record set */
CREATE TABLE #combined_simples (name nvarchar(255), sku nvarchar(255), simples_skus nvarchar(MAX))

INSERT INTO #combined_simples (name, sku, simples_skus)
	SELECT name, sku, simples_skus
	FROM #new_simples
	
/* Now perform a correlated update to concatenate the simples_skus value for both the 
OLDER & NEWER configurable products into the simples_skus value for the NEWER configurable sku. During the concatenation,
perform some simple manipulations in order to prepare the simples_skus string value for use in a dynamic SQL statement in the next step */
UPDATE a SET
	a.simples_skus = '''' + REPLACE(a.simples_skus + ',' + b.simples_skus/* + ',' + c.simples_skus*/,',',''''',''''') + ''''
FROM #combined_simples AS a
INNER JOIN #old_simples AS b
ON a.name = b.name
--INNER JOIN #middle_simples AS c
--ON a.name = c.name

--Identify duplicate records within database to be fixed.
SELECT x.* FROM
(SELECT DISTINCT name, MAX(sku) AS sku
FROM #combined_simples
GROUP BY name
HAVING COUNT(name) > 1
UNION ALL
SELECT DISTINCT name, MIN(sku) AS sku
FROM #combined_simples
GROUP BY name
HAVING COUNT(name) > 1) AS x
ORDER BY x.name, x.sku

/* Create temp table to imitate catalog_product_super_link with SKUs, later enabling logical selection 
of associated simples to assign based on stock status & season. */
CREATE TABLE #combined_simples_sku (name nvarchar(255), child_sku nvarchar(255))

/* Using a CURSOR, iterate through the list of NEWER configurable skus, and replace the entity_id values under the 
simples_skus column with the corresponding sku values from Magento in order to allow import via MAGMI. Also, populate #combined_simples_sku. */
DECLARE @name nvarchar(255), @simples_skus nvarchar(MAX), @sql nvarchar(MAX)

DECLARE update_simples_skus CURSOR FOR
SELECT DISTINCT name, simples_skus FROM #combined_simples
 
OPEN update_simples_skus

FETCH NEXT FROM update_simples_skus INTO @name, @simples_skus
 
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @sql = '
	UPDATE #combined_simples SET simples_skus =
		(SELECT simples_skus FROM OPENQUERY(MAGENTO,''
			SELECT simples_skus FROM (
			SELECT GROUP_CONCAT(sku) AS simples_skus 
			FROM catalog_product_entity 
			WHERE entity_id IN(''' + @simples_skus + ''')) AS x
			''))
	WHERE name = ''' + @name + '''
	'
	EXEC (@sql)
	
	INSERT INTO #combined_simples_sku (name, child_sku)
	SELECT @name AS name, s AS child_sku FROM dbo.Split(',',(SELECT simples_skus FROM #combined_simples WHERE name = @name))
	
	FETCH NEXT FROM update_simples_skus INTO @name, @simples_skus
END
 
CLOSE update_simples_skus
DEALLOCATE update_simples_skus
GO

ALTER TABLE #combined_simples_sku ADD qty float 
ALTER TABLE #combined_simples_sku ADD style nvarchar(255) 
ALTER TABLE #combined_simples_sku ADD size nvarchar(255)
ALTER TABLE #combined_simples_sku ADD color_code nvarchar(255)
ALTER TABLE #combined_simples_sku ADD season nvarchar(255)

UPDATE a SET
	a.qty = b.qty,
	a.style = b.style,
	a.size = b.size,
	a.color_code = b.color_code,
	a.season = b.season
FROM #combined_simples_sku AS a
INNER JOIN (SELECT * FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, (b.qty - b.stock_reserved_qty) AS qty, c.value AS style, d.value AS size, e.value AS color_code, f.value AS season
	FROM catalog_product_entity AS a
	INNER JOIN cataloginventory_stock_item AS b
	ON a.entity_id = b.product_id
	INNER JOIN catalog_product_entity_varchar AS c
	ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_product_id'')
	INNER JOIN catalog_product_entity_varchar AS d
	ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_size_code'')
	INNER JOIN catalog_product_entity_varchar AS e
	ON a.entity_id = e.entity_id AND e.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_color_code'')
	INNER JOIN (
		SELECT a.entity_id, b.value 
		FROM catalog_product_entity_int AS a
		INNER JOIN eav_attribute_option_value AS b
		ON a.value = b.option_id AND b.store_id = 0 AND a.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''season_id'')) AS f
	ON a.entity_id = f.entity_id')) AS b
ON a.child_sku = b.sku

DELETE FROM #combined_simples_sku WHERE qty IS NULL

--Begin final cursor loop to assign each NEWER configurable a filtered simples_skus value.
DECLARE @name nvarchar(255), @output varchar(MAX)

DECLARE filter_simples_skus CURSOR FOR
SELECT DISTINCT TOP 5 name FROM #combined_simples WHERE name IS NOT NULL
 
OPEN filter_simples_skus

FETCH NEXT FROM filter_simples_skus INTO @name
 
WHILE @@FETCH_STATUS = 0
BEGIN	
	IF OBJECT_ID('tempdb..#catalog') IS NOT NULL BEGIN
	DROP TABLE #catalog
	END

	IF OBJECT_ID('tempdb..#simple_skus') IS NOT NULL BEGIN
		DROP TABLE #simple_skus
	END
	
	CREATE TABLE #simple_skus (sku varchar(255), size varchar(255), color_code varchar(255), style varchar(255))

	SELECT child_sku AS sku, size, color_code, season, style, qty INTO #catalog FROM #combined_simples_sku WHERE name = @name

	-- There is no quantity-on-hand for inline or closeout products
	IF (SELECT SUM(qty) FROM #catalog WHERE season IN ('FW13 Inline', 'SS13 Inline', 'FW13 Closeout', 'SS13 Closeout')) = 0 BEGIN
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT sku, size, color_code, style FROM #catalog WHERE season IN ('FW13 Closeout') -- all ASAPs
	END
	ELSE BEGIN
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT sku, size, color_code, style FROM #catalog WHERE season IN ('SS13 Inline') AND qty > 0 -- no ASAPs

		-- Now let's add newer Fall '13 inline skus to the list where there is quantity-on-hand and there aren't collisions
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT a.sku, a.size, a.color_code, a.style FROM #catalog AS a
		LEFT JOIN #simple_skus AS b ON a.size = b.size AND a.color_code = b.color_code AND a.style = b.style
		WHERE season = 'FW13 Inline' AND qty > 0 AND b.sku IS NULL

		-- Now let's add old Spring '13 closeout skus to the list where there is quantity-on-hand and there aren't collisions
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT a.sku, a.size, a.color_code, a.style FROM #catalog AS a
		LEFT JOIN #simple_skus AS b ON a.size = b.size AND a.color_code = b.color_code AND a.style = b.style
		WHERE season = 'SS13 Closeout' AND qty > 0 AND b.sku IS NULL
		
		-- Now let's add newer Fall '13 closeout skus to the list where is quantity-on-hand and there aren't collisions
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT a.sku, a.size, a.color_code, a.style FROM #catalog AS a
		LEFT JOIN #simple_skus AS b ON a.size = b.size AND a.color_code = b.color_code AND a.style = b.style
		WHERE season = 'FW13 Closeout' AND b.sku IS NULL
		
		-- Now let's add in-stock ASAPs to the list
		INSERT INTO #simple_skus (sku, size, color_code, style)
		SELECT a.sku, a.size, a.color_code, a.style FROM #catalog AS a
		LEFT JOIN #simple_skus AS b ON a.size = b.size AND a.color_code = b.color_code AND a.style = b.style
		WHERE season LIKE '%ASAP%' AND qty > 0 AND b.sku IS NULL
	END	

	SET @output = ''
	(SELECT @output = COALESCE(@output + ',', '') + sku FROM
	(SELECT sku FROM #simple_skus) AS x)
	
	UPDATE #combined_simples SET simples_skus = @output WHERE name = @name
	PRINT 'UPDATE #combined_simples SET simples_skus = ''' + @output + ''' WHERE name = ''' + @name + ''''
	
	FETCH NEXT FROM filter_simples_skus INTO @name
END
 
CLOSE filter_simples_skus
DEALLOCATE filter_simples_skus
GO

SELECT * FROM #combined_simples
SELECT * FROM #combined_simples_sku

/* Perform two simple SELECT statements, preparing the final data for the following actions:
	1. Update the simples_skus attribute for the NEWER configurable to associated it with ALL of the simple products from BOTH configurables 
	2. Delete the OLDER configurable products from Magento
*/
SELECT 'configurable' AS type, sku, '1' AS has_options, '"choose_color,choose_size"' AS configurable_attributes, '"' + simples_skus + '"' AS simples_skus 
FROM #combined_simples

SELECT '1' AS 'magmi:delete', sku
FROM #old_simples

/*

RULES:

1. If all of the Inline & Closeout simples are OOS, associate all ASAP simples. 
2. No configurable can be associated to an ASAP simple (unless it is in-stock) if it has Inline OR Closeout children with qty on-hand.
3. In the case where there are Inline & Closeout children with the same Color/Size, Inline simples take precedence. 
4. In the case where there is a seasonal conflict, always pick the older season (unless the older simple is Closeout and the newer is Inline).

*/