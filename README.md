# Book-Crossing-dataset

Software Tools:
* MySQL Community Server 8.0.15
* MySQL Workbench 8.0.15

Data sets are taken from:
http://www2.informatik.uni-freiburg.de/~cziegler/BX/

Background
Software installations and configurations took approximately 20 min. Data set format is chosen as sql files.

Data and questions
1. Load data into database (or any other data processing system)
All sql files are dumped into a local schema that I have configured in my PC. It took around one hour to load
over million rows for three tables in my machine (MacBook Pro)
2. How many users have made exactly 2 ratings?
Answer: 12502 (noOfUsersWith2Ratings.sql)
3. Find the mean, median, mode, and range for number of ratings made for book
Since the question was about calculating mean, median, mode, and range for number of ratings for book therefore I took one sample book ISBN in my where condition. Any desired book ISBN can be check through the same queries by replacing the corresponding ISBN number
Queries are:
- mean.sql
- median.sql
- mode.sql
- range.sql
4. If you look for users and ratings, does Pareto principle hold?
