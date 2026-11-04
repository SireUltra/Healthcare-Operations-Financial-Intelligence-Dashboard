SELECT *,
		YEAR(START) AS year,
        month(START) as month,
		TIMEstampDIFF(hour, START, STOP) AS visit_duration
FROM healthcare.encounters

select count(*) from encounters

SELECT START, 
    STOP,
    TIMEDIFF(STOP, START) AS visit_duration
FROM encounters;

SELECT 
    AVG(TIMESTAMPDIFF(MINUTE, START, STOP)) AS avg_duration_minutes,
    AVG(TIMESTAMPDIFF(HOUR, START, STOP)) AS avg_duration_hours
FROM encounters;

SELECT 
    encounterclass, -- Replace with your actual grouping column name if applicable
    COUNT(*) AS total_encounters,
    AVG(TIMESTAMPDIFF(minute, START, STOP)) AS avg_duration
FROM encounters
GROUP BY encounterclass;