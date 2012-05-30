--manually import skus into the sku column via copying and pasting
--manually import names
--manually import UPCs

UPDATE tbl_LoadFile_CloseOut SET stock_location = 'On-Hand', season = 'S12 Special Buy 2', manufacturer = ''

SET department = 'Women' WHERE name like 'Women''s'
			   = 'Men' WHERE name like 'Men''s'
			   = 'Women|Men' WHERE name not like 'Women''s' OR 'Men''s'	
	
	SET vendor_product_id = SUBSTRING(sku,,)
		
		SET type = 'simple' WHERE vendor_product_id is not null
			
			SET vendor_color_code = SUBSTRING(sku,,)
				
				SET choose_color = '' WHERE sku like ''
								   '' WHERE sku like ''
								   '' WHERE sku like ''
					SET image_label = choose_color
					
			SET vendor_size_code = SUBSTRING(sku,,)
				SET choose_size = vendor_size_code
				
			SET cost = ''WHERE sku like ''
						  WHERE sku like ''
						  WHERE sku like ''
			SET price = ''WHERE sku like ''
						  WHERE sku like ''
						  WHERE sku like ''
						  WHERE sku like ''
						  
--manually enter quantities
		
		SET type = 'configurable' WHERE vendor_product_id is null
			
			SET configurable_attributes = 'choose_color, choose_size', has_options = '1', visibility = 'Catalog, Search' WHERE type = 'configurable'
			
--manually enter short description, description, and features			
			
CREATE FUNCTION getAssociatedSkus(
	@input varchar(50)
)
RETURNS varchar(4000)	
BEGIN
	DECLARE @output nvarchar(4000)

	(SELECT @output = COALESCE(@output + ',', '') + sku FROM
	(SELECT sku AS sku
		FROM tbl_LoadFile_CloseOut WHERE (vendor_product_id = @input) AND type = 'simple')
	 AS x)
	RETURN @output
END
GO

UPDATE a SET
	simples_skus = dbo.getAssociatedSkus(a.vendor_product_id)
FROM tbl_LoadFile_CloseOut AS a
WHERE manufacturer = '' AND type = 'configurable'


DROP FUNCTION getAssociatedSkus
GO

--don't forget to change the table name to the correct table for both the associated skus and media gallery sections

SET image = SUBSTRING(sku,,) + '.jpg' WHERE type = 'simple'
	SET small_image = image, thumbnail = image
--manually copy image name from simple of choice into image, small_image, and thumbnail for configurables

CREATE FUNCTION [dbo].[getMediaGallery](
	@productid nvarchar(4000)
)
RETURNS nvarchar(4000)
AS
BEGIN
	DECLARE @output nvarchar(4000)
	
	(SELECT @output = COALESCE(@output + ';', '') + Photo FROM
	(SELECT DISTINCT image + CASE WHEN image_label IS NOT NULL THEN '::' + image_label ELSE '' END AS Photo FROM tbl_LoadFile_CloseOut WHERE type = 'simple' AND vendor_product_id = @productid AND image IS NOT NULL AND image <> (SELECT TOP 1 image FROM tbl_LoadFile_CloseOut WHERE type = 'configurable' AND vendor_product_id = @productid)) AS x)
	 	
	RETURN @output

END
GO

UPDATE a SET
	media_gallery = dbo.getMediaGallery(a.vendor_product_id)
FROM tbl_LoadFile_CloseOut AS a
WHERE manufacturer = '' AND type = 'configurable'


DROP FUNCTION dbo.getMediaGallery
GO

--DONE!!!
