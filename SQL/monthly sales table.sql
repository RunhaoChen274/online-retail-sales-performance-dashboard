CREATE OR REPLACE TABLE orp1001.sales.monthly_sales AS

SELECT
    EXTRACT(YEAR FROM InvoiceDate) AS Year,
    EXTRACT(MONTH FROM InvoiceDate) AS Month,
    FORMAT_TIMESTAMP('%Y-%m', InvoiceDate) AS Year_Month,

    COUNT(DISTINCT InvoiceNo) AS Total_Orders,
    SUM(Quantity) AS Total_Quantity,
    SUM(Revenue) AS Total_Revenue,
    COUNT(DISTINCT CustomerID) AS Unique_Customers,
    SAFE_DIVIDE(SUM(Revenue), COUNT(DISTINCT InvoiceNo)) AS Average_Order_Value

FROM orp1001.sales.clean_sales_table

GROUP BY
    Year,
    Month,
    Year_Month

ORDER BY
    Year,
    Month;