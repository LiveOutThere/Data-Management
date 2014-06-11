SELECT DISTINCT department, name, vendor_product_id 
FROM tbl_LoadFile_SS14_MERFOOT
WHERE department + '-' + name IN('Men-Allout Blaze',
'Men-Allout Rush',
'Men-Bare Access 3',
'Men-Mix Master Move',
'Men-Moab Ventilator',
'Men-Mountain Moc',
'Men-Pulsate Ventilator',
'Men-Rant',
'Men-Road Glove 3',
'Women-Allout Rush',
'Women-Azura Waterproof',
'Women-Bare Access Arc 3',
'Women-Mix Master Move Glide',
'Women-Pace Glove 2',
'Women-Road Glove Dash 3',
'Women-Siren Sport',
'Women-Siren Sport Gore-Tex®®')