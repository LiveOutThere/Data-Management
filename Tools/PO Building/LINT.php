<?php

ini_set("auto_detect_line_endings", true);

class Linter 
{
	const STORE = 0;
	const WEBSITES = 1;
	const TYPE = 2;
	const SKU = 3;
	const NAME = 4;
	const CATEGORIES = 5;
	const ATTRIBUTE_SET = 6;
	const CONFIGURABLE_ATTRIBUTES = 7;
	const HAS_OPTIONS = 8;
	const PRICE = 9;
	const COST = 10;
	const SUPER_ATTRIBUTE_PRICING = 11;
	const STATUS = 12;
	const TAX_CLASS_ID = 13;
	const DEPARTMENT = 14;
	const VISIBILITY = 15;
	const IMAGE = 16;
	const IMAGE_LABEL = 17;
	const SMALL_IMAGE = 18;
	const THUMBNAIL = 19;
	const CHOOSE_COLOR = 20;
	const CHOOSE_SIZE = 21;
	const VENDOR_PRODUCT_ID = 22;
	const VENDOR_COLOR_CODE = 23;
	const VENDOR_SIZE_CODE = 24;
	const SEASON_ID = 25;
	const DESCRIPTION = 26;
	const FEATURES = 27;
	const FABRIC = 28;
	const CARE_INSTRUCTIONS = 29;
	const FIT = 30;
	const VOLUME = 31;
	const MANUFACTURER = 32;
	const QTY = 33;
	const IS_IN_STOCK = 34;
	const SIMPLES_SKUS = 35;
	const URL_KEY = 36;
	const META_TITLE = 37;
	const MERCHANDISE_PRIORITY = 38;
	const NEVER_BACKORDER = 39;
	const BACKORDERS = 40;
	const MANAGE_STOCK = 41;
	const USE_CONFIG_BACKORDERS = 42;
	const USE_CONFIG_MANAGE_STOCK = 43;
	const VENDOR_SKU = 44;

	var $simple_skus = Array();

	function getExpectedColumnHeaders()
	{
		$columns = Array(
		'store',
		'websites',
		'type',
		'sku',
		'name',
		'categories',
		'attribute_set',
		'configurable_attributes',
		'has_options',
		'price',
		'cost',
		'super_attribute_pricing',
		'status',
		'tax_class_id',
		'department',
		'visibility',
		'image',
		'image_label',
		'small_image',
		'thumbnail',
		'choose_color',
		'choose_size',
		'vendor_product_id',
		'vendor_color_code',
		'vendor_size_code',
		'season_id',
		'description',
		'features',
		'fabric',
		'care_instructions',
		'fit',
		'volume',
		'manufacturer',
		'qty',
		'is_in_stock',
		'simples_skus',
		'url_key',
		'meta_title',
		'merchandise_priority',
		'never_backorder',
		'backorders',
		'manage_stock',
		'use_config_backorders',
		'use_config_manage_stock',
		'vendor_sku');
		return $columns;
	}

	function findMissingSimpleSkus($input)
	{
		if (!in_array($input,$this->simple_skus))
			return true;
		else
			return false;
	}

	function getMetaTitleDepartment($input)
	{
		switch ($input) {
			case 'Men':
				return 'Men\'s';
				break;
			case 'Women':
				return 'Women\'s';
				break;
			case 'Men|Women':
				return '';
				break;
			case 'Boy':
				return 'Boy\'s';
				break;
			case 'Girl':
				return 'Girl\'s';
				break;
			case 'Infant':
				return 'Infant\'s';
				break;
		}
	}

	function showErrors($errors)
	{
		echo "\n";

		if (count($errors['global_errors']))
			echo "Global Errors:\n\n" . implode("\n",$errors['global_errors']) . "\n\n";

		if (count($errors['simple_errors'])) 
			echo "Simple Errors:\n\n" . implode("\n",$errors['simple_errors']) . "\n\n";

		if (count($errors['configurable_errors'])) 
			echo "Configurable Errors:\n\n" . implode("\n",$errors['configurable_errors']) . "\n\n";

		if (count($errors['warnings'])) 
			echo "Warnings:\n\n" . implode("\n",$errors['warnings']) . "\n\n";

		else
			if ((!count($errors['global_errors'])) && (!count($errors['simple_errors'])) && (!count($errors['configurable_errors']))) 
				echo "\n*********\nCongratulations, your loadfile is error free!\n*********\n\n";
	}

	function __construct($filename) 
	{
		if (empty($filename)) {
			throw new Exception('Bad file');			
		}
		else {
			$expected_columns = $this->getExpectedColumnHeaders();
			
			$global_errors = Array();
			$simple_errors = Array();
			$configurable_errors = Array();
			$warnings = Array();

			$sku_parts = Array();
			$types = Array();
			$manufacturer = Array();
			$configurable_names = Array();
			$configurable_styles = Array();
			$simple_names = Array();
			$simple_styles = Array();
			$simple_price_cost = Array();

			$row = 0;
			if (($handle = fopen($filename, "r")) !== FALSE) {
	   			while (($data = fgetcsv($handle, 0, ",")) !== FALSE) {
	   				if ($row == 0) {
						for ($c = 0; $c < count($data); $c++) {
							if ($data[$c] != $expected_columns[$c])
								$global_errors[] = 'Header column mismatch in column ' . ($c+1) . '. Check your column names are correct and in the right order.';
						}
	   				}
	   				else {
						
						$sku_parts[] = substr($data[Linter::SKU],0,9);
						$types[] = $data[Linter::TYPE];
						$manufacturer[] = $data[Linter::MANUFACTURER];
						$attribute_sets = Array('default','Sleeping Bags','Daypacks Backpacks & Luggage','Skirts Skorts & Dresses','Gloves & Mitts','Hats','Footwear','Jackets & Vests','Pants & Shorts','Shirts & Tops','Tents & Footprints','Underwear');
						$departments = Array('Men','Women','Men|Women','Boy','Girl','Boy|Girl','Infant');
						$seasons = Array('SS13 Closeout','FW13 Closeout', 'SS14 Closeout', 'FW13 Inline', 'SS14 Inline', 'FW13 ASAP', 'SS14 ASAP');
						
						// Warning Rules //

						if ($data[Linter::MANUFACTURER] == 'Merrell' && $data[Linter::TYPE] == 'configurable' && $data[Linter::PRICE] < '50.00')
							$warnings[] = 'Check the simples_skus value on ' . ($row+1) . '. Verify that the correct simple products are associated because this is a cheap Merrell configurable.';

						if ($data[Linter::PRICE] < $data[Linter::COST])
							$warnings[] = 'Check the price & cost values on ' . ($row+1) . '. The price is lower than the cost!';

						// Test Rules for Simple & Configurable Products //

						if ($data[Linter::STORE] != 'admin') 
								$global_errors[] = 'The store value is wrong on row ' . ($row+1) . '. It should be set to admin but it is set to: ' . $data[Linter::STORE];
						
						if ($data[Linter::WEBSITES] != 'base') 
								$global_errors[] = 'The websites value is wrong on row ' . ($row+1) . '. It should be set to base but it is set to: ' . $data[Linter::WEBSITES];
						
						if (preg_match('/[^a-zA-Z0-9®™\-\/ ]/',$data[Linter::NAME])) 
								$global_errors[] = 'Check the name value on row ' . ($row+1) . '. It contains a special character that we may not want: ' . $data[Linter::NAME];

						if (empty($data[Linter::NAME]) || strlen($data[Linter::NAME]) <= 5 || !preg_match('/[e|a|i|o|u|y]/',$data[Linter::NAME])) 
								$global_errors[] = 'Check the name value on row ' . ($row+1) . '. It is either empty, contains no vowels, or has less than five characters, which is suspicious: "' . $data[Linter::NAME] . '"';
						
						if (empty($data[Linter::PRICE]) || substr($data[Linter::PRICE],-3) != '.99' || preg_match('/[^0-9.]/',$data[Linter::PRICE])) 
								$global_errors[] = 'Check the price value for row ' . ($row+1) . '. It is either NULL, contains something other than a number, or does not end in .99: ' . $data[Linter::PRICE];		

						if (empty($data[Linter::COST]) || preg_match('/[^0-9.]/',$data[Linter::COST]))  
								$global_errors[] = 'Check the cost value for row ' . ($row+1) . '. It is either NULL or contains something besides a number: ' . $data[Linter::COST];

						if ($data[Linter::TAX_CLASS_ID] != 'Taxable Goods') 
								$global_errors[] = 'The tax code is wrong on row ' . ($row+1) . '. It should be set to Taxable Goods but it is set to: ' . $data[Linter::TAX_CLASS_ID];
						
						if (!in_array($data[Linter::DEPARTMENT],$departments)) 
								$global_errors[] = 'The department is wrong on row ' . ($row+1) . '. It is not one of our allowed department values: ' . $data[Linter::DEPARTMENT];

						if (empty($data[Linter::VENDOR_PRODUCT_ID])) 
								$global_errors[] = 'The vendor_product_id value is NULL on row ' . ($row+1) . '.';

						if (!in_array($data[Linter::SEASON_ID],$seasons)) 
								$global_errors[] = 'The season_id value is wrong on row ' . ($row+1) . '. It is not one of our allowed season values: ' . $data[Linter::SEASON_ID];

						// Simple Product Test Rules //

						if ($data[Linter::TYPE] == 'simple') {

							if (isset($simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]]) && ($simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]]['price'] != $data[Linter::PRICE] || $simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]]['cost'] != $data[Linter::COST])) {

								$error_already_exists = false;
								foreach ($simple_errors as $error) {
									if ($error == 'The simple products for ' . $data[Linter::VENDOR_PRODUCT_ID] . ' have different prices or costs!')
										$error_already_exists = true;
								}

								if (!$error_already_exists)
									$simple_errors[] = 'The simple products for ' . $data[Linter::VENDOR_PRODUCT_ID] . ' have different prices or costs!';
							}

							$simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]] = Array('price' => $data[Linter::PRICE], 'cost' => $data[Linter::COST]); 
							$simple_names[] = $data[Linter::NAME];
							$simple_styles[] = $data[Linter::VENDOR_PRODUCT_ID];
							$this->simple_skus[] = $data[Linter::SKU];

							//if (count(explode('-', $data[Linter::SKU])) != 5) 
							//	$simple_errors[] = 'The SKU is improperly formatted on row ' . ($row+1) . '. It should have four dashes but it looks like this: ' . $data[Linter::SKU];
							
							if (!empty($data[Linter::CATEGORIES])) 
								$simple_errors[] = 'Check the categories value for row ' . ($row+1) . '. It should be NULL but it contains this value: ' . $data[Linter::CATEGORIES];
							
							if ($data[Linter::ATTRIBUTE_SET] != 'default') 
								$simple_errors[] = 'The attribute set is wrong on row ' . ($row+1) . '. It should be set to default but it is set to: ' . $data[Linter::ATTRIBUTE_SET];

							if (!empty($data[Linter::CONFIGURABLE_ATTRIBUTES])) 
								$simple_errors[] = 'Check the configurable_attributes value for row ' . ($row+1) . '. It should be NULL but it contains this value: ' . $data[Linter::CONFIGURABLE_ATTRIBUTES];		
							
							if ($data[Linter::HAS_OPTIONS] != '0') 
								$simple_errors[] = 'Check the has_options value for row ' . ($row+1) . '. It should be 0 but it contains this value: ' . $data[Linter::HAS_OPTIONS];		

							if (!empty($data[Linter::SUPER_ATTRIBUTE_PRICING])) 
								$simple_errors[] = 'Check the super_attribute_pricing value for row ' . ($row+1) . '. It should be NULL but it contains this value: ' . $data[Linter::SUPER_ATTRIBUTE_PRICING];		

							if ($data[Linter::STATUS] == 'Enabled' && empty($data[Linter::IMAGE]) || $data[Linter::STATUS] != 'Enabled' && !empty($data[Linter::IMAGE])) 
								$simple_errors[] = 'Check the image value for row ' . ($row+1) . '. Either that row has a status of Enabled but the image value is NULL, or that row has a status that <> Enabled and the image value is not NULL: ' . $data[Linter::HAS_OPTIONS];		
						
							if ($data[Linter::VISIBILITY] != 'Not Visible Individually')
								$simple_errors[] = 'Check the visibility value for row ' . ($row+1) . '. It should equal "Not Visible Individually" but it looks like this: ' . $data[Linter::VISIBILITY];
						
							if (empty($data[Linter::IMAGE]) && $data[Linter::STATUS] == 'Enabled')
								$simple_errors[] = 'Check the image value for row ' . ($row+1) . '. It is NULL, but the status for that row <> Disabled';

							if ($data[Linter::IMAGE_LABEL] != $data[Linter::CHOOSE_COLOR])
								$simple_errors[] = 'Check the image_label value for row ' . ($row+1) . '. It should equal the choose_color value, but it looks like this: ' . $data[Linter::IMAGE_LABEL];

							if ($data[Linter::SMALL_IMAGE] != $data[Linter::IMAGE])
								$simple_errors[] = 'Check the small_image value for row ' . ($row+1) . '. It should equal the image value, but it looks like this: ' . $data[Linter::SMALL_IMAGE];

							if ($data[Linter::THUMBNAIL] != $data[Linter::IMAGE])
								$simple_errors[] = 'Check the image_label value for row ' . ($row+1) . '. It should equal the image value, but it looks like this: ' . $data[Linter::THUMBNAIL];

							if (preg_match('/[^a-zA-Z0-9, \/]/',$data[Linter::CHOOSE_COLOR]) || empty($data[Linter::CHOOSE_COLOR]) || !preg_match('/[e|E|a|i|o|u|y]/',$data[Linter::CHOOSE_COLOR])) 
								$simple_errors[] = 'Check the choose_color value on row ' . ($row+1) . '. It is either NULL, contains no vowels, or contains a special character that we may not want: ' . $data[Linter::CHOOSE_COLOR];

							if ($data[Linter::CHOOSE_SIZE] !== '0' && empty($data[Linter::CHOOSE_SIZE]) || substr($data[Linter::CHOOSE_SIZE],-2) == '.5')
								$simple_errors[] = 'Check the choose_size value for row ' . ($row+1) . '. It is either NULL or contains a ".5" that has not been converted into a fraction: ' . $data[Linter::CHOOSE_SIZE];

							if (!in_array($data[Linter::VENDOR_COLOR_CODE],explode('-',$data[Linter::SKU])))
								$simple_errors[] = 'Check the vendor_color_code value for row ' . ($row+1) . '. It should equal the 4th SKU section for that row (' . $data[Linter::SKU] . '), but it looks like this: ' . $data[Linter::VENDOR_COLOR_CODE];

							//if (!in_array($data[Linter::VENDOR_SIZE_CODE],explode('-',$data[Linter::SKU])))
							//	$simple_errors[] = 'Check the vendor_size_code value for row ' . ($row+1) . '. It should equal the 5th SKU section for that row (' . $data[Linter::SKU] . '), but it looks like this: ' . $data[Linter::VENDOR_SIZE_CODE];
						
							if (!empty($data[Linter::DESCRIPTION]))
								$simple_errors[] = 'Check the description value for row ' . ($row+1) . '. It should be NULL but it looks like this: ' . $data[Linter::DESCRIPTION];

							if (!empty($data[Linter::FEATURES]))
								$simple_errors[] = 'Check the features value for row ' . ($row+1) . '. It should be NULL but it looks like this: ' . $data[Linter::FEATURES];
						
							if ($data[Linter::QTY] != '0')
								$simple_errors[] = 'Check the qty value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::QTY];
						
							if ($data[Linter::IS_IN_STOCK] != '0')
								$simple_errors[] = 'Check the is_in_stock value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::IS_IN_STOCK];
						
							if ($data[Linter::BACKORDERS] != '0')
								$simple_errors[] = 'Check the backorders value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::BACKORDERS];	

							if ($data[Linter::MANAGE_STOCK] != '1')
								$simple_errors[] = 'Check the manage_stock value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::MANAGE_STOCK];
						
							if ($data[Linter::USE_CONFIG_MANAGE_STOCK] != '1')
								$simple_errors[] = 'Check the use_config_manage_stock value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::USE_CONFIG_MANAGE_STOCK];
						
							if (!empty($data[Linter::META_TITLE]))
								$simple_errors[] = 'Check the meta_title value for row ' . ($row+1) . '. It should be NULL but it looks like this: ' . $data[Linter::META_TITLE];

							if (!empty($data[Linter::MERCHANDISE_PRIORITY]))
								$simple_errors[] = 'Check the merchandise_priority value for row ' . ($row+1) . '. It should be NULL but it looks like this: ' . $data[Linter::MERCHANDISE_PRIORITY];
						
							if (empty($data[Linter::URL_KEY]) || preg_match('/[^a-zA-Z0-9\-]/',$data[Linter::URL_KEY])) //|| (substr_count($data[Linter::URL_KEY],'-') != (substr_count($data[Linter::MANUFACTURER],' ') + substr_count($data[Linter::NAME],' ') + substr_count($data[Linter::NAME],'-') + substr_count($data[Linter::CHOOSE_COLOR],' ') + substr_count($data[Linter::CHOOSE_COLOR],'/') + substr_count($data[Linter::CHOOSE_SIZE],' ') + substr_count($data[Linter::CHOOSE_SIZE],'/') + 5)))
								$simple_errors[] = 'Check the url_key value for row ' . ($row+1) . '. It is either NULL, or contains a special character we may not want: ' . $data[Linter::URL_KEY];

							if (count(array_unique($sku_parts)) > 1)
	    						$simple_errors[] = 'simple product SKUs are not consistent. Check season & brand codes.';

						}	
						// Simple Inline & Closeout //

						if ($data[Linter::TYPE] == 'simple' && substr($data[Linter::SEASON_ID],-6) == 'Inline'|| $data[Linter::TYPE] == 'simple' && substr($data[Linter::SEASON_ID],-8) == 'Closeout') {

							if ($data[Linter::NEVER_BACKORDER] != '1')
								$simple_errors[] = 'Check the never_backorder value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::NEVER_BACKORDER];

							if ($data[Linter::USE_CONFIG_BACKORDERS] != '1')
								$simple_errors[] = 'Check the use_config_backorders value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::USE_CONFIG_BACKORDERS];
						}
						// Simple ASAP //

						if ($data[Linter::TYPE] == 'simple' && substr($data[Linter::SEASON_ID],-4) == 'ASAP') {

							if ($data[Linter::NEVER_BACKORDER] != '0')
								$simple_errors[] = 'Check the never_backorder value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::NEVER_BACKORDER];

							if ($data[Linter::USE_CONFIG_BACKORDERS] != '0')
								$simple_errors[] = 'Check the use_config_backorders value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::USE_CONFIG_BACKORDERS];
						}
						// Configurable Product Test Rules //

						if ($data[Linter::TYPE] == 'configurable') {

							$configurable_names[] = $data[Linter::NAME];
							$configurable_styles[] = $data[Linter::VENDOR_PRODUCT_ID];
							$configurable_simples_skus = explode(',',$data[Linter::SIMPLES_SKUS]);
							$missing_skus = array_filter($configurable_simples_skus, array('Linter','findMissingSimpleSkus'));
							$inline_merchandising_letters = Array('B','C');
						

							if ($simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]]['price'] != $data[Linter::PRICE])
								$configurable_errors[] = 'The price value for the configurable on row ' . ($row+1) . ' does not match the last price value for it\'s simple products.';

							if ($simple_price_cost[$data[Linter::VENDOR_PRODUCT_ID]]['cost'] != $data[Linter::COST])
								$configurable_errors[] = 'The cost value for the configurable on row ' . ($row+1) . ' does not match the last cost value for it\'s simple products.';

							if (count(explode('-', $data[Linter::SKU])) != 2) 
								$configurable_errors[] = 'The SKU is improperly formatted on row ' . ($row+1) . '. It should have two dashes but it looks like this: ' . $data[Linter::SKU];
							
							if (empty($data[Linter::CATEGORIES])) 
								$configurable_errors[] = 'The categories value for row ' . ($row+1) . ' is NULL: "' . $data[Linter::CATEGORIES] . '"';
							
							//if (count(array_unique(explode(';;', $data[Linter::CATEGORIES]))) < 2)
							//	$configurable_errors[] = 'Check the categories value for row ' . ($row+1) . '. It contains less than two categories: ' . $data[Linter::CATEGORIES];
							
							if (!in_array($data[Linter::ATTRIBUTE_SET],$attribute_sets)) 
								$configurable_errors[] = 'The attribute set is wrong on row ' . ($row+1) . '. It is not one of our custom Magento attribute sets: ' . $data[Linter::ATTRIBUTE_SET];

							if (($data[Linter::CONFIGURABLE_ATTRIBUTES]) != 'choose_color,choose_size') 
								$configurable_errors[] = 'The configurable attributes are wrong on row ' . ($row+1) . '. They should be set to choose_color,choose_size but they are set to: ' . $data[Linter::CONFIGURABLE_ATTRIBUTES];														
							
							if ($data[Linter::HAS_OPTIONS] != 1) 
								$configurable_errors[] = 'Check the has_options value for row ' . ($row+1) . '. It should be 1 but it contains this value: ' . $data[Linter::HAS_OPTIONS];		

							if (!empty($data[Linter::SUPER_ATTRIBUTE_PRICING]) && substr($data[Linter::SUPER_ATTRIBUTE_PRICING],0,13) != 'choose_size::')  
								$configurable_errors[] = 'Check the super_attribute_pricing value for row ' . ($row+1) . '. If it is not NULL, it should start with "choose_size::", but it looks like this: ' . $data[Linter::SUPER_ATTRIBUTE_PRICING];		
							
							if ($data[Linter::STATUS] = 'Enabled' && !empty($data[Linter::IMAGE]) || $data[Linter::STATUS] != 'Enabled') 
								$configurable_errors[] = 'Check the image value for row ' . ($row+1) . '. Either that row has a status of Enabled but the image value is NULL, or that row has a status that <> Enabled and the image value is not NULL: ' . $data[Linter::HAS_OPTIONS];					
						
							if ($data[Linter::VISIBILITY] != 'Catalog, Search')
								$configurable_errors[] = 'Check the visibility value for row ' . ($row+1) . '. It should equal "Catalog, Search" but it looks like this: ' . $data[Linter::VISIBILITY];
							
							if (!empty($data[Linter::IMAGE]))
								$configurable_errors[] = 'Check the image value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::IMAGE];

							if (!empty($data[Linter::IMAGE_LABEL]))
								$configurable_errors[] = 'Check the image_label value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::IMAGE_LABEL];

							if (!empty($data[Linter::SMALL_IMAGE]))
								$configurable_errors[] = 'Check the small_image value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::SMALL_IMAGE];

							if (!empty($data[Linter::THUMBNAIL]))
								$configurable_errors[] = 'Check the thumbnail value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::THUMBNAIL];

							if (!empty($data[Linter::CHOOSE_COLOR]))
								$configurable_errors[] = 'Check the choose_color value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::CHOOSE_COLOR];

							if (!empty($data[Linter::CHOOSE_SIZE]))
								$configurable_errors[] = 'Check the choose_size value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::CHOOSE_SIZE];

							if (!empty($data[Linter::VENDOR_COLOR_CODE]))
								$configurable_errors[] = 'Check the vendor_color_code value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::VENDOR_COLOR_CODE];

							if (!empty($data[Linter::VENDOR_SIZE_CODE]))
								$configurable_errors[] = 'Check the vendor_size_code value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::VENDOR_SIZE_CODE];
					
							if (empty($data[Linter::DESCRIPTION]) || strpos($data[Linter::DESCRIPTION],$data[Linter::NAME]) === false || strpos($data[Linter::DESCRIPTION],$data[Linter::MANUFACTURER]) === false) 
								$configurable_errors[] = 'Check the description value on row ' . ($row+1) . '. It is either NULL, or does not contain the product name & brand. Name:' . (strpos($data[Linter::DESCRIPTION],$data[Linter::NAME]) ? ' is present.' : ' is missing.') . ' Brand:' . (strpos($data[Linter::DESCRIPTION],$data[Linter::MANUFACTURER]) ? ' is present.' : ' is missing.');
							
							// This is a simples_skus test //						
							//if (count($missing_skus)) 
							//	$configurable_errors[] = 'There are SKUs in the simples_skus value on row ' . ($row+1) . ' that are not in the loadfile: ' . implode(', ', $missing_skus);
						
							if (empty($data[Linter::FEATURES]) && $data[Linter::MANUFACTURER] != 'Icebreaker' || preg_match('/[^a-zA-Z0-9®!™%<>•&+";:()\/,|\.\-\' ]/',$data[Linter::FEATURES]) || substr_count($data[Linter::FEATURES],'||') > 0)
								$configurable_errors[] = 'Check the features value on row ' . ($row+1) . '. It is either NULL, contains a special character we may not want, or has a double pipe.';// . $data[Linter::FEATURES];

							if (!empty($data[Linter::FABRIC]) && preg_match('/[^a-zA-Z0-9®™²<>•+&%;:()\/,|\.\-\' ]/',$data[Linter::FABRIC]))
								$configurable_errors[] = 'Check the fabric value on row ' . ($row+1) . '. It contains a special character we may not want: ' . $data[Linter::FABRIC];		
						
							if (!empty($data[Linter::QTY]))
								$configurable_errors[] = 'Check the qty value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::QTY];
						
							if (!empty($data[Linter::IS_IN_STOCK]))
								$configurable_errors[] = 'Check the is_in_stock value for row ' . ($row+1) . '. It should be NULL, but it looks like this: ' . $data[Linter::IS_IN_STOCK];
							
							if ($data[Linter::BACKORDERS] != '0')
								$configurable_errors[] = 'Check the backorders value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::BACKORDERS];	
							
							if ($data[Linter::MANAGE_STOCK] != '0')
								$configurable_errors[] = 'Check the manage_stock value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::MANAGE_STOCK];
							
							if ($data[Linter::USE_CONFIG_MANAGE_STOCK] != '0')
								$configurable_errors[] = 'Check the use_config_manage_stock value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::USE_CONFIG_MANAGE_STOCK];
							
							if (empty($data[Linter::URL_KEY]) || preg_match('/[^a-zA-Z0-9\-]/',$data[Linter::URL_KEY])) //|| (substr_count($data[Linter::URL_KEY],'-') != (substr_count($data[Linter::MANUFACTURER],' ') + substr_count($data[Linter::NAME],' ') + substr_count($data[Linter::NAME],'-') + 3)))
								$configurable_errors[] = 'Check the url_key value for row ' . ($row+1) . '. It is either NULL, or contains a special character we may not want: ' . $data[Linter::URL_KEY];
							
							if (empty($data[Linter::META_TITLE]) || $data[Linter::META_TITLE] != ($data[Linter::MANUFACTURER] . ' ' . ($this->getMetaTitleDepartment($data[Linter::DEPARTMENT]) ? $this->getMetaTitleDepartment($data[Linter::DEPARTMENT]) . ' ' : '' ) . $data[Linter::NAME]))
								$configurable_errors[] = 'Check the meta_title value on row ' . ($row+1) . '. It is either NULL or does not follow our meta_title conventions: ' . $data[Linter::META_TITLE];
						}
						// Inline Merchandising Rules //
						if ($data[Linter::TYPE] == 'configurable' && substr($data[Linter::SEASON_ID],-6) == 'Inline') {
							
							if (!in_array($data[Linter::MERCHANDISE_PRIORITY],$inline_merchandising_letters) || $data[Linter::MERCHANDISE_PRIORITY] == 'C' && substr_count($data[Linter::CATEGORIES],'Accessories') < 1)
								$configurable_errors[] = 'Check the merchandise_priority value on row ' . ($row+1) . '. It should equal "B" or "C" (if the configurable in questions is an accessory), but it looks like this: ' . $data[Linter::MERCHANDISE_PRIORITY];	
						}
						// Closeout Merchandising Rules //
						if ($data[Linter::TYPE] == 'configurable' && substr($data[Linter::SEASON_ID],-8) == 'Closeout') {
							
							if ($data[Linter::MERCHANDISE_PRIORITY] != 'E')
								$configurable_errors[] = 'Check the merchandise_priority value on row ' . ($row+1) . '. It should equal "E", but it looks like this: ' . $data[Linter::MERCHANDISE_PRIORITY];	
						}
						// Configurable Inline & Closeout General Rules //

						if ($data[Linter::TYPE] == 'configurable' && substr($data[Linter::SEASON_ID],-6) == 'Inline'|| $data[Linter::TYPE] == 'configurable' && substr($data[Linter::SEASON_ID],-8) == 'Closeout') {

							if ($data[Linter::NEVER_BACKORDER] != '1')
								$configurable_errors[] = 'Check the never_backorder value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::NEVER_BACKORDER];

							if ($data[Linter::USE_CONFIG_BACKORDERS] != '1')
								$configurable_errors[] = 'Check the use_config_backorders value for row ' . ($row+1) . '. It should equal 1, but it looks like this: ' . $data[Linter::USE_CONFIG_BACKORDERS];
						}
						// Configurable ASAP General & Merchandising Rules //

						else if ($data[Linter::TYPE] == 'configurable' && substr($data[Linter::SEASON_ID],-4) == 'ASAP') {

							if ($data[Linter::NEVER_BACKORDER] != '0')
								$configurable_errors[] = 'Check the never_backorder value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::NEVER_BACKORDER];

							if ($data[Linter::USE_CONFIG_BACKORDERS] != '0')
								$configurable_errors[] = 'Check the use_config_backorders value for row ' . ($row+1) . '. It should equal 0, but it looks like this: ' . $data[Linter::USE_CONFIG_BACKORDERS];
						
							if ($data[Linter::MERCHANDISE_PRIORITY] != 'F')
								$configurable_errors[] = 'Check the merchandise_priority value on row ' . ($row+1) . '. It should equal "F", but it looks like this: ' . $data[Linter::MERCHANDISE_PRIORITY];
						}
	   				}
		      	    $row++;
	    		}
	    		fclose($handle);

	    		if (count(array_diff($simple_names,$configurable_names)))
	    			$global_errors[] = 'There is a name mismatch - either a simple has a different name than a configurable or vice-versa: ' . implode(',',array_diff($simple_names,$configurable_names));

	    		if (count(array_diff($simple_styles,$configurable_styles)))
	    			$global_errors[] = 'There is a style code mismatch - either a simple has a different style than a configurable or vice-versa: ' . implode(',',array_diff($simple_styles,$configurable_styles));
	    		
	    		if (count(array_unique($types)) != 2)
	    			$global_errors[] = 'There is an inconsistency in the type field. Check for values other than simple or configurable.';
			
	    		if (count(array_unique($manufacturer)) > 1)
					$global_errors[] = 'There is more than one manufacturer value in the loadfile.';

	    		$this->showErrors(array('global_errors' => $global_errors, 'configurable_errors' => $configurable_errors, 'simple_errors' => $simple_errors, 'warnings' => $warnings));
	    		
			}
		}
	}
}

$filename = $argv[1];
$linter = new Linter($filename);