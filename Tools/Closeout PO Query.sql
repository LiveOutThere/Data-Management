SELECT DISTINCT store, websites, type, REPLACE(sku,'FW12A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, gender AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, simples_skus, 
                      REPLACE(url_key,'fw13a','ss13c'), '' AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, '1' AS use_config_manage_stock
FROM tbl_LoadFile_F12_OSP
WHERE type = 'simple' AND vendor_product_id + ',' + choose_color IN('34522,Indigo',
'33534,Shale',
'33534,Tarn',
'33524,Tarn',
'33524,Shale',
'25036,Amethyst',
'25036,Aquamarine',
'25024,Amethyst',
'25024,Aquamarine',
'16613,Go Green',
'16613,Flashpoint Red',
'27608,Black',
'27608,Teal Blue',
'27608,Plum Purple',
'17625,Black',
'17625,Chili Red',
'17625,Cool Grey')


SELECT DISTINCT store, websites, type, REPLACE(sku,'FW12A','SS13C') AS sku, REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') AS name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, tax_class_id, gender AS 'department', visibility, 
                      image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, vendor_size_code, 
                      'SS13 Closeout' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, is_in_stock, REPLACE(simples_skus,'FW12A','SS13C'), 
                      REPLACE(url_key,'fw12a','ss13c'), 'Arcteryx ' + REPLACE(REPLACE(name,'Women''s ',''),'Men''s ','') + CASE WHEN gender = 'Men' THEN ' - Men''s' WHEN gender = 'Women' THEN ' - Women''s' ELSE ' - Unisex' END AS meta_title, videos, weight, '' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, '1' AS use_config_manage_stock
FROM tbl_LoadFile_F12_ARC
WHERE type = 'configurable' AND vendor_product_id IN('7357',
'10295',
'9048',
'10246',
'10907',
'11441',
'5845',
'5844',
'10291',
'9209',
'9217',
'8980',
'8973',
'8972',
'9603')