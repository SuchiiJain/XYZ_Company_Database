select
    I.interviewer_id,
    concat(P.first_name, ' ', P.last_name) as interviewer_name
from
    interview I
join
    person P on I.interviewer_id = P.person_id
join
    person PE on I.interviewee_id = PE.person_id
where
    I.job_id = '11111'
    and PE.first_name = 'Hellen'
    and PE.last_name = 'Cole';
    
select
    job_id
from
    job_position JP
join
    department D on JP.department_id = D.department_id
where
    D.department_name = 'Marketing'
    and month(posted_date) = 1
    and year(posted_date) = 2011;

select
    MS.site_id,
    MS.site_location
from
    marketing_site MS
where
    MS.site_id not in (
        select site_id
        from sale_history
        where month(sale_time) = 3 and year(sale_time) = 2011
    );

select
    JP.job_id,
    JP.job_description
from
    job_position JP
where
    not exists (
        select 1
        from interview I
        where I.job_id = JP.job_id
        group by I.interviewee_id
        having avg(I.grade) > 70 and count(case when grade > 60 then 1 end) >= 5
    )
    and datediff(curdate(), JP.posted_date) > 30;

select
    SH.salesman_id,
    concat(P.first_name, ' ', P.last_name) as salesman_name
from
    sale_history SH
join
    product PR on SH.product_id = PR.product_id
join
    person P on SH.salesman_id = P.person_id
where
    PR.list_price > 200
group by
    SH.salesman_id
having
    count(distinct PR.product_type) = (
        select count(distinct product_type)
        from product
        where list_price > 200
    );


select
    D.department_id,
    D.department_name
from
    department D
where
    D.department_id not in (
        select department_id
        from job_position
        where posted_date between '2011-01-01' and '2011-02-01'
    );

select
    P.person_id,
    concat(P.first_name, ' ', P.last_name) as name,
    DA.department_id
from
    job_application JA
join
    employee E on JA.person_id = E.person_id
join
    person P on JA.person_id = P.person_id
join
    department_assignment DA on JA.person_id = DA.person_id
where
    JA.job_id = '12345';
    

select
    PR.product_type
from
    sale_history SH
join
    product PR on SH.product_id = PR.product_id
group by
    PR.product_type
order by
    count(*) desc
limit 1;

select
    PR.product_type
from
    product PR
join
    product_part PP on PR.product_id = PP.product_id
join
    vendor_part VP on PP.part_type_id = VP.part_type_id
group by
    PR.product_type
order by
    (avg(PR.list_price) - sum(PP.quantity * VP.price)) desc
limit 1;

select
    E.person_id,
    concat(P.first_name, ' ', P.last_name) as name
from
    employee E
join
    person P on E.person_id = P.person_id
where
    not exists (
        select D.department_id
        from department D
        where D.department_id not in (
            select DA.department_id
            from department_assignment DA
            where DA.person_id = E.person_id
        )
    );

select
    P.person_id,
    concat(P.first_name, ' ', P.last_name) as name
from
    interview I
join
    person P on I.interviewee_id = P.person_id
group by
    I.interviewee_id
having
    avg(I.grade) > 70 and count(case when I.grade > 60 then 1 end) >= 5;

select
    P.first_name,
    P.last_name,
    max(PH.phone_number) as phone_number
from
    interview I
join
    person P on I.interviewee_id = P.person_id
join
    phone PH on PH.person_id = P.person_id
group by
    I.interviewee_id, P.first_name, P.last_name
having
    avg(I.grade) > 70 and count(case when I.grade > 60 then 1 end) >= 5;
    
    
select
    P.first_name,
    P.last_name,
    max(PH.phone_number) as phone_number
from
    interview I
join
    person P on I.interviewee_id = P.person_id
join
    phone PH on PH.person_id = P.person_id
group by
    I.interviewee_id, P.first_name, P.last_name
having
    avg(I.grade) > 70 and count(case when I.grade > 60 then 1 end) >= 5;

select
    S.person_id,
    concat(P.first_name, ' ', P.last_name) as name
from
    salary S
join
    person P on S.person_id = P.person_id
group by
    S.person_id
order by
    avg(S.amount) desc
limit 1;

select
    V.vendor_id,
    V.name
from
    vendor V
join
    vendor_part VP on V.vendor_id = VP.vendor_id
join
    part_type PT on VP.part_type_id = PT.part_type_id
where
    PT.name = 'Cup'
    and PT.weight < 4
order by
    VP.price asc
limit 1;

