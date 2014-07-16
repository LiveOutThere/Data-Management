--Start by adding department & style columns to the tables you will be working with:
--ALTER TABLE tbl_RawData_FW14_SAL_UPC_Price ADD Department nvarchar(255)
--ALTER TABLE tbl_RawData_FW14_SAL_UPC_Price ADD Style nvarchar(255)
ALTER TABLE tbl_RawData_FW14_SAL_Marketing ADD Department nvarchar(255)
ALTER TABLE tbl_RawData_FW14_SAL_Marketing ADD Style nvarchar(255)
select * from tbl_RawData_FW14_SAL_UPC_Price
--Update the Department column using dbo.getSALDepartment:
--UPDATE tbl_RawData_FW14_SAL_UPC_Price SET Department = dbo.getSALDepartment(Material,Name)
UPDATE tbl_RawData_FW14_SAL_Marketing SET Gender = dbo.getSALDepartment(Gender)

select Gender from tbl_RawData_FW14_SAL_Marketing
--Populate temp table with DISTINCT Name + Department + Style combinations from UPC table:
SELECT DISTINCT [MODEL NAME], (SELECT SUBSTRING(CONVERT(varchar(40), NEWID()),0,6)) AS Style INTO #SAL_CONFIGS FROM tbl_RawData_FW14_SAL_UPC_Price

--SELECT * FROM #SAL_CONFIGS
						   
--Update the Style column in the UPC table:
UPDATE a SET
	a.[SIZE CODE] = b.Style
FROM tbl_RawData_FW14_SAL_UPC_Price AS a
INNER JOIN #SAL_CONFIGS AS b
ON a.[MODEL NAME]= b.[MODEL NAME] --AND a.Department = b.Department

--Update the Style column in the Marketing table to match the values in the UPC table
UPDATE a SET
	a.Visible = b.[SIZE CODE]--, b.Department = a.Gender
FROM tbl_RawData_FW14_SAL_Marketing AS a 
INNER JOIN tbl_RawData_FW14_SAL_UPC_Price AS b 
ON REPLACE(REPLACE(a.[Model Name],'®',''),' ','') = b.[MODEL NAME]
 
--DONE!!!
