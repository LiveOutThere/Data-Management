SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, department AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, simples_skus, 
                      REPLACE(url_key,'ss13a','ss13c'), '' AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, '1' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_MER
WHERE type = 'simple' AND vendor_product_id /*+ ',' + vendor_color_code + ',' + choose_size*/ IN('J89440',
'J16042',
'J15205',
'J39017',
'J41739',
'J39337',
'J39993',
'J41233',
'J39989',
'J39801',
'J68276',
'J57240',
'J57322',
'J57324',
'J55776',
'J68788',
'J57924',
'J57928')


SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, department AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, REPLACE(simples_skus,'SS13A','SS13C'), 
                      REPLACE(url_key,'ss13a','ss13c'), 'Merrell ' + REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') + CASE WHEN department = 'Men' THEN ' - Men''s' WHEN department = 'Women' THEN ' - Women''s' ELSE ' - Unisex' END AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '0' AS manage_stock, '1' AS use_config_backorders, '0' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_MER
WHERE type = 'configurable' AND name IN('Axis 2',
'Siren vent Mid Gore-Tex®',
'Geomorph Blaze Mid Waterproof',
'Mix Master Tuff',
'Mix Master 2 Waterproof',
'Chameleon 5 Mid Ventilator Waterproof',
'Chameleon Arc Contender Waterproof',
'Crush Glove',
'Mimosa Lace',
'Avian Light Ventilator Waterproof',
'Siren Sport Gore-Tex®')--'JWS10046','JWS10005','JMS21092')

SELECT * FROM tbl_LoadFile_S12_MER WHERE name LIKE '%lithe%'