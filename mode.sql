-- First counting the frequencies of values in the subset, by grouping on the values and using the count function. 
-- After, selecting the max frequency value from our subtable of values and frequencies. 
-- Then adding a filter to the query on max_count, by specifying a where clause so that only values with a frequency count in the max count 
-- table can be returned. Add a condition on max_count to ensure it is greater than 1, so it only returns valid results when the mode exists.
-- Lastly 'and condition' can be removed if all the values occur not only once
select `Book-Rating` as 'Book Rating Mode', max_count as Occurance
from
(
	select `Book-Rating`, count(`Book-Rating`) as max_count from `BX-Book-Ratings`
    	where `ISBN` = '034545104X'
	group by `Book-Rating`
) BBR
where max_count in 
(
	select max(count_val) from
	(
		select `Book-Rating`, count(`Book-Rating`) as count_val from `BX-Book-Ratings`
        	where `ISBN` = '034545104X'
		group by `Book-Rating`
	) subset
)
and max_count > 1
