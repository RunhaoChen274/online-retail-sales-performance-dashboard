CREATE OR REPLACE TABLE orp1001.sales.country_performance AS

SELECT

    Country,

    COUNT(DISTINCT InvoiceNo) AS Total_Orders,

    SUM(Quantity) AS Total_Quantity,

    SUM(Revenue) AS Total_Revenue,

    COUNT(DISTINCT CustomerID) AS Unique_Customers,

    SAFE_DIVIDE(
        SUM(Revenue),
        COUNT(DISTINCT InvoiceNo)
    ) AS Average_Order_Value

FROM orp1001.sales.clean_sales_table

GROUP BY

    Country

ORDER BY

    Total_Revenue DESC;