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
