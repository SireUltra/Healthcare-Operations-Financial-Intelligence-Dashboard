SELECT * FROM healthcare.patients;

with a as(
select * from encounters
Join patients
on encounters.patient = patients.pid),
b as
(select *,
		YEAR(START) AS year,
        month(START) as month,
		TIMEstampDIFF(hour, START, STOP) AS visit_duration
from a)
Select *,
		case when visit_duration > 24 then 'over 24 hours'
        else 'under 24 hours' end as hour_group,
        case when payer_coverage > 0 then 'covered'
        else 'no cover' end as pay_group,
        case when deathdate = '' then 'alive'
        else 'dead' end as life_update
From b