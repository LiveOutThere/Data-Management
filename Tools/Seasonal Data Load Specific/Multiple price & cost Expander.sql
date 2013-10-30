SELECT DISTINCT a.name, a.department, a.vendor_product_id, a.price, a.cost INTO #reference 
FROM (
	SELECT DISTINCT name, department, MAX(vendor_product_id) AS vendor_product_id, MAX(price) AS price, MAX(cost) AS cost
	FROM tbl_LoadFile_FW13_TNF
	WHERE type = 'simple'
	GROUP BY name, department, price, cost
	HAVING (COUNT(price) + COUNT(cost)) > 2
	UNION ALL
	SELECT DISTINCT name, department, MIN(vendor_product_id) AS vendor_product_id, MIN(price) AS price, MIN(cost) AS cost
	FROM tbl_LoadFile_FW13_TNF
	WHERE type = 'simple'
	GROUP BY name, department, price, cost
	HAVING (COUNT(price) + COUNT(cost)) > 2) AS a

SELECT b.name, b.department INTO #duplicates
FROM (
	SELECT name, department 
	FROM #reference
	GROUP BY name, department
	HAVING COUNT(department) > 1) AS b
	
SELECT a.*
FROM #reference AS a
INNER JOIN #duplicates AS b
ON a.name = b.name AND a.department = b.department
INNER JOIN tbl_RawData_FW13_TNF_UPC AS c
ON a.vendor_product_id = c.Style AND a.price = c.MSRP 

DROP TABLE #reference
DROP TABLE #duplicates