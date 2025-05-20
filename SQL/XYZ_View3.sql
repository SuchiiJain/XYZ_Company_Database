create view View3 as
select
    PR.Product_Type,
    count(*) as Total_Items_Sold
from
    Sale_History S
join
    Product PR on S.Product_ID = PR.Product_ID
group by
    PR.Product_Type;
