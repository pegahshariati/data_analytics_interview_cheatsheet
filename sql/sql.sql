-- find employee with max salary
SELECT name
FROM users
WHERE salary = (SELECT MAX(salary) FROM users)


--find highest salary
SELECT MAX(salary)
FROM users


--find range of employees based on id
SELECT *
FROM users
WHERE id BETWEEN 1 AND 5


--find 3rd highest salary value
SELECT  salary
FROM users
ORDER BY salary DESC
LIMIT 1 OFFSET 2


--find employee with highest salary and dep name
SELECT name 
FROM users
INNER JOIN addresses 
ON users.id = addresses.user_id;
WHERE salary = (SELECT MAX(salary) FROM users)


--return highest salary, employee name and department for each department
SELECT users.name, users.salary, departments.name
FROM users
INNER JOIN departments
ON users.department_id = departments.id
GROUP BY departments.name  


--fetch all data from employee table
SELECT * 
FROM Employee


--fetch all details of all Female employees
SELECT *
FROM Employee
WHERE Gender = 'Female'


--return maximum salary from each department
SELECT MAX(salary), department
FROM Employee
GROUP BY department


--find distinct employee whose salary is between 30000-35000
SELECT DISTINCT(employee)
WHERE salary BETWEEN 30000 AND 35000


-- find name of users where salary is grater than specified user salary
SELECT name 
FROM users 
WHERE salary > (SELECT salary FROM users WHERE name = 'Pegah');


--select all cities start with S
SELECT city
FROM `bigquery-public-data.geo_us_boundaries.zip_codes`
WHERE city LIKE 'S%'


--find maximum salary for a lady employee
SELECT salary
FROM Employee
WHERE salary = (SELECT MAX(salary)FROM Employee WHERE gender = 'Female')


-- find 3rd lowest salary value
SELECT  salary
FROM users
ORDER BY salary ASC
LIMIT 1 OFFSET 2


--update salary of an employee to 34000
UPDATE users
SET salary = 34000
WHERE name = 'Pegah'


--commnents that recieved more than 10 replies
SELECT comments.id
FROM comments
WHERE replies_count > 10;


--select all cities where users salary is greater than specified salary
SELECT city
FROM `bigquery-public-data.geo_us_boundaries.zip_codes`
WHERE area_land_meters > (SELECT area_land_meters FROM `bigquery-public-data.geo_us_boundaries.zip_codes` WHERE city = 'Woodbury town')


--delete details of an employee named JOHN
DELETE FROM users
WHERE name = 'John'


--fetch geo_id and population data from population_by_zip_2010 & zip_codes tables using inner join
SELECT geo_id, population
FROM`bigquery-public-data.census_bureau_usa.population_by_zip_2010` census
INNER JOIN `bigquery-public-data.geo_us_boundaries.zip_codes` zip
ON(census.zipcode = zip.zip_code)


-- find details of CA place with highest salary
SELECT *
FROM `bigquery-public-data.census_bureau_usa.population_by_zip_2010` census
FULL JOIN `bigquery-public-data.geo_us_boundaries.zip_codes` zip
ON(zip.zip_code = census.zipcode)
WHERE zip.state_code = 'CA'
ORDER BY census.population DESC
LIMIT 1

-- delete duplicate rows from table using NOT IN
DELETE FROM table WHERE id NOT IN (
SELECT MAX(id) FROM table GROUP BY col1, col2, col3)

-- Return duplicated rowsfrom table
SELECT *
FROM table 
WHERE id Not IN (SELECT MAX(id) FROM table GROUP BY col1, col2, col3)

--getting avg area lands by state using window aggregate function
SELECT first_name, avg(salary) OVERE (PARTITION BY first_name) AS avg_salary
FROM table

--Unique Users Per Client Per Month
SELECT client_id, month, count(distinct user_id) AS unique_users


--write a query that returns a first date of the month, a number of posts created in a given month and a month-over-month growth rate.
SELECT CAST(date_trunc('month', created_at) as DATE) as date,
       count(*) as count,
       ROUND(100*(1.0 * count(*)/LAG(count(*)) OVER (ORDER BY CAST(date_trunc('month', created_at) as DATE) ASC) - 1), 1) || '%' as percent_growth    
FROM posts
GROUP BY date
ORDER BY date asc

--insert name, age and attending to the guest list
INSERT INTO participants (name, age, attending)
VALUES ('Pegah', '29', 'True'), ('Jane', '26', 'True')

--Find the total sum of internal angles (in degrees) in an n-sided simple polygon. N will be greater than 2
select (n - 2)* 180 as res
from angle
WHERE n > 2

--lowercase
SELECT lower(name) as Name

--concatenate first and last name and capitalize the fist letter of each word
SELECT INITCAP (concat(firstname, ' ', lastname)) AS shortlist
FROM Elves
WHERE firstname LIKE 'tegil%' OR lastname LIKE 'astar%'

--convert number to hexadecimal
SELECT to_hex(id) as hex_id
FROM Elves

--first_name with at least 6 character long
SELECT firstname

replace any digit below 5 with '0' and any digit 5 and above with '1'. Return the resulting string
SELECT replace(id, '0', '1') as id

getting lenght of a string
SELECT length(id) as id_length


--sum of all customers expense for renting dvd that in their first name they have "Ma"
SELECT city, postal_code, store_id, last_name, first_name, SUM(amount) 
FROM city
JOIN address ON (city.city_id = address.city_id)
JOIN customer ON (customer.address_id = address.address_id)
JOIN payment ON (payment.customer_id = customer.customer_id)
WHERE first_name LIKE 'Ma%'
GROUP BY city, postal_code, store_id, last_name, first_name 
ORDER BY SUM(amount) Desc
LIMIT 35

--get the top 10% of the amount spent on rent video
SELECT T.payment_id, T.amount, T.cumm_dist
FROM (SELECT payment_id, amount, CUME_DIST() OVER(ORDER BY amount) cumm_dist
FROM payment) AS T
WHERE T.cumm_dist > 0.90

