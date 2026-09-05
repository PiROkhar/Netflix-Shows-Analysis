select * from data;
-- 1. Count the number of Movies vs TV Shows
select type, count(*) as total_number
from data
group by type;

-- 2. Find the most common rating for movies and TV shows
select type, rating, total
from (
		select type, rating, count(*) as total, row_number() over( partition by type order by count(*) desc) as rk
        from data
        where rating is not null
        group by type, rating
        ) as rankingg
where rk = 1;

-- 3. List all movies released in a specific year (e.g., 2020)
select *
from data 
where type = 'movie' AND release_year = 2020;

-- 4. Find the top 5 countries with the most content on Netflix
select country
from (select country, count(country) as cnt
from data
where country is not null AND country != ''
group by country
order by 2 desc
limit 5
) as top;

-- 5. Identify the longest movie
select title, duration
from data
where type = 'movie'
order by cast(substring_index(duration, ',',1)as unsigned) desc
;

-- 6. Find content added in the last 5 years
select * 
from data
where release_year > (year(curdate())-10);

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
select *
from data
where director like '%Rajiv Chilaka%';

-- 8. List all TV shows with more than 5 seasons
select *
from data
where cast(duration AS signed) > 5 and type = 'TV show';

-- 9. Count the number of content items in each genre


-- 10.Find each year and the average numbers of content release in India on netflix. 
select release_year, count(show_id)
from data
where country like '%india%'
group by release_year;

-- return top 5 year with highest avg content release!
select release_year, count(show_id)
from data
group by release_year
having  count(show_id) > (select avg(show_id) from data)
order by 2 desc
limit 5;

-- 11. List all movies that are documentaries
select *
from data
where type = 'movie' and listed_in = 'documentaries';

-- 12. Find all content without a director
select *
from data
where director = '';

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
select title
from data
where cast like '%Salman Khan%' and release_year > (year(curdate()) - 15);

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
select *
from data
where country like 'india' and type = 'movie';

-- 15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
-- the description field. Label content containing these keywords as 'Bad' and all other 
-- content as 'Good'. Count how many items fall into each category.

select category, type, count(*) as content_cnt
from
(
select *,
case 
	when description like '%kill%' OR description like '%violence%' then 'Bad'
	else 'Good'
end as category
from data
) as filterr
group by 1,2
order by 2;




