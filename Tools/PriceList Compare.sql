SELECT a.*, b.Material 
FROM tbl_RawData_SS13_MHW_PriceList AS a
LEFT JOIN tbl_RawData_SS13_COL AS b
ON a.Material = CAST(LEFT(CAST(CAST(b.Material AS bigint) AS varchar(255)),7) AS float)
WHERE b.Material IS NULL