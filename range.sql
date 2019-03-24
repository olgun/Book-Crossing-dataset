select `Book-Rating` as 'Book Rating Range'
from
(
	  select `Book-Rating`, count(`Book-Rating`) as max_count from `BX-Book-Ratings`
    where `ISBN` = '034545104X'
	  group by `Book-Rating`
) BBR;
