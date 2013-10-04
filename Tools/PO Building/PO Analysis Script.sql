SELECT LEFT(REPLACE(c.sku,'FW13I-OR-',''),5) AS style, SUM(a.pop_qty) AS style_total, MAX(a.pop_price_ht) AS style_price 
FROM purchase_order_product AS a
INNER JOIN purchase_order AS b
ON a.pop_order_num = b.po_num AND b.po_order_id = 'OR-F13-2'
INNER JOIN catalog_product_entity AS c
ON a.pop_product_id = c.entity_id
GROUP BY LEFT(REPLACE(c.sku,'FW13I-OR-',''),5)