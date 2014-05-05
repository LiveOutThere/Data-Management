CREATE TABLE #new_upc (sku nvarchar(155), vendor_sku bigint, brand nvarchar(10))

/*INSERT INTO #new_upc
SELECT sku, EAN, vendor_sku, '' FROM OPENQUERY(MAGENTO,'
SELECT a.sku, b.value AS EAN, c.value AS vendor_sku
FROM catalog_product_entity AS a
LEFT JOIN catalog_product_entity_varchar AS b
ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''ean'')
LEFT JOIN catalog_product_entity_varchar AS c
ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_sku'')
WHERE LEFT(a.sku,5) IN(''FW13I'',''FW13C'')')*/

DELETE FROM #new_upc WHERE sku IN (SELECT sku FROM #new_upc_updated WHERE vendor_sku IS NOT NULL)

CREATE TABLE #new_upc_updated (sku nvarchar(155), vendor_sku bigint, brand nvarchar(10))
INSERT INTO #new_upc_updated

SELECT a.sku, b.vendor_sku, a.brand 
FROM #new_upc AS a
INNER JOIN tbl_LoadFile_S12_ARC AS b
ON SUBSTRING(REPLACE(a.sku,'-lazuli','Lazuli'),7,LEN(a.sku)) COLLATE SQL_Latin1_General_CP1_CI_AS = CASE WHEN SUBSTRING(a.sku,5,1) = 'C' THEN REPLACE(b.sku,'SS13A','FW13C')
													 WHEN SUBSTRING(a.sku,5,1) = 'I' THEN REPLACE(b.sku,'FW13A','FW13I') END COLLATE SQL_Latin1_General_CP1_CI_AS
WHERE b.type = 'simple'

SELECT a.sku 
FROM #new_upc AS a
FULL JOIN #new_upc_updated AS b
ON a.sku = b.sku
WHERE b.sku IS NULL 

SELECT * FROM #new_upc
DROP TABLE #new_upc_updated

SELECT * FROM tbl_LoadFile_S12_ARC WHERE vendor_product_id = '8218'