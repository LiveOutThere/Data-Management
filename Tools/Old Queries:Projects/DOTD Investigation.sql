IF OBJECT_ID('tempdb..#data') IS NOT NULL BEGIN
	DROP TABLE #data
END
IF OBJECT_ID('tempdb..#final') IS NOT NULL BEGIN
	DROP TABLE #final
END

SELECT * INTO #data FROM OPENQUERY(MAGENTO,'
	SELECT d.manufacturer_value AS brand, 
		   CASE WHEN d.department = ''17215'' THEN ''Men'' WHEN d.department = ''17216'' THEN ''Women'' WHEN d.department = ''17215,17216'' THEN ''Men|Women'' ELSE d.department END AS department, 
		   d.name, 
		   a.entity_id, 
		   a.sku, 
		   b.value AS price, 
		   c.value AS cost, 
		   f.qoh,
		   g.lowest_deal_price,
		   h.qty_sold
	FROM catalog_product_entity AS a
	INNER JOIN catalog_product_entity_decimal AS b
	ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''price'')
	INNER JOIN catalog_product_entity_decimal AS c
	ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''cost'')
	INNER JOIN catalog_product_flat_1 AS d
	ON a.entity_id = d.entity_id
	LEFT JOIN catalog_product_super_link AS e
	ON a.entity_id = e.parent_id
	LEFT JOIN catalog_product_entity AS x
	ON e.product_id = x.entity_id
	LEFT JOIN (SELECT product_id, (SUM(qty) - SUM(stock_reserved_qty)) AS qoh
				FROM cataloginventory_stock_item
				GROUP BY product_id) AS f
	ON e.product_id = f.product_id
	LEFT JOIN (SELECT id, product_id, MIN(price) AS lowest_deal_price
			   FROM aw_collpur_deal
			   GROUP BY id, product_id) AS g
	ON a.entity_id = g.product_id
	LEFT JOIN (SELECT deal_id, SUM(qty_purchased) AS qty_sold
			   FROM aw_collpur_deal_purchases
			   GROUP BY deal_id) AS h
	ON g.id = h.deal_id
	WHERE a.type_id = ''configurable'' AND x.sku LIKE ''SS14C-%''')
	
SELECT brand, 
	   department, 
	   name, 
	   entity_id, 
	   sku, 
	   CAST(price AS money) AS price, 
	   CAST(cost AS money) AS cost, 
	   CAST(SUM(ISNULL(qoh,0)) AS int) AS qoh, 
	   CAST(MIN(ISNULL(lowest_deal_price,0)) AS money) AS deal_price,
	   CAST(ROUND((MIN(ISNULL(lowest_deal_price,0)) / ISNULL(price,1)) * 100,0) AS int) AS deal_discount,
	   (ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) AS net_deal_revenue,
	   (ISNULL(SUM(qty_sold),0) * cost) AS net_deal_cost,
	   CASE WHEN (CASE WHEN ((ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) - (ISNULL(SUM(qty_sold),0) * cost)) = 0 
					   THEN 1 
					   ELSE ((ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) - (ISNULL(SUM(qty_sold),0) * cost)) END / 
				  CASE WHEN (ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) = 0 
					   THEN 1 
					   ELSE (ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) END) = 1 
			THEN NULL 
			ELSE (CASE WHEN ((ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) - (ISNULL(SUM(qty_sold),0) * cost)) = 0 
					   THEN 1 
					   ELSE ((ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) - (ISNULL(SUM(qty_sold),0) * cost)) END / 
				  CASE WHEN (ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) = 0 
				  THEN 1 
				  ELSE (ISNULL(SUM(qty_sold),0) * MIN(ISNULL(lowest_deal_price,0))) END) 
			END AS deal_margin
	   --((ext_net_sales_revenue - ext_net_sales_cost) / ext_net_sales_revenue)
INTO #final
FROM #data
GROUP BY brand, department, name, entity_id, sku, price, cost

SELECT * FROM #final