/*UPDATE a
	SET Category = dbo.getCategory(a.Category,a.Brand,b.department)
FROM tbl_SS13_Categorization AS a
INNER JOIN view_Join_S13_Loadfiles AS b
ON a.Style = b.vendor_product_id*/

SELECT * FROM tbl_SS13_Categorization
WHERE SKU IN('SS13A-TNF-A03B',
'SS13A-TNF-A0FK',
'SS13A-TNF-A2XB',
'SS13A-TNF-A2YT',
'SS13A-TNF-A3AY',
'SS13A-TNF-A3BE',
'SS13A-TNF-AQCP',
'SS13A-TNF-AQCQ',
'SS13A-TNF-AR9T',
'SS13A-IB-100276',
'SS13A-IB-100365',
'SS13A-IB-IBQE45',
'SS13A-PAT-83826',
'SS13A-PAT-25541',
'SS13A-PAT-40137',
'SS13A-PAT-49330',
'SS13A-PAT-83185',
'SS13A-PAT-83195',
'SS13A-PAT-83655',
'SS13A-PAT-83801',
'SS13A-PAT-83806',
'SS13A-PAT-83816',
'SS13A-PAT-84756',
'SS13A-PAT-84766',
'SS13A-PAT-84771',
'SS13A-PAT-84820',
'SS13A-PAT-58255',
'SS13A-ARC-10805',
'SS13A-ARC-11917',
'SS13A-ARC-11980',
'SS13A-ARC-12042',
'SS13A-ARC-12129',
'SS13A-ARC-12158',
'SS13A-ARC-12166',
'SS13A-ARC-12397',
'SS13A-MER-12704',
'SS13A-MER-1504',
'SS13A-MER-17879',
'SS13A-MER-19683',
'SS13A-MER-4634',
'SS13A-MER-8161',
'SS13A-MAR-80950',
'SS13A-HH-51008',
'SS13A-HH-62041',
'SS13A-HH-62042',
'SS13A-HH-62053',
'SS13A-HH-62212',
'SS13A-MER-23944',
'SS13A-MER-31850',
'SS13A-MER-4718',
'SS13A-MER-5538')

-- Latest Categorization Approach

CREATE TABLE ##patcat (sku nvarchar(55), brand nvarchar(55), gender nvarchar(55), category nvarchar(MAX))

INSERT INTO ##patcat
SELECT REPLACE(sku,'SS13A-',''), 'Patagonia','', categories 
FROM tbl_Magento_Categories
WHERE sku IN('SS13A-PAT-25442',
'SS13A-PAT-27175',
'SS13A-PAT-27196',
'SS13A-PAT-27470',
'SS13A-PAT-31805',
'SS13A-PAT-31820',
'SS13A-PAT-37120',
'SS13A-PAT-37125',
'SS13A-PAT-43660',
'SS13A-PAT-56856',
'SS13A-PAT-83390',
'SS13A-PAT-83395',
'SS13A-PAT-83650',
'SS13A-PAT-83766',
'SS13A-PAT-83826',
'SS13A-PAT-84240',
'SS13A-PAT-84540',
'SS13A-PAT-84805')

UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-25442'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-27175'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-27196'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-27470'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-31805'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-31820'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-37120'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-37125'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-43660'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-56856'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-83390'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-83395'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-83650'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-83766'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-83826'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-84240'
UPDATE ##patcat SET gender = 'Men' WHERE sku = 'PAT-84540'
UPDATE ##patcat SET gender = 'Women' WHERE sku = 'PAT-84805'

UPDATE ##patcat SET category = dbo.getCategory(category,brand,gender)

SELECT * FROM ##patcat
DROP TABLE ##patcat


