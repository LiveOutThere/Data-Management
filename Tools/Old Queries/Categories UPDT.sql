/*Categorization Update*/

--First check all of the distinct categories values in the table:

SELECT DISTINCT categories FROM tbl_LoadFile_FW13_COL WHERE type = 'configurable'

--Make sure that any existing values (other than 'Uncategorized') are formatted correctly, then run this update: 

UPDATE a SET
	a.categories = dbo.getCategory(b.categories,'Columbia',a.department)
FROM tbl_LoadFile_FW13_COL AS a
INNER JOIN tbl_FW13_Final_Categorization AS b
ON a.sku = b.sku
WHERE a.type = 'configurable' AND a.categories = 'Uncategorized'