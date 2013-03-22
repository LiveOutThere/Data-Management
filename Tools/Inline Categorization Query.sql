SELECT DISTINCT sku, dbo.getCategoryFromSS13Categorization(sku) FROM tbl_SS13_Categorization
WHERE SKU IN('SS13A-MAR-16410')