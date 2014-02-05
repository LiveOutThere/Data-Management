IF OBJECT_ID('tempdb..#tmp_simple_ids') IS NOT NULL BEGIN
	DROP TABLE #tmp_simple_ids
END
IF OBJECT_ID('tempdb..#tmp_product_keep') IS NOT NULL BEGIN
	DROP TABLE #tmp_product_keep
END
IF OBJECT_ID('tempdb..#tmp_simples_to_delete') IS NOT NULL BEGIN
	DROP TABLE #tmp_simples_to_delete
END
IF OBJECT_ID('tempdb..#tmp_simple_sold') IS NOT NULL BEGIN
	DROP TABLE #tmp_simple_sold
END
IF OBJECT_ID('tempdb..#tmp_simple_qty') IS NOT NULL BEGIN
	DROP TABLE #tmp_simple_qty
END

--Populate temp table with ALL simples products in the database:
SELECT entity_id, sku INTO #tmp_simple_ids FROM OPENQUERY(MAGENTO,'SELECT DISTINCT entity_id, sku FROM catalog_product_entity WHERE type_id = ''simple''')

--Abstract contents of initial temp table into a new table that will be reduced down to only those products we want to delete:
SELECT * INTO #tmp_simples_to_delete FROM #tmp_simple_ids

--Pull contents of sales_flat_order_item & cataloginventory_stock_item for optimization purposes:
SELECT product_id, sku INTO #tmp_simple_sold FROM OPENQUERY(MAGENTO,'SELECT DISTINCT a.product_id, a.sku FROM sales_flat_order_item AS a INNER JOIN catalog_product_entity AS b ON a.product_id = b.entity_id WHERE b.type_id = ''simple''')
SELECT product_id, qty INTO #tmp_simple_qty FROM OPENQUERY(MAGENTO,'SELECT product_id, SUM(qty) - SUM(stock_reserved_qty) AS qty FROM cataloginventory_stock_item GROUP BY product_id')

--Determine the entity_ids of all simple products that meet one or both of the following conditions:
--	1) Have QTY on-hand > 0
--	2) Have been sold at some point   
SELECT a.entity_id, a.sku INTO #tmp_product_keep 
FROM #tmp_simples_to_delete AS a 
LEFT JOIN #tmp_simple_sold AS b
ON a.entity_id = b.product_id
LEFT JOIN #tmp_simple_qty AS c
ON a.entity_id = c.product_id
WHERE b.sku IS NOT NULL OR --eliminates all simple products that have been sold 
	  ISNULL(c.qty,0) > 0 OR --eliminates all simple products that have qty > 0
	  a.sku LIKE '%FREE%' OR --eliminates all simple products that are GWP stock 
	  a.sku LIKE 'SS14%' --eliminates all simple products that are in-season (perhaps have yet to be received)

--Remove unwanted records from table containing all simple products:
DELETE FROM #tmp_simples_to_delete WHERE entity_id IN(SELECT DISTINCT entity_id FROM #tmp_product_keep)

--Prepare MAGMI delete file, excluding all SS14 products and Gift With Purchase SKUs:
SELECT DISTINCT '1' AS [magmi:delete], sku
FROM #tmp_simples_to_delete
ORDER BY sku

--Run & Analyze Diagnostics:
SELECT ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_simple_sold) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_total_sold,
	   100 -  ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_simple_sold) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_not_sold,
	   ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_to_delete,
	   100 -  ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS percentage_keep,
	   100 -  ROUND(CAST((SELECT COUNT(*) FROM #tmp_simples_to_delete) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) - ROUND(CAST((SELECT COUNT(product_id) FROM #tmp_simple_sold) AS float) / CAST((SELECT COUNT(*) FROM #tmp_simple_ids) AS float) * 100,1) AS ss14_projected,
	   ROUND(CAST((SELECT COUNT(sku) FROM #tmp_simple_ids WHERE LEFT(sku,4) = 'SS14') AS float) / CAST((SELECT COUNT(sku) FROM #tmp_simple_ids) AS float) * 100,1) AS ss14_actual