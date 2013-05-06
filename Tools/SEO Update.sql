--first perform a correlated update to replace the loadfile data with the new SEO data

UPDATE a SET
	url_key = ISNULL((SELECT url_key FROM tbl_SEO_Staging WHERE sku = a.sku),a.url_key),
	meta_description = ISNULL((SELECT meta_description FROM tbl_SEO_Staging WHERE sku = a.sku),a.meta_description),
	description = ISNULL((SELECT description FROM tbl_SEO_Staging WHERE sku = a.sku),a.description),
	videos = ISNULL((SELECT videos FROM tbl_SEO_Staging WHERE sku = a.sku),a.videos)
FROM tbl_LoadFile_SS13_ARC AS a
WHERE a.type = 'configurable'
GO

--next, export the new data to .csv, stripping line breaks

CREATE VIEW [dbo].[view_ARC_SEO_Update]
AS
SELECT  '"sku"' AS sku, '"meta_description"' AS meta_description, '"description"' AS description, '"videos"' AS videos
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a. meta_description,'"','""'),CHAR(10),''),CHAR(13),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(10),''),CHAR(13),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_SS13_ARC AS a
INNER JOIN tbl_SEO_Staging AS b
ON a.sku = b.sku
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_ARC_SEO_Update" queryout "C:\Data\Shared\SS13ARCSEOUPDT.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_ARC_SEO_Update

--lastly, pump resulting .csv through MAGMI. Done!