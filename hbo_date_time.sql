CREATE TABLE hbo_max_data ( 
    user_id INT NOT NULL,               -- User ID 
    view_date DATE NOT NULL,            -- Date when the show was watched 
    show_name VARCHAR(255) NOT NULL,    -- Name of the show/movie 
    watch_time INTERVAL NOT NULL        -- Duration watched in hours, minutes, seconds 

); 

INSERT INTO hbo_max_data (user_id, view_date, show_name, watch_time) 
VALUES 
(1, '2025-01-01', 'Game of Thrones', '02:15:00'), 
(2, '2025-01-02', 'Euphoria', '01:45:00'), 
(3, '2025-01-03', 'The Last of Us', '00:30:00'), 
(1, '2025-01-04', 'House of the Dragon', '03:00:00'), 
(4, '2025-01-05', 'Friends', '00:50:00'), 
(3, '2025-01-06', 'Succession', '01:20:00'), 
(2, '2025-01-07', 'Westworld', '02:00:00'), 
(4, '2025-01-08', 'Chernobyl', '01:10:00'), 
(1, '2025-01-09', 'Barry', '00:40:00'), 
(3, '2025-01-10', 'Silicon Valley', '00:55:00'); 

-- Easy 

-- 1. Find all records where the user watched a show in January 2025. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE MONTH(view_date) = 1 AND YEAR(view_date) = 2025 

2. Find all records where the user watched a show in the first week of January 2025. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE view_date BETWEEN '2025-01-01' AND '2025-01-07'

3. Retrieve all records where the user watched a show on a weekend. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE DAYOFWEEK(view_date) IN (1,7)

4. List all records for shows watched on a specific day, e.g., '2025-01-01'. 
SELECT * 
FROM 
    hbo_max_data 
WHERE view_date = '2025-01-01';

5. Extract the day of the week for each view_date. 
SELECT 
      view_date, 
      DAYOFWEEK(view_date) AS day_of_week 
FROM  
    hbo_max_data 


6. Find all shows watched in the last week of January 2025. 
SELECT * 
FROM 
    Hbo_max_data
WHERE 
    view_date BETWEEN '2025-01-25' AND '2025-01-31'

7. List all records where the show was watched on a weekday. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE DAYOFWEEK(view_date) BETWEEN (2,6)

8. Get all records where the show was watched in the second week of January 2025. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE view_date BETWEEN '2025-01-08' AND '2025-01-14'

9. Find records for all shows watched on the same day by multiple users. 
SELECT 
      view_date, 
      COUNT(*) AS user_count
FROM   
    Hbo_max_data 
GROUP BY view_date 
HAVING COUNT(DISTINCT user_count) > 1 

10. Retrieve records for all shows watched during weekdays only in January 2025. 
SELECT * 
FROM 
    Hbo_max_data 
WHERE 
    MONTH(view_date) = 1 AND YEAR(view_date) = 2025 AND DAYOFWEEK(view_Date) BETWEEN (2,6)


- Medium 

11. Calculate the total watch time for each week in January 2025. 
SELECT WEEK(view_date) AS week, 
      SEC_TO_TIME(SUM(TIME_TO_SEC(watch_time))) AS total_time 
FROM  
    Hbo_max_data 
WHERE 
    MONTH(view_date) = 1 AND YEAR(view_date) = 2025 
GROUP BY WEEK(view_date)

12. Find the total watch time for each day in January 2025. 
SELECT 
      view_date 
      TIME_TO_SEC(SUM(SEC_TO_TIME(watch_time)))
FROM  
    Hbo_max_data 
WHERE MONTH(view_date) = 1 AND YEAR(view_date) = 2025 
GROUP BY view_date


13. Find the total watch time for each user during weekends in January 2025. 
SELECT  
      user_id, 
      SEC_TO_TIME(SUM(TIME_TO_SEC(watch_time))) AS total_watch_time 
FROM  
    Hbo_max_data 
WHERE 
    MONTH(view_date) = 1 AND YEAR(view_date) = 2025 AND DAY(view_date) BETWEEN (1,7)
GROUP BY user_id 


14. Retrieve the average watch time per week for all users. 
SELECT 
      WEEK(view_date) AS week 
      SEC_TO_TIME(avg(TIME_TO_SEC(watch_time)) AS avg_watch_time 
FROM   
    Hbo_max_data 
GROUP BY WEEK(view_date)

15. List users who watched a show every day in a specific week of January 2025. 
SELECT 
     user_id 
FROM   
    Hbo_max_data 
WHERE 
     WEEK(view_date) = 2 AND MONTH(view_date) = 1 AND YEAR(view_date) = 2025 
GROUP BY user_id 
HAVING COUNT(DISTINCT view_date) = 7  


16. Identify users who were active for at least 3 days in a specific week. 
SELECT 
      user_id 
FROM  
    Hbo_max_data 
WHERE 
    WEEK(view_date) = 3 AND MONTH(view_date) = 1 AND YEAR(view_date) = 2025
GROUP BY user_id 
HAVING COUNT(DISTINCT view_date) >= 3 

17. Find the average watch time per day for each user. 
SELECT 
     user_id, 
     SEC_TO_TIME(avg(TIME_TO_SEC(watch_time)) AS avg_watch_time 
FROM  
    Hbo_max_data 
GROUP BY view_date, user_id 


18. Calculate the total watch time for all users in the third week of January 2025. 
SELECT 
     SEC_TO_TIME(SUM(TIME_TO_SEC(watch_time)) AS avg_watch_time
FROM 
    Hbo_max_data 
WHERE 
    MONTH(view_date) = 1 AND YEAR(view_date) = 2025 AND WEEK(view_date) = 3


19. List all shows watched by users on the same weekday across multiple weeks. 
SELECT 
      DAYNAME(view_date) AS weekday, 
      show_name, 
      COUNT(*) AS times_watched 
FROM 
    Hbo_max_data 
GROUP BY 
    DAYNAME(view_date), 
    show_name
HAVING COUNT(*) > 1
     
20. Retrieve all users who watched shows only during weekdays in a specific week. 
SELECT 
     DISTINCT user_id 
FROM 
    Hbo_max_data 
WHERE WEEK(view_date) = 2 AND MONTH(view_date) = 1 AND YEAR(view_date) = 2025 AND 
DAYOFWEEK(view_date) BETWEEN (2,6)
