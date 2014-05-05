CREATE TABLE #activities (sku nvarchar(255), activities nvarchar(255), brand nvarchar(255))
CREATE TABLE #collections (sku nvarchar(255), collection nvarchar(255), brand nvarchar(255))
DROP TABLE #activities
DROP TABLE #collections

INSERT INTO #activities SELECT DISTINCT sku, activities, brand FROM tbl_FW13_Activities ORDER BY brand, activities
INSERT INTO #collections SELECT DISTINCT sku, collection, brand FROM tbl_FW13_Collections ORDER BY brand, collection

SELECT DISTINCT brand, collection, COUNT(brand)
FROM #collections
GROUP BY collection, brand
ORDER BY brand

SELECT DISTINCT activities, COUNT(activities)
FROM #activities
GROUP BY activities

UPDATE #activities SET activities = CASE WHEN activities IN('Alpine Climbing','Alpine/Ice Climbing','Mountain Climbing','Ice Climbing','Rock Climbing','Rock Climbing & Bouldering','Climbing','Mountaineering','Expedition')
										 THEN 'Climb'
										 WHEN activities IN('Bike','Biking','Mountain Biking','Cycle','Commuter Biking','Freeride')
										 THEN 'Bike'
										 WHEN activities IN('Casual','Around Town','Urban Exploration','Yoga','Yoga/Pilates','Tennis')
										 THEN 'Lifestyle'
										 WHEN activities IN('Travel')
										 THEN 'Travel'
										 WHEN activities IN('Fish/Hunt','Fly Fishing','Performance Fishing Gear')
										 THEN 'Fish'
										 WHEN activities IN('Hike','Hiking','Hiking & Backpacking','Hiking/Backpacking','Outdoor & Hiking','Trekking','Backpacking/Hiking','Outdoor','Adventure Travel','Camping')
										 THEN 'Hike'
										 WHEN activities IN('Run','Running','Running & Fitness','Running/Training','Urban Fitness/Run','Train','Training','Trail/Running')
										 THEN 'Run'
										 WHEN activities IN('Sailing-Coastal Cruising','Sailing-Inshore Racing','Sailing-Offshore','Surfing','Paddling')
										 THEN 'Watersports'
										 WHEN activities IN('Ski/Snowboard','Skiing','Skiing & Snowsports','Skiing/Snowboarding','Snowboarding','Snowboarding/Skiing','Snow Sports','On Snow','Vertical Endeavors/Snowplay','Snowshoe','Backcountry Skiing','Ski Touring')
										 THEN 'Snowsports'
										 ELSE activities END

UPDATE #activities SET activities = CASE WHEN activities IN('Casual/Travel','Lifestyle/Travel','Travel & Lifestyle','Travel/Commute') THEN 'Lifestyle|Travel' ELSE activities END
UPDATE #activities SET activities = CASE WHEN activities = 'Train/Run/Ride' THEN 'Bike|Fitness' ELSE activities END

SELECT LEFT(sku,CHARINDEX('-',sku) - 1) AS Brand, activities, COUNT(activities) AS Total
FROM #activities
GROUP BY LEFT(sku,CHARINDEX('-',sku) - 1), activities
ORDER BY Brand

SELECT activities, COUNT(activities) AS Total
FROM #activities
GROUP BY activities

SELECT DISTINCT sku, activities FROM #activities ORDER BY sku, activities
SELECT DISTINCT activities FROM #activities

SELECT DISTINCT '"' + sku + '","' + collection + '"' AS export, sku FROM #collections ORDER BY sku
