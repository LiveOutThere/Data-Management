INSERT
OPENQUERY(MAGENTO,'SELECT warranty_id, date_added, problem_comment, customer_name, customer_phone, customer_email, style, season, product_name, gender, size, color, store, 
                      ra, solution, status, supplier_id FROM lotwarranty_warranty')
SELECT
warranty_id,
date_added, 
problem_comment, 
customer_name, 
customer_phone, 
customer_email, 
style, 
season, 
product_name, 
CASE WHEN gender = 'Girl' THEN '17214' WHEN gender = 'Men' THEN '17215' WHEN gender = 'Women' THEN '17216' WHEN gender = 'N/A' THEN '42192' END, 
size, 
color, 
CASE WHEN store = 'OTAC' THEN 'outthere' ELSE 'liveoutthere' END AS store, 
ra,
CASE WHEN solution = 'Repair/Replace' THEN 'customer' WHEN solution = 'Credit' THEN 'store' WHEN solution = 'Replace' THEN 'customer' ELSE 'store' END AS type, 
CASE WHEN status = 'Open' AND ra = '' THEN 'pending_ra' 
	 WHEN status = 'Closed' AND EXISTS (SELECT note FROM tbl_Warranty_Note AS a INNER JOIN tbl_Warranty AS b ON a.warranty_id = b.warranty_id WHERE note LIKE '%credit%') THEN 'resolved_refunded' 
	 WHEN status = 'Closed' AND EXISTS (SELECT note FROM tbl_Warranty_Note AS a INNER JOIN tbl_Warranty AS b ON a.warranty_id = b.warranty_id WHERE note LIKE '%replacement%OTAC%') THEN 'resolved_store'
	 WHEN status = 'Closed' THEN 'resolved_shipped_customer' ELSE 'pending' END AS status,
CASE WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Arc''teryx' THEN 3
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Mountain Hardwear' THEN 4                
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'The North Face' THEN 5                   
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Marmot' THEN 6                           
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Icebreaker' THEN 7                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Lole' THEN 8                             
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Lolë' THEN 8                            
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Osprey' THEN 9                           
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Columbia' THEN 15752                     
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Sorel' THEN 16531                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Atlas' THEN 16534                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'SmartWool' THEN 16539                    
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Helly Hansen' THEN 18030                 
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Smith' THEN 26154                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Nathan' THEN 26220                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'CamelBak' THEN 26225                     
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Leki' THEN 26256                         
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Asolo' THEN 26303                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Merrell' THEN 26329                      
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Giro' THEN 27136                         
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Outdoor Research' THEN 27156             
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Buffs' THEN 28926                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Deuter' THEN 28994                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Nikwax' THEN 31186                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Patagonia' THEN 39407                    
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Millet' THEN 42157
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Ambler' THEN 42174                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Outside Inside' THEN 42175               
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'NiteIze' THEN 42176                      
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Montrail' THEN 42177                     
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Keen' THEN 42178                         
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Life is Good' THEN 42179                 
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Petzl' THEN 42180                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Ice Trekkers' THEN 42181                 
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Ryders' THEN 42182                       
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Polar' THEN 42183                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'GoPro' THEN 42184                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Exped' THEN 42185                        
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'MSR' THEN 42186                          
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Auclair' THEN 42187                      
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Sea to Summit' THEN 42188                
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Pacsafe' THEN 42189                      
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Laundromat' THEN 42190                   
WHEN (SELECT brand FROM tbl_Brand WHERE brand_id = a.brand_id) = 'Salomon' THEN 42191 END AS brand_id                
FROM tbl_Warranty AS a

INSERT
OPENQUERY(MAGENTO,'SELECT ot_created_at, ot_author_user, ot_caption, ot_entity_type, ot_entity_id, ot_entity_description FROM organizer_task')
SELECT

date,
11,
note,
'Warranty',
warranty_id,
'Warranty #' + CAST(warranty_id AS nvarchar(128))

FROM tbl_Warranty_Note