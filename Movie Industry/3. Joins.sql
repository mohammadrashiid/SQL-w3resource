use W3Resource
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



















































