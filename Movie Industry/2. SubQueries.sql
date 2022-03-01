use W3Resource
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


















