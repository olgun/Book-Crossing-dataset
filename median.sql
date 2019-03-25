-- Inner select will return the total number of rows, and then from the subset we calculate via average function the median.
-- Also avg(subset.`Book-Rating`) and subset.row_number in (...) is used to correctly produce a median when there are an even number of records.
SELECT avg(subset.`Book-Rating`) as median
FROM (
  SELECT BBR.`Book-Rating`, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
  FROM `BX-Book-Ratings` BBR, (SELECT @rownum:=0) r
  WHERE `ISBN`= '034545104X'
  ORDER BY BBR.`Book-Rating`
) as subset
WHERE subset.row_number IN ( FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2) );
