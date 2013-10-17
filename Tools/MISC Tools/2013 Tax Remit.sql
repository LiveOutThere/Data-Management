USE LOT_Reporting
GO

IF OBJECT_ID('tempdb..#view_Tax') IS NOT NULL BEGIN
	DROP TABLE #view_Tax
END	

SELECT * INTO #view_Tax FROM OPENQUERY(MAGENTO,'

SELECT b.subtotal, b.created_at, a.increment_id AS order_number, b.tax_amount AS tax_paid, d.region, c.code, c.percent, c.amount 
FROM sales_flat_order AS a
INNER JOIN sales_flat_invoice AS b
ON a.entity_id = b.order_id
INNER JOIN sales_order_tax AS c
ON a.entity_id = c.order_id
INNER JOIN sales_flat_order_address AS d
ON a.entity_id = d.parent_id AND d.address_type = ''shipping''
WHERE b.created_at > ''2013-01-01 00:00:00''')
GO

ALTER TABLE #view_Tax ADD region_code VARCHAR(155)

UPDATE #view_Tax SET created_at = dbo.adjustedForTimezone(created_at)
UPDATE #view_Tax SET region_code = CASE WHEN region = 'New Brunswick' THEN 'HST - NB'
										WHEN region = 'Newfoundland and Labrador' THEN 'HST - NL'
										WHEN region = 'Nova Scotia' THEN 'HST - NS'
										WHEN region = 'Ontario' THEN 'HST - ON'
										WHEN region = 'British Columbia' AND created_at < '2013-04-01 00:00:00' THEN 'HST - BC'
										ELSE 'GST' END
										
SELECT created_at, order_number, region AS shipping_region, code AS magento_tax_code, region_code AS actual_tax_code, dbo.getTotalWithTax(subtotal,code) AS magento_paid, dbo.getTotalWithTax(subtotal,region_code) AS proper_paid, (dbo.getTotalWithTax(subtotal,region_code) - dbo.getTotalWithTax(subtotal,code)) AS net_difference  
FROM #view_Tax
WHERE region_code <> code
ORDER BY net_difference