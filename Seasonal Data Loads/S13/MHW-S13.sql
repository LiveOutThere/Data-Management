USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_SS13_MHW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_SS13_MHW]

CREATE TABLE [dbo].[tbl_LoadFile_SS13_MHW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_visibility]  DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_season]  DEFAULT (N'SS13 ASAP'),
	[short_description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[description] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[features] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[activities] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weather] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[layering] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[care_instructions] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fabric] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[fit] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[volume] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_manufacturer]  DEFAULT ('Mountain Hardwear'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_is_in_stock]  DEFAULT ((0)),
	[simples_skus] [nvarchar](MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[meta_title] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[never_backorder] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_never_backorder]  DEFAULT ((0)),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_manage_stock]  DEFAULT ((1)),
	[use_config_backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_use_config_backorders]  DEFAULT ((1)),
	[use_config_manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_use_config_manage_stock]  DEFAULT ((1))
 CONSTRAINT [PK_tbl_LoadFile_SS13_MHW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_SS13_MHW] ON [dbo].[tbl_LoadFile_SS13_MHW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

INSERT INTO tbl_LoadFile_SS13_MHW (
		sku,
		vendor_product_id,
		[name],
		department,
		choose_color,
		choose_size,
		vendor_color_code,
	    vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		[type],
		image_label,
		url_key
)
SELECT DISTINCT dbo.getMagentoSimpleSKU('SS13A-MHW', LEFT(a.[JDE Style Color],6), a.[PDM Color], dbo.getMHWSize(a.Size,a.Dimension)) AS sku,
		LEFT(a.[JDE Style Color],6) AS vendor_product_id,
		c.Name AS name,
		dbo.getMHWGender(LEFT(a.[JDE Style Color],6)) AS gender,
		a.[PDM Color Description] AS choose_color,
		dbo.getMHWSize(a.Size,a.Dimension) AS choose_size,
		a.[PDM Color] AS vendor_color_code,
		dbo.getMHWSize(a.Size,a.Dimension) AS vendor_size_code,
		a.UPC AS vendor_sku,
		CAST(a.MSRP AS float) - 0.01 AS price,
		a.Wholesale AS cost,
		0 AS has_options,
		'simple' AS type,
		a.[PDM Color Description] AS image_label,
		dbo.getUrlKey(c.Name, 'Mountain Hardwear', a.[PDM Color Description] + ' - ' + dbo.getMHWSize(a.Size,a.Dimension), dbo.getMHWGender(LEFT(a.[JDE Style Color],6))) + '-ss13a' AS url_key
FROM tbl_RawData_SS13_COL_MHW_UPC AS a
LEFT JOIN tbl_RawData_SS13_COL_MHW_Catalog AS b
ON LEFT(a.[Material Number],7) = b.Material AND b.Brand = 'Mountain Hardwear' AND a.[Sub Brand] = 'Mountain Hardwear'
INNER JOIN tbl_RawData_SS13_MHW_PriceList AS c
ON LEFT(a.[Material Number],7) = c.Material WHERE a.[Sub Brand] = 'Mountain Hardwear' AND LEFT(a.[Material Number],7) IN('1265121',
'1265161',
'1273161',
'1273211',
'1281621',
'1314402',
'1314412',
'1314422',
'1314452',
'1314501',
'1314511',
'1314671',
'1314681',
'1314691',
'1332091',
'1333181',
'1367552',
'1374762',
'1374792',
'1375691',
'1380391',
'1380691',
'1380751',
'1381151',
'1381231',
'1381281',
'1381291',
'1398091',
'1403011',
'1424222',
'1426671',
'1437601',
'1437721',
'1438481',
'1438491',
'1438521',
'1438601',
'1438611',
'1438631',
'1438641',
'1438651',
'1438761',
'1438791',
'1438811',
'1438821',
'1442411',
'1444891',
'1444901',
'1444951',
'1445011',
'1445071',
'1445081',
'1445091',
'1445101',
'1445111',
'1445241',
'1445381',
'1445401',
'1445971',
'1446001',
'1446081',
'1446091',
'1446181',
'1446851',
'1446871',
'1449481',
'1449491',
'1449501',
'1449531',
'1449541',
'1449701',
'1449761',
'1449771',
'1450401',
'1450471',
'1450631',
'1450641',
'1450871',
'1450881',
'1454261',
'1454271',
'1454311',
'1454321',
'1454331',
'1454341',
'1454351',
'1454361',
'1454371',
'1454381',
'1455531',
'1457941',
'1459041',
'1459271',
'1459281',
'1459761',
'1460251',
'1461501',
'1461511',
'1461551',
'1461561',
'1466961',
'1467021',
'1467041',
'1476941',
'1486521',
'1486541',
'1486551',
'1486591',
'1486601',
'1486611',
'1486621',
'1486641',
'1486651',
'1486701',
'1486721',
'1486741',
'1488391',
'1488401',
'1488411',
'1488421',
'1488431',
'1488441',
'1488461',
'1488471',
'1488511',
'1488521',
'1488551',
'1488571',
'1488581',
'1488671',
'1488701',
'1488711',
'1488721',
'1488731',
'1488741',
'1488751',
'1488761',
'1488771',
'1488781',
'1488791',
'1488801',
'1488811',
'1488831',
'1488841',
'1488861',
'1488871',
'1488881',
'1488911',
'1488921',
'1488931',
'1488941',
'1488951',
'1488961',
'1488971',
'1489001',
'1489011',
'1489021',
'1489031',
'1489041',
'1489051',
'1489061',
'1489071',
'1489081',
'1489101',
'1489111',
'1489121',
'1489131',
'1489141',
'1489161',
'1489171',
'1489181',
'1489191',
'1489201',
'1489211',
'1489221',
'1489231',
'1489241',
'1489251',
'1489261',
'1489271',
'1489281',
'1489321',
'1489361',
'1489371',
'1489381',
'1489391',
'1489401',
'1489411',
'1489421',
'1489431',
'1491121',
'1491141',
'1491151',
'1491161',
'1491181',
'1491201',
'1491581',
'1491821',
'1491841',
'1491851',
'1491861',
'1491931',
'1491941',
'1491981',
'1492031',
'1492041',
'1492051',
'1492081',
'1492091',
'1492101',
'1492111',
'1492821',
'1495171',
'1495211',
'1496431',
'1496451',
'1496461',
'1496521',
'1496531',
'1496571',
'1497561',
'1497571',
'1497641',
'1497642',
'1497651',
'1497652',
'1497661',
'1497662',
'1497671',
'1497672',
'1497701',
'1497702',
'1497711',
'1497712',
'1497721',
'1497722',
'1497761',
'1497762',
'1497771',
'1497772',
'1497801',
'1497802',
'1497811',
'1497812',
'1497821',
'1497822',
'1497823',
'1497831',
'1497832',
'1497841',
'1497842',
'1497851',
'1497852',
'1497871',
'1497872',
'1498141',
'1498151',
'1498161',
'1498171',
'1498811',
'1499761',
'1501541',
'1501601',
'1501611',
'1501901',
'1501911',
'1501921',
'1501971',
'1501991',
'1502001',
'1502021',
'1502361',
'1502421',
'1502691',
'1502701',
'1502821',
'1502822',
'1502841',
'1507581',
'1507751',
'1507761',
'1507831',
'1509581',
'1509591',
'1509621',
'1511021',
'1511041',
'1517591',
'1517592',
'1517771',
'1519681',
'1522091',
'1522092',
'1522093',
'1522094',
'1522101',
'1522102',
'1522201',
'1522202',
'1522301',
'1522302',
'1522341',
'1522351',
'1522352',
'1522371',
'1525851',
'1525951',
'1525961',
'1525971')

UPDATE a 
SET a.image = b.Filename
FROM tbl_LoadFile_SS13_MHW AS a
INNER JOIN tbl_RawData_SS13_Image_Filenames AS b
ON b.Filename LIKE vendor_product_id + '[_]' + vendor_color_code + '[_]f.jpg' AND b.Brand = 'MHW'
WHERE a.type = 'simple'

INSERT INTO tbl_LoadFile_SS13_MHW (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	department,
	price,
	cost,
	has_options,
	type,
	url_key,
	meta_title,
	visibility,
	merchandise_priority,
	manage_stock,
	use_config_manage_stock
)
SELECT DISTINCT
	   dbo.getMagentoConfigurableSKU('SS13A-MHW', a.vendor_product_id) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		a.vendor_product_id AS vendor_product_id,
		'Uncategorized' AS categories,
		a.name AS name,
		a.department AS gender,
		(SELECT MAX(price) FROM tbl_LoadFile_SS13_MHW WHERE vendor_product_id = a.vendor_product_id) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_SS13_MHW WHERE vendor_product_id = a.vendor_product_id) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(a.name, 'Mountain Hardwear', '',a.department) + '-ss13a' AS url_key,
		'Mountain Hardwear ' + a.name + CASE WHEN a.department = 'Men' THEN ' - Men''s' WHEN a.department = 'Women' THEN ' - Women''s' WHEN a.department = 'Men|Women' THEN ' - Unisex' WHEN a.department = 'Boy' THEN ' - Boy''s' WHEN a.department = 'Girl' THEN ' - Girl''s' WHEN a.department = 'Boy|Girl' THEN ' - Kids''' END AS meta_title,
		'Catalog, Search' AS visibility,
		'Z' AS merchandise_priority,
		0 AS manage_stock,
		0 AS use_config_manage_stock
FROM tbl_LoadFile_SS13_MHW AS a

UPDATE a SET
	categories = CASE WHEN (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id) IS NULL THEN 'Uncategorized' ELSE (SELECT TOP 1 REPLACE(categories,'"','') FROM LOT_Reporting.dbo.tbl_Categories WHERE vendor_product_id = a.vendor_product_id) END,
	description = (SELECT TOP 1 REPLACE(REPLACE([Long Description],CHAR(13),''),CHAR(10),'') FROM tbl_RawData_SS13_COL_MHW_Catalog WHERE Style = a.vendor_product_id),
	features = (SELECT TOP 1 Features FROM view_RawData_MHW_Features_Fabric WHERE Style = a.vendor_product_id),
	fabric = (SELECT TOP 1 Fabric FROM view_RawData_MHW_Features_Fabric WHERE Style = a.vendor_product_id),
	simples_skus = dbo.getMHWAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_SS13_MHW AS a
WHERE type = 'configurable'
GO

/*
-- Drop some objects if they exist so we can just press the Execute button and not get errors
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[sproc_temp_Add_Feature_Fabric_Columns]'))
DROP PROCEDURE sproc_temp_Add_Feature_Fabric_Columns
GO

IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[view_RawData_MHW_Features_Fabric]'))
DROP VIEW view_RawData_MHW_Features_Fabric
GO

-- This procedure builds and executes a long SQL program. The @table_name input is one of Mountain Hardwear's feature/spec tables (there were five separate tables in 2013)
CREATE PROCEDURE sproc_temp_Add_Feature_Fabric_Columns (@table_name varchar(255)) AS
BEGIN
	DECLARE @sql varchar(max)
	SET @sql = '
	DECLARE @detail_column varchar(255), @column_name varchar(255), @productid varchar(255), @content varchar(1024), @sql varchar(max)
	
	IF NOT EXISTS (
		SELECT COLUMN_NAME FROM OPENROWSET (''SQLOLEDB'',''Server=(local);TRUSTED_CONNECTION=YES;'',''set fmtonly off exec LOT_Inventory.dbo.sp_Columns ''''' + @table_name + ''''''') WHERE COLUMN_NAME = ''Features'' OR COLUMN_NAME = ''Fabric''
	)
	BEGIN
		ALTER TABLE [dbo].' + @table_name + ' ADD Features nvarchar(max) NULL
		ALTER TABLE [dbo].' + @table_name + ' ADD Fabric nvarchar(max) NULL
	END

	UPDATE ' + @table_name + ' SET Features = '''', Fabric = ''''

	DECLARE c CURSOR FOR SELECT DISTINCT jdeStyleID FROM ' + @table_name + ' WHERE Language = ''ENG''
	OPEN c

	FETCH NEXT FROM c INTO @productid
	WHILE @@FETCH_STATUS = 0 BEGIN

		DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET (''SQLOLEDB'',''Server=(local);TRUSTED_CONNECTION=YES;'',''set fmtonly off exec LOT_Inventory.dbo.sp_Columns ''''' + @table_name + ''''''') AS tbl
		OPEN c1

		FETCH NEXT FROM c1 INTO @column_name
		WHILE @@FETCH_STATUS = 0 BEGIN
			
			IF (@column_name LIKE ''Feature %'' AND @column_name <> ''Features'') BEGIN
				SET @sql = ''UPDATE ' + @table_name + ' SET Features = Features + ISNULL('''''' + REPLACE(@column_name,''Feature '','''') + '': '''' + ['' + @column_name + ''],'''''''') + ''''|'''' WHERE jdeStyleID = '''''' + @productid + '''''' AND ['' + @column_name + ''] <> ''''''''''
				EXEC(@sql)
			END
			ELSE IF (@column_name LIKE ''Feature%'' AND @column_name <> ''Features'') BEGIN
				SET @sql = ''UPDATE ' + @table_name + ' SET Features = Features + ISNULL(['' + @column_name + ''],'''''''') + ''''|'''' WHERE jdeStyleID = '''''' + @productid + '''''' AND ['' + @column_name + ''] <> ''''''''''
				EXEC(@sql)
			END
			
			IF (@column_name LIKE ''Fabric%'' AND @column_name <> ''Fabric'') BEGIN
				SET @detail_column = REPLACE(@column_name,''Fabric'',''Detail'')
				SET @sql = ''UPDATE ' + @table_name + ' SET Fabric = Fabric + ISNULL('''''' + REPLACE(@column_name,''Fabric '','''') + '': '''' + ['' + @column_name + ''],'''''''') + CASE WHEN ['' + @detail_column + ''] <> '''''''' THEN ''''; '''' + ['' + @detail_column + ''] ELSE '''''''' END + ''''|'''' WHERE jdeStyleID = '''''' + @productid + '''''' AND ['' + @column_name + ''] <> ''''''''''
				EXEC(@sql)
			END

			FETCH NEXT FROM c1 INTO @column_name
		END

		CLOSE c1
		DEALLOCATE c1

		UPDATE ' + @table_name + ' SET Features = REPLACE(REPLACE(dbo.toHTMLEntities(Features), ''Weight: no weight assigned; no weight assigned|'', ''''),''Avg Weight: no weight assigned; no weight assigned|'',''''), Fabric = dbo.toHTMLEntities(Fabric) WHERE jdeStyleID = @productid

		FETCH NEXT FROM c INTO @productid
	END

	CLOSE c
	DEALLOCATE c
	'
	-- To see what's really going on here, add a PRINT @sql and examine it in the messages window. You'll see that there is dynamic SQL within the dynamically generated SQL. As convoluted as this seems, it is necessary because OPENROWSET and DECLARE CURSOR don't accept strings for their query parameter, so we have to cheat.
	EXEC(@sql)
END
GO

DECLARE @table_name varchar(255), @view_definition varchar(max)

-- We are going to dynamically generate a single view for all the specs and features
SET @view_definition = 'CREATE VIEW view_RawData_MHW_Features_Fabric AS '

-- Loop through each of the Mountain Hardwear feature/spec tables
DECLARE c2 CURSOR FOR SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_NAME LIKE 'tbl_RawData_SS13_MHW_%' AND TABLE_NAME NOT LIKE '%PriceList%' AND TABLE_NAME NOT LIKE '%COL_UPC%'
OPEN C2

FETCH NEXT FROM c2 INTO @table_name
WHILE @@FETCH_STATUS = 0 BEGIN

	-- And execute the SQL stored procedure above which will concatenate all of the fields into the new Features and Fabric columns. It adds every column starting with Feature to the Features column and every column starting with Fabric to the Fabric column.
	EXEC sproc_temp_Add_Feature_Fabric_Columns @table_name
	-- Add on to our view definition
	SET @view_definition = @view_definition + ' SELECT jdeStyleId AS Style, Name, Features, Fabric FROM ' + @table_name + ' WHERE Language = ''ENG'' UNION ALL '

	FETCH NEXT FROM c2 INTO @table_name
END

CLOSE c2
DEALLOCATE c2

SET @view_definition = LEFT(@view_definition, LEN(@view_definition) - LEN(' UNION ALL '))
-- Create the view
EXEC(@view_definition)
GO

SELECT style, ISNULL(name,'') 
FROM view_RawData_MHW_Features_Fabric AS a
LEFT JOIN tbl_RawData_SS13_COL_MHW_UPC AS b 
ON a.Style = LEFT(b.[JDE Style Color],6)
WHERE LEFT(b.[JDE Style Color],6) IS NULL
GO */

UPDATE tbl_LoadFile_SS13_MHW SET categories = dbo.getCategory(categories,manufacturer,department) WHERE type = 'configurable'
UPDATE tbl_LoadFile_SS13_MHW SET categories = NULL WHERE type = 'simple'
UPDATE tbl_LoadFile_SS13_MHW SET status = 'Disabled' WHERE image IS NULL AND type = 'simple'
UPDATE tbl_LoadFile_SS13_MHW SET thumbnail = image, small_image = image
GO

CREATE VIEW [dbo].[view_LoadFile_SS13_MHW]
AS
SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail,
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season_id"' AS season_id, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"videos"' AS videos, '"weight"' AS weight, '"merchandise_priority"' AS merchandise_priority, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock, '"never_backorder"' AS never_backorder, '"use_config_manage_stock"' AS use_config_manage_stock, '"use_config_backorders"' AS use_config_backorders, '"meta_title"' AS meta_title
UNION ALL
SELECT  '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.categories,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a. short_description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.meta_title,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_SS13_MHW AS a
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_SS13_MHW" queryout "C:\Data\Shared\SS13MHW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

DROP VIEW view_LoadFile_SS13_MHW