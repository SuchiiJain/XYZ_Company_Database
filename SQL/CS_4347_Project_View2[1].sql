create view View2 as
select
    I.Interviewee_ID,
    concat(P.First_Name, ' ', P.Last_Name) as Interviewee_Name,
    I.Job_ID,
    count(*) as Passed_Rounds
from
    Interview I
join
    Person P on I.Interviewee_ID = P.Person_ID
where
    I.Grade > 60
group by
    I.Interviewee_ID,
    I.Job_ID,
    P.First_Name,
    P.Last_Name;
