-- CREATE TABLE hbo_max_data ( 
--     user_id INT NOT NULL,               -- User ID 
--     view_date DATE NOT NULL,            -- Date when the show was watched 
--     show_name VARCHAR(255) NOT NULL,    -- Name of the show/movie 
--     watch_time INTERVAL NOT NULL        -- Duration watched in hours, minutes, seconds 

-- ); 

-- INSERT INTO hbo_max_data (user_id, view_date, show_name, watch_time) 
-- VALUES 
-- (1, '2025-01-01', 'Game of Thrones', '02:15:00'), 
-- (2, '2025-01-02', 'Euphoria', '01:45:00'), 
-- (3, '2025-01-03', 'The Last of Us', '00:30:00'), 
-- (1, '2025-01-04', 'House of the Dragon', '03:00:00'), 
-- (4, '2025-01-05', 'Friends', '00:50:00'), 
-- (3, '2025-01-06', 'Succession', '01:20:00'), 
-- (2, '2025-01-07', 'Westworld', '02:00:00'), 
-- (4, '2025-01-08', 'Chernobyl', '01:10:00'), 
-- (1, '2025-01-09', 'Barry', '00:40:00'), 
-- (3, '2025-01-10', 'Silicon Valley', '00:55:00'); 

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

6. Find all shows watched in the last week of January 2025. 

7. List all records where the show was watched on a weekday. 

8. Get all records where the show was watched in the second week of January 2025. 

9. Find records for all shows watched on the same day by multiple users. 

10. Retrieve records for all shows watched during weekdays only in January 2025. 
 