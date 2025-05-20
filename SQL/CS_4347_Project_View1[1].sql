create view View1 as
select
    S.Person_ID,
    concat(P.First_Name, ' ', P.Last_Name) as Employee_Name,
    avg(S.Amount) as Avg_Monthly_Salary
from
    Salary S
join
    Person P on S.Person_ID = P.Person_ID
join
    Employee E on S.Person_ID = E.Person_ID
group by
    S.Person_ID,
    P.First_Name,
    P.Last_Name;
