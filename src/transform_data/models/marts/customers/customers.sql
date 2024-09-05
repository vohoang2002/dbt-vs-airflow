with customer as (
    select
        Customer_ID,
        Customer_Name,
        Customer_Segment,
        Region,
        State_Or_Province,
        City
    from
        {{ ref('staging_superstore_sales') }}
    group by
        Customer_ID,
        Customer_Name,
        Customer_Segment,
        Region,
        State_Or_Province,
        City
)

select * from customer