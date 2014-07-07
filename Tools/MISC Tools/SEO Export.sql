IF OBJECT_ID('tempdb..#seo_export') IS NOT NULL BEGIN
	DROP TABLE #seo_export
END

SELECT manufacturer, CASE WHEN department = '17216' THEN 'Women' WHEN department = '17215' THEN 'Men' WHEN department = '17215,17216' THEN 'Unisex' ELSE department END AS department, name, sku, description, features, fabric, url_key + '.html' AS url_key, seo_status, age
INTO #seo_export
FROM OPENQUERY(MAGENTO,'
	SELECT a.sku, b.value AS description, c.value AS features, d.value AS fabric, e.value AS name, g.value AS url_key, f.value AS seo_status, m.value AS manufacturer, k.value AS department, DATEDIFF(CURDATE(),a.created_at) AS age
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
	LEFT JOIN catalog_product_entity_varchar AS j
	ON a.entity_id = j.entity_id AND j.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''department'')
	LEFT JOIN eav_attribute_option_value AS k
	ON j.value = k.option_id AND k.store_id = 0
	LEFT JOIN catalog_product_entity_int AS l
	ON a.entity_id = l.entity_id AND l.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''manufacturer'')
	LEFT JOIN eav_attribute_option_value AS m
	ON l.value = m.option_id AND m.store_id = 0
	WHERE a.type_id = ''configurable'' AND DATEDIFF(CURDATE(),a.created_at) < 60 AND (f.value IS NULL OR f.value = ''new'')')

SELECT DISTINCT manufacturer,
				department, 
				name, 
				sku,
				age, 
				CAST(description AS varchar(MAX)) AS description, 
				CAST(features AS varchar(MAX)) AS features, 
				CAST(fabric AS varchar(MAX)) AS fabric, 
				url_key, 
				seo_status 
FROM #seo_export

SELECT DISTINCT sku, 'checked_out' AS seo_status FROM #seo_export
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

SELECT a.sku, f.value
FROM catalog_product_entity AS a	
LEFT JOIN catalog_product_entity_varchar AS f
ON a.entity_id = f.entity_id AND f.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = 'seo_status')
WHERE a.sku LIKE '%LAS-%'
*/

