--Start by adding department & style columns to the tables you will be working with:
ALTER TABLE tbl_RawData_SS14_UPC_Price ADD Department nvarchar(255)
ALTER TABLE tbl_RawData_SS14_UPC_Price ADD Style nvarchar(255)
ALTER TABLE tbl_RawData_SS14_Marketing ADD Department nvarchar(255)
ALTER TABLE tbl_RawData_SS14_Marketing ADD Style nvarchar(255)

--Update the Department column using dbo.getMERFOOTDepartment:
UPDATE tbl_RawData_SS14_MERFOOT_UPC_Price SET Department = dbo.getMERFOOTDepartment(Material,Name)
UPDATE tbl_RawData_SS14_MERFOOT_Marketing SET Department = dbo.getMERFOOTDepartment(Material,Name)

--Populate temp table with DISTINCT Name + Department + Style combinations from UPC table:
SELECT DISTINCT Name, Department, (SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,6)) AS Style INTO #MERFOOT_CONFIGS FROM tbl_RawData_SS14_MERFOOT_UPC_Price

--SELECT * FROM #MERFOOT_CONFIGS
						   
--Update the Style column in the UPC table:
UPDATE a SET
	a.Style = b.Style
FROM tbl_RawData_SS14_MERFOOT_UPC_Price AS a
INNER JOIN #MERFOOT_CONFIGS AS b
ON a.Name = b.Name AND a.Department = b.Department

--Update the Style column in the Marketing table to match the values in the UPC table
UPDATE a SET
	a.Style = b.Style
FROM tbl_RawData_SS14_MERFOOT_Marketing AS a 
INNER JOIN tbl_RawData_SS14_MERFOOT_UPC_Price AS b 
ON a.Name = b.Name AND a.Department = b.Department

--DONE!!!