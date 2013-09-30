USE LOT_Inventory
GO

--SELECT * FROM tbl_RawData_FW13_SOR_UPC_Marketing WHERE LEFT(Material_Number,7) = '1308911'

SELECT DISTINCT a.vendor_product_id + '-' + a.vendor_color_code AS match, LEFT(b.Material_Number,7) AS style, a.choose_color FROM tbl_LoadFile_FW13_SOR AS a
INNER JOIN tbl_RawData_FW13_SOR_UPC_Marketing AS b
ON a.vendor_sku = b.UPC
WHERE LEFT(b.Material_Number,7) + '-' + a.choose_color IN('1424351-Black/Dark Brown',
'1424351-Chipmunk, Black',
'1002871-Buff',
'1002871-Black/ Tusk',
'1351071-Tobacco',
'1351071-Black',
'1524411-Elk',
'1517851-Cinnamon',
'1517851-Black',
'1472591-Black',
'1308891-Black',
'1308891-Tobacco, Sudan Brown',
'1308911-Black/ Stone')