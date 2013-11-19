USE LOT_Inventory
GO

IF OBJECT_ID('tempdb..#skucolorfamily') IS NOT NULL BEGIN
		DROP TABLE #skucolorfamily
END
	
CREATE TABLE #skucolorfamily (brand varchar(255), sku varchar(255), choose_color varchar(255), color_family varchar(255))

INSERT INTO #skucolorfamily (sku,choose_color)
SELECT * FROM OPENQUERY(MAGENTO,'
SELECT DISTINCT a.sku, c.value AS choose_color
FROM catalog_product_entity AS a
INNER JOIN catalog_product_entity_int AS b
ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''choose_color'')
INNER JOIN eav_attribute_option_value AS c
ON b.value = c.option_id
WHERE a.sku LIKE ''FW13%'' AND a.type_id = ''simple''')

UPDATE a
	SET a.brand = LEFT(SUBSTRING(b.sku,7,LEN(b.sku)),CHARINDEX('-',SUBSTRING(b.sku,7,LEN(b.sku))) - 1)
FROM #skucolorfamily AS a
INNER JOIN #skucolorfamily AS b
ON a.sku = b.sku

UPDATE a
	SET a.color_family = CASE WHEN RIGHT(b.color1 + '|' + b.color2,1) = '|' THEN LEFT(b.color1 + '|' + b.color2,LEN(b.color1 + '|' + b.color2) - 1) ELSE b.color1 + '|' + b.color2 END
FROM #skucolorfamily AS a
INNER JOIN tbl_Color_Family_Lookup AS b
ON a.brand COLLATE SQL_Latin1_General_CP1_CI_AS = b.brand COLLATE SQL_Latin1_General_CP1_CI_AS AND a.choose_color COLLATE SQL_Latin1_General_CP1_CI_AS = b.color_name COLLATE SQL_Latin1_General_CP1_CI_AS

--SELECT DISTINCT brand, choose_color FROM #skucolorfamily WHERE color_family IS NULL

SELECT DISTINCT sku, color_family FROM #skucolorfamily WHERE color_family IS NOT NULL


