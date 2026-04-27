CREATE OR REPLACE table orp1001.sales.clean_sales_view AS

SELECT
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country,

    -- Derived column
    Quantity * UnitPrice AS Revenue

FROM orp1001.sales.Total_sales

WHERE

    -- Rule 1: Remove cancelled transactions
    InvoiceNo NOT LIKE 'C%'

    -- Rule 2: Remove invalid quantity
    AND Quantity > 0

    -- Rule 3: Remove invalid price
    AND UnitPrice > 0

    -- Rule 4: Remove missing customer identifiers
    AND CustomerID IS NOT NULL
;