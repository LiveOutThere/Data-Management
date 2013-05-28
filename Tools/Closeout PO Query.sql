SELECT DISTINCT store, websites, type, REPLACE(sku,'FW12A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, gender AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, simples_skus, 
                      REPLACE(url_key,'fw12a','ss13c'), '' AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, '1' AS use_config_manage_stock
FROM tbl_LoadFile_F12_HH
WHERE type = 'simple' AND vendor_product_id + ',' + vendor_color_code + ',' + choose_size IN('51006,485,2XL',
'51006,485,L',
'51006,485,M',
'51006,485,S',
'51006,485,XL',
'51006,990,2XL',
'51006,990,L',
'51006,990,M',
'51006,990,S',
'51006,990,XL',
'62063,990,L',
'62063,990,M',
'62063,990,S',
'62063,990,XL',
'66510,204,2XL',
'66510,204,L',
'66510,204,M',
'66510,204,XL')


SELECT DISTINCT store, websites, type, REPLACE(sku,'FW12A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, gender AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, REPLACE(simples_skus,'FW12A','SS13C'), 
                      REPLACE(url_key,'fw12a','ss13c'), 'Helly Hansen ' + REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') + CASE WHEN gender = 'Men' THEN ' - Men''s' WHEN gender = 'Women' THEN ' - Women''s' ELSE ' - Unisex' END AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, '1' AS use_config_manage_stock
FROM tbl_LoadFile_F12_HH
WHERE type = 'configurable' AND vendor_product_id IN('51006',
'62063',
'66510')