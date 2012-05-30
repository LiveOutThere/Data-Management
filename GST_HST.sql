USE LOT_Reporting
GO

SELECT *,
	TotalTaxRefunded - GST AS newcol
FROM (
	SELECT FullYear, MonthName, shipping_region,

	SUM(CAST(subtotal AS float)) - SUM(CAST(c.amount AS float)) AS [Month Sales Less Refunds], 
	SUM(CAST(tax_amount AS float)) AS Tax,
	ROUND(SUM(CAST(tax_amount AS float)) / SUM(CAST(subtotal AS float)),2) * 100 AS TaxedPercentage,
	(ROUND(SUM(CAST(tax_amount AS float)) / SUM(CAST(subtotal AS float)),2) * 100) - 5 AS [HST/PST Percentage], 
	ROUND(((((ROUND(SUM(CAST(tax_amount AS float)) / SUM(CAST(subtotal AS float)),2)) - .05) + 1) * SUM(CAST(subtotal AS float))) - SUM(CAST(subtotal AS float)),2) AS [HST/PST Amount], 
	ROUND(SUM(CAST(tax_amount AS float)) - (((((ROUND(SUM(CAST(tax_amount AS float)) / SUM(CAST(subtotal AS float)),2)) - .05) + 1) * SUM(CAST(subtotal AS float))) - SUM(CAST(subtotal AS float))),2) AS GST,
	SUM(CAST(c.amount AS float)) AS TotalRefunded,
	ROUND(SUM(CAST(c.amount AS float)) - (SUM(CAST(c.amount AS float)) / (1 + (ROUND(SUM(CAST(tax_amount AS float)) / SUM(CAST(subtotal AS float)),2)))),2) AS TotalTaxRefunded

	FROM tbl_Magento_Sales AS a
	INNER JOIN lut_Date AS b ON LEFT(created_at,11) = b.DateFull
	LEFT JOIN tbl_RawData_Moneris AS c ON a.txn_id = c.txn_id AND c.txn_type = 'Refund' 

	WHERE FullYear = 2012 AND subtotal <> '0' AND shipping_region is not null
	GROUP BY FullYear, MonthName, shipping_region, MonthNumber) AS tmp