SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13I'), name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, 
                      tax_class_id, department, visibility, image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku AS 'ean', vendor_product_id, vendor_color_code, 
                      vendor_size_code, 'SS13 Inline' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, '0' AS qty, 
                      '0' AS is_in_stock, simples_skus, REPLACE(url_key,'ss13a','ss13i'), meta_title, videos, weight, NULL AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '1' AS manage_stock, '1' AS use_config_backorders, 
                      '1' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_COL AS a
INNER JOIN tbl_RawData_SS13_COL_MHW_UPC AS b
ON LEFT(LTRIM(RTRIM(b.[JDE Style Color])),6) = a.vendor_product_id
WHERE type = 'simple' AND LEFT(LTRIM(RTRIM(b.[Material Number])),7) + ',' + a.vendor_color_code IN('1493551,100',
'1493551,010',
'1493551,400',
'1521521,100',
'1521521,695',
'1521521,010',
'1493661,809',
'1493661,441',
'1493661,385',
'1502621,010',
'1495551,513',
'1495551,100',
'1495551,343',
'1522031,463',
'1522031,864',
'1522031,010',
'1522031,100',
'1495681,385',
'1495681,307')


SELECT DISTINCT store, websites, type, REPLACE(sku,'SS13A','SS13I'), name, categories, attribute_set, configurable_attributes, has_options, price, cost, super_attribute_pricing, status, 
                      tax_class_id, department, visibility, image, image_label, small_image, thumbnail, choose_color, choose_size, vendor_sku, vendor_product_id, vendor_color_code, 
                      vendor_size_code, 'SS13 Inline' AS season_id, short_description, description, features, activities, weather, layering, care_instructions, fabric, fit, volume, manufacturer, qty, 
                      is_in_stock, REPLACE(simples_skus,'SS13A','SS13I'), REPLACE(url_key,'ss13a','ss13i'), meta_title, videos, weight, 'D' AS merchandise_priority, '1' AS never_backorder, '0' AS backorders, '0' AS manage_stock, '1' AS use_config_backorders, 
                      '0' AS use_config_manage_stock
FROM tbl_LoadFile_SS13_COL AS a
INNER JOIN tbl_RawData_SS13_COL_MHW_UPC AS b
ON LEFT(LTRIM(RTRIM(b.[JDE Style Color])),6) = a.vendor_product_id
WHERE type = 'configurable' AND LEFT(LTRIM(RTRIM(b.[Material Number])),7) IN('1493551',
'1521521',
'1493661',
'1502621',
'1495551',
'1522031',
'1495681')