SELECT c.sku, (a.eip_qty - b.eisp_stock) AS difference, d.value AS cost, ((a.eip_qty - b.eisp_stock) * d.value) AS net
FROM erp_inventory_product AS a
INNER JOIN erp_inventory_stock_picture AS b
ON a.eip_inventory_id = b.eisp_inventory_id AND a.eip_product_id = b.eisp_product_id
INNER JOIN catalog_product_entity AS c
ON a.eip_product_id = c.entity_id
INNER JOIN catalog_product_entity_decimal AS d
ON a.eip_product_id = d.entity_id AND d.attribute_id = 71 
WHERE a.eip_inventory_id >=8 AND (a.eip_qty - b.eisp_stock) <> 0 AND (a.eip_qty - b.eisp_stock) > -9999