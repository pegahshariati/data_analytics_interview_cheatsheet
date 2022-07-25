--join two tables using inner join
SELECT name 
FROM users
    INNER JOIN addresses 
    ON users.id = addresses.user_id;

-- find name of users where salary is grater than specified user salary
SELECT name 
FROM users 
WHERE salary > (SELECT salary FROM users WHERE name = 'Pegah');

--commnents that recieved more than 10 replies
SELECT comments.id, comments.body, comments.user_id, comments.post_id, comments.created_at, comments.updated_at, comments.replies_count FROM comments WHERE replies_count > 10;     


-- find name of person with max salary
SELECT name
FROM users
WHERE salary = (SELECT MAX(salary) FROM users);

--select all cities where users salary is greater than specified salary
SELECT city
FROM `bigquery-public-data.geo_us_boundaries.zip_codes`
WHERE area_land_meters > (SELECT area_land_meters FROM `bigquery-public-data.geo_us_boundaries.zip_codes` WHERE city = 'Woodbury town')


--select all cities start with S
SELECT city
FROM `bigquery-public-data.geo_us_boundaries.zip_codes`
WHERE city LIKE 'S%'


--find 3rd highest salary value
SELECT  salary
FROM users
ORDER BY salary DESC
LIMIT 1 OFFSET 2

-- find 3rd lowest salary value
SELECT  salary
FROM users
ORDER BY salary ASC
LIMIT 1 OFFSET 2

--update salary of an employee to 34000
UPDATE users
SET salary = 34000
WHERE name = 'Pegah';

--fetch all data from employees and sales tables
SELECT geo_id, population
FROM`bigquery-public-data.census_bureau_usa.population_by_zip_2010` census
INNER JOIN `bigquery-public-data.geo_us_boundaries.zip_codes` zip
ON(census.zipcode = zip.zip_code
)



