USE LOT_Inventory
GO

IF OBJECT_ID('tempdb..#skucolorfamily') IS NOT NULL BEGIN
	DROP TABLE #skucolorfamily
END
	
CREATE TABLE #skucolorfamily (brand varchar(255), sku varchar(255), choose_color varchar(255), color_family varchar(255))

INSERT INTO #skucolorfamily (sku, choose_color)
SELECT * FROM OPENQUERY(MAGENTO,'
SELECT DISTINCT a.sku, c.value AS choose_color
FROM catalog_product_entity AS a
INNER JOIN catalog_product_entity_int AS b
ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''choose_color'')
INNER JOIN eav_attribute_option_value AS c
ON b.value = c.option_id
LEFT JOIN catalog_product_entity_varchar AS d
ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''color_family'')
LEFT JOIN eav_attribute_option_value AS e
ON d.value = e.option_id	
WHERE a.sku LIKE ''SS14%'' AND a.type_id = ''simple'' AND e.value IS NULL')

UPDATE a SET
	a.brand = SUBSTRING(SUBSTRING(b.sku,7,LEN(b.sku)),0,CHARINDEX('-',SUBSTRING(b.sku,7,LEN(b.sku))))
FROM #skucolorfamily AS a
INNER JOIN #skucolorfamily AS b
ON a.sku = b.sku
				
UPDATE a
	SET a.color_family = CASE WHEN b.color_family2 IS NOT NULL THEN b.color_family1 + '|' + b.color_family2 ELSE b.color_family1 END
FROM #skucolorfamily AS a
INNER JOIN tbl_Color_Family_Lookup AS b
ON a.choose_color = b.choose_color COLLATE SQL_Latin1_General_CP1_CI_AS AND a.brand = b.brand COLLATE SQL_Latin1_General_CP1_CI_AS

SELECT DISTINCT sku, color_family FROM #skucolorfamily WHERE color_family IS NOT NULL

/* SOURCE FOR MECHANICAL TURK PROJECT:

<h3>Colour Test</h3>

<div class="highlight-box">
<p><span style="line-height: 1.6em;">If the product in the image has equal (or almost equal) portions of&nbsp;two distinct colours (I.E. &quot;Red&quot; &amp; &quot;White&quot;):</span></p>

<ul>
	<li>Choose &quot;Red&quot;&nbsp;for Colour Family 1, and &quot;White&quot;&nbsp;for Colour Family 2.</li>
</ul>

<p><span style="line-height: 1.6em;">If the product in the image has&nbsp;</span>equal or almost equal portions<strong> of&nbsp;</strong><span style="line-height: 1.6em;"><strong>more than two colours</strong>:</span></p>

<ul>
	<li><span style="line-height: 1.6em;">​C</span>hoose multi-colour for Colour Family 1, and leave Colour Family 2 blank.</li>
</ul>

<p>If&nbsp;the product in the image is PRIMARILY one colour, but contains an&nbsp;accent colour or colours:</p>

<ul>
	<li>Choose the primary colour for Colour Family 1, and leave Colour Family 2 blank.</li>
</ul>
</div>

<p><strong>START!!!</strong></p>

<p>Color Name: ${choose_color}</p>

<p>Brand: ${brand}</p>

<p>Image: <img src="${image}" /></p>

<p>Select your choice for Colour Family 1:</p>

<table border="0" cellpadding="0" cellspacing="4">
	<tbody>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice1" /></td>
			<td><span class="answertext">Black</span></td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>White</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Multi-Colour</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Blue</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Green</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Beige</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Brown</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Grey</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Teal</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Orange</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Pink</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Red</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Yellow</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Purple</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Burgundy</td>
		</tr>
	</tbody>
</table>

<p>Select your choice for Colour Family 2:</p>

<table border="0" cellpadding="0" cellspacing="4">
	<tbody>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice1" /></td>
			<td><span class="answertext">Black</span></td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>White</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Blue</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Green</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Beige</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Brown</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Grey</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Teal</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Orange</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Pink</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Red</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Yellow</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Purple</td>
		</tr>
		<tr>
			<td valign="center"><input name="Q1" type="radio" value="Choice2" /></td>
			<td>Burgundy</td>
		</tr>
	</tbody>
</table>

<p><span style="color: rgb(68, 68, 68); font-family: 'courier new'; font-size: 14px; line-height: normal; background-color: rgb(246, 244, 240);">
<style type="text/css"><!--
.highlight-box { border:solid 0px #98BE10; background:#FCF9CE; color:#222222; padding:4px; text-align:left; font-size: smaller;}
-->
</style>
</span></p>

*/