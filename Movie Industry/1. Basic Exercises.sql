use W3Resource
-- 1. From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year. 
select mov_title, mov_year
from Movies.Movie

-- 2. From the following table, write a SQL query to find when the movie ‘American Beauty’ released. Return movie release year. 
select mov_year
from Movies.Movie
where mov_title = 'American Beauty' 

--3. From the following table, write a SQL query to find the movie, which was made in the year 1999. Return movie title.
select  mov_title
from Movies.Movie
where  mov_year = 1999 

--4. From the following table, write a SQL query to find those movies, which was made before 1998. Return movie title.
select  mov_title
from Movies.Movie
where  mov_year < 1998 

--5. From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.
select rev_name
from Movies.Reviewer
union
(select  mov_title
from Movies.Movie)

--6. From the following tables, write a SQL query to find all reviewers who have rated 7 or more stars to their rating. Return reviewer name.
select rev_name
from Movies.Reviewer,Movies.Rating
where Reviewer.rev_id = Rating.rev_id and
rev_stars >= 7 and rev_name is not null

--7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.
select mov_title
from Movies.Movie
where mov_id not in (select mov_id from Movies.Rating)

--8. From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title. 
select mov_title
from Movies.Movie
where mov_id in (905,907,917)

--9. From the following table, write a SQL query to find those movie titles, which include the words 'Boogie Nights'. Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year.
select mov_id, mov_title, mov_year
from Movies.Movie
where mov_title like '%Boogie Nights%'

--10. From the following table, write a SQL query to find those actors whose first name is 'Woody' and the last name is 'Allen'. Return actor ID
select act_id
from Movies.Actor
where act_fname = 'Woody' and act_lname = 'Allen'