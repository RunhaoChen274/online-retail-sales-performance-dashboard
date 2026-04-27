CREATE OR REPLACE VIEW orp1001.sales.data_quality_summary AS

SELECT

    COUNT(*) AS Total_Raw_Records,

    COUNTIF(InvoiceNo LIKE 'C%') AS Cancelled_Orders,

    ROUND(
        COUNTIF(InvoiceNo LIKE 'C%') / COUNT(*),
        4
    ) AS Cancelled_Rate,

    COUNTIF(CustomerID IS NULL) AS Missing_CustomerID,

    ROUND(
        COUNTIF(CustomerID IS NULL) / COUNT(*),
        4
    ) AS Missing_Customer_Rate,

    COUNTIF(Quantity <= 0) AS Invalid_Quantity,

    ROUND(
        COUNTIF(Quantity <= 0) / COUNT(*),
        4
    ) AS Invalid_Quantity_Rate,

    COUNTIF(UnitPrice <= 0) AS Invalid_Price,

    ROUND(
        COUNTIF(UnitPrice <= 0) / COUNT(*),
        4
    ) AS Invalid_Price_Rate

FROM orp1001.sales.Total_sales;

SELECT * FROM orp1001.sales.data_quality_summary;