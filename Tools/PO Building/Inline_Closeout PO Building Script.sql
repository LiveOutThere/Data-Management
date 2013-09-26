USE LOT_Purchasing
GO

ALTER PROCEDURE Inline_Closeout_PO_Building
	@po_num varchar(30), 
	@po_type nvarchar(30), 
	@brand nvarchar(30),
	@brand_code nvarchar(30),
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
	SELECT '100297-001-L' UNION ALL
	SELECT '100297-001-M' UNION ALL
	SELECT '100297-001-S' UNION ALL
	SELECT '100297-001-XL' UNION ALL
	SELECT '100297-001-XS' UNION ALL
	SELECT '100297-J82-L' UNION ALL
	SELECT '100297-J82-M' UNION ALL
	SELECT '100297-J82-S' UNION ALL
	SELECT '100297-J82-XL' UNION ALL
	SELECT '100297-J82-XS' UNION ALL
	SELECT '100348-184-L' UNION ALL
	SELECT '100348-184-M' UNION ALL
	SELECT '100348-184-S' UNION ALL
	SELECT '100348-184-XL' UNION ALL
	SELECT '100348-184-XS' UNION ALL
	SELECT '100348-F49-L' UNION ALL
	SELECT '100348-F49-M' UNION ALL
	SELECT '100348-F49-S' UNION ALL
	SELECT '100348-F49-XL' UNION ALL
	SELECT '100348-F49-XS' UNION ALL
	SELECT '100348-J81-L' UNION ALL
	SELECT '100348-J81-M' UNION ALL
	SELECT '100348-J81-S' UNION ALL
	SELECT '100348-J81-XL' UNION ALL
	SELECT '100348-J81-XS' UNION ALL
	SELECT '100386-001-L' UNION ALL
	SELECT '100386-001-M' UNION ALL
	SELECT '100386-001-S' UNION ALL
	SELECT '100386-001-XL' UNION ALL
	SELECT '100386-001-XS' UNION ALL
	SELECT '100406-001-L' UNION ALL
	SELECT '100406-001-M' UNION ALL
	SELECT '100406-001-S' UNION ALL
	SELECT '100406-001-XL' UNION ALL
	SELECT '100406-001-XS' UNION ALL
	SELECT '100406-110-L' UNION ALL
	SELECT '100406-110-M' UNION ALL
	SELECT '100406-110-S' UNION ALL
	SELECT '100406-110-XL' UNION ALL
	SELECT '100406-110-XS' UNION ALL
	SELECT '100406-D87-L' UNION ALL
	SELECT '100406-D87-M' UNION ALL
	SELECT '100406-D87-S' UNION ALL
	SELECT '100406-D87-XL' UNION ALL
	SELECT '100406-D87-XS' UNION ALL
	SELECT '100408-001-L' UNION ALL
	SELECT '100408-001-M' UNION ALL
	SELECT '100408-001-S' UNION ALL
	SELECT '100408-001-XL' UNION ALL
	SELECT '100408-001-XS' UNION ALL
	SELECT '100408-D87-L' UNION ALL
	SELECT '100408-D87-M' UNION ALL
	SELECT '100408-D87-S' UNION ALL
	SELECT '100408-D87-XL' UNION ALL
	SELECT '100408-D87-XS' UNION ALL
	SELECT '100466-001-L' UNION ALL
	SELECT '100466-001-M' UNION ALL
	SELECT '100466-001-S' UNION ALL
	SELECT '100466-001-XL' UNION ALL
	SELECT '100466-D04-L' UNION ALL
	SELECT '100466-D04-M' UNION ALL
	SELECT '100466-D04-S' UNION ALL
	SELECT '100466-D04-XL' UNION ALL
	SELECT '100466-D34-L' UNION ALL
	SELECT '100466-D34-M' UNION ALL
	SELECT '100466-D34-S' UNION ALL
	SELECT '100466-D34-XL' UNION ALL
	SELECT '100467-001-L' UNION ALL
	SELECT '100467-001-M' UNION ALL
	SELECT '100467-001-S' UNION ALL
	SELECT '100467-001-XL' UNION ALL
	SELECT '100467-D04-L' UNION ALL
	SELECT '100467-D04-M' UNION ALL
	SELECT '100467-D04-S' UNION ALL
	SELECT '100467-D04-XL' UNION ALL
	SELECT '100470-001-L' UNION ALL
	SELECT '100470-001-M' UNION ALL
	SELECT '100470-001-S' UNION ALL
	SELECT '100470-001-XL' UNION ALL
	SELECT '100470-001-XXL' UNION ALL
	SELECT '100470-J91-L' UNION ALL
	SELECT '100470-J91-M' UNION ALL
	SELECT '100470-J91-S' UNION ALL
	SELECT '100470-J91-XL' UNION ALL
	SELECT '100470-J93-L' UNION ALL
	SELECT '100470-J93-M' UNION ALL
	SELECT '100470-J93-S' UNION ALL
	SELECT '100470-J93-XL' UNION ALL
	SELECT '100471-001-L' UNION ALL
	SELECT '100471-001-M' UNION ALL
	SELECT '100471-001-S' UNION ALL
	SELECT '100471-001-XL' UNION ALL
	SELECT '100471-001-XXL' UNION ALL
	SELECT '100471-J91-L' UNION ALL
	SELECT '100471-J91-M' UNION ALL
	SELECT '100471-J91-S' UNION ALL
	SELECT '100471-J91-XL' UNION ALL
	SELECT '100471-J91-XXL' UNION ALL
	SELECT '100471-J92-L' UNION ALL
	SELECT '100471-J92-M' UNION ALL
	SELECT '100471-J92-S' UNION ALL
	SELECT '100471-J92-XL' UNION ALL
	SELECT '100471-J92-XXL' UNION ALL
	SELECT '100471-J93-L' UNION ALL
	SELECT '100471-J93-M' UNION ALL
	SELECT '100471-J93-S' UNION ALL
	SELECT '100471-J93-XL' UNION ALL
	SELECT '100473-001-L' UNION ALL
	SELECT '100473-001-M' UNION ALL
	SELECT '100473-001-S' UNION ALL
	SELECT '100473-001-XL' UNION ALL
	SELECT '100473-001-XXL' UNION ALL
	SELECT '100473-J91-L' UNION ALL
	SELECT '100473-J91-M' UNION ALL
	SELECT '100473-J91-S' UNION ALL
	SELECT '100473-J91-XL' UNION ALL
	SELECT '100473-J91-XXL' UNION ALL
	SELECT '100476-001-L' UNION ALL
	SELECT '100476-001-M' UNION ALL
	SELECT '100476-001-S' UNION ALL
	SELECT '100476-001-XL' UNION ALL
	SELECT '100476-001-XXL' UNION ALL
	SELECT '100477-001-L' UNION ALL
	SELECT '100477-001-M' UNION ALL
	SELECT '100477-001-S' UNION ALL
	SELECT '100477-001-XL' UNION ALL
	SELECT '100477-001-XXL' UNION ALL
	SELECT '100477-D34-L' UNION ALL
	SELECT '100477-D34-M' UNION ALL
	SELECT '100477-D34-S' UNION ALL
	SELECT '100477-D34-XL' UNION ALL
	SELECT '100477-D34-XXL' UNION ALL
	SELECT '100477-G67-L' UNION ALL
	SELECT '100477-G67-M' UNION ALL
	SELECT '100477-G67-S' UNION ALL
	SELECT '100477-G67-XL' UNION ALL
	SELECT '100477-G67-XXL' UNION ALL
	SELECT '100478-001-L' UNION ALL
	SELECT '100478-001-M' UNION ALL
	SELECT '100478-001-S' UNION ALL
	SELECT '100478-001-XL' UNION ALL
	SELECT '100478-J94-L' UNION ALL
	SELECT '100478-J94-M' UNION ALL
	SELECT '100478-J94-S' UNION ALL
	SELECT '100478-J94-XL' UNION ALL
	SELECT '100482-001-L' UNION ALL
	SELECT '100482-001-M' UNION ALL
	SELECT '100482-001-S' UNION ALL
	SELECT '100482-001-XL' UNION ALL
	SELECT '100482-001-XXL' UNION ALL
	SELECT '100482-J92-L' UNION ALL
	SELECT '100482-J92-M' UNION ALL
	SELECT '100482-J92-S' UNION ALL
	SELECT '100482-J92-XL' UNION ALL
	SELECT '100482-J92-XXL' UNION ALL
	SELECT '100487-001-L' UNION ALL
	SELECT '100487-001-M' UNION ALL
	SELECT '100487-001-S' UNION ALL
	SELECT '100487-001-XL' UNION ALL
	SELECT '100487-001-XXL' UNION ALL
	SELECT '100487-J17-L' UNION ALL
	SELECT '100487-J17-M' UNION ALL
	SELECT '100487-J17-S' UNION ALL
	SELECT '100487-J17-XL' UNION ALL
	SELECT '100487-J17-XXL' UNION ALL
	SELECT '100491-001-L' UNION ALL
	SELECT '100491-001-M' UNION ALL
	SELECT '100491-001-S' UNION ALL
	SELECT '100491-001-XL' UNION ALL
	SELECT '100491-J17-L' UNION ALL
	SELECT '100491-J17-M' UNION ALL
	SELECT '100491-J17-S' UNION ALL
	SELECT '100491-J17-XL' UNION ALL
	SELECT '100493-001-L' UNION ALL
	SELECT '100493-001-M' UNION ALL
	SELECT '100493-001-S' UNION ALL
	SELECT '100493-001-XL' UNION ALL
	SELECT '100500-001-L' UNION ALL
	SELECT '100500-001-M' UNION ALL
	SELECT '100500-001-S' UNION ALL
	SELECT '100500-001-XL' UNION ALL
	SELECT '100500-001-XS' UNION ALL
	SELECT '100500-F48-L' UNION ALL
	SELECT '100500-F48-M' UNION ALL
	SELECT '100500-F48-S' UNION ALL
	SELECT '100500-F48-XL' UNION ALL
	SELECT '100500-F48-XS' UNION ALL
	SELECT '100500-J78-L' UNION ALL
	SELECT '100500-J78-M' UNION ALL
	SELECT '100500-J78-S' UNION ALL
	SELECT '100500-J78-XL' UNION ALL
	SELECT '100500-J78-XS' UNION ALL
	SELECT '100509-001-L' UNION ALL
	SELECT '100509-001-M' UNION ALL
	SELECT '100509-001-S' UNION ALL
	SELECT '100509-001-XL' UNION ALL
	SELECT '100509-001-XS' UNION ALL
	SELECT '100509-F48-L' UNION ALL
	SELECT '100509-F48-M' UNION ALL
	SELECT '100509-F48-S' UNION ALL
	SELECT '100509-F48-XL' UNION ALL
	SELECT '100509-F48-XS' UNION ALL
	SELECT '100509-J78-L' UNION ALL
	SELECT '100509-J78-M' UNION ALL
	SELECT '100509-J78-S' UNION ALL
	SELECT '100509-J78-XL' UNION ALL
	SELECT '100509-J78-XS' UNION ALL
	SELECT '100514-001-L' UNION ALL
	SELECT '100514-001-M' UNION ALL
	SELECT '100514-001-S' UNION ALL
	SELECT '100514-001-XL' UNION ALL
	SELECT '100514-001-XS' UNION ALL
	SELECT '100514-J78-L' UNION ALL
	SELECT '100514-J78-M' UNION ALL
	SELECT '100514-J78-S' UNION ALL
	SELECT '100514-J78-XS' UNION ALL
	SELECT '100515-G56-L' UNION ALL
	SELECT '100515-G56-M' UNION ALL
	SELECT '100515-G56-S' UNION ALL
	SELECT '100515-G56-XL' UNION ALL
	SELECT '100515-G56-XS' UNION ALL
	SELECT '100515-J86-L' UNION ALL
	SELECT '100515-J86-M' UNION ALL
	SELECT '100515-J86-S' UNION ALL
	SELECT '100515-J86-XL' UNION ALL
	SELECT '100515-J86-XS' UNION ALL
	SELECT '100521-001-L' UNION ALL
	SELECT '100521-001-M' UNION ALL
	SELECT '100521-001-S' UNION ALL
	SELECT '100521-001-XL' UNION ALL
	SELECT '100521-001-XS' UNION ALL
	SELECT '100521-J82-L' UNION ALL
	SELECT '100521-J82-M' UNION ALL
	SELECT '100521-J82-S' UNION ALL
	SELECT '100521-J82-XL' UNION ALL
	SELECT '100521-J82-XS' UNION ALL
	SELECT '100526-001-L' UNION ALL
	SELECT '100526-001-M' UNION ALL
	SELECT '100526-001-S' UNION ALL
	SELECT '100526-001-XL' UNION ALL
	SELECT '100526-001-XS' UNION ALL
	SELECT '100536-001-L' UNION ALL
	SELECT '100536-001-M' UNION ALL
	SELECT '100536-001-S' UNION ALL
	SELECT '100536-001-XL' UNION ALL
	SELECT '100536-J91-L' UNION ALL
	SELECT '100536-J91-M' UNION ALL
	SELECT '100536-J91-S' UNION ALL
	SELECT '100536-J91-XL' UNION ALL
	SELECT '100537-001-L' UNION ALL
	SELECT '100537-001-M' UNION ALL
	SELECT '100537-001-S' UNION ALL
	SELECT '100537-001-XL' UNION ALL
	SELECT '100537-D34-L' UNION ALL
	SELECT '100537-D34-M' UNION ALL
	SELECT '100537-D34-S' UNION ALL
	SELECT '100537-D34-XL' UNION ALL
	SELECT '100544-001-L' UNION ALL
	SELECT '100544-001-M' UNION ALL
	SELECT '100544-001-S' UNION ALL
	SELECT '100544-001-XL' UNION ALL
	SELECT '100544-001-XS' UNION ALL
	SELECT '100544-G56-L' UNION ALL
	SELECT '100544-G56-M' UNION ALL
	SELECT '100544-G56-S' UNION ALL
	SELECT '100544-G56-XL' UNION ALL
	SELECT '100544-G56-XS' UNION ALL
	SELECT '100544-J86-L' UNION ALL
	SELECT '100544-J86-M' UNION ALL
	SELECT '100544-J86-S' UNION ALL
	SELECT '100544-J86-XL' UNION ALL
	SELECT '100544-J86-XS' UNION ALL
	SELECT '100574-001-L' UNION ALL
	SELECT '100574-001-M' UNION ALL
	SELECT '100574-001-S' UNION ALL
	SELECT '100574-001-XL' UNION ALL
	SELECT '100574-001-XS' UNION ALL
	SELECT '100574-184-L' UNION ALL
	SELECT '100574-184-M' UNION ALL
	SELECT '100574-184-S' UNION ALL
	SELECT '100574-184-XL' UNION ALL
	SELECT '100574-184-XS' UNION ALL
	SELECT '100710-001-O/S' UNION ALL
	SELECT '100710-F49-O/S' UNION ALL
	SELECT '100710-J78-O/S' UNION ALL
	SELECT '100710-J81-O/S' UNION ALL
	SELECT '100719-001-L' UNION ALL
	SELECT '100719-001-M' UNION ALL
	SELECT '100719-001-S' UNION ALL
	SELECT '100719-001-XL' UNION ALL
	SELECT '100730-001-L' UNION ALL
	SELECT '100730-001-M' UNION ALL
	SELECT '100730-001-S' UNION ALL
	SELECT '100730-001-XL' UNION ALL
	SELECT '100730-001-XS' UNION ALL
	SELECT '100746-001-O/S' UNION ALL
	SELECT '100746-D87-O/S' UNION ALL
	SELECT '100746-J78-O/S' UNION ALL
	SELECT '100753-001-L' UNION ALL
	SELECT '100753-001-M' UNION ALL
	SELECT '100753-001-S' UNION ALL
	SELECT '100753-001-XL' UNION ALL
	SELECT '100753-001-XS' UNION ALL
	SELECT '100753-110-L' UNION ALL
	SELECT '100753-110-M' UNION ALL
	SELECT '100753-110-S' UNION ALL
	SELECT '100753-110-XL' UNION ALL
	SELECT '100753-110-XS' UNION ALL
	SELECT '100753-J78-L' UNION ALL
	SELECT '100753-J78-M' UNION ALL
	SELECT '100753-J78-S' UNION ALL
	SELECT '100753-J78-XL' UNION ALL
	SELECT '100753-J78-XS' UNION ALL
	SELECT '100755-001-L' UNION ALL
	SELECT '100755-001-M' UNION ALL
	SELECT '100755-001-S' UNION ALL
	SELECT '100755-001-XL' UNION ALL
	SELECT '100755-001-XXL' UNION ALL
	SELECT '100755-595-L' UNION ALL
	SELECT '100755-595-M' UNION ALL
	SELECT '100755-595-S' UNION ALL
	SELECT '100755-595-XL' UNION ALL
	SELECT '100755-J91-L' UNION ALL
	SELECT '100755-J91-M' UNION ALL
	SELECT '100755-J91-S' UNION ALL
	SELECT '100755-J91-XL' UNION ALL
	SELECT '100755-J91-XXL' UNION ALL
	SELECT '100770-001-L' UNION ALL
	SELECT '100770-001-M' UNION ALL
	SELECT '100770-001-S' UNION ALL
	SELECT '100770-001-XL' UNION ALL
	SELECT '100770-001-XS' UNION ALL
	SELECT '100771-J77-L' UNION ALL
	SELECT '100771-J77-M' UNION ALL
	SELECT '100771-J77-S' UNION ALL
	SELECT '100771-J77-XL' UNION ALL
	SELECT '100771-J77-XS' UNION ALL
	SELECT '100795-J78-L' UNION ALL
	SELECT '100795-J78-M' UNION ALL
	SELECT '100795-J78-S' UNION ALL
	SELECT '100795-J78-XL' UNION ALL
	SELECT '100795-J78-XS' UNION ALL
	SELECT '100801-J81-L' UNION ALL
	SELECT '100801-J81-M' UNION ALL
	SELECT '100801-J81-S' UNION ALL
	SELECT '100801-J81-XL' UNION ALL
	SELECT '100801-J81-XS' UNION ALL
	SELECT '100801-J82-L' UNION ALL
	SELECT '100801-J82-M' UNION ALL
	SELECT '100801-J82-S' UNION ALL
	SELECT '100801-J82-XL' UNION ALL
	SELECT '100801-J82-XS' UNION ALL
	SELECT '100806-D34-L' UNION ALL
	SELECT '100806-D34-M' UNION ALL
	SELECT '100806-D34-S' UNION ALL
	SELECT '100806-D34-XL' UNION ALL
	SELECT '100806-F72-L' UNION ALL
	SELECT '100806-F72-M' UNION ALL
	SELECT '100806-F72-S' UNION ALL
	SELECT '100806-F72-XL' UNION ALL
	SELECT '100809-J17-L' UNION ALL
	SELECT '100809-J17-M' UNION ALL
	SELECT '100809-J17-S' UNION ALL
	SELECT '100809-J17-XL' UNION ALL
	SELECT '100809-J17-XXL' UNION ALL
	SELECT '100809-J92-L' UNION ALL
	SELECT '100809-J92-M' UNION ALL
	SELECT '100809-J92-S' UNION ALL
	SELECT '100809-J92-XL' UNION ALL
	SELECT '100809-J92-XXL' UNION ALL
	SELECT '100821-J81-O/S' UNION ALL
	SELECT '100823-184-L' UNION ALL
	SELECT '100823-184-M' UNION ALL
	SELECT '100823-184-S' UNION ALL
	SELECT '100823-184-XL' UNION ALL
	SELECT '100823-184-XS' UNION ALL
	SELECT '100823-J81-L' UNION ALL
	SELECT '100823-J81-M' UNION ALL
	SELECT '100823-J81-S' UNION ALL
	SELECT '100823-J81-XL' UNION ALL
	SELECT '100823-J81-XS' UNION ALL
	SELECT '100832-001-L' UNION ALL
	SELECT '100832-001-M' UNION ALL
	SELECT '100832-001-S' UNION ALL
	SELECT '100832-001-XL' UNION ALL
	SELECT '100832-001-XS' UNION ALL
	SELECT '100832-G67-L' UNION ALL
	SELECT '100832-G67-M' UNION ALL
	SELECT '100832-G67-S' UNION ALL
	SELECT '100832-G67-XL' UNION ALL
	SELECT '100832-G67-XS' UNION ALL
	SELECT '100832-J81-L' UNION ALL
	SELECT '100832-J81-M' UNION ALL
	SELECT '100832-J81-S' UNION ALL
	SELECT '100832-J81-XL' UNION ALL
	SELECT '100832-J81-XS' UNION ALL
	SELECT '100836-001-L' UNION ALL
	SELECT '100836-001-M' UNION ALL
	SELECT '100836-001-S' UNION ALL
	SELECT '100836-001-XL' UNION ALL
	SELECT '100836-001-XS' UNION ALL
	SELECT '100836-C64-L' UNION ALL
	SELECT '100836-C64-M' UNION ALL
	SELECT '100836-C64-S' UNION ALL
	SELECT '100836-C64-XL' UNION ALL
	SELECT '100873-001-L' UNION ALL
	SELECT '100873-001-M' UNION ALL
	SELECT '100873-001-S' UNION ALL
	SELECT '100873-001-XL' UNION ALL
	SELECT '100873-D34-L' UNION ALL
	SELECT '100873-D34-M' UNION ALL
	SELECT '100873-D34-S' UNION ALL
	SELECT '100873-D34-XL' UNION ALL
	SELECT '100873-G67-L' UNION ALL
	SELECT '100873-G67-M' UNION ALL
	SELECT '100873-G67-S' UNION ALL
	SELECT '100873-G67-XL' UNION ALL
	SELECT '100923-J81-L' UNION ALL
	SELECT '100923-J81-M' UNION ALL
	SELECT '100923-J81-S' UNION ALL
	SELECT '100923-J81-XL' UNION ALL
	SELECT '100923-J81-XS' UNION ALL
	SELECT '100930-F72-L' UNION ALL
	SELECT '100930-F72-M' UNION ALL
	SELECT '100930-F72-S' UNION ALL
	SELECT '100930-F72-XL' UNION ALL
	SELECT '100931-F72-L' UNION ALL
	SELECT '100931-F72-M' UNION ALL
	SELECT '100931-F72-S' UNION ALL
	SELECT '100931-F72-XL' UNION ALL
	SELECT '100939-J92-L' UNION ALL
	SELECT '100939-J92-M' UNION ALL
	SELECT '100939-J92-S' UNION ALL
	SELECT '100939-J92-XL' UNION ALL
	SELECT '100959-001-O/S' UNION ALL
	SELECT '100962-001-O/S' UNION ALL
	SELECT '100963-F72-L' UNION ALL
	SELECT '100963-F72-M' UNION ALL
	SELECT '100963-F72-S' UNION ALL
	SELECT '100963-F72-XL' UNION ALL
	SELECT '101266-001-L' UNION ALL
	SELECT '101266-001-M' UNION ALL
	SELECT '101266-001-S' UNION ALL
	SELECT '101266-001-XL' UNION ALL
	SELECT '101266-001-XXL' UNION ALL
	SELECT '101306-001-L' UNION ALL
	SELECT '101306-001-M' UNION ALL
	SELECT '101306-001-S' UNION ALL
	SELECT '101306-001-XL' UNION ALL
	SELECT '101306-001-XS' UNION ALL
	SELECT 'IBM200-H06-O/S' UNION ALL
	SELECT 'IBM200-K06-O/S' UNION ALL
	SELECT 'IBM200-K10-O/S' UNION ALL
	SELECT 'IBMC84-001-O/S' UNION ALL
	SELECT 'IBMC84-F48-O/S' UNION ALL
	SELECT 'IBMC84-K23-O/S' UNION ALL
	SELECT 'IBMC84-K25-O/S' UNION ALL
	SELECT 'IBMD29-001-L' UNION ALL
	SELECT 'IBMD29-001-M' UNION ALL
	SELECT 'IBMD29-001-S' UNION ALL
	SELECT 'IBMD29-001-XL' UNION ALL
	SELECT 'IBMD29-001-XS' UNION ALL
	SELECT 'IBMD31-001-L' UNION ALL
	SELECT 'IBMD31-001-M' UNION ALL
	SELECT 'IBMD31-001-S' UNION ALL
	SELECT 'IBMD31-001-XL' UNION ALL
	SELECT 'IBMD31-001-XS')

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '100297' UNION ALL
	SELECT '100348' UNION ALL
	SELECT '100386' UNION ALL
	SELECT '100406' UNION ALL
	SELECT '100408' UNION ALL
	SELECT '100466' UNION ALL
	SELECT '100467' UNION ALL
	SELECT '100470' UNION ALL
	SELECT '100471' UNION ALL
	SELECT '100473' UNION ALL
	SELECT '100476' UNION ALL
	SELECT '100477' UNION ALL
	SELECT '100478' UNION ALL
	SELECT '100482' UNION ALL
	SELECT '100487' UNION ALL
	SELECT '100491' UNION ALL
	SELECT '100493' UNION ALL
	SELECT '100500' UNION ALL
	SELECT '100509' UNION ALL
	SELECT '100514' UNION ALL
	SELECT '100515' UNION ALL
	SELECT '100521' UNION ALL
	SELECT '100526' UNION ALL
	SELECT '100536' UNION ALL
	SELECT '100537' UNION ALL
	SELECT '100544' UNION ALL
	SELECT '100574' UNION ALL
	SELECT '100710' UNION ALL
	SELECT '100719' UNION ALL
	SELECT '100730' UNION ALL
	SELECT '100746' UNION ALL
	SELECT '100753' UNION ALL
	SELECT '100755' UNION ALL
	SELECT '100770' UNION ALL
	SELECT '100771' UNION ALL
	SELECT '100795' UNION ALL
	SELECT '100801' UNION ALL
	SELECT '100806' UNION ALL
	SELECT '100809' UNION ALL
	SELECT '100821' UNION ALL
	SELECT '100823' UNION ALL
	SELECT '100832' UNION ALL
	SELECT '100836' UNION ALL
	SELECT '100873' UNION ALL
	SELECT '100923' UNION ALL
	SELECT '100930' UNION ALL
	SELECT '100931' UNION ALL
	SELECT '100939' UNION ALL
	SELECT '100959' UNION ALL
	SELECT '100962' UNION ALL
	SELECT '100963' UNION ALL
	SELECT '101266' UNION ALL
	SELECT '101306' UNION ALL
	SELECT 'IBM200' UNION ALL
	SELECT 'IBMC84' UNION ALL
	SELECT 'IBMD29' UNION ALL
	SELECT 'IBMD31')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''IB-100297'''',''''IB-100348'''',''''IB-100386'''',''''IB-100406'''',''''IB-100408'''',''''IB-100466'''',''''IB-100467'''',''''IB-100470'''',''''IB-100471'''',''''IB-100473'''',''''IB-100476'''',''''IB-100477'''',''''IB-100478'''',''''IB-100482'''',''''IB-100487'''',''''IB-100491'''',''''IB-100493'''',''''IB-100500'''',''''IB-100509'''',''''IB-100514'''',''''IB-100515'''',''''IB-100521'''',''''IB-100526'''',''''IB-100536'''',''''IB-100537'''',''''IB-100544'''',''''IB-100574'''',''''IB-100710'''',''''IB-100719'''',''''IB-100730'''',''''IB-100746'''',''''IB-100753'''',''''IB-100755'''',''''IB-100770'''',''''IB-100771'''',''''IB-100795'''',''''IB-100801'''',''''IB-100806'''',''''IB-100809'''',''''IB-100821'''',''''IB-100823'''',''''IB-100832'''',''''IB-100836'''',''''IB-100873'''',''''IB-100923'''',''''IB-100930'''',''''IB-100931'''',''''IB-100939'''',''''IB-100959'''',''''IB-100962'''',''''IB-100963'''',''''IB-101266'''',''''IB-101306'''',''''IB-IBM200'''',''''IB-IBMC84'''',''''IB-IBMD29'''',''''IB-IBMD31'''''
	
	--Here #view_PO_LoadFile gets created and then populated with the desired rows from your desired loadfile:
	IF OBJECT_ID('tempdb..#view_PO_LoadFile') IS NOT NULL BEGIN
		DROP TABLE #view_PO_LoadFile
	END	
	
	CREATE TABLE #view_PO_LoadFile (id int,store nvarchar(MAX),websites nvarchar(MAX),type nvarchar(100),sku nvarchar(100),name nvarchar(MAX),categories nvarchar(MAX),attribute_set nvarchar(MAX),configurable_attributes nvarchar(MAX),has_options nvarchar(MAX),price nvarchar(MAX),cost nvarchar(MAX),super_attribute_pricing nvarchar(MAX),status nvarchar(MAX),tax_class_id nvarchar(MAX),department nvarchar(MAX),visibility nvarchar(MAX),image nvarchar(MAX),image_label nvarchar(MAX),small_image nvarchar(MAX),thumbnail nvarchar(MAX),choose_color nvarchar(MAX),choose_size nvarchar(MAX),vendor_sku nvarchar(MAX),vendor_product_id nvarchar(100),vendor_color_code nvarchar(MAX),vendor_size_code nvarchar(MAX),season_id nvarchar(MAX),short_description nvarchar(MAX),description nvarchar(MAX),features nvarchar(MAX),activities nvarchar(MAX),weather nvarchar(MAX),layering nvarchar(MAX),care_instructions nvarchar(MAX),fabric nvarchar(MAX),fit nvarchar(MAX),volume nvarchar(MAX),manufacturer nvarchar(MAX),qty nvarchar(MAX),is_in_stock nvarchar(MAX),simples_skus nvarchar(MAX),url_key nvarchar(MAX),meta_title nvarchar(MAX),videos nvarchar(MAX),weight nvarchar(MAX),merchandise_priority nvarchar(MAX),never_backorder nvarchar(MAX),backorders nvarchar(MAX),manage_stock nvarchar(MAX),use_config_backorders nvarchar(MAX),use_config_manage_stock nvarchar(MAX))
	
	DECLARE @sql varchar(MAX)
	SET @sql = '
	INSERT INTO #view_PO_LoadFile
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = b.style_color_size COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple''
	
	UNION ALL
	
	SELECT a.*
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON a.vendor_product_id COLLATE Latin1_General_CI_AS = b.vendor_product_id COLLATE Latin1_General_CI_AS
	WHERE a.type = ''configurable''
	ORDER BY a.type DESC,a.department,a.vendor_product_id,a.vendor_color_code,a.vendor_size_code'
	EXEC (@sql)
	
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
	WHERE PO_NUM = @po_num AND type = 'configurable' AND description IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Features', name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'configurable' AND features IS NULL
	
	UPDATE #missing_data SET issue = 'Missing Description & Features' WHERE name IN(
		SELECT DISTINCT name
		FROM #missing_data
		GROUP BY name
		HAVING COUNT(*) > 1 AND MAX(issue) <> 'Missing Image')
	
	DELETE FROM #missing_data WHERE id IN(
		SELECT MAX(id)
		FROM #missing_data
		GROUP BY name
		HAVING MAX(issue) = 'Missing Description & Features')
	
	/* BEGIN DATA MANIPULATION */
	
	--Update the categories values for configurables without categories:
	UPDATE a SET
		a.categories = b.categories
	FROM tbl_Purchase_Order AS a
	INNER JOIN LOT_Inventory.dbo.tbl_Magento_Categories AS b
	ON a.sku COLLATE SQL_Latin1_General_CP1_CI_AS = b.sku COLLATE SQL_Latin1_General_CP1_CI_AS
	WHERE a.PO_NUM = @po_num AND a.type = 'configurable'
	
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
		a.sku = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.sku,'FW13A','FW13I') 
					 WHEN @po_type = 'Closeout' THEN REPLACE(a.sku,'FW13A','FW13C') END,
		a.url_key = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.url_key,'fw13a','fw13i') 
						 WHEN @po_type = 'Closeout' THEN REPLACE(a.url_key,'fw13a','fw13c') END,
		a.season_id = CASE WHEN @po_type = 'Inline' THEN 'FW13 Inline' 
						   WHEN @po_type = 'Closeout' THEN 'FW13 Closeout' END,
		a.simples_skus = CASE WHEN @po_type = 'Inline' THEN REPLACE(a.simples_skus,'FW13A','FW13I') 
							  WHEN @po_type = 'Closeout' THEN REPLACE(a.simples_skus,'FW13A','FW13C') END,
		a.description = CASE WHEN a.type = 'simple' THEN NULL ELSE a.description END,
		a.features = CASE WHEN a.type = 'simple' THEN NULL ELSE a.features END
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
		
	CREATE TABLE #po_style_color_size (style varchar(155), color_code varchar(155), size_code varchar(155))
	
	SET @sql = '
	INSERT INTO #po_style_color_size (style, color_code, size_code)
	(SELECT DISTINCT a.vendor_product_id, a.vendor_color_code, a.vendor_size_code
	FROM LOT_Inventory.dbo.tbl_LoadFile_FW13_' + @brand_code + ' AS a
	INNER JOIN #PO_DATA AS b
	ON (a.vendor_product_id + ''-'' + a.vendor_color_code + ''-'' + a.vendor_size_code) COLLATE Latin1_General_CI_AS = REPLACE(b.style_color_size,'''''''','''') COLLATE Latin1_General_CI_AS
	WHERE a.type = ''simple'')'
	EXEC(@sql)
		
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code FROM OPENQUERY(MAGENTO,''
	SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, z.vendor_product_id AS style, color_code.value AS color_code, size_code.value AS size_code
	FROM
	(SELECT x.sku AS parent_sku, a.sku AS child_sku
	FROM catalog_product_entity AS a
	INNER JOIN (SELECT DISTINCT b.sku, a.product_id
				FROM catalog_product_super_link AS a
				INNER JOIN catalog_product_entity AS b
				ON a.parent_id = b.entity_id
				WHERE b.sku IN(' + @config_string + ')) AS x
	ON a.entity_id = x.product_id) AS simple_products
	INNER JOIN catalog_product_flat_1 AS z
	ON simple_products.child_sku = z.sku
	INNER JOIN catalog_product_entity_varchar AS color_code
	ON z.entity_id = color_code.entity_id AND color_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_color_code'''')
	INNER JOIN catalog_product_entity_varchar AS size_code
	ON z.entity_id = size_code.entity_id AND size_code.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_size_code'''')
	INNER JOIN cataloginventory_stock_item AS stock
	ON z.entity_id = stock.product_id AND stock.stock_id = 1'')) AS b
	ON a.style = b.style AND a.color_code = b.color_code AND a.size_code = b.size_code
	ORDER BY b.style, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1), CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END'
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
			'"' + RTRIM(LTRIM(REPLACE(vendor_color_code,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(vendor_size_code,'"','""'))) + '"','"FW13 Inline"','"' + RTRIM(LTRIM(REPLACE(description,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(features,'"','""'))) + '"','"' + RTRIM(LTRIM(REPLACE(fabric,'"','""'))) + '"',
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

EXEC Inline_Closeout_PO_Building 'IB-F13-1', 'Inline', 'Icebreaker', 'IB', 467, 57

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/

