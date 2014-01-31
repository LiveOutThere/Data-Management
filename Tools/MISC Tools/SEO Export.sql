SELECT 
	CASE WHEN a.manufacturer = 'Columbia' AND LEFT(a.sku,3) = 'MON' THEN 'Montrail'
		 WHEN a.manufacturer = 'Columbia' AND LEFT(a.sku,3) = 'MHW' THEN 'Mountain Hardwear' ELSE a.manufacturer END AS manufacturer, 
	REPLACE(a.department,'Men|Women','Unisex') AS gender, 
	b.name, 
	a.sku, 
	b.description AS manufacturer_description, 
	b.features AS features,
	b.fabric AS fabric
FROM tbl_Purchase_Order AS a
INNER JOIN (SELECT sku, name, description, features, fabric 
			FROM OPENQUERY(MAGENTO,'
				SELECT a.sku, b.value AS description, c.value AS features, d.value AS fabric, e.value AS name
				FROM catalog_product_entity AS a
				INNER JOIN catalog_product_entity_text AS b
				ON a.entity_id = b.entity_id AND b.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''description'')
				INNER JOIN catalog_product_entity_text AS c
				ON a.entity_id = c.entity_id AND c.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''features'')
				INNER JOIN catalog_product_entity_text AS d
				ON a.entity_id = d.entity_id AND d.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''fabric'')
				INNER JOIN catalog_product_entity_varchar AS e
				ON a.entity_id = e.entity_id AND e.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''name'')
				INNER JOIN catalog_product_entity_varchar AS f
				ON a.entity_id = f.entity_id AND f.attribute_id = (SELECT attribute_id FROM eav_attribute WHERE entity_type_id = 4 AND attribute_code = ''seo_status'')
				WHERE a.type_id = ''configurable'' AND f.value = ''new''')) AS b
ON a.sku = b.sku
WHERE a.PO_NUM LIKE '%S14%' AND a.type = 'configurable'

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