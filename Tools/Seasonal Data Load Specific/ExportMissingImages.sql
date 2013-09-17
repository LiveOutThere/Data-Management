SELECT DISTINCT name, vendor_product_id, choose_color, vendor_color_code
FROM tbl_LoadFile_FW13_LOLE
WHERE type = 'simple' AND image IS NULL