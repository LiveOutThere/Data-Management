USE LOT_Purchasing
GO

ALTER PROCEDURE Inline_Closeout_PO_Building
	@po_num varchar(30), 
	@po_type nvarchar(30), 
	@brand nvarchar(30),
	@brand_code nvarchar(30),
	@season_code nvarchar(30),
	@simple_count float,
	@config_count float
AS
BEGIN
	--This initial line allows for multiple executions of the procedure without polluting tbl_Purchase_Order with duplicate rows:
	DELETE FROM tbl_Purchase_Order WHERE PO_NUM = @po_num
	
	--The beginning section is where the relevant data gets inserted into #PO_DATA & @config_string so that it can be referenced later:
	IF OBJECT_ID('tempdb..#PO_DATA') IS NOT NULL BEGIN
		DROP TABLE #PO_DATA
	END		

	CREATE TABLE #PO_DATA (style_color_size nvarchar(255), vendor_product_id nvarchar(255), config_sku nvarchar(255))
	INSERT INTO #PO_DATA (style_color_size) (
	SELECT '2011-025-LNG/LFT' UNION ALL
	SELECT '2033-6580-LNG/LFT' UNION ALL
	SELECT '2063-4484-LNG/LFT' UNION ALL
	SELECT '5067-2079-S' UNION ALL
	SELECT '5067-2079-M' UNION ALL
	SELECT '5067-2079-L' UNION ALL
	SELECT '5067-2079-XL' UNION ALL
	SELECT '5067-2079-XXL' UNION ALL
	SELECT '15380-001-M' UNION ALL
	SELECT '15380-001-L' UNION ALL
	SELECT '15380-001-XL' UNION ALL
	SELECT '15480-1027-S' UNION ALL
	SELECT '15480-1027-M' UNION ALL
	SELECT '15480-1027-L' UNION ALL
	SELECT '15480-1027-XL' UNION ALL
	SELECT '20050-1181-LNG/LFT' UNION ALL
	SELECT '21050-1145-LNG/LFT' UNION ALL
	SELECT '21160-4724-REG/LFT' UNION ALL
	SELECT '21160-4724-REG/RHT' UNION ALL
	SELECT '21170-4724-LNG/LFT' UNION ALL
	SELECT '21170-4724-LNG/RHT' UNION ALL
	SELECT '21320-9512-REG/LFT' UNION ALL
	SELECT '21440-2316-REG/LFT' UNION ALL
	SELECT '21440-2316-REG/RHT' UNION ALL
	SELECT '21450-2316-LNG/LFT' UNION ALL
	SELECT '21450-2316-LNG/RHT' UNION ALL
	SELECT '21790-2759-REG/LFT' UNION ALL
	SELECT '21790-2759-REG/RHT' UNION ALL
	SELECT '26680-9411-O/S' UNION ALL
	SELECT '27260-4260-O/S' UNION ALL
	SELECT '30380-2740-S' UNION ALL
	SELECT '30380-2740-M' UNION ALL
	SELECT '30380-2740-L' UNION ALL
	SELECT '30380-2740-XL' UNION ALL
	SELECT '35650-6779-XS' UNION ALL
	SELECT '35650-6779-S' UNION ALL
	SELECT '35650-6779-M' UNION ALL
	SELECT '35650-6779-L' UNION ALL
	SELECT '35650-6779-XL' UNION ALL
	SELECT '35830-169-S' UNION ALL
	SELECT '35830-169-M' UNION ALL
	SELECT '35830-169-L' UNION ALL
	SELECT '40420-1452-S' UNION ALL
	SELECT '40420-1452-M' UNION ALL
	SELECT '40420-1452-L' UNION ALL
	SELECT '40420-1452-XL' UNION ALL
	SELECT '40420-2777-S' UNION ALL
	SELECT '40420-2777-M' UNION ALL
	SELECT '40420-2777-L' UNION ALL
	SELECT '40420-2777-XL' UNION ALL
	SELECT '40420-6359-S' UNION ALL
	SELECT '40420-6359-M' UNION ALL
	SELECT '40420-6359-L' UNION ALL
	SELECT '40420-6359-XL' UNION ALL
	SELECT '50200-001-S' UNION ALL
	SELECT '50200-001-L' UNION ALL
	SELECT '50200-001-XL' UNION ALL
	SELECT '50200-001-XXL' UNION ALL
	SELECT '50200-1440-S' UNION ALL
	SELECT '50200-1440-M' UNION ALL
	SELECT '50200-1440-L' UNION ALL
	SELECT '50200-1440-XL' UNION ALL
	SELECT '50200-1440-XXL' UNION ALL
	SELECT '50200-1452-S' UNION ALL
	SELECT '50200-1452-M' UNION ALL
	SELECT '50200-1452-L' UNION ALL
	SELECT '50200-1452-XL' UNION ALL
	SELECT '50200-2059-S' UNION ALL
	SELECT '50200-2059-M' UNION ALL
	SELECT '50200-2059-L' UNION ALL
	SELECT '50200-2059-XL' UNION ALL
	SELECT '50200-2777-S' UNION ALL
	SELECT '50200-2777-M' UNION ALL
	SELECT '50200-2777-L' UNION ALL
	SELECT '50200-2777-XL' UNION ALL
	SELECT '50260-001-S' UNION ALL
	SELECT '50260-001-M' UNION ALL
	SELECT '50260-001-L' UNION ALL
	SELECT '50260-001-XL' UNION ALL
	SELECT '50260-001-XXL' UNION ALL
	SELECT '50260-1440-S' UNION ALL
	SELECT '50260-1440-M' UNION ALL
	SELECT '50260-1440-L' UNION ALL
	SELECT '50260-1440-XL' UNION ALL
	SELECT '50720-2077-M' UNION ALL
	SELECT '50720-2077-L' UNION ALL
	SELECT '50720-2077-XL' UNION ALL
	SELECT '55200-080-XS' UNION ALL
	SELECT '55200-080-S' UNION ALL
	SELECT '55200-080-M' UNION ALL
	SELECT '55200-080-L' UNION ALL
	SELECT '55200-080-XL' UNION ALL
	SELECT '55200-9185-XS' UNION ALL
	SELECT '55200-9185-S' UNION ALL
	SELECT '55200-9185-M' UNION ALL
	SELECT '55200-9185-L' UNION ALL
	SELECT '55200-9185-XL' UNION ALL
	SELECT '55260-001-XS' UNION ALL
	SELECT '55260-001-S' UNION ALL
	SELECT '55260-001-M' UNION ALL
	SELECT '55260-001-L' UNION ALL
	SELECT '60720-001-S' UNION ALL
	SELECT '60720-001-M' UNION ALL
	SELECT '60720-001-M' UNION ALL
	SELECT '60720-001-L' UNION ALL
	SELECT '60720-001-XL' UNION ALL
	SELECT '60720-1428-S' UNION ALL
	SELECT '60720-1428-M' UNION ALL
	SELECT '60720-1428-L' UNION ALL
	SELECT '60720-1428-XL' UNION ALL
	SELECT '60720-2088-S' UNION ALL
	SELECT '60720-2088-M' UNION ALL
	SELECT '60720-2088-L' UNION ALL
	SELECT '60720-2088-XL' UNION ALL
	SELECT '60720-6357-S' UNION ALL
	SELECT '60720-6357-M' UNION ALL
	SELECT '60720-6357-L' UNION ALL
	SELECT '60720-6357-XL' UNION ALL
	SELECT '65480-1337-XS' UNION ALL
	SELECT '65480-1337-S' UNION ALL
	SELECT '65480-1337-M' UNION ALL
	SELECT '65480-1337-L' UNION ALL
	SELECT '65480-1337-XL' UNION ALL
	SELECT '65480-2543-XS' UNION ALL
	SELECT '65480-2543-S' UNION ALL
	SELECT '65480-2543-L' UNION ALL
	SELECT '65480-2543-XL' UNION ALL
	SELECT '65480-2720-XS' UNION ALL
	SELECT '65480-2720-S' UNION ALL
	SELECT '65480-2720-M' UNION ALL
	SELECT '65480-2720-L' UNION ALL
	SELECT '65480-2720-XL' UNION ALL
	SELECT '69100-4428-2' UNION ALL
	SELECT '69100-4428-4' UNION ALL
	SELECT '69100-4428-6' UNION ALL
	SELECT '69100-4428-8' UNION ALL
	SELECT '69100-4428-10' UNION ALL
	SELECT '69100-4428-12' UNION ALL
	SELECT '69100-4428-14' UNION ALL
	SELECT '69100-7284-2' UNION ALL
	SELECT '69100-7284-4' UNION ALL
	SELECT '69100-7284-6' UNION ALL
	SELECT '69100-7284-8' UNION ALL
	SELECT '69100-7284-10' UNION ALL
	SELECT '69100-7284-12' UNION ALL
	SELECT '69100-7284-14' UNION ALL
	SELECT '70290-2059-S' UNION ALL
	SELECT '70290-2059-XL' UNION ALL
	SELECT '70290-4083-S' UNION ALL
	SELECT '70290-4083-M' UNION ALL
	SELECT '70290-4083-L' UNION ALL
	SELECT '70290-4083-XL' UNION ALL
	SELECT '70290-7150-M' UNION ALL
	SELECT '70290-9185-S' UNION ALL
	SELECT '70290-9185-L' UNION ALL
	SELECT '70290-9185-XL' UNION ALL
	SELECT '70310-001-M' UNION ALL
	SELECT '70310-001-L' UNION ALL
	SELECT '70310-001-XL' UNION ALL
	SELECT '70360-7153-S' UNION ALL
	SELECT '70360-7153-M' UNION ALL
	SELECT '70360-7153-L' UNION ALL
	SELECT '70360-7153-XL' UNION ALL
	SELECT '70670-001-M' UNION ALL
	SELECT '70670-001-L' UNION ALL
	SELECT '70670-001-XL' UNION ALL
	SELECT '71160-066-M' UNION ALL
	SELECT '71160-066-L' UNION ALL
	SELECT '71160-2059-M' UNION ALL
	SELECT '71160-2059-L' UNION ALL
	SELECT '71160-2059-XL' UNION ALL
	SELECT '71160-2059-XXL' UNION ALL
	SELECT '72220-2059-S' UNION ALL
	SELECT '72220-2059-M' UNION ALL
	SELECT '72220-2059-L' UNION ALL
	SELECT '72220-2059-XL' UNION ALL
	SELECT '72220-4680-S' UNION ALL
	SELECT '72220-4680-M' UNION ALL
	SELECT '72220-4680-L' UNION ALL
	SELECT '72560-4083-S' UNION ALL
	SELECT '72560-4083-M' UNION ALL
	SELECT '72560-4083-L' UNION ALL
	SELECT '72560-4083-XL' UNION ALL
	SELECT '72760-001-S' UNION ALL
	SELECT '72760-001-M' UNION ALL
	SELECT '72760-001-L' UNION ALL
	SELECT '72760-001-XL' UNION ALL
	SELECT '72960-1415-S' UNION ALL
	SELECT '72960-1415-M' UNION ALL
	SELECT '72960-1415-L' UNION ALL
	SELECT '72960-1415-XL' UNION ALL
	SELECT '72960-2740-S' UNION ALL
	SELECT '72960-2740-M' UNION ALL
	SELECT '72960-2740-L' UNION ALL
	SELECT '72960-2740-XL' UNION ALL
	SELECT '73150-2740-S' UNION ALL
	SELECT '73150-2740-M' UNION ALL
	SELECT '73150-2740-L' UNION ALL
	SELECT '73150-2740-XL' UNION ALL
	SELECT '73540-1415-S' UNION ALL
	SELECT '73540-1415-M' UNION ALL
	SELECT '73540-1415-L' UNION ALL
	SELECT '73540-1415-XL' UNION ALL
	SELECT '73590-1452-S' UNION ALL
	SELECT '73590-1452-M' UNION ALL
	SELECT '73590-1452-L' UNION ALL
	SELECT '73590-1452-XL' UNION ALL
	SELECT '73590-1452-XXL' UNION ALL
	SELECT '73590-2777-S' UNION ALL
	SELECT '73590-2777-M' UNION ALL
	SELECT '73590-2777-L' UNION ALL
	SELECT '73610-2314-S' UNION ALL
	SELECT '73610-2314-M' UNION ALL
	SELECT '73610-2314-L' UNION ALL
	SELECT '73610-2314-XL' UNION ALL
	SELECT '73610-7150-S' UNION ALL
	SELECT '73610-7150-M' UNION ALL
	SELECT '73610-7150-L' UNION ALL
	SELECT '73610-7150-XL' UNION ALL
	SELECT '75530-001-XS' UNION ALL
	SELECT '75530-001-S' UNION ALL
	SELECT '75530-001-M' UNION ALL
	SELECT '75530-001-L' UNION ALL
	SELECT '75530-001-XL' UNION ALL
	SELECT '75530-2538-XS' UNION ALL
	SELECT '75530-2538-S' UNION ALL
	SELECT '75530-2538-M' UNION ALL
	SELECT '75530-2538-L' UNION ALL
	SELECT '75530-2538-XL' UNION ALL
	SELECT '75530-2720-XS' UNION ALL
	SELECT '75530-2720-S' UNION ALL
	SELECT '75530-2720-M' UNION ALL
	SELECT '75530-2720-L' UNION ALL
	SELECT '75530-2720-XL' UNION ALL
	SELECT '75910-1220-XS' UNION ALL
	SELECT '75910-1220-S' UNION ALL
	SELECT '75910-1220-M' UNION ALL
	SELECT '75910-1220-L' UNION ALL
	SELECT '75910-1220-XL' UNION ALL
	SELECT '75910-2692-XS' UNION ALL
	SELECT '75910-2692-M' UNION ALL
	SELECT '75910-2692-L' UNION ALL
	SELECT '75910-2692-XL' UNION ALL
	SELECT '75910-4083-M' UNION ALL
	SELECT '77170-1347-S' UNION ALL
	SELECT '77170-1347-M' UNION ALL
	SELECT '77170-1347-L' UNION ALL
	SELECT '77660-2692-XS' UNION ALL
	SELECT '77660-2692-S' UNION ALL
	SELECT '77660-2692-M' UNION ALL
	SELECT '77660-2692-L' UNION ALL
	SELECT '77660-6178-XS' UNION ALL
	SELECT '77660-6178-S' UNION ALL
	SELECT '77660-6178-M' UNION ALL
	SELECT '77660-6405-XS' UNION ALL
	SELECT '77660-6405-S' UNION ALL
	SELECT '77660-6405-M' UNION ALL
	SELECT '77660-6405-L' UNION ALL
	SELECT '77660-6405-XL' UNION ALL
	SELECT '77790-2692-M' UNION ALL
	SELECT '77790-2692-L' UNION ALL
	SELECT '77790-2692-XL' UNION ALL
	SELECT '77790-4083-S' UNION ALL
	SELECT '77790-4083-M' UNION ALL
	SELECT '77790-4083-XL' UNION ALL
	SELECT '77790-6080-XS' UNION ALL
	SELECT '77790-6080-S' UNION ALL
	SELECT '77790-6080-M' UNION ALL
	SELECT '77790-6080-L' UNION ALL
	SELECT '77790-6080-XL' UNION ALL
	SELECT '77920-2381-XS' UNION ALL
	SELECT '77920-2381-S' UNION ALL
	SELECT '77920-2381-M' UNION ALL
	SELECT '77920-2381-L' UNION ALL
	SELECT '77920-2381-XL' UNION ALL
	SELECT '77980-1132-XXL' UNION ALL
	SELECT '77980-3048-XS' UNION ALL
	SELECT '77980-3048-S' UNION ALL
	SELECT '77980-3048-M' UNION ALL
	SELECT '77980-3048-L' UNION ALL
	SELECT '77980-3048-XL' UNION ALL
	SELECT '77980-3048-XXL' UNION ALL
	SELECT '78090-3048-S' UNION ALL
	SELECT '78090-3048-M' UNION ALL
	SELECT '78090-6387-XS' UNION ALL
	SELECT '78090-6387-S' UNION ALL
	SELECT '78090-6387-M' UNION ALL
	SELECT '78090-6387-L' UNION ALL
	SELECT '78090-6387-XL' UNION ALL
	SELECT '78090-6387-XXL' UNION ALL
	SELECT '78570-1132-XS' UNION ALL
	SELECT '78570-1132-S' UNION ALL
	SELECT '78570-1132-M' UNION ALL
	SELECT '78570-1132-L' UNION ALL
	SELECT '78570-1132-XL' UNION ALL
	SELECT '78570-1132-XXL' UNION ALL
	SELECT '78570-4317-XS' UNION ALL
	SELECT '78570-4317-S' UNION ALL
	SELECT '78570-4317-M' UNION ALL
	SELECT '78570-4317-L' UNION ALL
	SELECT '78570-4317-XL' UNION ALL
	SELECT '78570-4317-XXL' UNION ALL
	SELECT '78570-6387-XS' UNION ALL
	SELECT '78570-6387-S' UNION ALL
	SELECT '78570-6387-M' UNION ALL
	SELECT '78570-6387-L' UNION ALL
	SELECT '78570-6387-XXL' UNION ALL
	SELECT '78670-2381-XS' UNION ALL
	SELECT '78670-2381-S' UNION ALL
	SELECT '78670-2381-M' UNION ALL
	SELECT '78670-2381-L' UNION ALL
	SELECT '78670-2381-XL' UNION ALL
	SELECT '78670-2692-XS' UNION ALL
	SELECT '78670-2692-S' UNION ALL
	SELECT '78670-2692-M' UNION ALL
	SELECT '78670-2692-L' UNION ALL
	SELECT '78670-2692-XL' UNION ALL
	SELECT '80320-001-S' UNION ALL
	SELECT '80320-001-M' UNION ALL
	SELECT '80320-001-L' UNION ALL
	SELECT '80320-001-XL' UNION ALL
	SELECT '80320-1452-S' UNION ALL
	SELECT '80320-1452-M' UNION ALL
	SELECT '80320-1452-L' UNION ALL
	SELECT '80320-1452-XL' UNION ALL
	SELECT '80320-2777-S' UNION ALL
	SELECT '80320-2777-M' UNION ALL
	SELECT '80320-2777-L' UNION ALL
	SELECT '80320-2777-XL' UNION ALL
	SELECT '80500-1440-S' UNION ALL
	SELECT '80500-1440-M' UNION ALL
	SELECT '80500-1440-L' UNION ALL
	SELECT '80500-1440-XL' UNION ALL
	SELECT '80810-001-S' UNION ALL
	SELECT '80810-001-M' UNION ALL
	SELECT '80810-001-L' UNION ALL
	SELECT '80810-001-XL' UNION ALL
	SELECT '81030-1452-S' UNION ALL
	SELECT '81030-1452-M' UNION ALL
	SELECT '81030-1452-L' UNION ALL
	SELECT '81030-1452-XL' UNION ALL
	SELECT '81030-2777-S' UNION ALL
	SELECT '81030-2777-M' UNION ALL
	SELECT '81030-2777-L' UNION ALL
	SELECT '81030-2777-XL' UNION ALL
	SELECT '81030-6359-S' UNION ALL
	SELECT '81030-6359-M' UNION ALL
	SELECT '81030-6359-L' UNION ALL
	SELECT '81030-6359-XL' UNION ALL
	SELECT '83120-2477-M' UNION ALL
	SELECT '83120-2477-L' UNION ALL
	SELECT '83120-2477-XL' UNION ALL
	SELECT '83120-4283-M' UNION ALL
	SELECT '83120-4283-L' UNION ALL
	SELECT '83120-4283-XL' UNION ALL
	SELECT '83250-2314-S' UNION ALL
	SELECT '83250-2314-M' UNION ALL
	SELECT '83250-2314-L' UNION ALL
	SELECT '83250-2314-XL' UNION ALL
	SELECT '83270-2059-S' UNION ALL
	SELECT '83270-2059-M' UNION ALL
	SELECT '83270-2059-L' UNION ALL
	SELECT '83270-2059-XL' UNION ALL
	SELECT '83510-1452-S' UNION ALL
	SELECT '83510-1452-M' UNION ALL
	SELECT '83510-1452-L' UNION ALL
	SELECT '83510-1452-XL' UNION ALL
	SELECT '83510-2777-S' UNION ALL
	SELECT '83510-2777-M' UNION ALL
	SELECT '83510-2777-L' UNION ALL
	SELECT '83510-2777-XL' UNION ALL
	SELECT '83510-4034-S' UNION ALL
	SELECT '83510-4034-M' UNION ALL
	SELECT '83510-4034-L' UNION ALL
	SELECT '83510-4034-XL' UNION ALL
	SELECT '83510-9252-S' UNION ALL
	SELECT '83510-9252-M' UNION ALL
	SELECT '83510-9252-L' UNION ALL
	SELECT '85100-1220-XS' UNION ALL
	SELECT '85100-1220-S' UNION ALL
	SELECT '85100-1220-L' UNION ALL
	SELECT '85100-1220-XL' UNION ALL
	SELECT '85100-2538-XS' UNION ALL
	SELECT '85100-2538-S' UNION ALL
	SELECT '85100-2538-M' UNION ALL
	SELECT '85100-2538-L' UNION ALL
	SELECT '85100-2538-XL' UNION ALL
	SELECT '85100-2720-XS' UNION ALL
	SELECT '85100-2720-S' UNION ALL
	SELECT '85100-2720-M' UNION ALL
	SELECT '85100-2720-L' UNION ALL
	SELECT '85100-2720-XL' UNION ALL
	SELECT '85100-6786-XS' UNION ALL
	SELECT '85100-6786-S' UNION ALL
	SELECT '85100-6786-M' UNION ALL
	SELECT '85100-6786-L' UNION ALL
	SELECT '85100-6786-XL' UNION ALL
	SELECT '88630-5608-S' UNION ALL
	SELECT '88630-5608-M' UNION ALL
	SELECT '88630-5608-L' UNION ALL
	SELECT '88630-5608-XL')
	

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '2011' UNION ALL
	SELECT '2033' UNION ALL
	SELECT '2063' UNION ALL
	SELECT '5067' UNION ALL
	SELECT '15380' UNION ALL
	SELECT '15480' UNION ALL
	SELECT '20050' UNION ALL
	SELECT '21050' UNION ALL
	SELECT '21160' UNION ALL
	SELECT '21170' UNION ALL
	SELECT '21320' UNION ALL
	SELECT '21440' UNION ALL
	SELECT '21450' UNION ALL
	SELECT '21790' UNION ALL
	SELECT '26680' UNION ALL
	SELECT '27260' UNION ALL
	SELECT '30380' UNION ALL
	SELECT '35650' UNION ALL
	SELECT '35830' UNION ALL
	SELECT '40420' UNION ALL
	SELECT '50200' UNION ALL
	SELECT '50260' UNION ALL
	SELECT '50720' UNION ALL
	SELECT '55200' UNION ALL
	SELECT '55260' UNION ALL
	SELECT '60720' UNION ALL
	SELECT '65480' UNION ALL
	SELECT '69100' UNION ALL
	SELECT '70290' UNION ALL
	SELECT '70310' UNION ALL
	SELECT '70360' UNION ALL
	SELECT '70670' UNION ALL
	SELECT '71160' UNION ALL
	SELECT '72220' UNION ALL
	SELECT '72560' UNION ALL
	SELECT '72760' UNION ALL
	SELECT '72960' UNION ALL
	SELECT '73150' UNION ALL
	SELECT '73540' UNION ALL
	SELECT '73590' UNION ALL
	SELECT '73610' UNION ALL
	SELECT '75530' UNION ALL
	SELECT '75910' UNION ALL
	SELECT '77170' UNION ALL
	SELECT '77660' UNION ALL
	SELECT '77790' UNION ALL
	SELECT '77920' UNION ALL
	SELECT '77980' UNION ALL
	SELECT '78090' UNION ALL
	SELECT '78570' UNION ALL
	SELECT '78670' UNION ALL
	SELECT '80320' UNION ALL
	SELECT '80500' UNION ALL
	SELECT '80810' UNION ALL
	SELECT '81030' UNION ALL
	SELECT '83120' UNION ALL
	SELECT '83250' UNION ALL
	SELECT '83270' UNION ALL
	SELECT '83510' UNION ALL
	SELECT '85100' UNION ALL
	SELECT '88630')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''MAR-2011'''',''''MAR-2033'''',''''MAR-2063'''',''''MAR-5067'''',''''MAR-15380'''',''''MAR-15480'''',''''MAR-20050'''',''''MAR-21050'''',''''MAR-21160'''',''''MAR-21170'''',''''MAR-21320'''',''''MAR-21440'''',''''MAR-21450'''',''''MAR-21790'''',''''MAR-26680'''',''''MAR-27260'''',''''MAR-30380'''',''''MAR-35650'''',''''MAR-35830'''',''''MAR-40420'''',''''MAR-50200'''',''''MAR-50260'''',''''MAR-50720'''',''''MAR-55200'''',''''MAR-55260'''',''''MAR-60720'''',''''MAR-65480'''',''''MAR-69100'''',''''MAR-70290'''',''''MAR-70310'''',''''MAR-70360'''',''''MAR-70670'''',''''MAR-71160'''',''''MAR-72220'''',''''MAR-72560'''',''''MAR-72760'''',''''MAR-72960'''',''''MAR-73150'''',''''MAR-73540'''',''''MAR-73590'''',''''MAR-73610'''',''''MAR-75530'''',''''MAR-75910'''',''''MAR-77170'''',''''MAR-77660'''',''''MAR-77790'''',''''MAR-77920'''',''''MAR-77980'''',''''MAR-78090'''',''''MAR-78570'''',''''MAR-78670'''',''''MAR-80320'''',''''MAR-80500'''',''''MAR-80810'''',''''MAR-81030'''',''''MAR-83120'''',''''MAR-83250'''',''''MAR-83270'''',''''MAR-83510'''',''''MAR-85100'''',''''MAR-88630'''''
	
	--Here #view_PO_LoadFile gets created and then populated with the desired rows from your desired loadfile:
	IF OBJECT_ID('tempdb..#view_PO_LoadFile') IS NOT NULL BEGIN
		DROP TABLE #view_PO_LoadFile
	END	
	
	CREATE TABLE #view_PO_LoadFile (id int,store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_sku nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),short_description nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),activities nvarchar(MAX),weather nvarchar(MAX),layering nvarchar(MAX),care_instructions nvarchar(MAX),fabric nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),videos nvarchar(MAX),weight nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX))
	
	DECLARE @sql varchar(MAX)
	SET @sql = '
	INSERT INTO #view_PO_LoadFile
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = b.style_color_size COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple''
	
	UNION ALL
	
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON a.vendor_product_id COLLATE Latin1_General_CI_AS = b.vendor_product_id COLLATE Latin1_General_CI_AS
	WHERE a.type = ''configurable''
	ORDER BY a.type DESC,a.department,a.vendor_product_id,a.vendor_color_code,a.vendor_size_code'
	EXEC (@sql)
	
	IF @@ROWCOUNT = 0 BEGIN
		SELECT 'Nothing from #PO_DATA is matching LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + CAST(@brand_code AS varchar(155)) + '!!!' AS ERROR
		RETURN 
	END
	
	--Determine whether the PO procedure is building a complete PO, otherwise end the procudure and troubleshoot:
	IF OBJECT_ID('tempdb..#missing_rows') IS NOT NULL BEGIN
	DROP TABLE #missing_rows
	END	
	
	CREATE TABLE #missing_rows (sku nvarchar(255), style nvarchar(255))
	
	INSERT INTO #missing_rows (sku)	
	SELECT a.style_color_size
	FROM #PO_DATA AS a
	FULL JOIN #view_PO_LoadFile AS b
	ON a.style_color_size = b.vendor_product_id + '-' + b.vendor_color_code + '-' + b.vendor_size_code
	WHERE a.style_color_size IS NOT NULL AND b.sku IS NULL
	
	INSERT INTO #missing_rows (style)
	SELECT a.vendor_product_id
	FROM #PO_DATA AS a
	FULL JOIN #view_PO_LoadFile AS b
	ON a.vendor_product_id = b.vendor_product_id
	WHERE a.vendor_product_id IS NOT NULL AND b.vendor_product_id IS NULL
	
	IF OBJECT_ID('tempdb..#content_match') IS NOT NULL BEGIN
	DROP TABLE #content_match
	END	
	
	CREATE TABLE #content_match (type nvarchar(255),po_type_count float, expected_type_count float)
	
	INSERT INTO #content_match (type, po_type_count)
	SELECT type, COUNT(*) AS po_type_count
	FROM #view_PO_LoadFile
	GROUP BY type
	
	UPDATE #content_match SET expected_type_count = @simple_count WHERE type = 'simple'
	UPDATE #content_match SET expected_type_count = @config_count WHERE type = 'configurable'
	
	IF (SELECT po_type_count FROM #content_match WHERE type = 'simple') <> (SELECT expected_type_count FROM #content_match WHERE type = 'simple') OR
	   (SELECT po_type_count FROM #content_match WHERE type = 'configurable') <> (SELECT expected_type_count FROM #content_match WHERE type = 'configurable') BEGIN 
		SELECT * FROM (
			SELECT (SELECT 'There are ' + CAST((expected_type_count - po_type_count) AS varchar(255)) + ' simple products from the Purchase Order that are not being matched!!!' WHERE type = 'simple') AS error_message FROM #content_match
			UNION ALL
			SELECT (SELECT 'There are ' + CAST((expected_type_count - po_type_count) AS varchar(255)) + ' configurable products from the Purchase Order that are not being matched!!!' WHERE type = 'configurable') AS error_message FROM #content_match
		) AS x WHERE x.error_message IS NOT NULL
		SELECT sku FROM #missing_rows WHERE sku IS NOT NULL
		SELECT style FROM #missing_rows WHERE style IS NOT NULL
		RETURN	   
	END
		
	--Insert the contents of #view_PO_LoadFile into tbl_Purchase_Order, as well as a PO_NUM value:
	INSERT INTO tbl_Purchase_Order SELECT *, @po_num AS PO_NUM FROM #view_PO_LoadFile

	--Pull the SEO optimized product descriptions from the MYSQL database and assign them to the configurables from the loadfile:
	SET @sql = '
	UPDATE a SET
		a.description = b.description
	FROM tbl_Purchase_Order AS a
	INNER JOIN (SELECT sku, description FROM OPENQUERY(MAGENTO,''
		SELECT a.sku, b.value AS description
		FROM catalog_product_entity AS a
		INNER JOIN catalog_product_entity_text AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''description'''')
		WHERE a.sku IN(' + @config_string + ')'')) AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = ' + '''' + @po_num + '''' + ''
	EXEC (@sql)

	--Create the #missing_data table and insert rows for any and all issues:
	IF OBJECT_ID('tempdb..#missing_data') IS NOT NULL BEGIN
		DROP TABLE #missing_data
	END	

	CREATE TABLE #missing_data (id int IDENTITY(1,1), issue nvarchar(255),name nvarchar(MAX),vendor_product_id nvarchar(100),choose_color nvarchar(MAX),vendor_color_code nvarchar(MAX))
	INSERT INTO #missing_data
	SELECT DISTINCT 'Missing Image', name, vendor_product_id, choose_color, vendor_color_code
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'simple' AND image IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Description', name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND description IS NULL OR type = 'configurable' AND description = '')
	UNION ALL
	SELECT DISTINCT 'Missing Features', name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND features IS NULL OR type = 'configurable' AND features = '')
	
	UPDATE #missing_data SET issue = 'Missing Description & Features' WHERE name IN(
		SELECT DISTINCT name
		FROM #missing_data
		GROUP BY name,vendor_product_id
		HAVING COUNT(*) > 1 AND MAX(issue) <> 'Missing Image')
	
	DELETE FROM #missing_data WHERE id IN(
		SELECT MAX(id)
		FROM #missing_data
		GROUP BY name,vendor_product_id
		HAVING MAX(issue) = 'Missing Description & Features')
	
	/* BEGIN DATA MANIPULATION */
	
	--Update the categories values for configurables without categories:
	UPDATE a SET
		a.categories = b.categories
	FROM tbl_Purchase_Order AS a
	INNER JOIN LOT_Inventory.dbo.tbl_Magento_Categories AS b
	ON a.sku COLLATE SQL_Latin1_General_CP1_CI_AS = b.sku COLLATE SQL_Latin1_General_CP1_CI_AS
	WHERE a.PO_NUM = @po_num AND a.type = 'configurable'
		
	--Purchase Order Type-Specific correlated update:	
	UPDATE a SET
		a.never_backorder = '1',
		a.backorders = '0',
		a.manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_backorders = '1',
		a.merchandise_priority = CASE WHEN a.type = 'simple' THEN NULL
									  WHEN @po_type = 'Inline' THEN 'B'
									  WHEN @po_type = 'Inline' AND a.categories LIKE '%Accessories%' THEN 'C'
									  WHEN @po_type = 'Closeout' THEN 'E' END,
		a.status = 'Enabled',
		a.image = CASE WHEN a.image IS NOT NULL THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.small_image = CASE WHEN a.image IS NOT NULL THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.thumbnail = CASE WHEN a.image IS NOT NULL THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.sku = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.sku,@season_code + 'A',@season_code + 'I') 
					 WHEN @po_type = 'Closeout' THEN REPLACE(a.sku,@season_code + 'A',@season_code + 'C') END,
		a.url_key = CASE WHEN a.type = 'simple' THEN NULL ELSE a.url_key END,
		a.season_id = CASE WHEN @po_type = 'Inline' THEN @season_code + ' Inline' 
						   WHEN @po_type = 'Closeout' THEN @season_code + ' Closeout' END,
		a.simples_skus = CASE WHEN @po_type = 'Inline' AND a.type = 'configurable' THEN REPLACE(a.simples_skus,@season_code + 'A',@season_code + 'I') 
							  WHEN @po_type = 'Closeout' AND a.type = 'configurable' THEN REPLACE(a.simples_skus,@season_code + 'A',@season_code + 'C') 
							  WHEN a.type = 'simple' THEN NULL END,
		a.description = CASE WHEN a.type = 'simple' THEN NULL ELSE a.description END,
		a.features = CASE WHEN a.type = 'simple' THEN NULL ELSE a.features END,
		a.price = CASE WHEN a.price LIKE '%0.99%' THEN CAST(a.price AS float) - 1 ELSE a.price END
	FROM tbl_Purchase_Order AS a
	INNER JOIN tbl_Purchase_Order AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = @po_num
	 
	UPDATE a SET
		a.simples_skus = dbo.getAssociatedProducts(b.vendor_product_id,@po_num)
	FROM tbl_Purchase_Order AS a
	INNER JOIN tbl_Purchase_Order AS b
	ON a.sku = b.sku
	WHERE a.PO_NUM = @po_num AND a.type = 'configurable'
			
	--Begin simples_skus analysis:
	IF OBJECT_ID('tempdb..#po_style_color_size') IS NOT NULL BEGIN
	DROP TABLE #po_style_color_size
	END	
		
	CREATE TABLE #po_style_color_size (style varchar(155), color_code nvarchar(155), size_code varchar(155))
	
	SET @sql = '
	INSERT INTO #po_style_color_size (style, color_code, size_code)
	(SELECT DISTINCT a.vendor_product_id, a.vendor_color_code, a.vendor_size_code
	FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = REPLACE(b.style_color_size,'''''''','''') COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple'')'
	EXEC(@sql)
		
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand, b.sku AS sku
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code FROM OPENQUERY(MAGENTO,''
	SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, style_code.value AS style, color_code.value AS color_code, size_code.value AS size_code
	FROM
	(SELECT x.sku AS parent_sku, a.sku AS child_sku
	FROM catalog_product_entity AS a
	INNER JOIN (SELECT DISTINCT b.sku, a.product_id
				FROM catalog_product_super_link AS a
				INNER JOIN catalog_product_entity AS b
				ON a.parent_id = b.entity_id
				WHERE b.sku IN(' + @config_string + ')) AS x
	ON a.entity_id = x.product_id) AS simple_products
	INNER JOIN catalog_product_entity AS z
	ON simple_products.child_sku = z.sku AND z.type_id = ''''simple''''
	INNER JOIN catalog_product_entity_varchar AS style_code
	ON z.entity_id = style_code.entity_id AND style_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_product_id'''')
	INNER JOIN catalog_product_entity_varchar AS color_code
	ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_color_code'''')
	INNER JOIN catalog_product_entity_varchar AS size_code
	ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_size_code'''')
	INNER JOIN cataloginventory_stock_item AS stock
	ON z.entity_id = stock.product_id AND stock.stock_id = 1'')) AS b
	ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code
	WHERE (b.qty - b.qty_reserved) > 0'
	EXEC(@sql)
	
	--Create #view_Export_PO and insert into it a header row, as well as the contents of tbl_Purchase_Order (for the PO in question):
	IF OBJECT_ID('tempdb..##view_Export_PO') IS NOT NULL BEGIN
		DROP TABLE ##view_Export_PO
	END	
	
	CREATE TABLE ##view_Export_PO (store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),fabric nvarchar(MAX),care_instructions nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX),vendor_sku nvarchar(MAX))
	
	INSERT INTO ##view_Export_PO
	SELECT  '"store"' AS store, '"websites"' AS websites, '"type"' AS type, '"sku"' AS sku, '"name"' AS name, '"categories"' AS categories, '"attribute_set"' AS attribute_set, 
			'"configurable_attributes"' AS configurable_attributes, '"has_options"' AS has_options, '"price"' AS price, '"cost"' AS cost, '"super_attribute_pricing"' AS super_attribute_pricing, '"status"' AS status, '"tax_class_id"' AS tax_class_id, '"department"' AS department, 
			'"visibility"' AS visibility, '"image"' AS image, '"image_label"' AS image_label, '"small_image"' AS small_image, '"thumbnail"' AS thumbnail,
			'"choose_color"' AS choose_color, '"choose_size"' AS choose_size, '"vendor_product_id"' AS vendor_product_id, '"vendor_color_code"' AS vendor_color_code, 
			'"vendor_size_code"' AS vendor_size_code, '"season_id"' AS season_id, '"description"' AS description, '"features"' AS features, '"fabric"' AS fabric, '"care_instructions"' AS care_instructions,
			'"fit"' AS fit, '"volume"' AS volume, '"manufacturer"' AS manufacturer, '"qty"' AS qty, '"is_in_stock"' AS is_in_stock, '"simples_skus"' AS simples_skus, '"url_key"' AS url_key, '"meta_title"' AS meta_title,
			'"merchandise_priority"' AS merchandise_priority, '"never_backorder"' AS never_backorder, '"backorders"' AS backorders, '"manage_stock"' AS manage_stock, '"use_config_backorders"' AS use_config_backorders, '"use_config_manage_stock"' AS use_config_manage_stock, '"vendor_sku"' AS vendor_sku
	UNION ALL
	SELECT  '"' + RTRIM(LTRIM(REPLACE(store,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(websites,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(type,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(sku,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(name,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(categories,'"','""'))) + '"','"default"','"' + RTRIM(LTRIM(REPLACE(configurable_attributes,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(has_options,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(price,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(cost,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(super_attribute_pricing,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(status,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(tax_class_id,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(department,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(visibility,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(image_label,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(small_image,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(thumbnail,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(choose_color,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(choose_size,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_product_id,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_size_code,'"','""'))) + '"','"' + @season_code + ' Inline"','"' + RTRIM(LTRIM(REPLACE(description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fabric,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(care_instructions,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fit,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(volume,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manufacturer,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(qty,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(is_in_stock,'"','""'))) + '"', '"' + RTRIM(LTRIM(REPLACE(simples_skus,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(url_key,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(meta_title,'"','""'))) + '"',
			'"' + RTRIM(LTRIM(REPLACE(merchandise_priority,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(never_backorder,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_backorders,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(use_config_manage_stock,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_sku,'"','""'))) + '"'
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num
	ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code 
	
	--Return the contents of the #missing_data table at the end so that the final output of the procedure is as follows: simples_skus analysis -> Errors -> LINT output
	SELECT * FROM #missing_data ORDER BY issue
	
	--Begin final export and LINT process: (the same file is copied into C:\PHP\LoadFiles on FS01, and C:\Data\Shared also on FS01)
	DECLARE @cmd varchar(1024)
	
	SET @cmd = 'bcp "SELECT * FROM ##view_Export_PO ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code" queryout "C:\Data\Shared\' + @po_num + '.csv" -w -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'bcp "SELECT * FROM ##view_Export_PO ORDER BY type DESC,department,vendor_product_id,vendor_color_code,vendor_size_code" queryout "C:\PHP\LoadFiles\' + @po_num + '.csv" -w -t , -T -S ' + @@servername
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'copy "C:\PHP\LoadFiles\' + @po_num + '.csv" "C:\PHP\LoadFiles\temp-' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'iconv -f UTF-16 -t UTF-8 "C:\PHP\LoadFiles\temp-' + @po_num + '.csv" > "C:\PHP\LoadFiles\' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'del "C:\PHP\LoadFiles\temp-' + @po_num + '.csv"'
	EXEC master..xp_cmdshell @cmd, NO_OUTPUT

	SET @cmd = 'C:\PHP\php C:\PHP\LoadFiles\LINT.php C:\PHP\LoadFiles\' + @po_num + '.csv'
	EXEC master..xp_cmdshell @cmd
END
GO

/* START: */

EXEC Inline_Closeout_PO_Building 'MAR-DOTD-NOV25', 'Closeout', 'Marmot', 'MAR', 'FW13', 401, 61

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/

