##########################################################
##########################################################
#
#            The SQL SELECT Statement
#		      			 (& Friends)
#
#                    \ (•◡•) /
#
##########################################################
##########################################################

USE employees;

-- SELECT EVERYTHING *
SELECT *
	FROM departments; -- with tabulation

SELECT *
FROM departments; -- without tabulation, two lines

SELECT * FROM departments; -- one line, same thing

SELECT birth_date, first_name
	FROM employees;
    
SELECT birth_date as BIRTHDAY, first_name as NAME, gender
	FROM employees; -- aliases

select BIRTH_DATE AS BIRTHDAY
from employees; -- not case sensitive

SELECT *
	FROM employees;
    
SELECT first_name, last_name, gender
	FROM employees
    WHERE first_name = "Parto";

SELECT first_name, last_name, hire_date
	FROM employees
    WHERE last_name = "Ghelli";
    
-- df[[first_name,last_name, hire_date]] & last_name == "Ghelli"


-- AND operator: multiple conditions
SELECT * 
	FROM employees
    WHERE gender = "F" AND first_name = "Rosita";

-- OR operator
SELECT *
	FROM employees
    WHERE gender = "F" OR first_name = "Parto";
    
SELECT *
	FROM employees 
    WHERE (first_name = "Bezalel" AND gender = "F")
		OR gender = "M";

SELECT * FROM EMPLOYEES;

SELECT  * 
	FROM employees
	WHERE first_name = "Hugo"
		OR first_name = "Mark"
		OR first_name = "Ramzi"
		OR first_name = "Mayuko";

-- IN operator: to check if a value 
-- is contained in a (python) tuple
SELECT *
	FROM employees
    WHERE first_name IN ("Hugo", "Mark");

-- NOT IN: I can do the opposite: exclude

SELECT *
	FROM employees
    WHERE first_name NOT IN ("Hugo", "Mark");
    
-- str.startswith("An") ->
-- It is not case sensitive
-- % serves as a wildcard: what & quantity
SELECT *
	FROM employees
    WHERE first_name LIKE ("an%"); -- Not just Ana
								-- but Anyuan also gets it

-- I want -an- to be in between
-- % can also be nothing
SELECT * 
	FROM employees
    WHERE first_name LIKE ("%an%");
    
-- _ operator looks for ONE character 
-- they can be put together: __ (2 underscores)
SELECT * 
	FROM employees
    WHERE first_name LIKE ("Ang__");
    
-- Everyone man born in 1955 
SELECT *
	FROM employees
    WHERE birth_date LIKE ("1955%")
    AND gender = "M";

-- Everyone born in the 60s
SELECT birth_date, first_name
	FROM employees
    WHERE birth_date >= "1960-01-01" 
		AND birth_date < "1970-01-01";

-- Same example with like instead of range
SELECT birth_date, first_name
	FROM employees
    WHERE birth_date LIKE ("1960%");
    
-- Q: Range of months: Jan-June 1960: subquery
SELECT birth_date, first_name
	FROM employees
    WHERE birth_date LIKE ("1960-01-%")
		AND birth_date LIKE ("1960-02-%")
        AND birth_date LIKE ("1960-03-%")
        AND birth_date LIKE ("1960-04-%")
        AND birth_date LIKE ("1960-05-%")
        AND birth_date LIKE ("1960-06-%");

-- Q: People born in 1960 between Jan and June
SELECT birth_date, first_name
	FROM employees
    WHERE birth_date >= "1960-01-01"
		AND birth_date < "1960-07-01";

-- Q: import date in a different format than default

-- Rangs of dates: with two conditions
-- BETWEEN

SELECT first_name, last_name, hire_date, gender
	FROM employees
    WHERE hire_date BETWEEN "1990-01-01" 
    AND "2000-01-01"
    AND gender = "F";
    
SELECT *
	FROM salaries
    WHERE  salary BETWEEN 70000 AND 80000;

-- I can include order by 
-- so that I can sort the values
-- based on a given column
SELECT *
	FROM salaries
    WHERE  salary >= 70000
		AND salary < 80000
    ORDER BY salary DESC;
    
-- DESC for descending values (highest first)
-- ASC for ascending values (lowest first)


-- BETWEEN can be used for string ranges
-- Up to the previous element
-- Checks for first element
SELECT *
	FROM employees
    WHERE first_name BETWEEN "A" AND "D";
    -- this would retrieve A, B and C ocurrences, not D

/*
" A"
"1A"
"AA"
"aa"
"Ab"
*/

-- Q: Can I not do the same with the wildcard? -> 
-- not really, different output, only A's
SELECT *
	FROM employees
    WHERE first_name LIKE ("A%")
    ORDER BY first_name ASC;
    
    
-- BETWEEN: will values within a range
-- that range can be: DATES, INT, "things"

-- Q: Ahmed & Dani
-- It creates a range based on the ASCII
-- representation of strings

SELECT *
	FROM employees
    WHERE first_name BETWEEN "Ahmed" AND "Dan"
		ORDER BY first_name desc;
        
-- NULL values: WHERE value IS NULL, WHERE VALUE IS NOT NULL
SELECT *
	FROM employees
    WHERE birth_date IS NOT NULL;

SELECT * 
	FROM salaries
    WHERE from_date IS NULL;

SELECT SUM(salary)
	from salaries;
    
SELECT salary, (salary * 4 /100) 
	from SALARIES;

-- I can create new columns based on existing ones
-- That new column I cannot retrieve in the future
-- as I'm not creating it
SELECT salary as money, (salary * 15 / 100) AS TAX
	FROM salaries;

-- I can do operations on Where conditions
-- not just matches
SELECT *
	FROM salaries
	WHERE salary / 2 = 35000;

-- Select columns that don't really exist
-- based on operations on existing ones
-- I can pass ROUND to that operation
SELECT emp_no, salary, ROUND(salary * 15 / 100) as TAX
	FROM salaries
	WHERE from_date >= "2000-01-01";

SELECT SUM(salary)
	FROM salaries
    WHERE from_date LIKE "1990%";
    
-- Operators: SUM, COUNT, ROUND, MAX, MIN, AVG

SELECT ROUND(AVG(salary))
	FROM salaries;

-- Total amount of employees: count(PK)
SELECT COUNT(emp_no) -- Count: it does consider spaces
	FROM employees;
    
SELECT COUNT(*)
	FROM employees
    WHERE birth_date >= "1965-01-01";

-- How many different departments do I have in my dep table?
SELECT COUNT(DISTINCT dept_name)
	FROM departments;
    
    -- distinct will retrieve all the unique values


-- GROUP BY
SELECT first_name, COUNT(first_name) AS count
	FROM employees
    GROUP BY first_name
	ORDER BY count desc;

-- CONCAT: put strings together
SELECT CONCAT(first_name, " AND ", last_name) as FULL_NAME
	FROM employees;

-- WHERE & HAVING
SELECT *
	FROM employees
    WHERE hire_date >= "1900-01-01";

SELECT *
	FROM employees
    HAVING hire_date >= "1900-01-01";

-- Where will check for condition 
-- Having will check after data has been grouped
-- or filtered before

SELECT first_name, COUNT(first_name) as COUNT
	FROM employees
    WHERE hire_date LIKE ("1986%")
    GROUP BY first_name
    HAVING COUNT <= 20
    ORDER BY COUNT DESC;

-- If I used where: ERROR: 'WHERE COUNT <= 20     ORDER BY COUNT DESC' 


-- Having is passed after the data has been grouped
-- as it checks for the grouped (alreay processed)
-- result. While Where works for the first time
-- it checks the data
-- Sometimes both will work


SELECT * 
	FROM employees
    ORDER BY first_name ASC
    LIMIT 5;
    
SELECT *
	FROM salaries
	ORDER BY salary DESC
	LIMIT 5;
    
    

