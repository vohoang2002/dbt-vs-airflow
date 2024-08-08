with superstore_sales as (
    select
        "Order Priority" as Order_Priority,
        "Discount" as Discount,
        "Unit Price" as Unit_Price,
        "Shipping Cost" as Shipping_Cost,
        "Customer ID" as Customer_ID,
        "Customer Name" as Customer_Name,
        "Ship Mode" as Ship_Mode,
        "Customer Segment" as Customer_Segment,
        "Product Category" as Product_Category,
        "Product Container" as Product_Container,
        "Product Name" as Product_Name,
        "Product Base Margin" as Product_Base_Margin,
        "Region" as Region,
        "State or Province" as State_Or_Province,
        "City" as City,
        "Order Date" as Order_Date,
        "Ship Date" as Ship_Date,
        "Profit" as Profit,
        "Quantity ordered new" as Quantity_Ordered_New,
        "Sales" as Sales,
        "Order ID" as Order_Id
    from {{ source('source_1', 'report') }}
)

select * from superstore_sales
