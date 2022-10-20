##########################################################
##########################################################
#
#            			JOINS
#
#                    \ (•◡•) /
#
##########################################################
##########################################################

-- PROBLEM: 
-- Getting info scattered in different tables
-- 1. Getting a view: Reverse engineer + db you target

-- What I need to get: 
-- Salaries is on T.salaries, Name is on T.employees? 
-- Key in common: emp_no
-- Authors & publications
-- titleauthors & titles
-- on title_id titles & titleauthors
-- au_id: authors & titleautor

-- 1.TITLES (title_id) -> 2.TITLEAUTHOR (title_id, au_id)-> 3.AUTHORS (au_id)alter

SELECT titles.title, au_lname
	FROM titles
    LEFT JOIN titleauthor
		ON titles.title_id = titleauthor.title_id
	LEFT JOIN authors
		ON titleauthor.au_id = authors.au_id;
	
 


-- MySQL will do INNER joins by deafult
SELECT first_name, salary
	FROM employees -- Parent table
    JOIN salaries -- Child table
		ON employees.emp_no = salaries.emp_no -- PK = FK
    ORDER BY salary DESC
    LIMIT 10;

-- LEFT JOIN: all the names, those salaries that exist; else NaN
SELECT first_name, salary
	FROM employees -- Parent table
    LEFT JOIN salaries -- Child table
		ON employees.emp_no = salaries.emp_no -- PK = FK
    ORDER BY salary DESC
    LIMIT 10;

-- Right join: ALL the salaries, I don't mind not having all the names
SELECT first_name, salary
	FROM employees -- Parent table
    RIGHT JOIN salaries -- Child table
		ON employees.emp_no = salaries.emp_no -- PK = FK
    ORDER BY salary DESC
    LIMIT 10;
    
-- ALL columns from employees + salary column from salaries
SELECT emp.*, salary
	FROM employees AS emp
    JOIN salaries
		ON emp.emp_no = salaries.emp_no
    ORDER BY salary DESC
    LIMIT 10;
    
-- Q: get all info from both tables
SELECT emp.*, salaries.*
	FROM employees AS emp
    JOIN salaries
		ON emp.emp_no = salaries.emp_no
    ORDER BY salary DESC
    LIMIT 10;
    
-- Q: get all info from both tables
SELECT *
	FROM employees AS emp
    JOIN salaries
		ON emp.emp_no = salaries.emp_no
    ORDER BY salary DESC
    LIMIT 10;