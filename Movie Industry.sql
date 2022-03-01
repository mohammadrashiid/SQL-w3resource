/*--------------------1_BASIC QUERIES--------------------*/

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

/*--------------------2_SUBQUERIES--------------------*/

--1. From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table. 
select *
from movies.actor
where act_id in (
select act_id from Movies.Movie_cast where mov_id in (
select mov_id from Movies.Movie where mov_title = 'Annie Hall')
)

--2. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name.
select dir_fname, dir_lname
from Movies.Director
where dir_id in
(select dir_id from Movies.Movie_Direction where mov_id in
(select mov_id from Movies.Movie_cast where role = any 
(select role from Movies.Movie_cast where mov_id in (
select mov_id from Movies.Movie where mov_title = 'Eyes Wide Shut'))))

--3. From the following table, write a SQL query to find those movies, which released in the country besides UK. Return movie title, movie year, movie time, date of release, releasing country. 
select mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country
from Movies.Movie
where mov_rel_country not in 
(select mov_rel_country from movies.movie where mov_rel_country='UK')

--4. From the following tables, write a SQL query to find those movies where reviewer is unknown. Return movie title, year, release date, director first name, last name, actor first name, last name.
select mov_title, mov_year, mov_dt_rel, dir_fname, dir_lname, act_fname, act_lname     
from Movies.Movie m, Movies.Director mdi, Movies.Actor ma, Movies.Movie_cast mc, 
Movies.Movie_Direction md, Movies.Rating r, Movies.Reviewer re
where m.mov_id = r.mov_id and
r.rev_id = re.rev_id and
mdi.dir_id = md.dir_id and
ma.act_id = mc.act_id and
m.mov_id = mc.mov_id and 
m.mov_id = md.mov_id and
re.rev_name is null

--5. From the following tables, write a SQL query to find those movies directed by the director whose first name is ‘Woddy’ and last name is ‘Allen’. Return movie title.
select mov_title
from movies.movie 
where mov_id = ( select mov_id from Movies.Movie_Direction where dir_id = (
select dir_id from Movies.Director where dir_fname='Woody' and dir_lname='Allen')
)

--6. From the following tables, write a SQL query to find those years, which produced at least one movie and that, received a rating of more than three stars. Sort the result-set in ascending order by movie year. Return movie year
select distinct mov_year
from Movies.Movie
where mov_id in 
(select mov_id from Movies.Rating where rev_stars > 3)
order by mov_year

--7. From the following table, write a SQL query to find those movies, which have no ratings. Return movie title.
select mov_title
from Movies.Movie
where mov_id not in (
select mov_id from Movies.Rating )

--8. From the following tables, write a SQL query to find those reviewers who have rated nothing for some movies. Return reviewer name.
select rev_name
from Movies.Reviewer
where rev_id in (
select rev_id from movies.rating where rev_stars is null )

--9. From the following tables, write a SQL query to find those movies, which reviewed by a reviewer and got a rating. Sort the result-set in ascending order by reviewer name, movie title, review Stars. Return reviewer name, movie title, review Stars.
select rev_name, mov_title, rev_stars
from Movies.Reviewer re, Movies.Rating r, Movies.Movie m
where m.mov_id = r.mov_id and r.rev_id = re.rev_id and rev_name is not null
order by rev_name, mov_title, rev_stars

--10. From the following tables, write a SQL query to find those reviewers who rated more than one movie. Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.
select re.rev_name, m.mov_title
from Movies.Reviewer re, Movies.Rating r, Movies.Movie m,  Movies.Rating r2
where re.rev_id = r.rev_id and m.mov_id = r.mov_id and r.rev_id = r2.rev_id
and  rev_name is not null
group by re.rev_name, m.mov_title
having COUNT(*) > 1

--11. From the following tables, write a SQL query to find those movies, which have received highest number of stars. Group the result set on movie title and sorts the result-set in ascending order by movie title. Return movie title and maximum number of review stars.
select m.mov_title, MAX(r.rev_stars) as max_review_stars
from Movies.Movie m , Movies.Rating r 
where m.mov_id = r.mov_id and r.rev_stars is not null
group by m.mov_title
order by m.mov_title

--12. From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.
select rev_name
from Movies.Reviewer
where rev_id in (select rev_id from Movies.Rating where mov_id =
(select mov_id from Movies.Movie where mov_title = 'American Beauty'))

--13. From the following tables, write a SQL query to find the movies, which have reviewed by any reviewer body except by 'Paul Monks'. Return movie title. 
select mov_title
from Movies.Movie
where mov_id in (select mov_id from Movies.Rating where rev_id not in 
(select rev_id from Movies.Reviewer where rev_name = ('Paul Monks') ))

--14. From the following tables, write a SQL query to find the lowest rated movies. Return reviewer name, movie title, and number of stars for those movies.
select re.rev_name, m.mov_title, r.rev_stars
from Movies.Movie m, Movies.Reviewer re, Movies.Rating r
where m.mov_id = r.mov_id and r.rev_id = re.rev_id and 
r.rev_stars = (select min(rev_stars) from Movies.Rating)

--15. From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title.
select mov_title
from Movies.Movie 
where mov_id in (select mov_id from Movies.Movie_Direction where dir_id in (
select dir_id from Movies.Director where dir_fname = 'James' and dir_lname = 'Cameron'))

-- 16. Write a query in SQL to find the name of those movies where one or more actors acted in two or more movies.
select mov_title
from Movies.Movie
where mov_id in (select mov_id from Movies.Movie_cast where act_id in (
select act_id from Movies.Actor where act_id in (select act_id from Movies.Movie_cast 
group by act_id having COUNT(act_id)>1)))

/*--------------------3_JOINS--------------------*/

--1. From the following tables, write a SQL query to find the name of all reviewers who have rated their ratings with a NULL value. Return reviewer name.
select re.rev_name
from movies.reviewer re join movies.rating r on re.rev_id = r.rev_id
where r.rev_stars is null

--2. From the following tables, write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role. 
select act_fname, act_lname, role
from movies.actor a join movies.Movie_cast mc on a.act_id = mc.act_id
join Movies.Movie m on m.mov_id = mc.mov_id
where mov_title = 'Annie Hall'

--3. From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'. Return director first name, last name and movie title.  
select dir_fname, dir_lname, mov_title
from Movies.Director d join Movies.Movie_Direction md on d.dir_id=md.dir_id
join movies.movie_cast mc on mc.mov_id = md.mov_id
join Movies.Movie m on m.mov_id = mc.mov_id
where mov_title = 'Eyes Wide Shut'

--4. From the following tables, write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, last name and movie title.
select dir_fname, dir_lname, mov_title
from Movies.Director d join Movies.Movie_Direction md on d.dir_id=md.dir_id
join movies.movie_cast mc on mc.mov_id = md.mov_id
join Movies.Movie m on m.mov_id = mc.mov_id
where role = 'Sean Maguire'

--5. From the following tables, write a SQL query to find the actors who have not acted in any movie between1990 and 2000 (Begin and end values are included.). Return actor first name, last name, movie title and release year.
select act_fname, act_lname, mov_title, mov_year
from Movies.actor a
join movies.movie_cast mc on mc.act_id = a.act_id
join Movies.Movie m on m.mov_id = mc.mov_id
where mov_year not between 1990 and 2000

--6. From the following tables, write a SQL query to find the directors with number of genres movies. Group the result set on director first name, last name and generic title. Sort the result-set in ascending order by director first name and last name. Return director first name, last name and number of genres movies.
select d.dir_fname,d.dir_lname,g.gen_title,COUNT(g.gen_title) as no_of_generes_movies
from Movies.Director d join Movies.Movie_Direction md on d.dir_id = md.dir_id
join Movies.Movie_Genres mg on md.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
group by d.dir_fname,d.dir_lname,g.gen_title
order by d.dir_fname,d.dir_lname

--7. From the following table, write a SQL query to find the movies with year and genres. Return movie title, movie year and generic title.
select m.mov_title,m.mov_year,g.gen_title
from Movies.Movie m
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 

--8. From the following tables, write a SQL query to find all the movies with year, genres, and name of the director.
select distinct m.mov_title, m.mov_year, g.gen_title, dir_name = d.dir_fname +' '+ d.dir_lname
from Movies.Movie m
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
order by m.mov_year

--9. From the following tables, write a SQL query to find the movies released before 1st January 1989. Sort the result-set in descending order by date of release. Return movie title, release year, date of release, duration, and first and last name of the director. 
select distinct m.mov_title, m.mov_year, m.mov_dt_rel, m.mov_time ,d.dir_fname, d.dir_lname
from Movies.Movie m
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
where m.mov_dt_rel < '1989-01-01'

--10. From the following tables, write a SQL query to compute the average time and count number of movies for each genre. Return genre title, average time and number of movies for each genre.
select g.gen_title, avg(m.mov_time) as average_time, COUNT(g.gen_title) as no_of_movies
from Movies.Movie m
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
group by g.gen_title

--11. From the following tables, write a SQL query to find movies with the lowest duration. Return movie title, movie year, director first name, last name, actor first name, last name and role.
select m.mov_title, m.mov_year, d.dir_fname, d.dir_lname, act_fname, act_lname, mc.role
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
where m.mov_time = (select min(mov_time) from Movies.Movie)

--12. From the following tables, write a SQL query to find those years when a movie received a rating of 3 or 4. Sort the result in increasing order on movie year. Return move year.
select distinct m.mov_year
from Movies.Movie m join Movies.Rating r on m.mov_id = r.mov_id
where r.rev_stars in (3,4)
order by m.mov_year

--13. From the following tables, write a SQL query to get the reviewer name, movie title, and stars in an order that reviewer name will come first, then by movie title, and lastly by number of stars. 
select re.rev_name, m.mov_title, r.rev_stars
from movies.reviewer re 
join movies.rating r on re.rev_id = r.rev_id
join Movies.Movie m on m.mov_id = r.mov_id
where re.rev_name is not null and r.rev_stars is not null
order by re.rev_name, m.mov_title, r.rev_stars

--14. From the following tables, write a SQL query to find those movies that have at least one rating and received highest number of stars. Sort the result-set on movie title. Return movie title and maximum review stars.
select m.mov_title, max_review_stars = MAX(r.rev_stars)
from  movies.rating r 
join Movies.Movie m on m.mov_id = r.mov_id
where r.rev_stars >= 1 
group by m.mov_title

--15. From the following tables, write a SQL query to find those movies, which have received ratings. Return movie title, director first name, director last name and review stars.
select distinct m.mov_title,d.dir_fname, d.dir_lname, r.rev_stars
from Movies.Movie m
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
join Movies.Rating r on m.mov_id = r.mov_id
where r.rev_stars is not null

--16. Write a query in SQL to find the movie title, actor first and last name, and the role for those movies where one or more actors acted in two or more movies.
select m.mov_title, a.act_fname, a.act_lname, mc.role
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
where a.act_id in (
select act_id
from Movies.Movie_cast
group by act_id 
having COUNT(*) >=2)

--17. From the following tables, write a SQL query to find the actor whose first name is 'Claire' and last name is 'Danes'. Return director first name, last name, movie title, actor first name and last name, role.
select m.mov_title, d.dir_fname, d.dir_lname, act_fname, act_lname
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
where a.act_fname = 'Claire' and a.act_lname = 'Danes'

--18. From the following tables, write a SQL query to find those actors who have directed their movies. Return actor first name, last name, movie title and role. 
select m.mov_title, act_fname, act_lname, mc.role
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
where a.act_fname = d.dir_fname and a.act_lname = d.dir_lname

--19. From the following tables, write a SQL query to find the cast list of the movie ‘Chinatown’. Return first name, last name.
select act_fname, act_lname
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
where m.mov_title = 'Chinatown'

--20. From the following tables, write a SQL query to find those movies where actor’s first name is 'Harrison' and last name is 'Ford'. Return movie title.
select m.mov_title
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
where a.act_fname = 'Harrison' and a.act_lname = 'Ford'

--21. From the following tables, write a SQL query to find the highest-rated movies. Return movie title, movie year, review stars and releasing country.
select m.mov_title, m.mov_year, r.rev_stars, m.mov_rel_country
from  movies.rating r 
join Movies.Movie m on m.mov_id = r.mov_id
where r.rev_stars in (
select max(rev_stars) from Movies.Rating)

--22. From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating. 
select distinct m.mov_title,m.mov_year,r.rev_stars
from Movies.Movie m
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
join Movies.Rating r on m.mov_id = r.mov_id
where g.gen_title = 'Mystery' 

--23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. Return movie year, generic title, number of generic title and average rating. 
select distinct m.mov_year, g.gen_title, [number of generic title] = COUNT(distinct g.gen_title), [average rating] = avg(r.rev_stars)
from Movies.Movie m
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
join Movies.Rating r on m.mov_id = r.mov_id
where g.gen_title = 'Mystery' 
group by m.mov_year, g.gen_title

--24. From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie. 
select distinct m.mov_title, act_fname, act_lname, m.mov_year, mc.role, g.gen_title, d.dir_fname, d.dir_lname, m.mov_dt_rel, r.rev_stars
from movies.movie m 
join Movies.Movie_cast mc on m.mov_id = mc.mov_id
join Movies.Actor a on mc.act_id = a.act_id
join Movies.Movie_Direction md on m.mov_id = md.mov_id
join Movies.Director d on d.dir_id = md.dir_id
join Movies.Movie_Genres mg on m.mov_id=mg.mov_id
join Movies.Genres g on mg.gen_id=g.gen_id 
join Movies.Rating r on m.mov_id = r.mov_id
where a.act_gender = 'F'
