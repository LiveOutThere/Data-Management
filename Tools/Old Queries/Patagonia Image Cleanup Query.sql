/* Subquery Z (Join between image filename table and Subquery Y) indicates all of longer, non-standard filename rows 
   which can be deleted because a standard image filename already exists with the same style & colorcode. */
SELECT z.Filename
FROM tbl_RawData_FW13_Image_Filenames AS z
INNER JOIN
/* Subquery Y (Join between image filename table and Subquery X) indicates all of the standard image filenames which already exist,
   therefore the longer, non-standard filename rows can be deleted */
(SELECT a.Filename 
FROM tbl_RawData_FW13_Image_Filenames AS a
INNER JOIN
-- Subquery X gathers all of the images which are not the standard: style_colorcode.jpg
(SELECT DISTINCT LEFT(Filename,9) AS Filename
FROM tbl_RawData_FW13_Image_Filenames
WHERE Brand = 'PAT' AND LEN(Filename) > 13) AS x
ON a.Filename = x.Filename + '.jpg') AS y
ON z.Filename LIKE LEFT(y.Filename,9) + '%'
WHERE LEN(z.Filename) > 13

-- Useful queries
SELECT DISTINCT Filename FROM tbl_RawData_FW13_Image_Filenames WHERE Brand = 'PAT' AND LEN(Filename) > 13
SELECT DISTINCT Filename FROM tbl_RawData_FW13_Image_Filenames WHERE Brand = 'PAT' AND Filename LIKE '%11889%'