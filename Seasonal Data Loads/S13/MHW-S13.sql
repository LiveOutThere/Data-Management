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
	[status] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_status]  DEFAULT ('Enabled'),
	[tax_class_id] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_tax_class]  DEFAULT ('Taxable Goods'),
	[department] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[visibility] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_visibility]  DEFAULT ('Not Visible Individually'),
	[image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[image_label] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[small_image] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[thumbnail] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_MHWor] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[choose_size] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_sku] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_product_id] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[vendor_MHWor_code] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
	[manufacturer] [nvarchar](4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF_tbl_LoadFile_SS13_MHW_manufacturer]  DEFAULT ('Columbia'),
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
DECLARE c2 CURSOR FOR SELECT TABLE_NAME FROM information_schema.tables WHERE TABLE_NAME LIKE 'tbl_RawData_SS13_MHW_%'
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

SELECT style, ISNULL(name,'') FROM view_RawData_MHW_Features_Fabric AS a
LEFT JOIN tbl_RawData_SS13_COL AS b ON a.Style = b.ID
WHERE b.ID IS NULL