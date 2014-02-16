SELECT DISTINCT [Long Description], LEFT(Material,6) + '_' + ColorCode, ID, ColorCode FROM tbl_RawData_SS14_MHW_UPC_Marketing
WHERE LEFT(Material,6) + '-' + ColorCode IN('154193-010',
'149814-345',
'149814-338',
'149816-360',
'149816-417',
'149816-634',
'154042-010',
'154042-017',
'154617-010')
AND ID IS NOT NULL
ORDER BY ID