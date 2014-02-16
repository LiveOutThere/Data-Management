IF OBJECT_ID('tempdb..#seo_export') IS NOT NULL BEGIN
	DROP TABLE #seo_export
END

SELECT manufacturer, CASE WHEN department = '17216' THEN 'Women' WHEN department = '17215' THEN 'Men' WHEN department = '17215,17216' THEN 'Unisex' ELSE department END AS department, name, sku, description, features, fabric, url_key + '.html' AS url_key, seo_status, po_name
INTO #seo_export
FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, b.value AS description, c.value AS features, d.value AS fabric, e.value AS name, g.value AS url_key, f.value AS seo_status, h.manufacturer_value AS manufacturer, h.department, k.po_order_id AS po_name
	FROM catalog_product_entity AS a
	LEFT JOIN catalog_product_entity_text AS b
	ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''description'')
	LEFT JOIN catalog_product_entity_text AS c
	ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''features'')
	LEFT JOIN catalog_product_entity_text AS d
	ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''fabric'')
	LEFT JOIN catalog_product_entity_varchar AS e
	ON a.entity_id = e.entity_id AND e.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''name'')
	LEFT JOIN catalog_product_entity_varchar AS f
	ON a.entity_id = f.entity_id AND f.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''seo_status'')
	LEFT JOIN catalog_product_entity_varchar AS g
	ON a.entity_id = g.entity_id AND g.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''url_key'')
	LEFT JOIN catalog_product_flat_1 AS h
	ON a.entity_id = h.entity_id
	INNER JOIN catalog_product_super_link AS i
	ON a.entity_id = i.parent_id
	INNER JOIN purchase_order_product AS j
	ON i.product_id = j.pop_product_id
	INNER JOIN purchase_order AS k
	ON j.pop_order_num = k.po_num
	WHERE a.type_id = ''configurable'' AND k.po_order_id LIKE ''%S14%'' AND (f.value IS NULL OR f.value = ''new'')')

SELECT DISTINCT a.po_name, a.manufacturer, a.department, a.name, a.sku, CAST(a.description AS varchar(MAX)) AS description, CAST(a.features AS varchar(MAX)) AS features, CAST(a.fabric AS varchar(MAX)) AS fabric, a.url_key, a.seo_status 
FROM #seo_export AS a
FULL JOIN tbl_Purchase_Order AS b
ON a.sku = b.sku
WHERE ISNULL(b.PO_NUM,'S14') LIKE '%S14%'
ORDER BY a.po_name 

SELECT DISTINCT sku FROM #seo_export
/*

MAGENTO ATTRIBUTES

seo_status - tracks status of configurable product description & features SEO optimization
seo_status_date - tracks last updated date of seo_status attribute (used to calculate "staleness" of SEO optimized product descriptions & features)

SEO Statuses:

new - ALL products that either have never been optimized, or are currently checked_out
checked_out - ALL products that have been exported and are currently being optimized by Dave Nagy's copy writing team
desc_optimized - ALL products that have come back from Dave Nagy with an SEO Optimized product description
fully_optimized - ALL products that have come back from Dave Nagy with SEO Optimized product features
???stale??? - seo_status IN('desc_optimized','fully_optimized') AND DATEDIFF(CURDATE(),seo_status_date, INTERVAL DAY) > 365

*/

--CHECKER

/*
SELECT * FROM OPENQUERY(MAGENTO,'
	SELECT DISTINCT value 
	FROM catalog_product_entity_datetime
	WHERE attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''seo_status_date'')')
*/