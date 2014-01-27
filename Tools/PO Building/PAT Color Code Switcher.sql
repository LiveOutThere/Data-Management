SELECT ItemNumber, Color, Size, CAST(ItemNumber AS varchar(255)) + '-' + CASE WHEN LEN(ColorCode) = 2 THEN '0' + CAST(ColorCode AS varchar(255)) ELSE CAST(ColorCode AS varchar(255)) END + '-' + REPLACE(Size,'ALL','O/S') FROM tbl_RawData_SS14_PAT_UPC
WHERE CAST(ItemNumber AS varchar(255)) + '-' + Color + '-' + Size IN('47956-GLSB-ALL',
'47956-RKL-ALL',
'47956-WIL-ALL',
'48109-BLK-ALL',
'49295-BLK-ALL',
'49295-GLSB-ALL',
'49330-BLK-ALL',
'49330-ETO-ALL')

SELECT * FROM tbl_LoadFile_SS14_PAT WHERE sku LIKE '%27196%'