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
	SELECT '100711-001-XS' UNION ALL
	SELECT '100711-001-S' UNION ALL
	SELECT '100711-001-M' UNION ALL
	SELECT '100711-001-L' UNION ALL
	SELECT '100711-001-XL' UNION ALL
	SELECT '100711-J82-XS' UNION ALL
	SELECT '100711-J82-S' UNION ALL
	SELECT '100711-J82-M' UNION ALL
	SELECT '100711-J82-L' UNION ALL
	SELECT '100711-J82-XL' UNION ALL
	SELECT '100531-001-S' UNION ALL
	SELECT '100531-001-M' UNION ALL
	SELECT '100531-001-L' UNION ALL
	SELECT '100531-001-XL' UNION ALL
	SELECT '100531-001-XXL' UNION ALL
	SELECT '100531-J91-S' UNION ALL
	SELECT '100531-J91-M' UNION ALL
	SELECT '100531-J91-L' UNION ALL
	SELECT '100531-J91-XXL' UNION ALL
	SELECT '100539-001-XS' UNION ALL
	SELECT '100539-001-S' UNION ALL
	SELECT '100539-001-M' UNION ALL
	SELECT '100539-001-L' UNION ALL
	SELECT '100539-001-XL' UNION ALL
	SELECT '100539-J82-XS' UNION ALL
	SELECT '100539-J82-S' UNION ALL
	SELECT '100539-J82-M' UNION ALL
	SELECT '100539-J82-L' UNION ALL
	SELECT '100539-J82-XL' UNION ALL
	SELECT '100530-001-S' UNION ALL
	SELECT '100530-001-M' UNION ALL
	SELECT '100530-001-L' UNION ALL
	SELECT '100530-001-XL' UNION ALL
	SELECT '100530-001-XXL' UNION ALL
	SELECT '100530-J91-S' UNION ALL
	SELECT '100530-J91-M' UNION ALL
	SELECT '100530-J91-L' UNION ALL
	SELECT '100530-J91-XL' UNION ALL
	SELECT '100530-J91-XXL' UNION ALL
	SELECT '100834-001-XS' UNION ALL
	SELECT '100834-001-S' UNION ALL
	SELECT '100834-001-M' UNION ALL
	SELECT '100834-001-L' UNION ALL
	SELECT '100834-001-XL' UNION ALL
	SELECT '100834-G56-XS' UNION ALL
	SELECT '100834-G56-S' UNION ALL
	SELECT '100834-G56-M' UNION ALL
	SELECT '100834-G56-L' UNION ALL
	SELECT '100834-G56-XL' UNION ALL
	SELECT '100541-001-XS' UNION ALL
	SELECT '100541-001-S' UNION ALL
	SELECT '100541-001-M' UNION ALL
	SELECT '100541-001-L' UNION ALL
	SELECT '100541-J82-M' UNION ALL
	SELECT '100541-J82-L' UNION ALL
	SELECT '100541-J82-XL' UNION ALL
	SELECT '100878-001-S' UNION ALL
	SELECT '100878-001-M' UNION ALL
	SELECT '100878-001-L' UNION ALL
	SELECT '100878-001-XL' UNION ALL
	SELECT '100878-001-XXL' UNION ALL
	SELECT '100878-D34-M' UNION ALL
	SELECT '100878-D34-L' UNION ALL
	SELECT '100878-D34-XL' UNION ALL
	SELECT '100878-D34-XXL' UNION ALL
	SELECT '100533-001-S' UNION ALL
	SELECT '100533-001-M' UNION ALL
	SELECT '100533-001-L' UNION ALL
	SELECT '100533-001-XL' UNION ALL
	SELECT '100533-001-XXL' UNION ALL
	SELECT '100829-L73-XS' UNION ALL
	SELECT '100829-L73-S' UNION ALL
	SELECT '100829-L73-M' UNION ALL
	SELECT '100829-L73-L' UNION ALL
	SELECT '100829-L73-XL' UNION ALL
	SELECT '100829-D87-XS' UNION ALL
	SELECT '100829-D87-S' UNION ALL
	SELECT '100829-D87-M' UNION ALL
	SELECT '100829-D87-L' UNION ALL
	SELECT '100829-D87-XL' UNION ALL
	SELECT '100833-001-XS' UNION ALL
	SELECT '100833-001-S' UNION ALL
	SELECT '100833-001-M' UNION ALL
	SELECT '100833-001-L' UNION ALL
	SELECT '100833-001-XL' UNION ALL
	SELECT '100875-001-S' UNION ALL
	SELECT '100875-001-M' UNION ALL
	SELECT '100875-001-XL' UNION ALL
	SELECT '100875-001-XXL' UNION ALL
	SELECT '100875-L29-S' UNION ALL
	SELECT '100875-L29-M' UNION ALL
	SELECT '100875-L29-L' UNION ALL
	SELECT '100875-L29-XL' UNION ALL
	SELECT '100875-L29-XXL' UNION ALL
	SELECT '100877-001-S' UNION ALL
	SELECT '100877-001-M' UNION ALL
	SELECT '100877-001-L' UNION ALL
	SELECT '100877-001-XL' UNION ALL
	SELECT '100877-D34-M' UNION ALL
	SELECT '100877-D34-L' UNION ALL
	SELECT '100877-D34-XL' UNION ALL
	SELECT '100546-K26-S' UNION ALL
	SELECT '100546-K26-M' UNION ALL
	SELECT '100546-K26-L' UNION ALL
	SELECT '100546-K26-XL' UNION ALL
	SELECT '100538-J17-M' UNION ALL
	SELECT '100538-J17-L' UNION ALL
	SELECT '100538-J17-XL' UNION ALL
	SELECT '100538-J17-XXL' UNION ALL
	SELECT '100565-001-XS' UNION ALL
	SELECT '100565-001-S' UNION ALL
	SELECT '100565-001-M' UNION ALL
	SELECT '100565-001-L' UNION ALL
	SELECT '100565-520-XS' UNION ALL
	SELECT '100565-520-S' UNION ALL
	SELECT '100565-520-M' UNION ALL
	SELECT '100565-520-L' UNION ALL
	SELECT '100565-520-XL' UNION ALL
	SELECT '100752-001-XS' UNION ALL
	SELECT '100752-001-S' UNION ALL
	SELECT '100752-001-M' UNION ALL
	SELECT '100752-001-L' UNION ALL
	SELECT '100752-001-XL' UNION ALL
	SELECT '100540-001-XS' UNION ALL
	SELECT '100540-001-S' UNION ALL
	SELECT '100540-001-M' UNION ALL
	SELECT '100540-001-L' UNION ALL
	SELECT '100540-001-XL' UNION ALL
	SELECT '100551-001-M' UNION ALL
	SELECT '100551-001-L' UNION ALL
	SELECT '100551-J91-S' UNION ALL
	SELECT '100551-J91-M' UNION ALL
	SELECT '100551-J91-L' UNION ALL
	SELECT '100551-J91-XL' UNION ALL
	SELECT '100551-J91-XXL' UNION ALL
	SELECT '100552-G80-S' UNION ALL
	SELECT '100552-G80-M' UNION ALL
	SELECT '100552-G80-L' UNION ALL
	SELECT '100552-G80-XL' UNION ALL
	SELECT '100552-G80-XXL' UNION ALL
	SELECT '100552-F48-S' UNION ALL
	SELECT '100552-F48-M' UNION ALL
	SELECT '100552-F48-L' UNION ALL
	SELECT '100552-F48-XL' UNION ALL
	SELECT '100552-F48-XXL' UNION ALL
	SELECT '100532-D34-S' UNION ALL
	SELECT '100532-D34-M' UNION ALL
	SELECT '100532-D34-L' UNION ALL
	SELECT '100532-D34-XL' UNION ALL
	SELECT '100952-184-XS' UNION ALL
	SELECT '100952-184-S' UNION ALL
	SELECT '100952-184-M' UNION ALL
	SELECT '100952-184-L' UNION ALL
	SELECT '100952-184-XL' UNION ALL
	SELECT '100952-J78-XS' UNION ALL
	SELECT '100952-J78-S' UNION ALL
	SELECT '100952-J78-M' UNION ALL
	SELECT '100952-J78-L' UNION ALL
	SELECT '100952-J78-XL' UNION ALL
	SELECT '100756-L65-S' UNION ALL
	SELECT '100756-L65-M' UNION ALL
	SELECT '100756-L65-L' UNION ALL
	SELECT '100756-J78-XS' UNION ALL
	SELECT '100756-J78-S' UNION ALL
	SELECT '100756-J78-M' UNION ALL
	SELECT '100756-J78-L' UNION ALL
	SELECT '100756-J78-XL' UNION ALL
	SELECT '100757-G67-S' UNION ALL
	SELECT '100757-G67-M' UNION ALL
	SELECT '100757-G67-L' UNION ALL
	SELECT '100757-G67-XL' UNION ALL
	SELECT '100757-G67-XXL' UNION ALL
	SELECT '100757-K04-S' UNION ALL
	SELECT '100757-K04-M' UNION ALL
	SELECT '100757-K04-L' UNION ALL
	SELECT '100757-K04-XL' UNION ALL
	SELECT '100828-L73-XS' UNION ALL
	SELECT '100828-L73-S' UNION ALL
	SELECT '100828-L73-M' UNION ALL
	SELECT '100828-L73-L' UNION ALL
	SELECT '100828-L73-XL' UNION ALL
	SELECT '100876-L29-S' UNION ALL
	SELECT '100876-L29-M' UNION ALL
	SELECT '100876-L29-L' UNION ALL
	SELECT '100876-L29-XL' UNION ALL
	SELECT '100876-L29-XXL' UNION ALL
	SELECT '100545-001-XS' UNION ALL
	SELECT '100545-001-S' UNION ALL
	SELECT '100545-001-M' UNION ALL
	SELECT '100545-G56-XS' UNION ALL
	SELECT '100545-G56-S' UNION ALL
	SELECT '100545-G56-M' UNION ALL
	SELECT '100545-G56-L' UNION ALL
	SELECT '100545-G56-XL' UNION ALL
	SELECT '100545-J78-S' UNION ALL
	SELECT '100545-J78-M' UNION ALL
	SELECT '100545-J78-L' UNION ALL
	SELECT '100545-J78-XL' UNION ALL
	SELECT '101491-D50-S' UNION ALL
	SELECT '101491-D50-M' UNION ALL
	SELECT '101491-D50-L' UNION ALL
	SELECT '101491-D50-XL' UNION ALL
	SELECT '101491-D50-XXL' UNION ALL
	SELECT '101491-D30-S' UNION ALL
	SELECT '101491-D30-M' UNION ALL
	SELECT '101491-D30-L' UNION ALL
	SELECT '101491-D30-XL' UNION ALL
	SELECT '101491-D30-XXL' UNION ALL
	SELECT '100869-001-S' UNION ALL
	SELECT '100869-001-M' UNION ALL
	SELECT '100869-001-L' UNION ALL
	SELECT '100869-001-XL' UNION ALL
	SELECT '100869-001-XXL' UNION ALL
	SELECT '100869-J17-M' UNION ALL
	SELECT '100869-J17-L' UNION ALL
	SELECT '100869-J17-XL' UNION ALL
	SELECT '100702-J78-XS' UNION ALL
	SELECT '100702-J78-S' UNION ALL
	SELECT '100702-J78-M' UNION ALL
	SELECT '100702-J78-L' UNION ALL
	SELECT '100702-J78-XL' UNION ALL
	SELECT '100562-H17-XS' UNION ALL
	SELECT '100562-H17-S' UNION ALL
	SELECT '100562-H17-M' UNION ALL
	SELECT '100562-H17-L' UNION ALL
	SELECT '100562-H17-XL' UNION ALL
	SELECT '100544-J86-XS' UNION ALL
	SELECT '100544-J86-S' UNION ALL
	SELECT '100544-J86-M' UNION ALL
	SELECT '101499-G55-XS' UNION ALL
	SELECT '101499-G55-S' UNION ALL
	SELECT '101499-G55-M' UNION ALL
	SELECT '101499-G55-L' UNION ALL
	SELECT '101499-G55-XL' UNION ALL
	SELECT '101499-F47-XS' UNION ALL
	SELECT '101499-F47-S' UNION ALL
	SELECT '101499-F47-M' UNION ALL
	SELECT '101499-F47-L' UNION ALL
	SELECT '101499-F47-XL' UNION ALL
	SELECT '100873-G67-S' UNION ALL
	SELECT '100873-G67-M' UNION ALL
	SELECT '100873-G67-L' UNION ALL
	SELECT '100873-G67-XL' UNION ALL
	SELECT '100873-G67-XXL' UNION ALL
	SELECT '100873-D34-S' UNION ALL
	SELECT '100873-D34-M' UNION ALL
	SELECT '100873-D34-L' UNION ALL
	SELECT '100873-D34-XL' UNION ALL
	SELECT '100873-D34-XXL' UNION ALL
	SELECT '100536-G80-S' UNION ALL
	SELECT '100536-G80-M' UNION ALL
	SELECT '100536-G80-L' UNION ALL
	SELECT '100536-G80-XL' UNION ALL
	SELECT '100536-J91-S' UNION ALL
	SELECT '100536-J91-M' UNION ALL
	SELECT '100536-J91-L' UNION ALL
	SELECT '100536-J91-XL' UNION ALL
	SELECT '100536-J91-XXL' UNION ALL
	SELECT '100951-F48-XS' UNION ALL
	SELECT '100951-F48-S' UNION ALL
	SELECT '100951-F48-M' UNION ALL
	SELECT '100951-F48-L' UNION ALL
	SELECT '100951-F48-XL' UNION ALL
	SELECT '100927-J78-XS' UNION ALL
	SELECT '100927-J78-S' UNION ALL
	SELECT '100927-J78-M' UNION ALL
	SELECT '100927-J78-L' UNION ALL
	SELECT '100927-J78-XL' UNION ALL
	SELECT '100394-G80-M' UNION ALL
	SELECT '100394-G80-L' UNION ALL
	SELECT '100394-G80-XL' UNION ALL
	SELECT '100758-G67-XS' UNION ALL
	SELECT '100758-G67-S' UNION ALL
	SELECT '100758-G67-M' UNION ALL
	SELECT '100758-G67-L' UNION ALL
	SELECT '100758-G67-XL' UNION ALL
	SELECT '100758-520-XS' UNION ALL
	SELECT '100758-520-S' UNION ALL
	SELECT '100758-520-M' UNION ALL
	SELECT '100758-520-L' UNION ALL
	SELECT '100758-520-XL' UNION ALL
	SELECT '100793-001-S' UNION ALL
	SELECT '100793-001-M' UNION ALL
	SELECT '100793-001-L' UNION ALL
	SELECT '100793-001-XL' UNION ALL
	SELECT '100793-J99-M' UNION ALL
	SELECT '100793-J99-L' UNION ALL
	SELECT '100793-J99-XL' UNION ALL
	SELECT '100793-J99-XXL' UNION ALL
	SELECT '100871-G80-S' UNION ALL
	SELECT '100871-G80-M' UNION ALL
	SELECT '100871-G80-L' UNION ALL
	SELECT '100871-G80-XL' UNION ALL
	SELECT '100871-G80-XXL' UNION ALL
	SELECT '100719-001-S' UNION ALL
	SELECT '100719-001-M' UNION ALL
	SELECT '100719-001-L' UNION ALL
	SELECT '100719-001-XL' UNION ALL
	SELECT '100727-J91-S' UNION ALL
	SELECT '100727-J91-M' UNION ALL
	SELECT '100727-J91-L' UNION ALL
	SELECT '100727-J91-XL' UNION ALL
	SELECT '100727-J91-XXL' UNION ALL
	SELECT '100727-J17-S' UNION ALL
	SELECT '100727-J17-M' UNION ALL
	SELECT '100727-J17-L' UNION ALL
	SELECT '100727-J17-XL' UNION ALL
	SELECT '100280-H17-M' UNION ALL
	SELECT '100280-H17-L' UNION ALL
	SELECT '100280-H17-XL' UNION ALL
	SELECT '100280-H17-XXL' UNION ALL
	SELECT '100729-G67-XS' UNION ALL
	SELECT '100729-G67-S' UNION ALL
	SELECT '100729-G67-M' UNION ALL
	SELECT '100729-G67-L' UNION ALL
	SELECT '100729-G67-XL' UNION ALL
	SELECT '100729-J78-XS' UNION ALL
	SELECT '100729-J78-S' UNION ALL
	SELECT '100729-J78-M' UNION ALL
	SELECT '100729-J78-L' UNION ALL
	SELECT '100729-J78-XL' UNION ALL
	SELECT '100574-184-S' UNION ALL
	SELECT '100574-184-M' UNION ALL
	SELECT '100753-J78-XS' UNION ALL
	SELECT '100753-J78-S' UNION ALL
	SELECT '100753-J78-M' UNION ALL
	SELECT '100753-J78-L' UNION ALL
	SELECT '100753-J78-XL' UNION ALL
	SELECT '100528-J78-XS' UNION ALL
	SELECT '100528-J78-S' UNION ALL
	SELECT '100528-J78-M' UNION ALL
	SELECT '100528-J78-L' UNION ALL
	SELECT '100528-J78-XL' UNION ALL
	SELECT '100941-J17-S' UNION ALL
	SELECT '100941-J17-M' UNION ALL
	SELECT '100941-J17-L' UNION ALL
	SELECT '100941-J17-XL' UNION ALL
	SELECT '100945-J17-M' UNION ALL
	SELECT '100945-J17-L' UNION ALL
	SELECT '100945-J17-XL' UNION ALL
	SELECT '100945-J17-XXL' UNION ALL
	SELECT '100844-J79-S' UNION ALL
	SELECT '100844-J79-M' UNION ALL
	SELECT '100844-J79-L' UNION ALL
	SELECT '100844-J79-XL' UNION ALL
	SELECT '100887-D34-S' UNION ALL
	SELECT '100887-D34-M' UNION ALL
	SELECT '100887-D34-L' UNION ALL
	SELECT '100887-D34-XL' UNION ALL
	SELECT '100887-D34-XXL' UNION ALL
	SELECT '100523-J86-XS' UNION ALL
	SELECT '100523-J86-S' UNION ALL
	SELECT '100523-J86-M' UNION ALL
	SELECT '100523-J86-L' UNION ALL
	SELECT '100523-J86-XL' UNION ALL
	SELECT '100855-J81-S' UNION ALL
	SELECT '100855-J81-M' UNION ALL
	SELECT '100855-J81-L' UNION ALL
	SELECT '100855-J81-XL' UNION ALL
	SELECT '100478-J94-S' UNION ALL
	SELECT '100478-J94-M' UNION ALL
	SELECT '100478-J94-L' UNION ALL
	SELECT '100478-J94-XL' UNION ALL
	SELECT '100478-J94-XXL' UNION ALL
	SELECT '100400-K05-S' UNION ALL
	SELECT '100400-K05-M' UNION ALL
	SELECT '100400-K05-L' UNION ALL
	SELECT '100400-K05-XL' UNION ALL
	SELECT '100400-J91-S' UNION ALL
	SELECT '100400-J91-M' UNION ALL
	SELECT '100400-J91-XL' UNION ALL
	SELECT '100763-F48-XS' UNION ALL
	SELECT '100763-F48-S' UNION ALL
	SELECT '100763-F48-M' UNION ALL
	SELECT '100763-F48-XL' UNION ALL
	SELECT '100763-J77-XS' UNION ALL
	SELECT '100763-J77-S' UNION ALL
	SELECT '100763-J77-M' UNION ALL
	SELECT '100763-J77-L' UNION ALL
	SELECT '100763-J77-XL' UNION ALL
	SELECT '100803-J82-XS' UNION ALL
	SELECT '100803-J82-S' UNION ALL
	SELECT '100803-J82-M' UNION ALL
	SELECT '100803-J82-XL' UNION ALL
	SELECT '100766-J85-XS' UNION ALL
	SELECT '100766-J85-S' UNION ALL
	SELECT '100766-J85-M' UNION ALL
	SELECT '100766-J85-L' UNION ALL
	SELECT '100766-J85-XL' UNION ALL
	SELECT '100766-J77-S' UNION ALL
	SELECT '100766-J77-M' UNION ALL
	SELECT '100766-J77-L' UNION ALL
	SELECT '100784-F72-S' UNION ALL
	SELECT '100784-F72-M' UNION ALL
	SELECT '100784-F72-L' UNION ALL
	SELECT '100784-F72-XL' UNION ALL
	SELECT '100784-595-S' UNION ALL
	SELECT '100784-595-M' UNION ALL
	SELECT '100784-595-L' UNION ALL
	SELECT '100784-595-XL' UNION ALL
	SELECT '100784-J92-S' UNION ALL
	SELECT '100784-J92-M' UNION ALL
	SELECT '100784-J92-L' UNION ALL
	SELECT '100784-J92-XL' UNION ALL
	SELECT '100784-J92-XXL' UNION ALL
	SELECT '100785-J17-S' UNION ALL
	SELECT '100785-J17-M' UNION ALL
	SELECT '100785-J17-L' UNION ALL
	SELECT '100785-J17-XL' UNION ALL
	SELECT '100785-J17-XXL' UNION ALL
	SELECT '100399-K05-S' UNION ALL
	SELECT '100399-K05-M' UNION ALL
	SELECT '100399-K05-L' UNION ALL
	SELECT '100399-K05-XL' UNION ALL
	SELECT '100399-J91-S' UNION ALL
	SELECT '100399-J91-M' UNION ALL
	SELECT '100399-J91-L' UNION ALL
	SELECT '100399-J91-XL')

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '100837' UNION ALL
	SELECT '100711' UNION ALL
	SELECT '100531' UNION ALL
	SELECT '100539' UNION ALL
	SELECT '100530' UNION ALL
	SELECT '100834' UNION ALL
	SELECT '100541' UNION ALL
	SELECT '100878' UNION ALL
	SELECT '100533' UNION ALL
	SELECT '100829' UNION ALL
	SELECT '100833' UNION ALL
	SELECT '100875' UNION ALL
	SELECT '100877' UNION ALL
	SELECT '100546' UNION ALL
	SELECT '100538' UNION ALL
	SELECT '100565' UNION ALL
	SELECT '100752' UNION ALL
	SELECT '100540' UNION ALL
	SELECT '100551' UNION ALL
	SELECT '100552' UNION ALL
	SELECT '100532' UNION ALL
	SELECT '100952' UNION ALL
	SELECT '100756' UNION ALL
	SELECT '100757' UNION ALL
	SELECT '100828' UNION ALL
	SELECT '100876' UNION ALL
	SELECT '100545' UNION ALL
	SELECT '101491' UNION ALL
	SELECT '100869' UNION ALL
	SELECT '100702' UNION ALL
	SELECT '100562' UNION ALL
	SELECT '100544' UNION ALL
	SELECT '101499' UNION ALL
	SELECT '100550' UNION ALL
	SELECT '100873' UNION ALL
	SELECT '100536' UNION ALL
	SELECT '100951' UNION ALL
	SELECT '100927' UNION ALL
	SELECT '100394' UNION ALL
	SELECT '100758' UNION ALL
	SELECT '100940' UNION ALL
	SELECT '100943' UNION ALL
	SELECT '100573' UNION ALL
	SELECT '100557' UNION ALL
	SELECT '100793' UNION ALL
	SELECT '100871' UNION ALL
	SELECT '100719' UNION ALL
	SELECT '100727' UNION ALL
	SELECT '100280' UNION ALL
	SELECT '100729' UNION ALL
	SELECT '100574' UNION ALL
	SELECT '100753' UNION ALL
	SELECT '100528' UNION ALL
	SELECT '100941' UNION ALL
	SELECT '100945' UNION ALL
	SELECT '100844' UNION ALL
	SELECT '100887' UNION ALL
	SELECT '100523' UNION ALL
	SELECT '100406' UNION ALL
	SELECT '100855' UNION ALL
	SELECT '100569' UNION ALL
	SELECT '100693' UNION ALL
	SELECT '100478' UNION ALL
	SELECT '100400' UNION ALL
	SELECT '100763' UNION ALL
	SELECT '100803' UNION ALL
	SELECT '100766' UNION ALL
	SELECT '100405' UNION ALL
	SELECT '100861' UNION ALL
	SELECT '100843' UNION ALL
	SELECT '100784' UNION ALL
	SELECT '100785' UNION ALL
	SELECT '100399' UNION ALL
	SELECT '100805' UNION ALL
	SELECT '100514' UNION ALL
	SELECT '100860' UNION ALL
	SELECT '100571' UNION ALL
	SELECT '100809' UNION ALL
	SELECT '100891' UNION ALL
	SELECT '100774' UNION ALL
	SELECT '100520' UNION ALL
	SELECT '100856' UNION ALL
	SELECT '100511' UNION ALL
	SELECT '100852' UNION ALL
	SELECT '101259' UNION ALL
	SELECT '100781' UNION ALL
	SELECT '100851' UNION ALL
	SELECT '100898' UNION ALL
	SELECT '100467' UNION ALL
	SELECT '101261' UNION ALL
	SELECT '100722' UNION ALL
	SELECT '100503' UNION ALL
	SELECT '100745' UNION ALL
	SELECT '101267' UNION ALL
	SELECT '100723' UNION ALL
	SELECT '101409' UNION ALL
	SELECT '101410' UNION ALL
	SELECT '100770' UNION ALL
	SELECT '100795' UNION ALL
	SELECT '100500' UNION ALL
	SELECT 'IBMC84' UNION ALL
	SELECT '100768' UNION ALL
	SELECT '100794' UNION ALL
	SELECT '100709' UNION ALL
	SELECT '100712' UNION ALL
	SELECT '100509' UNION ALL
	SELECT '100323' UNION ALL
	SELECT '100778' UNION ALL
	SELECT '100800' UNION ALL
	SELECT '100715' UNION ALL
	SELECT 'IBMC85' UNION ALL
	SELECT '100706' UNION ALL
	SELECT '100961' UNION ALL
	SELECT 'IBM208' UNION ALL
	SELECT '100790' UNION ALL
	SELECT '100690' UNION ALL
	SELECT 'IBN310' UNION ALL
	SELECT '100609' UNION ALL
	SELECT 'IBN324' UNION ALL
	SELECT 'IBN704' UNION ALL
	SELECT '100741' UNION ALL
	SELECT '100716' UNION ALL
	SELECT '100746' UNION ALL
	SELECT 'IBM200' UNION ALL
	SELECT '100815' UNION ALL
	SELECT '100750' UNION ALL
	SELECT 'IBN309' UNION ALL
	SELECT 'IBN323' UNION ALL
	SELECT 'IBN322' UNION ALL
	SELECT 'IBND21' UNION ALL
	SELECT 'IBN305' UNION ALL
	SELECT 'IBN319' UNION ALL
	SELECT 'IBMD01' UNION ALL
	SELECT 'IBN304' UNION ALL
	SELECT '101199' UNION ALL
	SELECT 'IBN313' UNION ALL
	SELECT 'IBN327' UNION ALL
	SELECT 'IBNE93' UNION ALL
	SELECT 'IBNE94' UNION ALL
	SELECT 'IBND04')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''IB-100837'''',''''IB-100711'''',''''IB-100531'''',''''IB-100539'''',''''IB-100530'''',''''IB-100834'''',''''IB-100541'''',''''IB-100878'''',''''IB-100533'''',''''IB-100829'''',''''IB-100833'''',''''IB-100875'''',''''IB-100877'''',''''IB-100546'''',''''IB-100538'''',''''IB-100565'''',''''IB-100752'''',''''IB-100540'''',''''IB-100551'''',''''IB-100552'''',''''IB-100532'''',''''IB-100952'''',''''IB-100756'''',''''IB-100757'''',''''IB-100828'''',''''IB-100876'''',''''IB-100545'''',''''IB-101491'''',''''IB-100869'''',''''IB-100702'''',''''IB-100562'''',''''IB-100544'''',''''IB-101499'''',''''IB-100550'''',''''IB-100873'''',''''IB-100536'''',''''IB-100951'''',''''IB-100927'''',''''IB-100394'''',''''IB-100758'''',''''IB-100940'''',''''IB-100943'''',''''IB-100573'''',''''IB-100557'''',''''IB-100793'''',''''IB-100871'''',''''IB-100719'''',''''IB-100727'''',''''IB-100280'''',''''IB-100729'''',''''IB-100574'''',''''IB-100753'''',''''IB-100528'''',''''IB-100941'''',''''IB-100945'''',''''IB-100844'''',''''IB-100887'''',''''IB-100523'''',''''IB-100406'''',''''IB-100855'''',''''IB-100569'''',''''IB-100693'''',''''IB-100478'''',''''IB-100400'''',''''IB-100763'''',''''IB-100803'''',''''IB-100766'''',''''IB-100405'''',''''IB-100861'''',''''IB-100843'''',''''IB-100784'''',''''IB-100785'''',''''IB-100399'''',''''IB-100805'''',''''IB-100514'''',''''IB-100860'''',''''IB-100571'''',''''IB-100809'''',''''IB-100891'''',''''IB-100774'''',''''IB-100520'''',''''IB-100856'''',''''IB-100511'''',''''IB-100852'''',''''IB-101259'''',''''IB-100781'''',''''IB-100851'''',''''IB-100898'''',''''IB-100467'''',''''IB-101261'''',''''IB-100722'''',''''IB-100503'''',''''IB-100745'''',''''IB-101267'''',''''IB-100723'''',''''IB-101409'''',''''IB-101410'''',''''IB-100770'''',''''IB-100795'''',''''IB-100500'''',''''IB-IBMC84'''',''''IB-100768'''',''''IB-100794'''',''''IB-100709'''',''''IB-100712'''',''''IB-100509'''',''''IB-100323'''',''''IB-100778'''',''''IB-100800'''',''''IB-100715'''',''''IB-IBMC85'''',''''IB-100706'''',''''IB-100961'''',''''IB-IBM208'''',''''IB-100790'''',''''IB-100690'''',''''IB-IBN310'''',''''IB-100609'''',''''IB-IBN324'''',''''IB-IBN704'''',''''IB-100741'''',''''IB-100716'''',''''IB-100746'''',''''IB-IBM200'''',''''IB-100815'''',''''IB-100750'''',''''IB-IBN309'''',''''IB-IBN323'''',''''IB-IBN322'''',''''IB-IBND21'''',''''IB-IBN305'''',''''IB-IBN319'''',''''IB-IBMD01'''',''''IB-IBN304'''',''''IB-101199'''',''''IB-IBN313'''',''''IB-IBN327'''',''''IB-IBNE93'''',''''IB-IBNE94'''',''''IB-IBND04'''''
	
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
		a.description = b.description,
		a.features = b.features
	FROM tbl_Purchase_Order AS a
	INNER JOIN (SELECT sku, description, features FROM OPENQUERY(MAGENTO,''
		SELECT a.sku, b.value AS description, c.value AS features
		FROM catalog_product_entity AS a
		LEFT JOIN catalog_product_entity_text AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''description'''')
		LEFT JOIN catalog_product_entity_text AS c
		ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''features'''')
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

EXEC Inline_Closeout_PO_Building 'IB-DOTD-JAN17', 'Closeout', 'Icebreaker', 'IB', 'SS14', 418, 9

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/

