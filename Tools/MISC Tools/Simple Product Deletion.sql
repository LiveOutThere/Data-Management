IF OBJECT_ID('tempdb..#tmp_simple_ids') IS NOT NULL BEGIN
	DROP TABLE #tmp_simple_ids
END
IF OBJECT_ID('tempdb..#tmp_product_keep') IS NOT NULL BEGIN
	DROP TABLE #tmp_product_keep
END
IF OBJECT_ID('tempdb..#tmp_simples_to_delete') IS NOT NULL BEGIN
	DROP TABLE #tmp_simples_to_delete
END

--Populate temp table with ALL simples products in the database:
SELECT entity_id, sku INTO #tmp_simple_ids FROM OPENQUERY(MAGENTO,'SELECT DISTINCT entity_id, sku FROM catalog_product_entity WHERE type_id = ''simple''')

--Abstract contents of initial temp table into a new table that will be reduced down to only those products we want to delete:
SELECT * INTO #tmp_simples_to_delete FROM #tmp_simple_ids

--Determine the entity_ids of all simple products that meet one or both of the following conditions:
--	1) Have QTY on-hand > 0
--	2) Have QTY on-hand <= 0 BUT have been sold within the past 60 days   
SELECT entity_id, sku INTO #tmp_product_keep FROM OPENQUERY(MAGENTO,'
	SELECT DISTINCT a.entity_id, a.sku 
	FROM catalog_product_entity AS a 
	LEFT JOIN sales_flat_order_item AS b
	ON a.entity_id = b.product_id
	LEFT JOIN sales_flat_order AS c
	ON b.order_id = c.entity_id
	LEFT JOIN (SELECT product_id, (SUM(qty) - SUM(stock_reserved_qty) AS qty FROM catalog_inventory_stock_item GROUP BY product_id) AS d
	ON a.entity_id = d.product_id
	WHERE (a.type_id = ''simple'' AND IFNULL(d.qty,0) > 0) OR 
		  (a.type_id = ''simple'' AND IFNULL(d.qty,0) <= 0) AND DATEDIFF(IFNULL(c.created_at,CURDATE()),CURDATE()) < 60')

--Remove unwanted records from table containing all simple products:
DELETE FROM #tmp_simples_to_delete WHERE entity_id IN(SELECT DISTINCT entity_id FROM #tmp_product_keep)

--Prepare MAGMI delete file, excluding all SS14 products and Gift With Purchase SKUs:
SELECT DISTINCT '1' AS [magmi:delete], sku AS sku
FROM #tmp_simples_to_delete
WHERE sku NOT LIKE '%FREE%' AND sku NOT LIKE 'SS14%'
ORDER BY sku

--Run & Analyze Diagnostics:
SELECT ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_product_sold WHERE type_id = 'simple') AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_total_sold,
	   100 -  ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_product_sold WHERE type_id = 'simple') AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_not_sold,
	   ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_to_delete,
	   100 -  ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_keep,
	   100 -  ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) - ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_product_sold WHERE type_id = 'simple') AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS ss14_projected,
	   ROUND(CAST((SELECT COUNT(sku) FROM #tmp_simple_ids WHERE LEFT(sku,4) = 'SS14') AS float) / CAST((SELECT COUNT(sku) FROM #tmp_simple_ids) AS float) * 100,1) AS ss14_actual