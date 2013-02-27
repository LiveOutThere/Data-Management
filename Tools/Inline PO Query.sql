SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13I'), name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, 
                      tax_class_id, department, visibility, image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, 
                      vendor_size_code, 'SS13 Inline' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, '0' AS qty, 
                      '0' AS is_in_stock, simples_skus, REPLACE(url_key,'ss13a','ss13i'), meta_title, videos, weight, NULL AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, 
                      '1' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_COL
WHERE type = 'simple' AND vendor_product_id + ',' + vendor_color_code IN('AM4613,010',
'AM7453,160',
'AM7453,441',
'AM7453,028',
'WM2156,010',
'WM2156,441',
'WM2156,809',
'AL4608,010',
'AL7816,395',
'AL7816,419',
'AL7816,395',
'RL2150,011',
'RL2150,010')

SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13I'), name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, 
                      tax_class_id, department, visibility, image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, 
                      vendor_size_code, 'SS13 Inline' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, 
                      is_in_stock, REPLACE(simples_skus,'SS13A','SS13I'), REPLACE(url_key,'ss13a','ss13i'), meta_title, videos, weight, 'D' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '0' AS manage_stock, '1' AS use_config_backorders, 
                      '0' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_COL
WHERE type = 'configurable' AND vendor_product_id IN('AM4613',
'AM7453',
'WM2156',
'AL4608',
'AL7816',
'RL2150')






