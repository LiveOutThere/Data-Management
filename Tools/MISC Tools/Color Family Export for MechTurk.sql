IF OBJECT_ID('tempdb..#net_new_colors') IS NOT NULL BEGIN
	DROP TABLE #net_new_colors
END
IF OBJECT_ID('tempdb..#old_colors') IS NOT NULL BEGIN
	DROP TABLE #old_colors
END
IF OBJECT_ID('tempdb..#export') IS NOT NULL BEGIN
	DROP TABLE #export
END		   

-- Determine NET NEW choose_color values from season(s) of choice:
SELECT * 
INTO #net_new_colors 
FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, 
		   c.value AS choose_color, 
		   CONCAT(''https://www.liveoutthere.com/media/catalog/product/'',SUBSTRING(f.value,2,LENGTH(f.value))) AS image_url, 
		   e.value AS color_family
	FROM catalog_product_entity AS a
	INNER JOIN catalog_product_entity_int AS b
	ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''choose_color'')
	INNER JOIN eav_attribute_option_value AS c
	ON b.value = c.option_id
	LEFT JOIN catalog_product_entity_varchar AS d
	ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''color_family'')
	LEFT JOIN eav_attribute_option_value AS e
	ON d.value = e.option_id
	LEFT JOIN catalog_product_entity_varchar AS f
	ON a.entity_id = f.entity_id AND f.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	WHERE a.type_id = ''simple'' AND LEFT(a.sku,5) IN(''SS14I'',''SS14C'') AND e.value IS NULL')
	
-- Re-run with slight modifications in order to find product on-hand from past seasons w/o color_family assigned:
SELECT * 
INTO #old_colors
FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, 
		   c.value AS choose_color, 
		   CONCAT(''https://www.liveoutthere.com/media/catalog/product/'',SUBSTRING(f.value,2,LENGTH(f.value))) AS image_url, 
		   e.value AS color_family,
		   g.qoh
	FROM catalog_product_entity AS a
	INNER JOIN catalog_product_entity_int AS b
	ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''choose_color'')
	INNER JOIN eav_attribute_option_value AS c
	ON b.value = c.option_id
	LEFT JOIN catalog_product_entity_varchar AS d
	ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''color_family'')
	LEFT JOIN eav_attribute_option_value AS e
	ON d.value = e.option_id
	LEFT JOIN catalog_product_entity_varchar AS f
	ON a.entity_id = f.entity_id AND f.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	INNER JOIN 
		(SELECT DISTINCT product_id, (SUM(qty) - SUM(stock_reserved_qty)) AS qoh
		FROM cataloginventory_stock_item
		GROUP BY product_id) AS g
	ON a.entity_id = g.product_id
	WHERE a.type_id = ''simple'' AND
		  a.sku NOT LIKE ''%FREE%'' AND 
		  LEFT(a.sku,5) NOT IN(''SS14I'',''SS14C'') AND 
		  e.value IS NULL AND 
		  g.qoh > 0')

SELECT DISTINCT SUBSTRING(SUBSTRING(sku,7,LEN(sku)),0,CHARINDEX('-',SUBSTRING(sku,7,LEN(sku)))) AS brand,
				choose_color, 
				image_url 
INTO #export 
FROM #net_new_colors

INSERT INTO #export
SELECT DISTINCT SUBSTRING(SUBSTRING(sku,7,LEN(sku)),0,CHARINDEX('-',SUBSTRING(sku,7,LEN(sku)))) AS brand,
				choose_color, 
				image_url
FROM #old_colors

SELECT DISTINCT brand, choose_color, MAX(image_url) AS image_url
FROM #export
GROUP BY brand, choose_color

-- ONCE YOU HAVE RECEIVED THE MECHANICAL TURK RESULTS, TRUNCATE LOT_Inventory.dbo.tbl_Color_Family_Lookup AND IMPORT THE RESULTS TABLE INTO THE choose_color, color_family1, and color_family2 COLUMNS