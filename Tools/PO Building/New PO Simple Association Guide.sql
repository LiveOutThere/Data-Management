--First determine which simple products are already associated to the configurables you are about to re-load:

SELECT parent_sku, simples_skus FROM OPENQUERY(MAGENTO,'
SELECT x.sku AS parent_sku, CAST(GROUP_CONCAT(DISTINCT a.sku ORDER BY a.sku DESC SEPARATOR '','') AS CHAR(4000)) AS simples_skus
FROM catalog_product_entity AS a
INNER JOIN (SELECT DISTINCT b.sku, a.product_id
		    FROM catalog_product_super_link AS a
			INNER JOIN catalog_product_entity AS b
			ON a.parent_id = b.entity_id
			WHERE b.sku IN(''HH-48416'',
		''HH-48417'',
		''HH-48543'',
		''HH-48569'',
		''HH-48635'',
		''HH-48800'',
		''HH-48852'',
		''HH-48877'',
		''HH-48900'',
		''HH-48962'',
		''HH-48981'',
		''HH-50956'',
		''HH-51008'',
		''HH-51260'',
		''HH-51425'',
		''HH-51457'',
		''HH-51482'',
		''HH-57502'',
		''HH-60359'',
		''HH-62157'',
		''HH-62167'',
		''HH-62237'',
		''HH-62246'')) AS x
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
FROM tbl_LoadFile_FW13_HH
WHERE type = 'simple' AND vendor_product_id + '-' + vendor_color_code + '-' + vendor_size_code IN('48800-536-L',
'48800-536-M',
'48800-536-S',
'48800-536-XL',
'48800-689-L',
'48800-689-M',
'48800-689-S',
'48800-689-XL',
'48800-998-L',
'48800-998-M',
'48800-998-S',
'48800-998-XL',
'48852-223-L',
'48852-223-M',
'48852-223-S',
'48852-223-XL',
'48852-990-L',
'48852-990-M',
'48852-990-S',
'48852-990-XL',
'48877-689-L',
'48877-689-M',
'48877-689-S',
'48877-689-XL',
'48877-981-L',
'48877-981-M',
'48877-981-S',
'48877-981-XL',
'48900-990-L',
'48900-990-M',
'48900-990-S',
'48900-990-XL',
'48962-998-L',
'48962-998-M',
'48962-998-S',
'48962-998-XL',
'50956-707-L',
'50956-707-M',
'50956-707-S',
'50956-707-XL',
'50956-991-L',
'50956-991-M',
'50956-991-S',
'50956-991-XL',
'51008-990-L',
'51008-990-M',
'51008-990-S',
'51008-990-XL',
'51260-980-30',
'51260-980-32',
'51260-980-34',
'51260-980-36',
'51457-689-L',
'51457-689-M',
'51457-689-S',
'51457-689-XL',
'51457-990-L',
'51457-990-M',
'51457-990-S',
'51457-990-XL',
'60359-990-L',
'60359-990-M',
'60359-990-S',
'60359-990-XL',
'62157-204-L',
'62157-204-M',
'62157-204-S',
'62157-204-XL',
'62157-990-L',
'62157-990-M',
'62157-990-S',
'62157-990-XL',
'62237-707-L',
'62237-707-M',
'62237-707-S',
'62237-707-XL',
'62237-990-L',
'62237-990-M',
'62237-990-S',
'62237-990-XL',
'48416-990-L',
'48416-990-M',
'48416-990-S',
'48416-990-XL',
'48981-990-L',
'48981-990-M',
'48981-990-S',
'48981-990-XL',
'57502-001-O/S',
'57502-204-O/S',
'57502-990-O/S',
'48417-990-L',
'48417-990-M',
'48417-990-S',
'48417-990-XL',
'48417-990-XS',
'48543-222-L',
'48543-222-M',
'48543-222-S',
'48543-222-XL',
'48543-222-XS',
'48543-223-L',
'48543-223-M',
'48543-223-S',
'48543-223-XL',
'48543-223-XS',
'48543-258-L',
'48543-258-M',
'48543-258-S',
'48543-258-XL',
'48543-258-XS',
'48569-003-L',
'48569-003-M',
'48569-003-S',
'48569-003-XL',
'48569-003-XS',
'48569-570-L',
'48569-570-M',
'48569-570-S',
'48569-570-XL',
'48569-570-XS',
'48569-991-L',
'48569-991-M',
'48569-991-S',
'48569-991-XL',
'48569-991-XS',
'48635-222-L',
'48635-222-M',
'48635-222-S',
'48635-222-XL',
'48635-222-XS',
'48635-570-L',
'48635-570-M',
'48635-570-S',
'48635-570-XL',
'48635-570-XS',
'48635-998-L',
'48635-998-M',
'48635-998-S',
'48635-998-XL',
'48635-998-XS',
'51425-980-L',
'51425-980-M',
'51425-980-S',
'51425-980-XL',
'51425-980-XS',
'51482-399-L',
'51482-399-M',
'51482-399-S',
'51482-399-XL',
'51482-399-XS',
'51482-990-L',
'51482-990-M',
'51482-990-S',
'51482-990-XL',
'51482-990-XS',
'62167-258-L',
'62167-258-M',
'62167-258-S',
'62167-258-XL',
'62167-258-XS',
'62167-991-L',
'62167-991-M',
'62167-991-S',
'62167-991-XL',
'62167-991-XS',
'62246-535-L',
'62246-535-M',
'62246-535-S',
'62246-535-XL',
'62246-535-XS',
'62246-990-L',
'62246-990-M',
'62246-990-S',
'62246-990-XL',
'62246-990-XS'))

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
			WHERE b.sku IN(''HH-48416'',
		''HH-48417'',
		''HH-48543'',
		''HH-48569'',
		''HH-48635'',
		''HH-48800'',
		''HH-48852'',
		''HH-48877'',
		''HH-48900'',
		''HH-48962'',
		''HH-48981'',
		''HH-50956'',
		''HH-51008'',
		''HH-51260'',
		''HH-51425'',
		''HH-51457'',
		''HH-51482'',
		''HH-57502'',
		''HH-60359'',
		''HH-62157'',
		''HH-62167'',
		''HH-62237'',
		''HH-62246'')) AS x
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








