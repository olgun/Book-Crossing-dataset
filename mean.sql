-- Since the question was about calculating mean for number of
-- ratings for a book therefore I took one sample book ISBN

select format(avg(`Book-Rating`), 2) as mean
from `BX-Book-Ratings`
where `ISBN` = '034545104X';
