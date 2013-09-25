--Configurables to Delete:
SELECT * FROM OPENQUERY(MAGENTO,'

SELECT a.sku, c.last_ordered
FROM catalog_product_entity AS a
INNER JOIN catalog_product_super_link AS b
ON a.entity_id = b.parent_id
INNER JOIN
	(SELECT b.product_id, b.last_ordered
	FROM catalog_product_entity AS a
	INNER JOIN (SELECT product_id, CAST(MAX(created_at) AS date) AS last_ordered
			   FROM sales_flat_order_item
			   GROUP BY product_id
			   HAVING LEFT(MAX(sku),4) NOT IN(''SS13'',''FW13'') AND MAX(product_type) = ''simple'') AS b
	ON a.entity_id = b.product_id
	WHERE DATE_ADD(b.last_ordered, INTERVAL 60 DAY) <= CURDATE()) AS c
ON b.product_id = c.product_id
ORDER BY c.last_ordered
')

--Simples To Delete:
SELECT * FROM OPENQUERY(MAGENTO,'

SELECT a.sku, b.*
FROM catalog_product_entity AS a
INNER JOIN (SELECT product_id, CAST(MAX(created_at) AS date) AS last_ordered
		   FROM sales_flat_order_item
		   GROUP BY product_id
		   HAVING LEFT(MAX(sku),4) NOT IN(''SS13'',''FW13'') AND MAX(product_type) = ''simple'') AS b
ON a.entity_id = b.product_id
WHERE DATE_ADD(b.last_ordered, INTERVAL 60 DAY) <= CURDATE()
ORDER BY b.last_ordered
')

SELECT * FROM OPENQUERY(MAGENTO,'
SELECT a.sku
FROM catalog_product_entity AS a
LEFT JOIN sales_flat_order_item AS b
ON a.entity_id = b.product_id AND b.product_type = ''simple''
')