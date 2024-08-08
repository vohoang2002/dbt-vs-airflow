with monthly_sales as (
    select
        DATE_TRUNC('month', Ship_Date) as Month,
        Product_Name,
        sum(Quantity_Ordered_New) as Total_Quantity_Sold
    from
        {{ ref('staging_superstore_sales') }}
    group by
        Month,
        Product_Name
)

select * from monthly_sales
