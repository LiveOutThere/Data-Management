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
	SELECT '100325-001-O/S' UNION ALL
	SELECT '100386-001-M' UNION ALL
	SELECT '100386-001-XL' UNION ALL
	SELECT '100394-001-L' UNION ALL
	SELECT '100473-001-M' UNION ALL
	SELECT '100473-J91-M' UNION ALL
	SELECT '100474-001-M' UNION ALL
	SELECT '100474-001-S' UNION ALL
	SELECT '100500-L79-M' UNION ALL
	SELECT '100500-M04-L' UNION ALL
	SELECT '100500-M04-M' UNION ALL
	SELECT '100500-M04-S' UNION ALL
	SELECT '100502-001-L' UNION ALL
	SELECT '100502-001-M' UNION ALL
	SELECT '100502-001-S' UNION ALL
	SELECT '100502-001-XL' UNION ALL
	SELECT '100502-001-XS' UNION ALL
	SELECT '100503-M04-L' UNION ALL
	SELECT '100503-M04-M' UNION ALL
	SELECT '100503-M04-S' UNION ALL
	SELECT '100503-M04-XS' UNION ALL
	SELECT '100507-001-L' UNION ALL
	SELECT '100507-001-M' UNION ALL
	SELECT '100507-001-S' UNION ALL
	SELECT '100507-001-XS' UNION ALL
	SELECT '100509-001-L' UNION ALL
	SELECT '100509-001-M' UNION ALL
	SELECT '100509-001-S' UNION ALL
	SELECT '100509-001-XL' UNION ALL
	SELECT '100509-001-XS' UNION ALL
	SELECT '100509-M04-M' UNION ALL
	SELECT '100509-M04-S' UNION ALL
	SELECT '100509-M04-XS' UNION ALL
	SELECT '100509-L79-L' UNION ALL
	SELECT '100509-L79-M' UNION ALL
	SELECT '100509-L79-S' UNION ALL
	SELECT '100509-L79-XL' UNION ALL
	SELECT '100509-L79-XS' UNION ALL
	SELECT '100509-M04-L' UNION ALL
	SELECT '100514-G56-XL' UNION ALL
	SELECT '100521-001-M' UNION ALL
	SELECT '100521-001-S' UNION ALL
	SELECT '100521-C47-M' UNION ALL
	SELECT '100521-C47-S' UNION ALL
	SELECT '100521-C47-XS' UNION ALL
	SELECT '100542-001-M' UNION ALL
	SELECT '100542-001-S' UNION ALL
	SELECT '100542-001-XS' UNION ALL
	SELECT '100554-001-L' UNION ALL
	SELECT '100554-001-M' UNION ALL
	SELECT '100554-001-XL' UNION ALL
	SELECT '100554-G67-L' UNION ALL
	SELECT '100554-G67-M' UNION ALL
	SELECT '100726-G67-L' UNION ALL
	SELECT '100726-G67-M' UNION ALL
	SELECT '100728-001-L' UNION ALL
	SELECT '100728-001-M' UNION ALL
	SELECT '100728-001-S' UNION ALL
	SELECT '100770-110-L' UNION ALL
	SELECT '100770-110-M' UNION ALL
	SELECT '100823-001-L' UNION ALL
	SELECT '100823-001-M' UNION ALL
	SELECT '100823-001-S' UNION ALL
	SELECT '100823-F48-M' UNION ALL
	SELECT '100823-F48-S' UNION ALL
	SELECT '100823-F48-XS' UNION ALL
	SELECT '100830-001-L' UNION ALL
	SELECT '100830-001-M' UNION ALL
	SELECT '100830-001-S' UNION ALL
	SELECT '100830-001-XS' UNION ALL
	SELECT '100843-110-L' UNION ALL
	SELECT '100843-110-M' UNION ALL
	SELECT '100843-110-S' UNION ALL
	SELECT '100843-110-XS' UNION ALL
	SELECT '100845-001-L' UNION ALL
	SELECT '100845-001-M' UNION ALL
	SELECT '100845-001-S' UNION ALL
	SELECT '100845-001-XS' UNION ALL
	SELECT '100851-F48-S' UNION ALL
	SELECT '100851-F48-XS' UNION ALL
	SELECT '100851-M06-L' UNION ALL
	SELECT '100851-M06-M' UNION ALL
	SELECT '100851-M06-S' UNION ALL
	SELECT '100851-001-L' UNION ALL
	SELECT '100851-001-M' UNION ALL
	SELECT '100851-001-S' UNION ALL
	SELECT '100851-001-XL' UNION ALL
	SELECT '100851-F48-L' UNION ALL
	SELECT '100851-F48-M' UNION ALL
	SELECT '100856-001-L' UNION ALL
	SELECT '100856-J81-S' UNION ALL
	SELECT '100856-001-M' UNION ALL
	SELECT '100856-001-S' UNION ALL
	SELECT '100856-J78-L' UNION ALL
	SELECT '100856-J78-M' UNION ALL
	SELECT '100856-J78-S' UNION ALL
	SELECT '100856-J81-M' UNION ALL
	SELECT '100861-D87-L' UNION ALL
	SELECT '100861-D87-M' UNION ALL
	SELECT '100861-D87-S' UNION ALL
	SELECT '100861-D87-XS' UNION ALL
	SELECT '100862-D87-L' UNION ALL
	SELECT '100862-D87-M' UNION ALL
	SELECT '100862-D87-S' UNION ALL
	SELECT '100874-001-L' UNION ALL
	SELECT '100874-001-M' UNION ALL
	SELECT '100874-001-S' UNION ALL
	SELECT '100899-001-L' UNION ALL
	SELECT '100899-001-M' UNION ALL
	SELECT '100899-001-XL' UNION ALL
	SELECT '100899-G67-L' UNION ALL
	SELECT '100899-G67-M' UNION ALL
	SELECT '100899-G67-S' UNION ALL
	SELECT '100902-001-S' UNION ALL
	SELECT '100991-M11-M' UNION ALL
	SELECT '100991-M11-S' UNION ALL
	SELECT '100991-001-L' UNION ALL
	SELECT '100991-001-M' UNION ALL
	SELECT '100991-001-S' UNION ALL
	SELECT '100991-001-XL' UNION ALL
	SELECT '100991-001-XS' UNION ALL
	SELECT '100991-M11-L' UNION ALL
	SELECT '100992-J81-L' UNION ALL
	SELECT '100992-J81-M' UNION ALL
	SELECT '100992-J81-S' UNION ALL
	SELECT '100992-J81-XS' UNION ALL
	SELECT '100992-M03-XS' UNION ALL
	SELECT '100995-184-L' UNION ALL
	SELECT '100995-184-M' UNION ALL
	SELECT '100995-184-S' UNION ALL
	SELECT '100995-184-XL' UNION ALL
	SELECT '100995-184-XS' UNION ALL
	SELECT '100995-460-L' UNION ALL
	SELECT '100995-460-M' UNION ALL
	SELECT '100995-460-S' UNION ALL
	SELECT '100995-L80-L' UNION ALL
	SELECT '100995-L80-M' UNION ALL
	SELECT '100995-L80-S' UNION ALL
	SELECT '100996-G67-S' UNION ALL
	SELECT '100996-G67-XL' UNION ALL
	SELECT '100996-L80-L' UNION ALL
	SELECT '100996-L80-M' UNION ALL
	SELECT '100996-L80-S' UNION ALL
	SELECT '100996-L80-XS' UNION ALL
	SELECT '100996-184-L' UNION ALL
	SELECT '100996-184-M' UNION ALL
	SELECT '100996-184-S' UNION ALL
	SELECT '100996-184-XS' UNION ALL
	SELECT '100996-G67-L' UNION ALL
	SELECT '100996-G67-M' UNION ALL
	SELECT '100996-M02-L' UNION ALL
	SELECT '100996-M02-M' UNION ALL
	SELECT '100996-M02-S' UNION ALL
	SELECT '100997-F48-L' UNION ALL
	SELECT '100997-F48-M' UNION ALL
	SELECT '100997-F48-S' UNION ALL
	SELECT '100997-F48-XS' UNION ALL
	SELECT '100997-M07-M' UNION ALL
	SELECT '100997-M07-S' UNION ALL
	SELECT '100997-M07-XS' UNION ALL
	SELECT '100998-B24-L' UNION ALL
	SELECT '100998-B24-M' UNION ALL
	SELECT '100998-B24-S' UNION ALL
	SELECT '100998-B24-XS' UNION ALL
	SELECT '100998-F48-M' UNION ALL
	SELECT '100998-F48-S' UNION ALL
	SELECT '100999-G63-L' UNION ALL
	SELECT '101000-F48-L' UNION ALL
	SELECT '101000-F48-M' UNION ALL
	SELECT '101000-F48-S' UNION ALL
	SELECT '101000-F48-XS' UNION ALL
	SELECT '101000-M06-L' UNION ALL
	SELECT '101000-M06-M' UNION ALL
	SELECT '101000-M06-S' UNION ALL
	SELECT '101002-M04-S' UNION ALL
	SELECT '101002-M04-XS' UNION ALL
	SELECT '101002-M06-L' UNION ALL
	SELECT '101002-M06-M' UNION ALL
	SELECT '101002-M06-S' UNION ALL
	SELECT '101002-D87-L' UNION ALL
	SELECT '101002-D87-M' UNION ALL
	SELECT '101002-D87-S' UNION ALL
	SELECT '101002-D87-XL' UNION ALL
	SELECT '101002-M04-L' UNION ALL
	SELECT '101002-M04-M' UNION ALL
	SELECT '101003-L81-L' UNION ALL
	SELECT '101003-M06-L' UNION ALL
	SELECT '101003-M06-S' UNION ALL
	SELECT '101003-L81-M' UNION ALL
	SELECT '101003-L81-S' UNION ALL
	SELECT '101003-L81-XS' UNION ALL
	SELECT '101003-M04-L' UNION ALL
	SELECT '101003-M04-M' UNION ALL
	SELECT '101003-M04-S' UNION ALL
	SELECT '101005-110-L' UNION ALL
	SELECT '101005-110-M' UNION ALL
	SELECT '101005-110-S' UNION ALL
	SELECT '101005-110-XS' UNION ALL
	SELECT '101005-D87-L' UNION ALL
	SELECT '101005-D87-M' UNION ALL
	SELECT '101005-D87-S' UNION ALL
	SELECT '101005-M03-M' UNION ALL
	SELECT '101005-M03-S' UNION ALL
	SELECT '101005-M03-XS' UNION ALL
	SELECT '101006-M06-L' UNION ALL
	SELECT '101006-M06-M' UNION ALL
	SELECT '101006-M06-S' UNION ALL
	SELECT '101006-M06-XS' UNION ALL
	SELECT '101008-110-M' UNION ALL
	SELECT '101008-110-S' UNION ALL
	SELECT '101008-110-XS' UNION ALL
	SELECT '101010-184-L' UNION ALL
	SELECT '101010-184-M' UNION ALL
	SELECT '101010-184-S' UNION ALL
	SELECT '101010-184-XS' UNION ALL
	SELECT '101010-L80-M' UNION ALL
	SELECT '101010-L80-XL' UNION ALL
	SELECT '101010-M13-M' UNION ALL
	SELECT '101010-M13-S' UNION ALL
	SELECT '101010-M13-XS' UNION ALL
	SELECT '101012-D34-27' UNION ALL
	SELECT '101012-D34-29' UNION ALL
	SELECT '101012-L24-32' UNION ALL
	SELECT '101012-D34-31' UNION ALL
	SELECT '101012-L24-27' UNION ALL
	SELECT '101012-L24-28' UNION ALL
	SELECT '101012-L24-29' UNION ALL
	SELECT '101012-L24-30' UNION ALL
	SELECT '101012-L24-31' UNION ALL
	SELECT '101013-001-L' UNION ALL
	SELECT '101013-001-M' UNION ALL
	SELECT '101013-001-S' UNION ALL
	SELECT '101013-001-XL' UNION ALL
	SELECT '101014-001-L' UNION ALL
	SELECT '101014-001-M' UNION ALL
	SELECT '101014-001-S' UNION ALL
	SELECT '101014-001-XS' UNION ALL
	SELECT '101015-G63-L' UNION ALL
	SELECT '101015-G63-M' UNION ALL
	SELECT '101015-G63-S' UNION ALL
	SELECT '101015-G63-XS' UNION ALL
	SELECT '101015-M30-L' UNION ALL
	SELECT '101015-M30-M' UNION ALL
	SELECT '101015-M30-S' UNION ALL
	SELECT '101015-M30-XS' UNION ALL
	SELECT '101018-187-L' UNION ALL
	SELECT '101018-M21-XS' UNION ALL
	SELECT '101018-187-M' UNION ALL
	SELECT '101018-187-S' UNION ALL
	SELECT '101018-187-XS' UNION ALL
	SELECT '101018-M21-L' UNION ALL
	SELECT '101018-M21-M' UNION ALL
	SELECT '101018-M21-S' UNION ALL
	SELECT '101019-G62-L' UNION ALL
	SELECT '101019-G62-M' UNION ALL
	SELECT '101019-G62-S' UNION ALL
	SELECT '101019-G62-XS' UNION ALL
	SELECT '101019-M27-L' UNION ALL
	SELECT '101019-M32-L' UNION ALL
	SELECT '101019-M32-M' UNION ALL
	SELECT '101019-M32-S' UNION ALL
	SELECT '101020-C84-M' UNION ALL
	SELECT '101020-C84-S' UNION ALL
	SELECT '101020-C84-XS' UNION ALL
	SELECT '101025-001-L' UNION ALL
	SELECT '101025-001-M' UNION ALL
	SELECT '101025-001-S' UNION ALL
	SELECT '101025-001-XS' UNION ALL
	SELECT '101026-001-L' UNION ALL
	SELECT '101026-001-XS' UNION ALL
	SELECT '101033-L85-L' UNION ALL
	SELECT '101033-L85-M' UNION ALL
	SELECT '101033-L85-S' UNION ALL
	SELECT '101033-L85-XL' UNION ALL
	SELECT '101034-M30-M' UNION ALL
	SELECT '101034-M30-S' UNION ALL
	SELECT '101035-184-L' UNION ALL
	SELECT '101035-184-M' UNION ALL
	SELECT '101035-184-S' UNION ALL
	SELECT '101035-184-XL' UNION ALL
	SELECT '101035-G67-L' UNION ALL
	SELECT '101035-G67-M' UNION ALL
	SELECT '101035-L24-L' UNION ALL
	SELECT '101035-L24-M' UNION ALL
	SELECT '101035-L24-S' UNION ALL
	SELECT '101035-L24-XL' UNION ALL
	SELECT '101036-184-L' UNION ALL
	SELECT '101036-J91-L' UNION ALL
	SELECT '101036-J91-M' UNION ALL
	SELECT '101040-184-L' UNION ALL
	SELECT '101040-F48-L' UNION ALL
	SELECT '101042-001-L' UNION ALL
	SELECT '101042-001-M' UNION ALL
	SELECT '101042-001-XL' UNION ALL
	SELECT '101042-G80-L' UNION ALL
	SELECT '101042-G80-M' UNION ALL
	SELECT '101044-D34-L' UNION ALL
	SELECT '101044-D34-M' UNION ALL
	SELECT '101044-D34-S' UNION ALL
	SELECT '101044-D34-XL' UNION ALL
	SELECT '101044-J93-L' UNION ALL
	SELECT '101044-J93-M' UNION ALL
	SELECT '101044-J93-XL' UNION ALL
	SELECT '101044-L85-L' UNION ALL
	SELECT '101044-L85-M' UNION ALL
	SELECT '101044-L85-S' UNION ALL
	SELECT '101044-L85-XL' UNION ALL
	SELECT '101046-G67-M' UNION ALL
	SELECT '101046-G67-S' UNION ALL
	SELECT '101046-L24-L' UNION ALL
	SELECT '101046-L24-M' UNION ALL
	SELECT '101046-L24-XL' UNION ALL
	SELECT '101046-L87-L' UNION ALL
	SELECT '101046-L87-M' UNION ALL
	SELECT '101052-J65-30' UNION ALL
	SELECT '101052-J65-32' UNION ALL
	SELECT '101052-J65-34' UNION ALL
	SELECT '101052-J65-36' UNION ALL
	SELECT '101053-L92-32' UNION ALL
	SELECT '101053-L92-34' UNION ALL
	SELECT '101053-L92-36' UNION ALL
	SELECT '101053-L92-38' UNION ALL
	SELECT '101053-G80-30' UNION ALL
	SELECT '101053-G80-32' UNION ALL
	SELECT '101053-G80-34' UNION ALL
	SELECT '101053-G80-36' UNION ALL
	SELECT '101053-G80-38' UNION ALL
	SELECT '101053-L92-30' UNION ALL
	SELECT '101054-001-L' UNION ALL
	SELECT '101054-001-M' UNION ALL
	SELECT '101054-001-XL' UNION ALL
	SELECT '101054-G67-M' UNION ALL
	SELECT '101054-G67-S' UNION ALL
	SELECT '101060-D87-L' UNION ALL
	SELECT '101060-D87-M' UNION ALL
	SELECT '101060-D87-S' UNION ALL
	SELECT '101060-D87-XS' UNION ALL
	SELECT '101060-F48-L' UNION ALL
	SELECT '101060-F48-M' UNION ALL
	SELECT '101060-F48-S' UNION ALL
	SELECT '101060-F48-XS' UNION ALL
	SELECT '101060-M06-L' UNION ALL
	SELECT '101060-M06-M' UNION ALL
	SELECT '101060-M06-S' UNION ALL
	SELECT '101063-G67-L' UNION ALL
	SELECT '101063-G67-M' UNION ALL
	SELECT '101063-G67-S' UNION ALL
	SELECT '101063-G67-XL' UNION ALL
	SELECT '101063-L24-M' UNION ALL
	SELECT '101067-001-L' UNION ALL
	SELECT '101067-001-M' UNION ALL
	SELECT '101067-001-S' UNION ALL
	SELECT '101067-001-XL' UNION ALL
	SELECT '101067-M42-L' UNION ALL
	SELECT '101067-M42-M' UNION ALL
	SELECT '101067-M42-S' UNION ALL
	SELECT '101068-001-L' UNION ALL
	SELECT '101068-001-M' UNION ALL
	SELECT '101068-001-XL' UNION ALL
	SELECT '101071-M30-L' UNION ALL
	SELECT '101071-M30-M' UNION ALL
	SELECT '101071-M30-S' UNION ALL
	SELECT '101085-M19-L' UNION ALL
	SELECT '101085-M19-M' UNION ALL
	SELECT '101085-M19-S' UNION ALL
	SELECT '101085-M19-XL' UNION ALL
	SELECT '101094-G79-XL' UNION ALL
	SELECT '101094-K02-L' UNION ALL
	SELECT '101094-K02-M' UNION ALL
	SELECT '101094-K02-S' UNION ALL
	SELECT '101094-K02-XL' UNION ALL
	SELECT '101094-D34-L' UNION ALL
	SELECT '101094-D34-M' UNION ALL
	SELECT '101094-D34-S' UNION ALL
	SELECT '101094-D34-XL' UNION ALL
	SELECT '101094-G79-L' UNION ALL
	SELECT '101094-G79-M' UNION ALL
	SELECT '101097-J91-L' UNION ALL
	SELECT '101097-J91-M' UNION ALL
	SELECT '101097-J91-S' UNION ALL
	SELECT '101097-J91-XL' UNION ALL
	SELECT '101099-001-L' UNION ALL
	SELECT '101099-001-M' UNION ALL
	SELECT '101099-001-S' UNION ALL
	SELECT '101099-001-XL' UNION ALL
	SELECT '101099-G67-L' UNION ALL
	SELECT '101099-G67-M' UNION ALL
	SELECT '101099-G67-XL' UNION ALL
	SELECT '101099-L87-L' UNION ALL
	SELECT '101099-L87-M' UNION ALL
	SELECT '101099-L87-S' UNION ALL
	SELECT '101099-L87-XL' UNION ALL
	SELECT '101102-G67-L' UNION ALL
	SELECT '101102-G67-M' UNION ALL
	SELECT '101102-G67-S' UNION ALL
	SELECT '101102-G67-XL' UNION ALL
	SELECT '101102-L85-L' UNION ALL
	SELECT '101102-L85-M' UNION ALL
	SELECT '101102-L85-XL' UNION ALL
	SELECT '101105-D34-L' UNION ALL
	SELECT '101105-D34-M' UNION ALL
	SELECT '101105-D34-S' UNION ALL
	SELECT '101105-D34-XL' UNION ALL
	SELECT '101105-J93-L' UNION ALL
	SELECT '101105-J93-M' UNION ALL
	SELECT '101105-J93-S' UNION ALL
	SELECT '101105-J93-XL' UNION ALL
	SELECT '101107-G19-L' UNION ALL
	SELECT '101107-G19-M' UNION ALL
	SELECT '101107-G19-XL' UNION ALL
	SELECT '101107-G79-L' UNION ALL
	SELECT '101107-G79-M' UNION ALL
	SELECT '101107-G79-S' UNION ALL
	SELECT '101107-G79-XL' UNION ALL
	SELECT '101110-M36-M' UNION ALL
	SELECT '101110-M36-S' UNION ALL
	SELECT '101110-M39-L' UNION ALL
	SELECT '101110-M39-M' UNION ALL
	SELECT '101110-M39-S' UNION ALL
	SELECT '101110-M39-XL' UNION ALL
	SELECT '101118-G19-L' UNION ALL
	SELECT '101118-G19-M' UNION ALL
	SELECT '101118-G19-S' UNION ALL
	SELECT '101118-G19-XL' UNION ALL
	SELECT '101119-L81-L' UNION ALL
	SELECT '101119-L81-M' UNION ALL
	SELECT '101119-L81-S' UNION ALL
	SELECT '101119-L81-XL' UNION ALL
	SELECT '101121-L84-M' UNION ALL
	SELECT '101121-L84-S' UNION ALL
	SELECT '101121-M09-L' UNION ALL
	SELECT '101121-M09-M' UNION ALL
	SELECT '101121-M09-S' UNION ALL
	SELECT '101121-M09-XS' UNION ALL
	SELECT '101129-M20-L' UNION ALL
	SELECT '101129-M20-M' UNION ALL
	SELECT '101129-M20-S' UNION ALL
	SELECT '101134-L80-XS' UNION ALL
	SELECT '101135-L80-L' UNION ALL
	SELECT '101135-L80-M' UNION ALL
	SELECT '101135-L80-S' UNION ALL
	SELECT '101135-L80-XS' UNION ALL
	SELECT '101136-L80-L' UNION ALL
	SELECT '101136-L80-M' UNION ALL
	SELECT '101136-L80-S' UNION ALL
	SELECT '101136-L80-XS' UNION ALL
	SELECT '101146-G67-L' UNION ALL
	SELECT '101146-G67-M' UNION ALL
	SELECT '101146-G67-S' UNION ALL
	SELECT '101146-G67-XL' UNION ALL
	SELECT '101196-B24-XS' UNION ALL
	SELECT '101196-110-L' UNION ALL
	SELECT '101196-110-M' UNION ALL
	SELECT '101196-110-S' UNION ALL
	SELECT '101196-110-XS' UNION ALL
	SELECT '101196-B24-M' UNION ALL
	SELECT '101196-B24-S' UNION ALL
	SELECT '101203-M03-L' UNION ALL
	SELECT '101203-M03-M' UNION ALL
	SELECT '101203-M03-S' UNION ALL
	SELECT '101203-M06-L' UNION ALL
	SELECT '101203-M06-M' UNION ALL
	SELECT '101203-M06-S' UNION ALL
	SELECT '101203-M06-XS' UNION ALL
	SELECT '101260-001-L' UNION ALL
	SELECT '101260-001-M' UNION ALL
	SELECT '101260-001-XL' UNION ALL
	SELECT '101266-001-L' UNION ALL
	SELECT '101266-001-S' UNION ALL
	SELECT '101266-001-XL' UNION ALL
	SELECT '101266-001-XXL' UNION ALL
	SELECT '101266-G80-L' UNION ALL
	SELECT '101266-G80-M' UNION ALL
	SELECT '101266-G80-S' UNION ALL
	SELECT '101266-G80-XL' UNION ALL
	SELECT '101304-001-L' UNION ALL
	SELECT '101304-001-M' UNION ALL
	SELECT '101304-001-S' UNION ALL
	SELECT '101305-001-L' UNION ALL
	SELECT '101305-001-M' UNION ALL
	SELECT '101305-001-S' UNION ALL
	SELECT '101305-001-XL' UNION ALL
	SELECT '101305-001-XS' UNION ALL
	SELECT '101305-J81-M' UNION ALL
	SELECT '101305-J81-S' UNION ALL
	SELECT '101306-001-L' UNION ALL
	SELECT '101306-001-M' UNION ALL
	SELECT '101306-001-S' UNION ALL
	SELECT '101306-001-XL' UNION ALL
	SELECT '101306-001-XS' UNION ALL
	SELECT '101307-001-L' UNION ALL
	SELECT '101307-001-M' UNION ALL
	SELECT '101307-001-S' UNION ALL
	SELECT '101307-001-XL' UNION ALL
	SELECT '101307-001-XS' UNION ALL
	SELECT 'IB6B41-001-L' UNION ALL
	SELECT 'IB6B41-001-M' UNION ALL
	SELECT 'IB6B41-001-S' UNION ALL
	SELECT 'IB6B41-001-XL' UNION ALL
	SELECT 'IB6B41-001-XS' UNION ALL
	SELECT 'IBMD31-001-L' UNION ALL
	SELECT 'IBMD31-001-M' UNION ALL
	SELECT 'IBMD31-001-S' UNION ALL
	SELECT 'IBMD31-001-XL')

	INSERT INTO #PO_DATA (vendor_product_id) (
	SELECT '100325' UNION ALL
	SELECT '100386' UNION ALL
	SELECT '100394' UNION ALL
	SELECT '100473' UNION ALL
	SELECT '100474' UNION ALL
	SELECT '100500' UNION ALL
	SELECT '100502' UNION ALL
	SELECT '100503' UNION ALL
	SELECT '100507' UNION ALL
	SELECT '100509' UNION ALL
	SELECT '100514' UNION ALL
	SELECT '100521' UNION ALL
	SELECT '100542' UNION ALL
	SELECT '100554' UNION ALL
	SELECT '100726' UNION ALL
	SELECT '100728' UNION ALL
	SELECT '100770' UNION ALL
	SELECT '100823' UNION ALL
	SELECT '100830' UNION ALL
	SELECT '100843' UNION ALL
	SELECT '100845' UNION ALL
	SELECT '100851' UNION ALL
	SELECT '100856' UNION ALL
	SELECT '100861' UNION ALL
	SELECT '100862' UNION ALL
	SELECT '100874' UNION ALL
	SELECT '100899' UNION ALL
	SELECT '100902' UNION ALL
	SELECT '100991' UNION ALL
	SELECT '100992' UNION ALL
	SELECT '100995' UNION ALL
	SELECT '100996' UNION ALL
	SELECT '100997' UNION ALL
	SELECT '100998' UNION ALL
	SELECT '100999' UNION ALL
	SELECT '101000' UNION ALL
	SELECT '101002' UNION ALL
	SELECT '101003' UNION ALL
	SELECT '101005' UNION ALL
	SELECT '101006' UNION ALL
	SELECT '101008' UNION ALL
	SELECT '101010' UNION ALL
	SELECT '101012' UNION ALL
	SELECT '101013' UNION ALL
	SELECT '101014' UNION ALL
	SELECT '101015' UNION ALL
	SELECT '101018' UNION ALL
	SELECT '101019' UNION ALL
	SELECT '101020' UNION ALL
	SELECT '101025' UNION ALL
	SELECT '101026' UNION ALL
	SELECT '101033' UNION ALL
	SELECT '101034' UNION ALL
	SELECT '101035' UNION ALL
	SELECT '101036' UNION ALL
	SELECT '101040' UNION ALL
	SELECT '101042' UNION ALL
	SELECT '101044' UNION ALL
	SELECT '101046' UNION ALL
	SELECT '101052' UNION ALL
	SELECT '101053' UNION ALL
	SELECT '101054' UNION ALL
	SELECT '101060' UNION ALL
	SELECT '101063' UNION ALL
	SELECT '101067' UNION ALL
	SELECT '101068' UNION ALL
	SELECT '101071' UNION ALL
	SELECT '101085' UNION ALL
	SELECT '101094' UNION ALL
	SELECT '101097' UNION ALL
	SELECT '101099' UNION ALL
	SELECT '101102' UNION ALL
	SELECT '101105' UNION ALL
	SELECT '101107' UNION ALL
	SELECT '101110' UNION ALL
	SELECT '101118' UNION ALL
	SELECT '101119' UNION ALL
	SELECT '101121' UNION ALL
	SELECT '101129' UNION ALL
	SELECT '101134' UNION ALL
	SELECT '101135' UNION ALL
	SELECT '101136' UNION ALL
	SELECT '101146' UNION ALL
	SELECT '101196' UNION ALL
	SELECT '101203' UNION ALL
	SELECT '101260' UNION ALL
	SELECT '101266' UNION ALL
	SELECT '101304' UNION ALL
	SELECT '101305' UNION ALL
	SELECT '101306' UNION ALL
	SELECT '101307' UNION ALL
	SELECT 'IB6B41' UNION ALL
	SELECT 'IBMD31')
	
	DECLARE @config_string varchar(MAX)
	SET @config_string = '''''IB-100325'''',''''IB-100386'''',''''IB-100394'''',''''IB-100473'''',''''IB-100474'''',''''IB-100500'''',''''IB-100502'''',''''IB-100503'''',''''IB-100507'''',''''IB-100509'''',''''IB-100514'''',''''IB-100521'''',''''IB-100542'''',''''IB-100554'''',''''IB-100726'''',''''IB-100728'''',''''IB-100770'''',''''IB-100823'''',''''IB-100830'''',''''IB-100843'''',''''IB-100845'''',''''IB-100851'''',''''IB-100856'''',''''IB-100861'''',''''IB-100862'''',''''IB-100874'''',''''IB-100899'''',''''IB-100902'''',''''IB-100991'''',''''IB-100992'''',''''IB-100995'''',''''IB-100996'''',''''IB-100997'''',''''IB-100998'''',''''IB-100999'''',''''IB-101000'''',''''IB-101002'''',''''IB-101003'''',''''IB-101005'''',''''IB-101006'''',''''IB-101008'''',''''IB-101010'''',''''IB-101012'''',''''IB-101013'''',''''IB-101014'''',''''IB-101015'''',''''IB-101018'''',''''IB-101019'''',''''IB-101020'''',''''IB-101025'''',''''IB-101026'''',''''IB-101033'''',''''IB-101034'''',''''IB-101035'''',''''IB-101036'''',''''IB-101040'''',''''IB-101042'''',''''IB-101044'''',''''IB-101046'''',''''IB-101052'''',''''IB-101053'''',''''IB-101054'''',''''IB-101060'''',''''IB-101063'''',''''IB-101067'''',''''IB-101068'''',''''IB-101071'''',''''IB-101085'''',''''IB-101094'''',''''IB-101097'''',''''IB-101099'''',''''IB-101102'''',''''IB-101105'''',''''IB-101107'''',''''IB-101110'''',''''IB-101118'''',''''IB-101119'''',''''IB-101121'''',''''IB-101129'''',''''IB-101134'''',''''IB-101135'''',''''IB-101136'''',''''IB-101146'''',''''IB-101196'''',''''IB-101203'''',''''IB-101260'''',''''IB-101266'''',''''IB-101304'''',''''IB-101305'''',''''IB-101306'''',''''IB-101307'''',''''IB-IB6B41'''',''''IB-IBMD31'''''
	
	--SELECT DISTINCT CASE WHEN department = 'Men' THEN 'M-' WHEN department = 'Women' THEN 'W-' WHEN department = 'Men|Women' THEN 'U-' END + name FROM tbl_Purchase_Order WHERE type = 'configurable' AND PO_NUM = 'IB-S14-ADD1'
	
	DECLARE @config_string_verbose varchar(MAX)
	SET @config_string_verbose = '''''M-Aero Short Sleeve Crewe'''',''''M-Aero Tank'''',''''M-Anatomica Boxers w/ Fly'''',''''M-Anatomica Leggings w/ Fly'''',''''M-Blast Long Sleeve Zip'''',''''M-Blast Vest'''',''''M-Departure Short Sleeve Shirt'''',''''M-Drifter Hoody'''',''''M-Drifter Short Sleeve V'''',''''M-Escape Pants'''',''''M-Escape Shorts'''',''''M-Everyday Boxers w/ Fly'''',''''M-Everyday Leggings'''',''''M-Quantum Plus Long Sleeve Hood'''',''''M-Quantum Vest'''',''''M-Quattro Long Sleeve Crewe'''',''''M-Quattro Long Sleeve Hood'''',''''M-Quattro Short Sleeve Polo'''',''''M-Quattro Short Sleeve Polo Stripe'''',''''M-Quattro SS'''',''''M-Rover Hoody'''',''''M-Rover Shorts'''',''''M-Seeker SS'''',''''M-Sonic 5inch Shorts'''',''''M-Sonic Short Sleeve Crewe'''',''''M-Sonic Tank'''',''''M-Tech Short Sleeve Polo'''',''''M-Tech T Lite Short Sleeve All in a Day'''',''''M-Tech T Lite Short Sleeve Lancewood'''',''''M-Tech T Lite Short Sleeve Mt. Blanc'''',''''M-Tech T Lite Short Sleeve Mt. Cook'''',''''M-Tech T Lite Short Sleeve Stripe'''',''''M-Tech T Lite Short Sleeve Wave'''',''''M-Tech T Lite Short Sleeves Alpss'''',''''U-Quantum Arm Warmers'''',''''U-Quantum Cap'''',''''U-Quantum Gloves'''',''''W-3Q Rush 3Q Tights'''',''''W-Allure Dress'''',''''W-Allure Short Sleeve Scoop'''',''''W-Allure Skirt'''',''''W-Bliss Wrap Stripe'''',''''W-Bolt Hipster'''',''''W-Bolt Long Sleeve Half Zip'''',''''W-Cascade Vest'''',''''W-Crush Dress Stripe'''',''''W-Destiny Shorts'''',''''W-Everyday Boy Shorts'''',''''W-Everyday Cami'''',''''W-Everyday Leggings'''',''''W-Everyday Long Sleeve Crewe'''',''''W-Everyday Short Sleeve Crewe'''',''''W-Everyday Tank'''',''''W-Flash Long Sleeve Crewe'''',''''W-Flash Short Sleeve V'''',''''W-Flash Tank'''',''''W-Harmony Short Sleeve Polo'''',''''W-Harmony Short Sleeve V'''',''''W-Harmony Short Sleeve V Plume'''',''''W-Oasis Leggings'''',''''W-Oasis Long Sleeve Crewe'''',''''W-Quantum Plus Long Sleeve Hood'''',''''W-Quantum Vest'''',''''W-Siren Cami Fern'''',''''W-Siren Cami Stripe'''',''''W-Siren Long Sleeve Sweetheart'''',''''W-Siren Long Sleeve Sweetheart Fern'''',''''W-Siren Tank'''',''''W-Siren Tank Botanical'''',''''W-Spirit Capri'''',''''W-Spirit Tank'''',''''W-Sprite Hot pants'''',''''W-Sprite Racerback Bra'''',''''W-Sprite Racerback Tank'''',''''W-Sublime Long Sleeve Zip'''',''''W-Sublime Tank'''',''''W-Tech Short Sleeve Scoop Flax'''',''''W-Tech Short Sleeve Scoop Garden'''',''''W-Tech Short Sleeve V Stripe'''',''''W-Tech T Lite SS'''',''''W-Tech Tank Rift'''',''''W-Tech Tank Tui'''',''''W-Villa Crop Leggings'''',''''W-Villa Crop Pants'''',''''W-Villa Dress Plume'''',''''W-Villa Pants'''',''''W-Villa Skirt'''',''''W-Villa Wrap'''',''''W-Willow 3Q Sleeve'''',''''W-Willow Tank Feather'''',''''W-Zest Shorts'''''
	
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
	CREATE TABLE #missing_data (id int IDENTITY(1,1), issue nvarchar(255),gender nvarchar(255),name nvarchar(MAX),vendor_product_id nvarchar(100),choose_color nvarchar(MAX),vendor_color_code nvarchar(MAX))
	INSERT INTO #missing_data
	SELECT DISTINCT 'Missing Image', department, name, vendor_product_id, choose_color, vendor_color_code
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND type = 'simple' AND image IS NULL
	UNION ALL
	SELECT DISTINCT 'Missing Description', department, name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND description IS NULL OR type = 'configurable' AND description = '')
	UNION ALL
	SELECT DISTINCT 'Missing Features', department, name, vendor_product_id, '', ''
	FROM tbl_Purchase_Order
	WHERE PO_NUM = @po_num AND (type = 'configurable' AND features IS NULL OR type = 'configurable' AND features = '')
	
	/*
	SET @sql = '
	INSERT INTO #missing_data
	SELECT DISTINCT ''Missing ALT Image(s)'', a.name, a.vendor_product_id, '''', ''''
	FROM OPENQUERY(MAGENTO,''
		SELECT b.value AS name, c.value AS vendor_product_id
		FROM catalog_product_entity AS a
		INNER JOIN catalog_product_entity_varchar AS b
		ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''name'''')
		INNER JOIN catalog_product_entity_varchar AS c
		ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''vendor_product_id'''')
		INNER JOIN catalog_product_entity_varchar AS d
		ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''image_alt1_label'''')
		WHERE a.sku IN(' + @config_string + ') AND d.value IS NULL'') AS a'
	EXEC(@sql)
	*/
	
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
	
	--Assign an image value for all configs by picking a random image from its children
	DECLARE @sku nvarchar(255), @style nvarchar(255)
	
	DECLARE c1 CURSOR FOR
	SELECT DISTINCT sku, vendor_product_id FROM tbl_Purchase_Order WHERE PO_NUM = @po_num AND type = 'configurable'
	OPEN c1
	FETCH NEXT FROM c1 INTO @sku, @style
	WHILE @@FETCH_STATUS = 0 BEGIN
	
		SET @sql = '
		UPDATE tbl_Purchase_Order SET image = ISNULL((SELECT TOP 1 image FROM LOT_Inventory.dbo.tbl_LoadFile_' + @season_code + '_' + @brand_code + ' WHERE vendor_product_id = ''' + @style + ''' AND type = ''simple''),NULL) WHERE sku = ''' + @sku + ''''
		EXEC(@sql)
			
		FETCH NEXT FROM c1 INTO @sku, @style
	END
	CLOSE c1
	DEALLOCATE c1
		
	--Purchase Order Type-Specific correlated update:	
	UPDATE a SET
		a.never_backorder = '1',
		a.backorders = '0',
		a.manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_manage_stock = CASE WHEN a.type = 'simple' THEN '1' ELSE '0' END,
		a.use_config_backorders = '1',
		a.merchandise_priority = CASE WHEN a.type = 'simple' THEN NULL ELSE 'Z' END,
		a.status = 'Enabled',
		a.image = CASE WHEN a.image IS NOT NULL AND a.image <> '' THEN a.image ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.small_image = CASE WHEN a.image IS NOT NULL THEN a.image WHEN a.type = 'configurable' THEN NULL ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
		a.thumbnail = CASE WHEN a.image IS NOT NULL THEN a.image WHEN a.type = 'configurable' THEN NULL ELSE a.vendor_product_id + '_' + a.vendor_color_code + '.jpg' END,
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
	
	IF OBJECT_ID('tempdb..##association_sku_discreps') IS NOT NULL BEGIN
		DROP TABLE ##association_sku_discreps
	END	
	IF OBJECT_ID('tempdb..##association_name_gender_discreps') IS NOT NULL BEGIN
		DROP TABLE ##association_name_gender_discreps
	END	
		
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand, b.sku AS sku
	INTO ##association_sku_discreps
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
	
	SET @sql = '
	SELECT a.style AS new_style, a.color_code AS new_color, a.size_code AS new_size, LEFT(b.sku,CHARINDEX(''-'',b.sku) - 1) AS existing_season, b.style AS existing_style, b.color_code AS existing_color, b.size_code AS existing_size, CASE WHEN b.is_in_stock = ''0'' THEN ''OOS'' ELSE ''In-Stock'' END AS is_in_stock, (b.qty - b.qty_reserved) AS qty_on_hand, b.sku AS sku
	INTO ##association_name_gender_discreps
	FROM #po_style_color_size AS a
	FULL JOIN (SELECT sku, is_in_stock, qty, qty_reserved, style, color_code, size_code 
	FROM OPENQUERY(MAGENTO,''
		SELECT simple_products.child_sku AS sku, stock.qty AS qty, stock.stock_reserved_qty AS qty_reserved, stock.is_in_stock AS is_in_stock, style_code.value AS style, color_code.value AS color_code, size_code.value AS size_code
		FROM
			(SELECT x.sku AS parent_sku, a.sku AS child_sku
			FROM catalog_product_entity AS a
			INNER JOIN (SELECT DISTINCT b.sku, a.product_id
						FROM catalog_product_super_link AS a
						INNER JOIN catalog_product_entity AS b
						ON a.parent_id = b.entity_id
						INNER JOIN catalog_product_entity_varchar AS c
						ON b.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''name'''')
						INNER JOIN catalog_product_entity_varchar AS d
						ON b.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''''department'''')
						WHERE CONCAT(CASE WHEN d.value = ''''17215,17216'''' THEN ''''U-'''' 
										  WHEN d.value = ''''17215'''' THEN ''''M-'''' 
										  WHEN d.value = ''''17216'''' THEN ''''W-'''' ELSE '''''''' END,CAST(c.value AS CHAR(255))) IN(' + @config_string_verbose + ')) AS x
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
	
	SELECT DISTINCT a.* FROM (
	SELECT a.*
	FROM ##association_sku_discreps AS a
	LEFT JOIN ##association_name_gender_discreps AS b
	ON a.sku = b.sku
	UNION ALL
	SELECT b.*
	FROM ##association_sku_discreps AS a
	RIGHT JOIN ##association_name_gender_discreps AS b
	ON a.sku = b.sku) AS a
	
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

EXEC Inline_Closeout_PO_Building 'IB-S14-ADD1', 'Inline', 'Icebreaker', 'IB', 'SS14', 504, 93

/*
See below for rules regarding which new SKUs to associate depending on which existing simple products are already associated:

	1.If there is a style-color-size match where the existing associated simple is Inline, only associate the new SKU if the existing Inline SKU is OOS
	2.If there is a style-color-size match where the existing associated simple is Closeout, only associate the new SKU if existing Closeout SKU is OOS
	3.If there is a style-color-size match where the existing associated simple is ASAP:
		a.If the ASAP is OOS, simply associate the new SKU
		b.If the ASAP is In-Stock, associate the new SKU, then once the PO is loaded (and before it gets received), transfer the QTY from the ASAP SKU to the new Inline/Closeout SKU
*/
