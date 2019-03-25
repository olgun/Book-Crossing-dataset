-- I have used almost same query as I did in first part of mode calculation (mode.sql) in order to list the range of the book ratings 
-- without checking occurance times
select `Book-Rating` as 'Book Rating Range'
from
(
	select `Book-Rating`, count(`Book-Rating`) as max_count from `BX-Book-Ratings`
    	where `ISBN` = '034545104X'
	group by `Book-Rating`
) BBR;
