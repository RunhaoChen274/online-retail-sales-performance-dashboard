CREATE OR REPLACE TABLE orp1001.sales.product_performance AS

SELECT

    StockCode,

    Description,

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

    StockCode,
    Description

ORDER BY

    Total_Revenue DESC;