with order_details as (
    select
        Order_Id,
        Customer_Id,
        Order_Date,
        sum(Profit) as Total_Profit,
        sum(Sales) as Total_Sales
    from
        {{ ref('staging_superstore_sales') }}
    group by
        Order_Id,
        Customer_Id,
        Order_Date
)

select * from order_details