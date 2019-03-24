SELECT avg(subset.`Book-Rating`) as median
FROM (
  SELECT BBR.`Book-Rating`, @rownum:=@rownum+1 as `row_number`, @total_rows:=@rownum
  FROM `BX-Book-Ratings` BBR, (SELECT @rownum:=0) r
  WHERE `ISBN`= '034545104X'
  ORDER BY BBR.`Book-Rating`
) as subset
WHERE subset.row_number IN ( FLOOR((@total_rows+1)/2), FLOOR((@total_rows+2)/2) );
