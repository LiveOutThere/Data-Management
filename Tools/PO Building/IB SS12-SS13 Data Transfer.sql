--SELECT * FROM tbl_RawData_SS13_IB_UPC WHERE [Style Description] LIKE '%Halo%'

SELECT '', '', '', 
	   a.Style, 
	   RIGHT(a.StyleColor,3) AS Colour, 
	   SUBSTRING(a.StyleColorSize,10,LEN(a.StyleColorSize)) AS Size,
	   '',
	   a.Description,
	   REVERSE(SUBSTRING(REVERSE(a.Description),0,CHARINDEX(' ',REVERSE(a.Description)))) AS Color_Name,
	   'Women' AS sex,
	   '','',
	   b.Price AS cost,
	   b.Retail AS MSRP
FROM tbl_RawData_S12_IB AS a
LEFT JOIN tbl_RawData_S12_IB_Prices AS b
ON a.StyleColorSize = b.SKU
WHERE a.Description LIKE '%Halo%'

--Style, Colour, Size, Sex, Style Description, Colour Description, Retail, WHSL