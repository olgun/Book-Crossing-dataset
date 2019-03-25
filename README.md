# Book-Crossing-dataset

Software Tools:
* MySQL Community Server 8.0.15
* MySQL Workbench 8.0.15

Data sets are taken from:
http://www2.informatik.uni-freiburg.de/~cziegler/BX/

Background: 
Software installations and configurations took approximately 20 min. Data set format is chosen as sql files. I had to remove 'TYPE=MyISAM' statement from table definition part of sql files since I got an error in MySQL Workbench.

Data model diagram:
https://drive.google.com/open?id=1HxyGQz__fLAD7g7h_q53vvjjWYQXrkS2

Data and questions
1. Load data into database (or any other data processing system)
All sql files are dumped into a local schema that I have configured in my PC. It took around one hour to load
over million rows for three tables in my machine (MacBook Pro, https://support.apple.com/kb/sp715?locale=en_US).
2. How many users have made exactly 2 ratings? 
Answer: 12502 (noOfUsersWith2Ratings.sql). 
3. Find the mean, median, mode, and range for number of ratings made for book
Since the question was about calculating mean, median, mode, and range for number of ratings for book therefore I took one sample book ISBN in my SQL queries inside where conditions. Any desired book ISBN can be check through the same queries by replacing the corresponding ISBN number. I have checked internet for calculating median and mode definitions since I did not remember about them. For all of the queries, first I took a smaller set of data in order to make validation of my queries manually.
Queries are:
- mean.sql
- median.sql
- mode.sql
- range.sql
4. If you look for users and ratings, does Pareto principle hold?
Based on the knowledge that I have gained regarding Pareto principle on the internet;
Can we say whether Pareto principle holds in this data set or not, I would say I have to make a statement first. 
"80% of explicit book ratings are given by 20% of all users." So is it correct?

First of all, since I was not a power user of MySQL Workbench, I could not use data profiling functionality even if it exists in it. Instead I tried to focus on the numbers that I could gather and find any correlation. In this statement I have assumed we consider only explicit book ratings (1-10) because 0 is meant for implicit rating and '0' was default value for `Book-Rating` column in `BX-Book-Ratings` table.

I have calculated at the beginning total users and active users who rates book(s).
select count(*) from `BX-Users`
-- Row count: 278858

select count(distinct(`User-ID`)) from `BX-Book-Ratings`
where `Book-Rating` <> 0;
-- Row count: 77805
So this means 77805 (out of 278858) unique users have rated one or many books. This is approximately 28%.

Then, I have calculated how many book ratings there are between 1-10 (Zero values are exempted).

select count(*) from `BX-Book-Ratings`
where `Book-Rating` <> 0;
-- Row count: 433671

Since in our statement, it was mentioned as '80% of explicit book ratings..'. After small math, we come up with:
433671 x 80% ~= 346937 number of book ratings. 

So now the question is, can 20% of users accomplish such number of book ratings (346937).

I have just made a ratio based calculation here:

77805 users --> 433671 explicit book ratings
? users     --> 346937 explicit book ratings

? = (77805 x 346937)/433671 ~=  62244 users

62244 users are representing around 22% of all users (62244/278858). Based on this assumptions and calculations, it seems that Pareto principle is applicable here.
