DROP TABLE catalog_product_entity

DROP TABLE catalog_product_entity_varchar_restore
DROP TABLE catalog_product_entity_datetime_restore
DROP TABLE catalog_product_entity_decimal_restore
DROP TABLE catalog_product_entity_int_restore
DROP TABLE catalog_product_entity_media_gallery_restore
DROP TABLE catalog_product_entity_media_gallery_value_restore
DROP TABLE catalog_product_entity_text_restore
DROP TABLE catalog_product_super_link_restore
DROP TABLE catalog_product_relation_restore
DROP TABLE cataloginventory_stock_item_restore
DROP TABLE cataloginventory_stock_status_restore
DROP TABLE catalog_product_website_restore
DROP TABLE catalog_product_entity_restore
DROP TABLE catalog_category_product_restore
DROP TABLE catalog_product_super_attribute_restore
DROP TABLE catalog_product_super_attribute_label_restore

SELECT * INTO catalog_product_entity FROM OPENQUERY(DGDEV,'SELECT * FROM catalog_product_entity')

SELECT a.* INTO catalog_product_entity_restore FROM catalog_product_entity AS a
WHERE entity_id IN (
347640)

-- At this point I created a table on MySQL
-- CREATE TABLE entity_ids_to_restore (entity_id integer)

-- Push these entity_ids back into the Staging database in MySQL so we can do joins against these IDs and the tables containing the actual product data
INSERT INTO OPENQUERY(DGDEV, 'SELECT entity_id FROM entity_ids_to_restore')
SELECT entity_id FROM catalog_product_entity_restore

-- Select the product data from the Staging database for products that were deleted into a series of tables on MSSQL
SELECT * INTO catalog_product_entity_varchar_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_varchar AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')
SELECT * INTO catalog_product_entity_datetime_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_datetime AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')
SELECT * INTO catalog_product_entity_decimal_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_decimal AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')
SELECT * INTO catalog_product_entity_int_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_int AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')
SELECT * INTO catalog_product_entity_media_gallery_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_media_gallery AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')
SELECT * INTO catalog_product_entity_media_gallery_value_restore FROM OPENQUERY(DGDEV,'SELECT c.* FROM catalog_product_entity_media_gallery AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id INNER JOIN catalog_product_entity_media_gallery_value AS c ON a.value_id = c.value_id')
SELECT * INTO catalog_product_entity_text_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_entity_text AS a INNER JOIN entity_ids_to_restore AS b ON a.entity_id = b.entity_id')

-- product simple configurable link data 
SELECT * INTO catalog_product_super_link_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_super_link AS a INNER JOIN entity_ids_to_restore AS b ON a.parent_id = b.entity_id')
SELECT * INTO catalog_product_super_attribute_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_super_attribute AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id')
SELECT * INTO catalog_product_super_attribute_label_restore FROM OPENQUERY(DGDEV,'SELECT c.* FROM catalog_product_super_attribute AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id INNER JOIN catalog_product_super_attribute_label AS c ON a.product_super_attribute_id = c.product_super_attribute_id')
SELECT * INTO catalog_product_relation_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_relation AS a INNER JOIN entity_ids_to_restore AS b ON a.parent_id = b.entity_id')

-- catalog inventory data
SELECT * INTO cataloginventory_stock_item_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM cataloginventory_stock_item AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id')
SELECT * INTO cataloginventory_stock_status_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM cataloginventory_stock_status AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id')

SELECT * INTO catalog_product_website_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_product_website AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id')

SELECT * INTO catalog_category_product_restore FROM OPENQUERY(DGDEV,'SELECT a.* FROM catalog_category_product AS a INNER JOIN entity_ids_to_restore AS b ON a.product_id = b.entity_id')

-- Now let's insert the data we pulled from the Staging database back into the Production database
-- (the LEFT JOIN prevents PK conflicts and allows us to restart where we left off if the query times out)
INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity')
SELECT a.* FROM catalog_product_entity_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT entity_id FROM catalog_product_entity')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

-- Now that we've done catalog_product_entity we can insert to the other tables without getting FK errors
INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_varchar')
SELECT a.* FROM catalog_product_entity_varchar_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_varchar')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_datetime')
SELECT a.* FROM catalog_product_entity_datetime_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_datetime')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_decimal')
SELECT a.* FROM catalog_product_entity_decimal_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_decimal')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_int')
SELECT a.* FROM catalog_product_entity_int_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_int')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_media_gallery')
SELECT a.* FROM catalog_product_entity_media_gallery_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_media_gallery')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_media_gallery_value')
SELECT a.* FROM catalog_product_entity_media_gallery_value_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT value_id FROM catalog_product_entity_media_gallery_value')) AS b
ON a.value_id = b.value_id 
WHERE b.value_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_entity_text')
SELECT a.* FROM catalog_product_entity_text_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT entity_id FROM catalog_product_entity_text')) AS b
ON a.entity_id = b.entity_id 
WHERE b.entity_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_super_link')
SELECT a.* FROM catalog_product_super_link_restore AS a
INNER JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT entity_id FROM catalog_product_entity WHERE type_id = ''simple''')) AS c
ON c.entity_id = a.product_id
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM catalog_product_super_link')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_super_attribute')
SELECT a.* FROM catalog_product_super_attribute_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM catalog_product_super_attribute')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_super_attribute_label')
SELECT a.* FROM catalog_product_super_attribute_label_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_super_attribute_id FROM catalog_product_super_attribute_label')) AS b
ON a.product_super_attribute_id = b.product_super_attribute_id 
WHERE b.product_super_attribute_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_relation')
SELECT a.* FROM catalog_product_relation_restore AS a
INNER JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT entity_id FROM catalog_product_entity WHERE type_id = ''simple''')) AS c
ON c.entity_id = a.child_id
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT child_id FROM catalog_product_relation')) AS b
ON a.child_id = b.child_id 
WHERE b.child_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_category_product')
SELECT a.* FROM catalog_category_product_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM catalog_category_product')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM cataloginventory_stock_item')
SELECT a.* FROM cataloginventory_stock_item_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM cataloginventory_stock_item')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM cataloginventory_stock_status')
SELECT a.* FROM cataloginventory_stock_status_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM cataloginventory_stock_status')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

INSERT INTO OPENQUERY(MAGENTO, 'SELECT * FROM catalog_product_website')
SELECT a.* FROM catalog_product_website_restore AS a
LEFT JOIN (SELECT * FROM OPENQUERY(MAGENTO, 'SELECT DISTINCT product_id FROM catalog_product_website')) AS b
ON a.product_id = b.product_id 
WHERE b.product_id IS NULL

