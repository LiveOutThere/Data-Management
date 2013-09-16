--First determine which simple products are already associated to the configurables you are about to re-load:

SELECT x.sku AS parent_sku, a.sku AS child_sku
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN('SS13A-IB-100269')) AS x
ON a.entity_id = x.product_id

--If the query above returns an empty result set you are free to proceed as there is no risk of overwriting any existing associations.

--If not, the next step is to determine whether there are any style-color-size matches between the existing simple products and the ones you are about to load. The query below will indicate the style, color_code, and size_code values of all the simple products that are already associated:

SELECT simple_products.child_sku AS sku, z.vendor_product_id AS style, color_code.value AS color_code, size_code.value AS size_code
FROM
(SELECT x.sku AS parent_sku, a.sku AS child_sku
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN(.../*Insert configurable SKUs*/)) AS x
ON a.entity_id = x.product_id) AS simple_products
INNER JOIN catalog_product_flat_1 AS z
ON simple_products.child_sku = z.sku
INNER JOIN catalog_product_entity_varchar AS color_code
ON z.entity_id = color_code.entity_id
INNER JOIN catalog_product_entity_varchar AS size_code
ON z.entity_id = size_code.entity_id
WHERE size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = 'vendor_size_code') AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = 'vendor_color_code')

--Now that we can see the style, color_code, and size_code values for the existing simple products, we can cross-reference them to the equivalent values for the new simples we are wanting to load.

IF OBJECT_ID('tempdb..#po_style_color_size') IS NOT NULL BEGIN
	DROP TABLE #po_style_color_size
END	
	
CREATE TABLE #po_style_color_size (style varchar(155), color_code varchar(155), size_code varchar(155))

INSERT INTO #po_style_color_size (style, color_code, size_code)
(SELECT DISTINCT vendor_product_id, vendor_color_code, vendor_size_code
FROM tbl_LoadFile_SS13_IB
WHERE type = 'simple' AND vendor_product_id + '-' + vendor_color_code IN('100269-J01','100269-D34'))

SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX('-',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = '0' THEN 'OOS' ELSE 'In-Stock' END AS is_in_stock
FROM #po_style_color_size AS a
FULL JOIN (SELECT sku, is_in_stock, style, color_code, size_code FROM OPENQUERY(MAGENTO,'
SELECT simple_products.child_sku AS sku, stock.is_in_stock AS is_in_stock, z.vendor_product_id AS style, color_code.value AS color_code, size_code.value AS size_code
FROM
(SELECT x.sku AS parent_sku, a.sku AS child_sku
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN(''SS13A-IB-100269'')) AS x
ON a.entity_id = x.product_id) AS simple_products
INNER JOIN catalog_product_flat_1 AS z
ON simple_products.child_sku = z.sku
INNER JOIN catalog_product_entity_varchar AS color_code
ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_color_code'')
INNER JOIN catalog_product_entity_varchar AS size_code
ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''vendor_size_code'')
INNER JOIN cataloginventory_stock_item AS stock
ON z.entity_id = stock.product_id AND stock.stock_id = 1')) AS b
ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code

--By taking a look at the output of the query above you can quickly see any overlap between what is already associated and what we are trying to add.

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP, remove the ASAP qty from ERP and add it on the qty from the PO, then associate the new SKU
*/








