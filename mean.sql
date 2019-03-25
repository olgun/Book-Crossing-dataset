-- Since the question was about calculating mean for number of ratings for a book therefore I took one sample book ISBN. 
-- Average function is used to find the mean of book ratings for desired book.

select format(avg(`Book-Rating`), 2) as mean
from `BX-Book-Ratings`
where `ISBN` = '034545104X';
