SHOW DATABASES;
USE project_csat_analytics;
SHOW TABLES;

SELECT *
FROM CSAT
LIMIT 10;
DESCRIBE CSAT;
SELECT COUNT(*) AS Total_Records
FROM CSAT;
SELECT id, COUNT(*) AS Duplicate_Count
FROM CSAT
GROUP BY id
HAVING COUNT(*) > 1;
SELECT id, COUNT(*) AS Duplicate_Count
FROM CSAT
GROUP BY id
HAVING COUNT(*) > 1;
SELECT
    COUNT(*) AS Total_Records,
    SUM(CASE WHEN customer_name IS NULL THEN 1 ELSE 0 END) AS Missing_Names,
    SUM(CASE WHEN sentiment IS NULL THEN 1 ELSE 0 END) AS Missing_Sentiment,
    SUM(CASE WHEN csat_score IS NULL THEN 1 ELSE 0 END) AS Missing_CSAT,
    SUM(CASE WHEN reason IS NULL THEN 1 ELSE 0 END) AS Missing_Reason,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS Missing_City,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS Missing_State,
    SUM(CASE WHEN channel IS NULL THEN 1 ELSE 0 END) AS Missing_Channel,
    SUM(CASE WHEN response_time IS NULL THEN 1 ELSE 0 END) AS Missing_Response_Time
FROM CSAT;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT id) AS Unique_IDs,
    COUNT(*) - COUNT(DISTINCT id) AS Duplicate_IDs
FROM CSAT;

DESCRIBE CSAT;
SELECT
    sentiment,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY sentiment
ORDER BY Total_Calls DESC;

SELECT
    channel,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY channel
ORDER BY Total_Calls DESC;

SELECT
    sentiment,
    COUNT(*) AS Total_Calls,
    ROUND(
        COUNT(*) * 100.0 / (SELECT COUNT(*) FROM CSAT), 2
    ) AS Percentage
FROM CSAT
GROUP BY sentiment
ORDER BY Total_Calls DESC;

SELECT
    channel,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY channel
ORDER BY Total_Calls DESC;

SELECT
    reason,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY reason
ORDER BY Total_Calls DESC;

SELECT
    state,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY state
ORDER BY Total_Calls DESC
LIMIT 10;

SELECT
    ROUND(AVG(csat_score), 2) AS Average_CSAT,
    MIN(csat_score) AS Minimum_CSAT,
    MAX(csat_score) AS Maximum_CSAT
FROM CSAT;

SELECT
    response_time,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY response_time
ORDER BY Total_Calls DESC;

SELECT
    sentiment,
    ROUND(AVG(csat_score), 2) AS Average_CSAT,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY sentiment
ORDER BY Average_CSAT DESC;

SELECT
    Call_Day,
    COUNT(*) AS Total_Calls
FROM CSAT
GROUP BY Call_Day
ORDER BY Total_Calls DESC;

SELECT
    ROUND(AVG(call_duration_in_minutes), 2) AS Average_Call_Duration,
    MAX(call_duration_in_minutes) AS Longest_Call,
    MIN(call_duration_in_minutes) AS Shortest_Call
FROM CSAT;

SELECT
    reason,
    COUNT(*) AS Total_Calls,
    ROUND(AVG(csat_score), 2) AS Average_CSAT
FROM CSAT
GROUP BY reason
ORDER BY Average_CSAT ASC
LIMIT 10;