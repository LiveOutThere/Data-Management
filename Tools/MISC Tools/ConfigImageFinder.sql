-- FIND CONFIG IMAGES FROM SIMPLES IN MAGENTO:
SELECT * FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, a.name, MAX(c.value) AS image
	FROM catalog_product_flat_1 AS a
	INNER JOIN catalog_product_super_link AS b
	ON a.entity_id = b.parent_id
	INNER JOIN catalog_product_entity_varchar AS c
	ON b.product_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	WHERE a.sku IN(''TNF-A9MK'')
GROUP BY a.sku, a.name')

-- FIND CONFIG IMAGES FROM LOADFILE DATA ON FS01:

IF OBJECT_ID('tempdb..#image_setter') IS NOT NULL BEGIN
	DROP TABLE #image_setter
END

SELECT * INTO #image_setter FROM OPENQUERY(MAGENTO,'
	SELECT DISTINCT a.sku, e.value
	FROM catalog_product_entity AS a
	INNER JOIN catalog_product_super_link AS b
	ON a.entity_id = b.parent_id
	INNER JOIN catalog_product_entity AS c
	ON b.product_id = c.entity_id
	INNER JOIN catalog_product_entity_varchar AS d
	ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	INNER JOIN catalog_product_entity_varchar AS e
	ON c.entity_id = e.entity_id AND e.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	WHERE a.type_id = ''configurable'' AND (d.value IS NULL OR d.value = ''no_selection'')
	')
--SELECT * FROM #image_setter
SELECT 'sku' AS sku, 'image' AS image UNION ALL
SELECT sku, MAX(RIGHT(value,CHARINDEX('/',REVERSE(value)) - 1)) AS image FROM #image_setter GROUP BY sku

IF OBJECT_ID('tempdb..#config_image') IS NOT NULL BEGIN
	DROP TABLE #config_image
END

SELECT * INTO #config_image FROM OPENQUERY(MAGENTO,'
	SELECT DISTINCT a.sku
	FROM catalog_product_entity AS a
	LEFT JOIN catalog_product_entity_varchar AS b
	ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''image'')
	WHERE a.type_id = ''configurable'' AND (b.value IS NULL OR b.value = ''no_selection'')
	')

SELECT a.sku, MAX(a.filename) AS filename
FROM
(SELECT DISTINCT a.sku, b.filename
FROM #config_image AS a
LEFT JOIN LOT_Inventory.dbo.tbl_RawData_SS13_Image_Filenames AS b
ON LEFT(a.sku,CHARINDEX('-',a.sku) - 1) = b.brand COLLATE SQL_Latin1_General_CP1_CI_AS AND b.filename COLLATE SQL_Latin1_General_CP1_CI_AS LIKE '%' + SUBSTRING(a.sku,CHARINDEX('-',a.sku) + 1,LEN(a.sku)) + '%'
WHERE b.filename IS NOT NULL) AS a
GROUP BY a.sku