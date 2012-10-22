SET NOCOUNT ON
GO

-- Define some helper functions that make our code less messy and more readable. This is the DRY methodology, which stands for Don't Repeat Yourself!
ALTER FUNCTION dbo.prepareColumnForCsv (
	@value nvarchar(MAX)
)
RETURNS nvarchar(MAX)
BEGIN
	RETURN '"' + RTRIM(LTRIM(REPLACE(REPLACE(REPLACE(@value,'"','""'),CHAR(13),''),CHAR(10),''))) + '"'
END
GO

ALTER FUNCTION dbo.unprepareColumnForCsv (
	@value nvarchar(MAX)
)
RETURNS nvarchar(MAX)
BEGIN
	RETURN REPLACE(@value,'"','')
END
GO


-- This checks to see if we've already defined the custom type you see below. If we have, we need to get rid of it
IF EXISTS (SELECT name FROM sys.table_types WHERE name = 'MissingSkuTableType') BEGIN
	-- Here is your introduction to Try/Catch error handling. In some cases the code within the BEGIN TRY / END TRY block below will throw an error. If it does,
	-- the interpreter jumps right to the BEGIN CATCH / END CATCH block and tries to run the code there instead of failing.
	BEGIN TRY
		DROP TYPE MissingSkuTableType
		-- If we get the error "Cannot drop type 'MissingSkuTableType' because it is being referenced by object 'generateRowsForMagmi'. There may be other objects that reference this type."
		-- the catch block handles it by dropping the procedure first, then the custom type
	END TRY
	BEGIN CATCH
		DROP PROCEDURE generateRowsForMagmi
		DROP TYPE MissingSkuTableType
	END CATCH
END
-- MissingSkuTableType is a custom type - so it is like a varchar, except instead, it is an entire table with the given schema
CREATE TYPE MissingSkuTableType AS TABLE (id int PRIMARY KEY IDENTITY, manufacturer varchar(50), style varchar(50), color varchar(50), size varchar(50))
GO

-- A procedure, or stored procedure, is a "program" in SQL. It can do a lot more than you've been able to do with SQL so far
CREATE PROCEDURE generateRowsForMagmi
	@MissingSkus MissingSkuTableType READONLY, @CheckMagento bit = 1, @RunMagmi bit = 1, @Filename varchar(50) = ''
AS
BEGIN
	BEGIN TRY
		DROP TABLE ##FTPCommands
		DROP TABLE ##skus
	END TRY
	BEGIN CATCH
	END CATCH
	
	-- Declare some variables we'll need to use in the procedure and another temp table to hold our result set
	DECLARE @configurableSku varchar(255), @simpleSku varchar(255), @i int, @rowCount int, @style varchar(128), @manufacturer varchar(128), @color varchar(128), @size varchar(128), @sql varchar(4000), @cmd varchar (4000)

	-- The two ## signifies a global temporary table, as opposed to a local (to the procedure) temporary table. This is so that bcp can find the temp table when we export it as the last step.
	CREATE TABLE ##skus (store nvarchar(MAX), websites nvarchar(MAX), [type] nvarchar(MAX), sku nvarchar(MAX), name nvarchar(MAX), attribute_set nvarchar(MAX), configurable_attributes nvarchar(MAX), has_options nvarchar(MAX), price nvarchar(MAX), cost nvarchar(MAX), status nvarchar(MAX), tax_class_id nvarchar(MAX), gender nvarchar(MAX), visibility nvarchar(MAX), image nvarchar(MAX), image_label nvarchar(MAX), small_image nvarchar(MAX), thumbnail nvarchar(MAX), media_gallery nvarchar(MAX), choose_color nvarchar(MAX), choose_size nvarchar(MAX), vendor_sku nvarchar(MAX), vendor_product_id nvarchar(MAX), vendor_color_code nvarchar(MAX), vendor_size_code nvarchar(MAX), season nvarchar(MAX), short_description nvarchar(MAX), description nvarchar(MAX), features nvarchar(MAX), fabric nvarchar(MAX), manufacturer nvarchar(MAX), simples_skus nvarchar(MAX), url_key nvarchar(MAX), merchandise_priority nvarchar(MAX));
	
	SET @i = 1
	-- How many times do we have to loop?
	SET @rowCount = (SELECT COUNT(*) FROM @MissingSkus)

	-- This while loop starts at 1 and ends at @rowCount	
	WHILE @i <= @rowCount BEGIN

		-- Assign the values of these variables to the appropriate column values from the row in the @MissingSkus table with the id @i
		SET @style = (SELECT style FROM @MissingSkus WHERE id = @i)
		SET @manufacturer = (SELECT manufacturer FROM @MissingSkus WHERE id = @i)
		SET @color = (SELECT color FROM @MissingSkus WHERE id = @i)
		SET @size = (SELECT size FROM @MissingSkus WHERE id = @i)
		
		IF (@CheckMagento = 1 ) BEGIN
			SET @simpleSku = (SELECT sku FROM MAGENTO...catalog_product_flat_1 WHERE sku COLLATE SQL_Latin1_General_CP1_CI_AS = (SELECT sku FROM view_Join_F12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND choose_color = @color AND choose_size = @size AND type = 'simple'))
			
			IF @simpleSku IS NOT NULL BEGIN
				PRINT @simpleSku
				RAISERROR('This SKU already exists in Magento', 16, 1)
			END
		END
		
		/*** BEGIN FW12 ***/
		-- Let's try to find a simple product row from F12 that matches our criteria to insert into the temporary table
		INSERT INTO ##skus
		SELECT TOP 1 store, websites, type, sku, name, attribute_set, configurable_attributes, has_options, price, cost, status, tax_class_id, gender, visibility, image, image_label, small_image, thumbnail, media_gallery, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, vendor_size_code, season, short_description, description, features, fabric, manufacturer, simples_skus, url_key, NULL
		FROM view_Join_F12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND choose_color = @color AND choose_size = @size
		
		SET @simpleSku = (SELECT sku FROM ##skus WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND choose_color = @color AND choose_size = @size)
		
		IF (SELECT COUNT(*) FROM ##skus) = 1 BEGIN
			-- We found a row! Now let's check to see if we need a configurable
			
			IF (@CheckMagento = 1) BEGIN
				SET @configurableSku = (SELECT sku FROM MAGENTO...catalog_product_flat_1 WHERE sku COLLATE SQL_Latin1_General_CP1_CI_AS = (SELECT sku FROM view_Join_F12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND type = 'configurable'))
			END
			
			IF (@configurableSku IS NULL) BEGIN
				-- We couldn't find an FW12A configurable for this product, so let's generate a row for the configurable too
				INSERT INTO ##skus
				SELECT TOP 1 store, websites, type, sku, name, attribute_set, configurable_attributes, has_options, price, cost, status, tax_class_id, gender, visibility, image, image_label, small_image, thumbnail, media_gallery, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, vendor_size_code, season, short_description, description, features, fabric, manufacturer, simples_skus, url_key, 'Z'
				FROM view_Join_F12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND type = 'configurable'
				
				-- And let's make sure the simples_skus column contains this simple sku!
				IF (SELECT simples_skus FROM ##skus WHERE type = 'configurable') NOT LIKE '%' + @simpleSku + '%' BEGIN
					UPDATE ##skus SET simples_skus = simples_skus + ',' + @simpleSku WHERE type = 'configurable'
				END
			END
		END
		/*** END FW12 ***/
		/*** BEGIN SS12 ***/
		-- If we haven't found anything, it means the product didn't exist in FW12. Let's look in previous seasons. This code block would be duplicated for n seasons
		IF (SELECT COUNT(*) FROM ##skus) = 0 BEGIN
			INSERT INTO ##skus
			SELECT TOP 1 store, websites, type, sku, name, attribute_set, configurable_attributes, has_options, price, cost, status, tax_class_id, gender, visibility, image, image_label, small_image, thumbnail, media_gallery, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, vendor_size_code, season, short_description, description, features, fabric, manufacturer, simples_skus, url_key, NULL
			FROM view_Join_S12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND choose_color = @color AND choose_size = @size

			IF (@CheckMagento = 1) BEGIN
				SET @configurableSku = (SELECT sku FROM MAGENTO...catalog_product_flat_1 WHERE sku COLLATE SQL_Latin1_General_CP1_CI_AS LIKE 'SS12_-' + (SELECT sku FROM view_Join_S12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND type = 'configurable'))
			END
			
			IF (@configurableSku IS NULL) BEGIN
				INSERT INTO ##skus
				SELECT TOP 1 store, websites, type, sku, name, attribute_set, configurable_attributes, has_options, price, cost, status, tax_class_id, gender, visibility, image, image_label, small_image, thumbnail, media_gallery, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, vendor_size_code, season, short_description, description, features, fabric, manufacturer, simples_skus, url_key, 'Z'
				FROM view_Join_S12_LoadFiles WHERE vendor_product_id = @style AND manufacturer = @manufacturer AND type = 'configurable'
				
				IF (SELECT simples_skus FROM ##skus WHERE type = 'configurable') NOT LIKE '%' + @simpleSku + '%' BEGIN
					UPDATE ##skus SET simples_skus = simples_skus + ',' + @simpleSku WHERE type = 'configurable'
				END
			END
		END
		/*** END SS12 ***/

		-- Finally, increment the variable that stores our position in the table @MissingSkus, otherwise we'll create an infinite loop
		SET @i = @i + 1
	END
	
	-- Strip line breaks and quote our fields for the CSV
	UPDATE ##skus SET store = dbo.prepareColumnForCsv(store), websites = dbo.prepareColumnForCsv(websites), type = dbo.prepareColumnForCsv(type), sku = dbo.prepareColumnForCsv(sku), name = dbo.prepareColumnForCsv(name), attribute_set = dbo.prepareColumnForCsv(attribute_set), configurable_attributes = dbo.prepareColumnForCsv(configurable_attributes), has_options = dbo.prepareColumnForCsv(has_options), price = dbo.prepareColumnForCsv(price), cost = dbo.prepareColumnForCsv(cost), status = dbo.prepareColumnForCsv(status), tax_class_id = dbo.prepareColumnForCsv(tax_class_id), gender = dbo.prepareColumnForCsv(gender), visibility = dbo.prepareColumnForCsv(visibility), image = dbo.prepareColumnForCsv(image), image_label = dbo.prepareColumnForCsv(image_label), small_image = dbo.prepareColumnForCsv(small_image), thumbnail = dbo.prepareColumnForCsv(thumbnail), media_gallery = dbo.prepareColumnForCsv(media_gallery), choose_color = dbo.prepareColumnForCsv(choose_color), choose_size = dbo.prepareColumnForCsv(choose_size), vendor_sku = dbo.prepareColumnForCsv(vendor_sku), vendor_product_id = dbo.prepareColumnForCsv(vendor_product_id), vendor_color_code = dbo.prepareColumnForCsv(vendor_color_code), vendor_size_code = dbo.prepareColumnForCsv(vendor_size_code), season = dbo.prepareColumnForCsv(season), short_description = dbo.prepareColumnForCsv(short_description), description = dbo.prepareColumnForCsv(description), features = dbo.prepareColumnForCsv(features), fabric = dbo.prepareColumnForCsv(fabric), manufacturer = dbo.prepareColumnForCsv(manufacturer), simples_skus = dbo.prepareColumnForCsv(simples_skus), url_key = dbo.prepareColumnForCsv(url_key), merchandise_priority = dbo.prepareColumnForCsv(merchandise_priority)

	IF (@Filename = '') BEGIN
		SET @Filename = 'missing-skus.csv'
	END

	SET @sql = 'SELECT ''"store"'' AS store, ''"websites"'' AS websites, ''"type"'' AS type, ''"sku"'' AS sku, ''"name"'' AS name, ''"attribute_set"'' AS attribute_set,  ''"configurable_attributes"'' AS configurable_attributes, ''"has_options"'' AS has_options, ''"price"'' AS price, ''"cost"'' AS cost, ''"status"'' AS status, ''"tax_class_id"'' AS tax_class_id, ''"department"'' AS department,  ''"visibility"'' AS visibility, ''"image"'' AS image, ''"image_label"'' AS image_label, ''"small_image"'' AS small_image, ''"thumbnail"'' AS thumbnail, ''"media_gallery"'' AS media_gallery,  ''"choose_color"'' AS choose_color, ''"choose_size"'' AS choose_size, ''"vendor_sku"'' AS vendor_sku, ''"vendor_product_id"'' AS vendor_product_id, ''"vendor_color_code"'' AS vendor_color_code,  ''"vendor_size_code"'' AS vendor_size_code, ''"season"'' AS season, ''"short_description"'' AS short_description, ''"description"'' AS description, ''"features"'' AS features, ''"fabric"'' AS fabric, ''"manufacturer"'' AS manufacturer, ''"simples_skus"'' AS simples_skus, ''"url_key"'' AS url_key, ''"merchandise_priority"'' AS merchandise_priority UNION ALL SELECT * FROM ##skus ORDER BY name, type DESC'
	-- Show the contents of ##skus as the Result set
	EXEC(@sql)

	-- Output ##skus to a CSV named @Filename (this is an optional argument you can pass when you call the stored procedure)
	SET @sql = 'bcp "' + REPLACE(@sql,'"','\"') + '" queryout "C:\Data\Shared\temp-' + @Filename + '" -w -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @sql, NO_OUTPUT

	-- Convert @Filename from UTF-16 to UTF-8 using the iconv program
	SET @cmd = 'iconv -f UTF-16 -t UTF-8 "C:\Data\Shared\temp-' + @Filename + '" > "C:\Data\Shared\' + @Filename
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT
	SET @cmd = 'del "C:\Data\Shared\temp-' + @Filename + '"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	-- We need another temporary table to store commands to pass to the command line ftp program (so we can automate what we would usually do with FileZilla)
	CREATE TABLE ##FTPCommands (id int PRIMARY KEY IDENTITY, command varchar(50))
	INSERT INTO ##FTPCommands (command) VALUES ('o liveoutthere.com'),
											   ('outthere_fs01'),
											   ('*76wdnt@1'),
											   ('BINARY'),
											   ('put C:\Data\Shared\' + @Filename),
											   ('bye')
	
	-- Then we use bcp again to save the set of FTP commands to a file
	SET @cmd = 'bcp "SELECT command FROM ##FTPCommands ORDER BY id" queryout "C:\Data\Shared\generateRowsForMagmi.ftp" -c -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT
	TRUNCATE TABLE ##FTPCommands

	-- Then we use xp_cmdshell to call ftp with the -s option (list of commands to execute) set to the location of the FTP commands file we just created
	EXEC master..xp_cmdshell 'ftp -w:12288 -s:C:\Data\Shared\generateRowsForMagmi.ftp', NO_OUTPUT

	IF (@RunMagmi = 1) BEGIN
		-- Now, @Filename has been uploaded to /var/import! We can run MAGMI (wget is a command line web browser)
		-- First let's make sure MAGMI isn't running
		
		INSERT INTO ##FTPCommands (command) VALUES ('o liveoutthere.com'),
												   ('outthere_magmistate'),
												   ('*76wdnt@1'),
												   ('BINARY'),
												   ('get magmistate'),
												   ('bye')
		
		SET @cmd = 'bcp "SELECT command FROM ##FTPCommands ORDER BY id" queryout "C:\Data\Shared\generateRowsForMagmi.ftp" -c -t , -T -S ' + @@servername
		EXEC master..xp_cmdshell @cmd, NO_OUTPUT
		TRUNCATE TABLE ##FTPCommands

		-- Delete the local copy of missing-skus.log if it exists, then download it, then run the type program on the log file to dump its contents the output window
		EXEC master..xp_cmdshell 'cd C:\Data\Shared & ftp -w:12288 -s:C:\Data\Shared\generateRowsForMagmi.ftp', NO_OUTPUT
		
		-- Need to get a bit fancy to actually capture the contents of the magmistate file in a variable
		DECLARE @magmiState varchar(128)
		CREATE TABLE #state (output varchar(255) null)
		INSERT #state EXEC master..xp_cmdshell 'type C:\Data\Shared\magmistate'
		SELECT TOP 1 @magmiState = output FROM #state
		DROP TABLE #state

		IF (@magmiState = 'idle') BEGIN
			SET @cmd = 'wget --spider "http://www.liveoutthere.com/utility_o23tsgf/magmi/web/magmi_run.php?mode=create&logfile=missing-skus.log&profile=Missing%20SKUs&engine=magmi_productimportengine:Magmi_ProductImportEngine"'
			EXEC master..xp_cmdshell @cmd, NO_OUTPUT
				
			-- Do you see what xp_cmdshell does now? It is an "extended" stored procedure that allows us to execute commands as if we'd typed them at the terminal
			
			-- Now let's go get MAGMI's log:
			INSERT INTO ##FTPCommands (command) VALUES ('o liveoutthere.com'),
													   ('outthere_magmistate'),
													   ('*76wdnt@1'),
													   ('BINARY'),
													   ('get missing-skus.log'),
													   ('bye')
			
			SET @cmd = 'bcp "SELECT command FROM ##FTPCommands ORDER BY id" queryout "C:\Data\Shared\generateRowsForMagmi.ftp" -c -t , -T -S ' + @@servername
			EXEC master..xp_cmdshell @cmd, NO_OUTPUT
			TRUNCATE TABLE ##FTPCommands
		
			-- Delete the local copy of missing-skus.log if it exists, then download it, then run the type program on the log file to dump its contents the output window
			EXEC master..xp_cmdshell 'cd C:\Data\Shared & ftp -w:12288 -s:C:\Data\Shared\generateRowsForMagmi.ftp', NO_OUTPUT
			EXEC master..xp_cmdshell 'type C:\Data\Shared\missing-skus.log'	
			
			-- Clean up and remove files
			SET @cmd = 'del C:\Data\Shared\magmistate & del C:\Data\Shared\missing-skus.log & del C:\Data\Shared\generateRowsForMagmi.ftp & del "C:\Data\Shared\' + @Filename + '"'
			EXEC master..xp_cmdshell @cmd, NO_OUTPUT
		END
		ELSE BEGIN
			RAISERROR('Unable to run load file because MAGMI is not idle.', 16, 1)
		END
	END

	-- Assign all configurable products without a category to Uncategorized
	INSERT INTO OPENQUERY( MAGENTO, 'SELECT * FROM catalog_category_product' )
	SELECT (SELECT entity_id FROM MAGENTO...catalog_category_flat_store_1 WHERE name = 'Uncategorized'), entity_id, 100 FROM MAGENTO...catalog_product_entity AS a LEFT JOIN MAGENTO...catalog_category_product AS b ON a.entity_id = b.product_id WHERE a.type_id = 'configurable' AND b.category_id IS NULL

END
GO

/*** PROGRAM EXECUTION BEGINS HERE ***/
-- Create a temporary table variable and insert some data into it. You could also SELECT from another table here, instead of typing, if your missing returned products were in their own table.
DECLARE @MissingSkus MissingSkuTableType, @CheckMagento bit
INSERT INTO @MissingSkus (manufacturer, style, color, size) VALUES ('The North Face', 'AYHP', 'TNF Black', 'XS'),
																   ('The North Face', 'AYHP', 'TNF Black', 'S')

-- Call the stored procedure defined above. If CheckMagento = 1 it will check if the configurable exists. If it doesn't, the sproc returns a configurable row too.
-- It will also dummy-check for you and throw an error if the simple product exists.
EXEC generateRowsForMagmi @MissingSkus, @CheckMagento = 0, @RunMagmi = 1