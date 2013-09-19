--First determine which simple products are already associated to the configurables you are about to re-load:

SELECT parent_sku, simples_skus FROM OPENQUERY(MAGENTO,'
SELECT x.sku AS parent_sku, CAST(GROUP_CONCAT(DISTINCT a.sku ORDER BY a.sku DESC SEPARATOR '','') AS CHAR(4000)) AS simples_skus
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN(''ARC-8135'',
''ARC-9537'',
''ARC-9558'',
''ARC-9825'',
''ARC-10683'',
''ARC-11114'',
''ARC-12032'',
''ARC-12643'',
''ARC-12645'',
''ARC-12676'',
''ARC-12708'',
''ARC-7640'',
''ARC-8136'',
''ARC-8560'',
''ARC-9492'',
''ARC-9826'',
''ARC-10971'',
''ARC-11115'',
''ARC-11117'',
''ARC-11267'',
''ARC-12665'')) AS x
ON a.entity_id = x.product_id
GROUP BY x.sku')
ORDER BY parent_sku

-- Next, cross-reference the style, color_code, and size_code values for the existing simple products with the equivalent values for the new simples we are wanting to load:

IF OBJECT_ID('tempdb..#po_style_color_size') IS NOT NULL BEGIN
	DROP TABLE #po_style_color_size
END	
	
CREATE TABLE #po_style_color_size (style varchar(155), color_code varchar(155), size_code varchar(155))

INSERT INTO #po_style_color_size (style, color_code, size_code)
(SELECT DISTINCT vendor_product_id, vendor_color_code, vendor_size_code
FROM tbl_LoadFile_FW13_ARC
WHERE type = 'simple' AND vendor_product_id + '-' + vendor_color_code + '-' + vendor_size_code IN('8135-BLUEMOON-L',
'8135-BLUEMOON-M',
'8135-BLUEMOON-S',
'8135-BLUEMOON-XL',
'8135-EMERALDISLE-L',
'8135-EMERALDISLE-M',
'8135-EMERALDISLE-S',
'8135-EMERALDISLE-XL',
'9537-COGNAC-L',
'9537-COGNAC-M',
'9537-COGNAC-S',
'9537-COGNAC-XL',
'9537-OLYMPUSBLUE-L',
'9537-OLYMPUSBLUE-M',
'9537-OLYMPUSBLUE-S',
'9537-OLYMPUSBLUE-XL',
'9558-HERON-L',
'9558-HERON-M',
'9558-HERON-S',
'9558-HERON-XL',
'9825-UTILITYGREEN-L',
'9825-UTILITYGREEN-M',
'9825-UTILITYGREEN-S',
'9825-UTILITYGREEN-XL',
'10683-GRAPHITE-30',
'10683-GRAPHITE-32',
'10683-GRAPHITE-34',
'10683-GRAPHITE-36',
'10683-GRAPHITE-38',
'11114-CARBONCOPY-L',
'11114-CARBONCOPY-M',
'11114-CARBONCOPY-S',
'11114-CARBONCOPY-XL',
'12032-BURLYWOOD-32',
'12032-BURLYWOOD-34',
'12032-BURLYWOOD-36',
'12643-BLUENILE-L',
'12643-BLUENILE-M',
'12643-BLUENILE-S',
'12643-BLUENILE-XL',
'12643-UTILITYGREEN-L',
'12643-UTILITYGREEN-M',
'12643-UTILITYGREEN-S',
'12643-UTILITYGREEN-XL',
'12645-BLACK-L',
'12645-BLACK-M',
'12645-BLACK-S',
'12645-BLACK-XL',
'12676-CARBONCOPY-L',
'12676-CARBONCOPY-M',
'12676-CARBONCOPY-S',
'12676-CARBONCOPY-XL',
'12676-UTILITYGREEN-L',
'12676-UTILITYGREEN-M',
'12676-UTILITYGREEN-S',
'12676-UTILITYGREEN-XL',
'12708-HERON-L',
'12708-HERON-M',
'12708-HERON-S',
'12708-HERON-XL',
'12708-RIPTIDE-L',
'12708-RIPTIDE-M',
'12708-RIPTIDE-S',
'12708-RIPTIDE-XL',
'7640-BLACK-L',
'7640-BLACK-M',
'7640-BLACK-S',
'7640-BLACK-XS',
'7640-LAGUNA-L',
'7640-LAGUNA-M',
'7640-LAGUNA-S',
'7640-LAGUNA-XS',
'8136-CYANBLUE-L',
'8136-CYANBLUE-M',
'8136-CYANBLUE-S',
'8136-CYANBLUE-XS',
'8136-ROSEBERRY-L',
'8136-ROSEBERRY-M',
'8136-ROSEBERRY-S',
'8136-ROSEBERRY-XS',
'8560-CARBONCOPY-L',
'8560-CARBONCOPY-M',
'8560-CARBONCOPY-S',
'8560-CARBONCOPY-XL',
'9492-CYANBLUE-L',
'9492-CYANBLUE-M',
'9492-CYANBLUE-S',
'9492-HERON-L',
'9492-HERON-M',
'9492-HERON-S',
'9826-BLACK-L',
'9826-BLACK-M',
'9826-BLACK-S',
'9826-BLACK-XS',
'10971-CARBONCOPY-L',
'10971-CARBONCOPY-M',
'10971-CARBONCOPY-S',
'10971-CARBONCOPY-XS',
'10971-CYANBLUE-L',
'10971-CYANBLUE-M',
'10971-CYANBLUE-S',
'10971-CYANBLUE-XS',
'11115-BLUEPYTHON-L',
'11115-BLUEPYTHON-M',
'11115-BLUEPYTHON-S',
'11115-CARBONCOPY-L',
'11115-CARBONCOPY-M',
'11115-CARBONCOPY-S',
'11115-CARBONCOPY-XS',
'11117-DRAGONFRUIT-L',
'11117-DRAGONFRUIT-M',
'11117-DRAGONFRUIT-S',
'11117-DRAGONFRUIT-XS',
'11267-BLACK-L',
'11267-BLACK-M',
'11267-BLACK-S',
'11267-BLACK-XS',
'12665-BLACK-10',
'12665-BLACK-12',
'12665-BLACK-4',
'12665-BLACK-6',
'12665-BLACK-8'))

SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX('-',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = '0' THEN 'OOS' ELSE 'In-Stock' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand
FROM #po_style_color_size AS a
FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code FROM OPENQUERY(MAGENTO,'
SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, z.vendor_product_id AS style, color_code.value AS color_code, size_code.value AS size_code
FROM
(SELECT x.sku AS parent_sku, a.sku AS child_sku
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN(''ARC-8135'',
''ARC-9537'',
''ARC-9558'',
''ARC-9825'',
''ARC-10683'',
''ARC-11114'',
''ARC-12032'',
''ARC-12643'',
''ARC-12645'',
''ARC-12676'',
''ARC-12708'',
''ARC-7640'',
''ARC-8136'',
''ARC-8560'',
''ARC-9492'',
''ARC-9826'',
''ARC-10971'',
''ARC-11115'',
''ARC-11117'',
''ARC-11267'',
''ARC-12665'')) AS x
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
ORDER BY b.style, LEFT(b.sku,CHARINDEX('-',b.sku) - 1), CASE WHEN b.is_in_stock = '0' THEN 'OOS' ELSE 'In-Stock' END

--By taking a look at the output of the query above you can quickly see any overlap between what is already associated and what we are trying to add.

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/








