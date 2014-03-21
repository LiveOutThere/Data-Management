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
	WHERE a.type_id = ''configurable'' AND a.sku IN(''ARC-13130'',
	''ARC-10980'',
	''ARC-10982'',
	''ARC-13983'',
	''ARC-13984'',
	''ARC-13134'',
	''ARC-10981'',
	''ARC-10983'',
	''ARC-12648'',
	''ARC-5848'',
	''ARC-6274'',
	''ARC-13812'',
	''ARC-6845'',
	''ARC-6265'',
	''ARC-12687'',
	''ARC-11789'',
	''ARC-12676'',
	''ARC-9488'',
	''ARC-9407'',
	''ARC-12684'',
	''ARC-9408'',
	''ARC-9410'',
	''ARC-12708'',
	''ARC-12736'',
	''ARC-12643'',
	''ARC-11114'',
	''ARC-10970'',
	''ARC-8135'',
	''ARC-8136'',
	''ARC-9825'',
	''ARC-9486'',
	''ARC-12680'',
	''ARC-12740'',
	''ARC-12739'',
	''ARC-6248'',
	''ARC-9954'',
	''BD-BD111523'',
	''BD-BD120106'',
	''BD-BD120101'',
	''BD-BD115024'',
	''BD-BD120206'',
	''BD-BD115018'',
	''BD-BD115012'',
	''IB-100040'',
	''MAR-72560'',
	''MAR-77790'',
	''MAR-15480'',
	''MAR-40420'',
	''MAR-5067'',
	''MAR-73590'',
	''MAR-75910'',
	''MAR-88630'',
	''MAR-78090'',
	''MAR-70290'',
	''MAR-69100'',
	''MAR-78670'',
	''MAR-70670'',
	''MAR-75530'',
	''MAR-73610'',
	''MAR-15380'',
	''MAR-60720'',
	''MAR-65480'',
	''MERFOOT-FFF53'',
	''MERFOOT-120CD'',
	''MERFOOT-A50A4'',
	''MERFOOT-49E4F'',
	''MERFOOT-5EF09'',
	''MERFOOT-E9AE2'',
	''MERFOOT-A67D3'',
	''MERFOOT-54C8C'',
	''MERFOOT-96481'',
	''MERFOOT-80FCC'',
	''MERFOOT-5491F'',
	''MERFOOT-BD10B'',
	''MERFOOT-CAAFD'',
	''MERFOOT-DE6F9'',
	''MHW-OM5550'',
	''MHW-OL4352'',
	''MHW-OM5731'',
	''MHW-OM4989'',
	''MHW-OM4990'',
	''MHW-OL5636'',
	''MHW-OM4420'',
	''MHW-OM5586'',
	''MHW-OL5621'',
	''MHW-OL5634'',
	''MHW-OM5647'',
	''MHW-OL5640'',
	''MHW-OM4748'',
	''MHW-OL4398'',
	''MHW-OM5648'',
	''MHW-OL5642'',
	''MHW-OM4344'',
	''MHW-OL5451'',
	''MHW-OM4351'',
	''MHW-OM5666'',
	''MHW-OL5729'',
	''MHW-OM5422'',
	''MHW-OM4416'',
	''MHW-OL5134'',
	''MHW-OM5664'',
	''MHW-OM4151'',
	''MHW-OL5421'',
	''MHW-OM4382'',
	''MHW-OM5527'',
	''MHW-OM5186'',
	''MHW-OL4749'',
	''MHW-OM4750'',
	''MHW-OL3866'',
	''MHW-OM5599'',
	''MHW-OM4282'',
	''MHW-OM4281'',
	''MHW-OL4140'',
	''MHW-OL5581'',
	''MHW-OU5626'',
	''MHW-OM5588'',
	''MHW-OM4825'',
	''MHW-OM4805'',
	''MHW-OL5653'',
	''MHW-OL3242'',
	''MHW-OM5426'',
	''PAT-31677'',
	''PAT-28320'',
	''PAT-84385'',
	''PAT-51430'',
	''SMI-PZ6'',
	''SMI-PR6'',
	''SMI-VR6'',
	''TNF-A0MQ'',
	''TNF-A0MR'',
	''TNF-AUFA'',
	''TNF-A6EC'',
	''TNF-AUEY'',
	''TNF-A0EW'',
	''TNF-A0X5'',
	''TNF-A7FJ'',
	''TNF-A6FB'',
	''TNF-A8XM'',
	''TNF-A1M2'',
	''TNF-C326'',
	''TNF-A0MH'',
	''TNF-A7EY'',
	''TNF-A8WM'',
	''TNF-A0PA'',
	''TNF-A7T2'',
	''TNF-A51R'',
	''TNF-A6FD'',
	''TNF-A0PM'',
	''TNF-A6EK'')
	')
	
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