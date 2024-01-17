CREATE VIEW ARDEP.jobs_count AS(
SELECT t3.department, t2.job, quarter(t1.datetime) as Q, count(t1.id) as cnt  
FROM ARDEP.hired_employees as t1 
left join ARDEP.jobs as t2  on t1.job_id = t2.id
left join departments as t3 on t1.department_id = t3.id
where year(datetime)='2021' 
group by  t3.department, t2.job, quarter(datetime)
order by quarter(datetime));





CREATE VIEW ARDEP.jobs_2021 AS(
SELECT 
t3.department, 
t2.job, 
 count(case when quarter(t1.datetime) = 1 then t1.id else null end) as Q1,
 count(case when quarter(t1.datetime) = 2 then t1.id else null end) as Q2,
 count(case when quarter(t1.datetime) = 3 then t1.id else null end) as Q3,
 count(case when quarter(t1.datetime) = 4 then t1.id else null end) as Q4,
count(t1.id) as TOTAL
FROM ARDEP.hired_employees as t1 
left join ARDEP.jobs as t2  on t1.job_id = t2.id
left join departments as t3 on t1.department_id = t3.id
where year(datetime)='2021'
and t1.department_id is not null
and t1.job_id is not null
and datetime is not null 
group by  t3.department, t2.job, quarter(datetime)
order by t3.department, 
t2.job);


create view ARDEP.department_avg as (
select round(avg(cnt),0) as promedio from (
SELECT t3.id, t3.department, count(t1.id) as cnt  
FROM ARDEP.hired_employees as t1 
left join departments as t3 on t1.department_id = t3.id
where year(t1.datetime)='2021' 
and t1.department_id is not null
group by  t3.id,t3.department) as t4 
) 

CREATE VIEW ARDEP.department_list AS(
SELECT 
t3.id,
t3.department, 
count(t1.id) as cnt
FROM ARDEP.hired_employees as t1 
left join departments as t3 on t1.department_id = t3.id
where t1.department_id is not null
and t1.job_id is not null
and datetime is not null 
group by t3.id,
t3.department
);

create view ARDEP.department_list_avg as (
SELECT * FROM ARDEP.department_list
where cnt > (SELECT * FROM ARDEP.department_avg)