USE [LOT_Inventory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
 
IF EXISTS (SELECT * FROM sysobjects WHERE id = object_id(N'[dbo].[tbl_LoadFile_F12_MHW]')
AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[tbl_LoadFile_F12_MHW]

CREATE TABLE [dbo].[tbl_LoadFile_F12_MHW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[store] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_store]  DEFAULT ('admin'),
	[websites] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_websites]  DEFAULT ('base'),
	[type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[sku] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[name] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[categories] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[attribute_set] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_attribute_set]  DEFAULT ('default'),
	[configurable_attributes] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[has_options] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[price] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cost] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_tax_class]  DEFAULT ('Taxable Goods'),
	[gender] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_visibility]  DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[media_gallery] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_color] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_color_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_size_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[season] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_season]  DEFAULT (N'FW12'),
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_manufacturer]  DEFAULT ('Mountain Hardwear'),
	[qty] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_qty]  DEFAULT ((0)),
	[is_in_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_is_in_stock]  DEFAULT ((1)),
	[simples_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[url_key] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[super_attribute_pricing] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[videos] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[hs_tariff] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[origin] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[weight] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[us_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[cs_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[xre_skus] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[merchandise_priority] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_merchandise_priority]  DEFAULT (('Z')),
	[backorders] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_F12_MHW_backorders]  DEFAULT ((0)),
	[manage_stock] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
 CONSTRAINT [PK_tbl_LoadFile_F12_MHW] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_tbl_LoadFile_F12_MHW] ON [dbo].[tbl_LoadFile_F12_MHW] 
(
	[sku] ASC,
	[type] ASC,
	[vendor_product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'view_RawData_MHW_Photos')
DROP VIEW [dbo].[view_RawData_MHW_Photos]
GO

CREATE VIEW [dbo].[view_RawData_MHW_Photos] AS
	SELECT DISTINCT filename, pos FROM (
		SELECT filename, 0 AS pos FROM tbl_RawData_F12_MHW_Photos
		UNION ALL
		SELECT Filename, 1 AS pos FROM tbl_RawData_S12_MHW_Photos
		UNION ALL
		SELECT filename, 2 AS pos FROM tbl_RawData_F11_MHW_Photos
		UNION ALL
		SELECT filename, 3 AS pos FROM tbl_RawData_S11_MHW_Photos
	) AS tmp
GO

INSERT INTO tbl_LoadFile_F12_MHW (
		sku,
		vendor_product_id,
		[name],
		gender,
		choose_color,
		choose_size,
		vendor_color_code,
		vendor_size_code,
		vendor_sku,
		price,
		cost,
		has_options,
		[type],
		[image],
		image_label,
		url_key,
		is_in_stock,
		manage_stock,
		merchandise_priority
)
SELECT  dbo.getMagentoSimpleSKU('FW12-MHW', a.jdeStyleID, RIGHT(a.REI,3), LTRIM(RTRIM(a.jdeSizeID)) + CASE WHEN a.jdeDimensionId IS NOT NULL AND a.jdeDimensionId <> '' THEN '-' + a.jdeDimensionId ELSE '' END) AS sku,
		LTRIM(RTRIM(a.jdeStyleID)) AS vendor_product_id,
		dbo.getMHWName(a.name) AS name,
		CASE WHEN RIGHT(RTRIM(a.name),3) = '- W' THEN 'Women' WHEN RIGHT(RTRIM(a.name),3) = '- M' THEN 'Men' ELSE 'Men|Women' END AS gender,
		LTRIM(RTRIM(a.color)) AS choose_color,
		LTRIM(RTRIM(a.jdeSizeID)) + CASE WHEN a.jdeDimensionId IS NOT NULL AND a.jdeDimensionId <> '' THEN '-' + a.jdeDimensionId ELSE '' END AS choose_size,
		RIGHT(a.REI,3) AS vendor_color_code,
		LTRIM(RTRIM(a.jdeSizeID)) + CASE WHEN a.jdeDimensionId IS NOT NULL AND a.jdeDimensionId <> '' THEN '-' + a.jdeDimensionId ELSE '' END AS vendor_size_code,
		CAST(a.UPC AS bigint) AS vendor_sku,
		b.price - 0.01 AS price,
		b.cost AS cost,
		0 AS has_options,
		'simple' AS type,
		(SELECT TOP 1 Filename FROM [view_RawData_MHW_Photos] WHERE Filename LIKE '%' + a.jdeStyleId + '[_]' + a.jdeColorID + '%' AND Filename NOT LIKE '%' + a.jdeStyleId + '[_]' + a.jdeColorID + '[_]b%' ORDER BY pos) AS image,
		LTRIM(RTRIM(a.color)) AS image_label,
		dbo.getUrlKey(dbo.getMHWName(a.name), 'Mountain Hardwear', LTRIM(RTRIM(a.color)) + ' - ' + LTRIM(RTRIM(a.jdeSizeID)) + CASE WHEN a.jdeDimensionId IS NOT NULL AND a.jdeDimensionId <> '' THEN '-' + a.jdeDimensionId ELSE '' END) + '-fw12' AS url_key,
		0 AS is_in_stock,
		1 AS manage_stock,
		'' AS merchandise_priority
FROM tbl_RawData_F12_MHW AS a
INNER JOIN tbl_RawData_F12_MHW_Prices AS b ON a.jdeStyleID = b.style
ORDER BY image

--DELETE FROM tbl_LoadFile_F12_MHW WHERE image IS NULL

INSERT INTO tbl_LoadFile_F12_MHW (
	sku,
	configurable_attributes,
	vendor_product_id,
	categories,
	name,
	gender,
	price,
	cost,
	has_options,
	type,
	url_key,
	visibility,
	is_in_stock,
	manage_stock
)
SELECT DISTINCT
	   dbo.getMagentoConfigurableSKU('FW12-MHW', a.vendor_product_id) AS sku,
		'choose_color,choose_size' AS configurable_attributes,
		vendor_product_id,
		'Uncategorized',
		name,
		gender,
		(SELECT MAX(price) FROM tbl_LoadFile_F12_MHW WHERE vendor_product_id = a.vendor_product_id) AS price,
		(SELECT MAX(cost) FROM tbl_LoadFile_F12_MHW WHERE vendor_product_id = a.vendor_product_id) AS cost,
		'1' AS has_options,
		'configurable' AS type,
		dbo.getUrlKey(name, 'Mountain Hardwear', '') + '-fw12' AS url_key,
		'Catalog, Search' AS visibility,
		1 AS is_in_stock,
		0 AS manage_stock
FROM tbl_LoadFile_F12_MHW AS a

UPDATE a SET
	-- these columns have to be updated prior to updating media_gallery below
	image = (SELECT TOP 1 image FROM tbl_LoadFile_F12_MHW WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC),
	image_label = (SELECT TOP 1 image_label FROM tbl_LoadFile_F12_MHW WHERE vendor_product_id = a.vendor_product_id ORDER BY choose_color DESC)
FROM tbl_LoadFile_F12_MHW AS a
WHERE type = 'configurable'

UPDATE a SET
	media_gallery = dbo.getMHWMediaGallery(a.vendor_product_id),
	simples_skus = dbo.getMHWAssociatedProducts(a.vendor_product_id)
FROM tbl_LoadFile_F12_MHW AS a
WHERE type = 'configurable'

IF NOT EXISTS (SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Backpacks''')
			   WHERE COLUMN_NAME = 'Features' OR COLUMN_NAME = 'Fabric') BEGIN
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Backpacks] ADD Features nvarchar(max) NULL
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Backpacks] ADD Fabric nvarchar(max) NULL
END

UPDATE tbl_RawData_F12_MHW_Backpacks SET Features = '', Fabric = ''

DECLARE @detail_column varchar(255), @column_name varchar(255), @productid varchar(255), @content varchar(1024)
DECLARE c CURSOR FOR SELECT DISTINCT jdeStyleID FROM tbl_RawData_F12_MHW_Backpacks
OPEN c

FETCH NEXT FROM c INTO @productid
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Backpacks''') AS tbl
	OPEN c1

	FETCH NEXT FROM c1 INTO @column_name
	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF (@column_name LIKE 'Feature%' AND @column_name <> 'Features') BEGIN
			EXEC ('UPDATE tbl_RawData_F12_MHW_Backpacks SET Features = Features + ISNULL([' + @column_name + '],'''') + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		IF (@column_name LIKE 'Fabric%' AND @column_name <> 'Fabric') BEGIN
			SET @detail_column = REPLACE(@column_name,'Fabric','Detail')
			EXEC ('UPDATE tbl_RawData_F12_MHW_Backpacks SET Fabric = Fabric + ISNULL([' + @column_name + '],'''') + CASE WHEN [' + @detail_column + '] <> '''' THEN '': '' + [' + @detail_column + '] ELSE '''' END + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END

		FETCH NEXT FROM c1 INTO @column_name
	END

	CLOSE c1
	DEALLOCATE c1

	UPDATE tbl_RawData_F12_MHW_Backpacks SET Features = dbo.toHTMLEntities(Features), Fabric = dbo.toHTMLEntities(Fabric) WHERE jdeStyleID = @productid

	FETCH NEXT FROM c INTO @productid
END

CLOSE c
DEALLOCATE c

IF NOT EXISTS (SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Apparel''')
			   WHERE COLUMN_NAME = 'Features' OR COLUMN_NAME = 'Fabric') BEGIN
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Apparel] ADD Features nvarchar(max) NULL
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Apparel] ADD Fabric nvarchar(max) NULL
END

UPDATE tbl_RawData_F12_MHW_Apparel SET Features = '', Fabric = ''

DECLARE c CURSOR FOR SELECT DISTINCT jdeStyleID FROM tbl_RawData_F12_MHW_Apparel
OPEN c

FETCH NEXT FROM c INTO @productid
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Apparel''') AS tbl
	OPEN c1

	FETCH NEXT FROM c1 INTO @column_name
	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF (@column_name LIKE 'Feature%' AND @column_name <> 'Features') BEGIN
			EXEC ('UPDATE tbl_RawData_F12_MHW_Apparel SET Features = Features + ISNULL([' + @column_name + '],'''') + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		IF (@column_name LIKE 'Fabric%' AND @column_name <> 'Fabric') BEGIN
			SET @detail_column = REPLACE(@column_name,'Fabric','Detail')
			EXEC ('UPDATE tbl_RawData_F12_MHW_Apparel SET Fabric = Fabric + ISNULL([' + @column_name + '],'''') + CASE WHEN [' + @detail_column + '] <> '''' THEN '': '' + [' + @detail_column + '] ELSE '''' END + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END

		FETCH NEXT FROM c1 INTO @column_name
	END

	CLOSE c1
	DEALLOCATE c1

	UPDATE tbl_RawData_F12_MHW_Apparel SET Features = dbo.toHTMLEntities(Features), Fabric = dbo.toHTMLEntities(Fabric) WHERE jdeStyleID = @productid

	FETCH NEXT FROM c INTO @productid
END

CLOSE c
DEALLOCATE c

IF NOT EXISTS (SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Accessory''')
			   WHERE COLUMN_NAME = 'Features' OR COLUMN_NAME = 'Fabric') BEGIN
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Accessory] ADD Features nvarchar(max) NULL
	ALTER TABLE [dbo].[tbl_RawData_F12_MHW_Accessory] ADD Fabric nvarchar(max) NULL
END

UPDATE tbl_RawData_F12_MHW_Accessory SET Features = '', Fabric = ''

DECLARE c CURSOR FOR SELECT DISTINCT jdeStyleID FROM tbl_RawData_F12_MHW_Accessory
OPEN c

FETCH NEXT FROM c INTO @productid
WHILE @@FETCH_STATUS = 0 BEGIN

	DECLARE c1 CURSOR FOR SELECT COLUMN_NAME FROM OPENROWSET ('SQLOLEDB','Server=(local);TRUSTED_CONNECTION=YES;','set fmtonly off exec LOT_Inventory.dbo.sp_columns ''tbl_RawData_F12_MHW_Accessory''') AS tbl
	OPEN c1

	FETCH NEXT FROM c1 INTO @column_name
	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF (@column_name LIKE 'Feature%' AND @column_name <> 'Features') BEGIN
			EXEC ('UPDATE tbl_RawData_F12_MHW_Accessory SET Features = Features + ISNULL([' + @column_name + '],'''') + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END
		
		IF (@column_name LIKE 'Fabric%' AND @column_name <> 'Fabric') BEGIN
			SET @detail_column = REPLACE(@column_name,'Fabric','Detail')
			EXEC ('UPDATE tbl_RawData_F12_MHW_Accessory SET Fabric = Fabric + ISNULL([' + @column_name + '],'''') + CASE WHEN [' + @detail_column + '] <> '''' THEN '': '' + [' + @detail_column + '] ELSE '''' END + ''|'' WHERE jdeStyleID = ''' + @productid + ''' AND [' + @column_name + '] <> ''''')
		END

		FETCH NEXT FROM c1 INTO @column_name
	END

	CLOSE c1
	DEALLOCATE c1

	UPDATE tbl_RawData_F12_MHW_Accessory SET Features = dbo.toHTMLEntities(Features), Fabric = dbo.toHTMLEntities(Fabric) WHERE jdeStyleID = @productid

	FETCH NEXT FROM c INTO @productid
END

CLOSE c
DEALLOCATE c

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_NAME = 'view_MHW_F12_Copy')
DROP VIEW [dbo].[view_MHW_F12_Copy]
GO

CREATE VIEW view_MHW_F12_Copy AS
	SELECT jdeStyleId AS Style, description, positioning, Features, Fabric FROM tbl_RawData_F12_MHW_Backpacks
	UNION ALL
	SELECT jdeStyleId, description, usage, Features, Fabric FROM tbl_RawData_F12_MHW_Apparel
	UNION ALL
	SELECT jdeStyleId, description, usage, Features, Fabric FROM tbl_RawData_F12_MHW_Accessory
GO

UPDATE a SET
	description = (SELECT TOP 1 description FROM view_MHW_F12_Copy WHERE Style = a.vendor_product_id),
	short_description = (SELECT TOP 1 positioning FROM view_MHW_F12_Copy WHERE Style = a.vendor_product_id),
	features = (SELECT TOP 1 Features FROM view_MHW_F12_Copy WHERE Style = a.vendor_product_id),
	fabric = (SELECT TOP 1 Fabric FROM view_MHW_F12_Copy WHERE Style = a.vendor_product_id)
FROM tbl_LoadFile_F12_MHW AS a
WHERE type = 'configurable'

-- prepend plus signs to tell Magmi to include all images in the media gallery
UPDATE tbl_LoadFile_F12_MHW SET thumbnail = '+' + image, small_image = '+' + image WHERE image IS NOT NULL
UPDATE tbl_LoadFile_F12_MHW SET image = '+' + image WHERE image IS NOT NULL
GO

CREATE VIEW [dbo].[view_LoadFile_F12_MHW]
AS
SELECT  '"magmi:delete"' AS magmi, '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"attribute_set"' AS attribute_set, 
        '"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
        '"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail, '"media_gallery"' AS media_gallery, 
        '"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_sku"' AS vendor_sku, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
        '"vendor_size_code"' AS vendor_size_code, '"season"' AS season, '"short_description"' AS short_description, '"description"' AS description, '"features"' AS features, '"activities"' AS activities, '"weather"' AS weather, '"layering"' AS layering, '"care_instructions"' AS care_instructions,
        '"fabric"' AS fabric, '"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key,
        '"super_attribute_pricing"' AS super_attribute_pricing, '"videos"' AS videos, '"hs_tariff_id"' AS hs_tariff_id, '"origin"' AS origin, '"weight"' AS weight, '"us_skus"' AS us_skus, '"cs_skus"' AS cs_skus, '"xre_skus"' AS xre_skus, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock
UNION ALL
SELECT  '0', '"' + RTRIM(LTRIM(REPLACE(a.store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.attribute_set,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.configurable_attributes,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.gender,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.image_label,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.media_gallery,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_product_id,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.vendor_size_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.season,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.short_description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.description,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(a.features,'"','""'),CHAR(13),''),CHAR(10),''))) + '"','"' + RTRIM(LTRIM(REPLACE(a.activities,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weather,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.layering,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.care_instructions,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.fabric,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.qty,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.is_in_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.url_key,'"','""'))) + '"',
		'"' + RTRIM(LTRIM(REPLACE(a.super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.videos,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.hs_tariff,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.origin,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.weight,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.us_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.cs_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.xre_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(a.manage_stock,'"','""'))) + '"'
FROM dbo.tbl_LoadFile_F12_MHW AS a WHERE a.image IS NOT NULL
GO

DECLARE @sql varchar(1024)
SELECT @sql = 'bcp "SELECT * FROM LOT_Inventory.dbo.view_LoadFile_F12_MHW" queryout "C:\Data\Shared\MHW.csv" -w -t , -T -S ' + @@servername
EXEC master..xp_cmdshell @sql

--Remember to open the CSV up in TextMate and save with UTF-8 encoding and LF line breaks!

DROP VIEW view_LoadFile_F12_MHW