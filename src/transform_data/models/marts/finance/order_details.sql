-- order_details.sql
with order_details as(
    select
        Order_Id,
        Product_Name,
        Order_Priority,
        Ship_Mode,
        Discount,
        Unit_Price,
        Shipping_Cost,
        Ship_Date,
        Profit,
        Quantity_Ordered_New,
        Sales
    from
        {{ ref('staging_superstore_sales') }}
)

select * from order_details