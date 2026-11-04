SELECT * FROM healthcare.procedures;
select count(*) from healthcare.procedures;
select count(distinct stop_time) from healthcare.procedures;

SELECT *,
		YEAR(start_time) AS year,
        month(start_time) as month,
        TIMEDIFF(stop_time, start_time) AS visit_duration
from procedures

with a as(
select * from procedures
Join patients
on procedures.patient_id = patients.pid),
b as(
SELECT *,
		YEAR(start_time) AS year,
        month(start_time) as month,
        TIMEstampDIFF(hour, start_time, stop_time) AS visit_duration
from a)
Select *,
		case when visit_duration > 24 then 'over 24 hours'
        else 'under 24 hours' end as hour_group,
        case when deathdate = '' then 'alive'
        else 'dead' end as life_update
From b