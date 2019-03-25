-- Finding the numbers of users who has made exactly 2 book ratings
select count(*) from (
	select `User-ID`, count(*)
	from `BX-Book-Ratings`
    group by `User-ID`
    having count(*) = 2 ) as noOfUsersWith2Ratings;
