#1 

WITH CTE AS(
     SELECT 
          employee_id, 
          employee_name, 
          salary, 
          RANK() OVER (ORDER BY salary) DESC) AS RANK
    FROM 
         Employees
    GROUP BY 1,2,3
)
SELECT 
     employee_id, 
     employee_name, 
     Salary 
FROM 
    CTE 
WHERE Rank = 2; 
     
