with products as(
    select
        Product_Name,
        Product_Category,
        Product_Base_Margin,
        Product_Container
    from
        {{ ref('staging_superstore_sales') }}
    group by 
        Product_Name,
        Product_Category,
        Product_Base_Margin,
        Product_Container
)

select * from products