SELECT * FROM OPENQUERY(MAGENTO,'
	SELECT c.sku, MAX(a.pop_price_ht) AS cost, SUM(a.pop_qty) AS total_units, LEFT(ROUND(((SUM(a.pop_qty) * MAX(a.pop_price_ht)) * (1 - (MAX(a.pop_discount) / 100))),1),6) AS total_value
	FROM purchase_order_product AS a
	INNER JOIN catalog_product_super_link AS b
	ON a.pop_product_id = b.product_id
	INNER JOIN catalog_product_entity AS c
	ON b.parent_id = c.entity_id 
	WHERE a.pop_order_num = 1928
	GROUP BY c.sku
	ORDER BY c.sku')