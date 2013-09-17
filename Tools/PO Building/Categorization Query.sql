SELECT DISTINCT b.sku, dbo.getCategory(b.categories,'Patagonia',a.department) 
FROM tbl_LoadFile_FW13_PAT AS a
INNER JOIN tbl_FW13_Final_Categorization AS b
ON a.sku = b.sku
WHERE b.sku IN('PAT-28471')