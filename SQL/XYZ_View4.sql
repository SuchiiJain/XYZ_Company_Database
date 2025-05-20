create view View4 as
select
    PP.Product_ID,
    PR.Product_Type,
    sum(PP.Quantity * VP.Price) as Total_Part_Cost
from
    Product_Part PP
join
    Vendor_Part VP on PP.Part_Type_ID = VP.Part_Type_ID
join
    Product PR on PP.Product_ID = PR.Product_ID
group by
    PP.Product_ID,
    PR.Product_Type;
