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


-- create table Employee


