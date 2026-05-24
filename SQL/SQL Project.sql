CREATE DATABASE IF NOT EXISTS ADVENTUREWORKS_SALES;

USE ADVENTUREWORKS_SALES;

CREATE TABLE FactInternetSalesNew (
    ProductKey INT,
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(20),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(10,2),
    ExtendedAmount DECIMAL(10,2),
    UnitPriceDiscount DECIMAL(10,2),
    DiscountAmount DECIMAL(10,2),
    ProductStandardCost DECIMAL(10,4),
    TotalProductCost DECIMAL(10,4),
    SalesAmount DECIMAL(10,2),
    TaxAmt DECIMAL(10,2),
    Freight DECIMAL(10,2)
    );

 CREATE TABLE FactInternetSales ( 
ProductKey INT,
    OrderDate DATE,
    DueDate DATE,
    ShipDate DATE,
    CustomerKey INT,
    PromotionKey INT,
    CurrencyKey INT,
    SalesTerritoryKey INT,
    SalesOrderNumber VARCHAR(20),
    SalesOrderLineNumber INT,
    RevisionNumber INT,
    OrderQuantity INT,
    UnitPrice DECIMAL(10,2),
    ExtendedAmount DECIMAL(10,2),
    UnitPriceDiscount DECIMAL(10,2),
    DiscountAmount DECIMAL(10,2),
    ProductStandardCost DECIMAL(10,4),
    TotalProductCost DECIMAL(10,4),
    SalesAmount DECIMAL(10,2),
    TaxAmt DECIMAL(10,2),
    Freight DECIMAL(10,2)
    );

SHOW TABLES;

SET GLOBAL local_infile = 1;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Factinternetsalesnew.csv'
INTO TABLE factinternetsalesnew
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '/n'
IGNORE 1 ROWS;


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FactInternetSales.csv'
INTO TABLE factinternetsales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '/n'
IGNORE 1 ROWS;

SELECT * FROM FactInternetSalesNew;

SELECT * FROM FactInternetSales;

SELECT * FROM sales_new;

SELECT COUNT(*) FROM sales_new;

SELECT COUNT(*) FROM FactInternetSales;

SELECT COUNT(*) FROM FactInternetSalesNew;



#Union of Fact Internet sales and Fact internet sales new
CREATE TABLE Sales_new AS
SELECT * FROM factinternetsales
UNION ALL
SELECT * FROM factinternetsalesnew;


CREATE TABLE product (
    ProductKey INT,
    UnitPrice DECIMAL(10,2),
    ProductAlternateKey VARCHAR(50),
    ProductSubcategoryKey INT,
    WeightUnitMeasureCode VARCHAR(10),
    SizeUnitMeasureCode VARCHAR(10),
    EnglishProductName VARCHAR(255),
    SpanishProductName VARCHAR(255),
    FrenchProductName VARCHAR(255),
    StandardCost DECIMAL(10,2),
    FinishedGoodsFlag TINYINT,
    Color VARCHAR(50),
    SafetyStockLevel INT,
    ReorderPoint INT,
    ListPrice DECIMAL(10,2),
    Size VARCHAR(20),
    SizeRange VARCHAR(50),
    Weight DECIMAL(10,2),
    DaysToManufacture INT,
    ProductLine VARCHAR(10),
    DealerPrice DECIMAL(10,2),
    Class VARCHAR(10),
    Style VARCHAR(10),
    ModelName VARCHAR(255),
    EnglishDescription TEXT,
    FrenchDescription TEXT,
    ChineseDescription TEXT,
    ArabicDescription TEXT,
    HebrewDescription TEXT,
    ThaiDescription TEXT,
    GermanDescription TEXT,
    JapaneseDescription TEXT,
    TurkishDescription TEXT,
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20)
);


SELECT COUNT(*) FROM product;

DESCRIBE product;

TRUNCATE TABLE product;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Product.csv'
INTO TABLE product
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS

(
@ProductKey,
@UnitPrice,
@ProductAlternateKey,
@ProductSubcategoryKey,
@WeightUnitMeasureCode,
@SizeUnitMeasureCode,
@EnglishProductName,
@SpanishProductName,
@FrenchProductName,
@StandardCost,
@FinishedGoodsFlag,
@Color,
@SafetyStockLevel,
@ReorderPoint,
@ListPrice,
@Size,
@SizeRange,
@Weight,
@DaysToManufacture,
@ProductLine,
@DealerPrice,
@Class,
@Style,
@ModelName,
@EnglishDescription,
@FrenchDescription,
@ChineseDescription,
@ArabicDescription,
@HebrewDescription,
@ThaiDescription,
@GermanDescription,
@JapaneseDescription,
@TurkishDescription,
@StartDate,
@EndDate,
@Status
)
SET
ProductKey = IF(@ProductKey='', NULL, @ProductKey),
UnitPrice = IF(@UnitPrice='', NULL, @UnitPrice),
ProductAlternateKey = NULLIF(@ProductAlternateKey,''),
ProductSubcategoryKey = NULLIF(@ProductSubcategoryKey,'0'),
WeightUnitMeasureCode = NULLIF(@WeightUnitMeasureCode,''),
SizeUnitMeasureCode = NULLIF(@SizeUnitMeasureCode,''),
EnglishProductName = NULLIF(@EnglishProductName,''),
SpanishProductName = NULLIF(@SpanishProductName,'NA'),
FrenchProductName = NULLIF(@FrenchProductName,'NA'),
StandardCost = IF(@StandardCost='', NULL, @StandardCost),
FinishedGoodsFlag = IF(@FinishedGoodsFlag='', 0, @FinishedGoodsFlag),
Color = NULLIF(@Color,'NA'),
SafetyStockLevel = IF(@SafetyStockLevel='', NULL, @SafetyStockLevel),
ReorderPoint = IF(@ReorderPoint='', NULL, @ReorderPoint),
ListPrice = IF(@ListPrice='' OR @ListPrice='NA', NULL, @ListPrice),
Size = NULLIF(@Size,''),
SizeRange = NULLIF(@SizeRange,''),
Weight = IF(@Weight='' OR @Weight='NA', NULL, @Weight),
DaysToManufacture = IF(@DaysToManufacture='', NULL, @DaysToManufacture),
ProductLine = NULLIF(@ProductLine,''),
DealerPrice = IF(@DealerPrice='' OR @DealerPrice='NA', NULL, @DealerPrice),
Class = NULLIF(@Class,''),
Style = NULLIF(@Style,''),
ModelName = NULLIF(@ModelName,''),
EnglishDescription = NULLIF(@EnglishDescription,''),
FrenchDescription = NULLIF(@FrenchDescription,''),
ChineseDescription = NULLIF(@ChineseDescription,''),
ArabicDescription = NULLIF(@ArabicDescription,''),
HebrewDescription = NULLIF(@HebrewDescription,''),
ThaiDescription = NULLIF(@ThaiDescription,''),
GermanDescription = NULLIF(@GermanDescription,''),
JapaneseDescription = NULLIF(@JapaneseDescription,''),
TurkishDescription = NULLIF(@TurkishDescription,''),
StartDate = IF(@StartDate='', NULL, STR_TO_DATE(@StartDate,'%Y-%m-%d')),
EndDate = IF(@EndDate='', NULL, STR_TO_DATE(@EndDate,'%Y-%m-%d')),
Status = NULLIF(@Status,'');

SELECT COUNT(*) FROM product;

SELECT * FROM product;

#Lookup the productname from the Product sheet to Sales sheet.
SELECT 
    sales_new.ProductKey,
    product.EnglishProductName,
    sales_new.SalesAmount
FROM sales_new
LEFT JOIN product
ON sales_new.ProductKey = product.ProductKey;


CREATE TABLE Customer (
    CustomerKey INT PRIMARY KEY,
    GeographyKey INT,
    CustomerAlternateKey VARCHAR(50),

    Firstname VARCHAR(50),
    Middlename VARCHAR(50),
    Lastname VARCHAR(50),

    NameStyle TINYINT(1),

    BirthDate DATE,
    MaritalStatus CHAR(1),
    Gender CHAR(1),

    EmailAddress VARCHAR(100),

    YearlyIncome INT,
    TotalChildren INT,
    NumberChildrenAtHome INT,

    EnglishEducation VARCHAR(50),
    SpanishEducation VARCHAR(50),
    FrenchEducation VARCHAR(50),

    EnglishOccupation VARCHAR(50),
    SpanishOccupation VARCHAR(50),
    FrenchOccupation VARCHAR(50),

    HouseOwnerFlag TINYINT(1),
    NumberCarsOwned INT,

    AddressLine1 VARCHAR(100),

    Phone VARCHAR(25),

    DateFirstPurchase DATE,

    CommuteDistance VARCHAR(20)
);

DESCRIBE Customer;

SET GLOBAL local_infile = 1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer.csv'
INTO TABLE Customer
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
CustomerKey,
GeographyKey,
CustomerAlternateKey,
Firstname,
Middlename,
Lastname,
NameStyle,
@BirthDate,
MaritalStatus,
Gender,
EmailAddress,
YearlyIncome,
TotalChildren,
NumberChildrenAtHome,
EnglishEducation,
SpanishEducation,
FrenchEducation,
EnglishOccupation,
SpanishOccupation,
FrenchOccupation,
HouseOwnerFlag,
NumberCarsOwned,
AddressLine1,
Phone,
@DateFirstPurchase,
CommuteDistance
)
SET
BirthDate = STR_TO_DATE(@BirthDate, '%Y-%m-%d'),
DateFirstPurchase = STR_TO_DATE(@DateFirstPurchase, '%Y-%m-%d');

SELECT COUNT(*) FROM Customer;

SELECT * FROM Customer;



#Lookup the Customerfullname from the Customer and Unit Price from Product sheet to Sales sheet.
SELECT 
    sales_new.*,

    CONCAT(
        customer.Firstname,
        ' ',
        IFNULL(customer.Middlename, ''),
        ' ',
        customer.Lastname
    ) AS CustomerFullName,

    product.UnitPrice

FROM sales_new

LEFT JOIN customer
    ON sales_new.CustomerKey = customer.CustomerKey

LEFT JOIN product
    ON sales_new.ProductKey = product.ProductKey;


# calcuate the following fields from the Orderdatekey field ( First Create a Date Field from Orderdatekey)
   #Year
   #Monthno
   #Monthfullname
   #Quarter(Q1,Q2,Q3,Q4)
   #YearMonth ( YYYY-MMM)
   #Weekdayno
   #Weekdayname
   #FinancialMOnth
   #Financial Quarter 

SELECT 

    OrderDate,

    -- A. Year
    YEAR(OrderDate) AS Year,

    -- B. Month Number
    MONTH(OrderDate) AS MonthNo,

    -- C. Month Full Name
    MONTHNAME(OrderDate) AS MonthFullName,

    -- D. Quarter
    CONCAT('Q', QUARTER(OrderDate)) AS Quarter,

    -- E. YearMonth (YYYY-MMM)
    DATE_FORMAT(OrderDate, '%Y-%b') AS YearMonth,

    -- F. Weekday Number
    DAYOFWEEK(OrderDate) AS WeekdayNo,

    -- G. Weekday Name
    DAYNAME(OrderDate) AS WeekdayName,

    -- H. Financial Month (April = 1)
    CASE 
        WHEN MONTH(OrderDate) >= 4 THEN MONTH(OrderDate) - 3
        ELSE MONTH(OrderDate) + 9
    END AS FinancialMonth,

    -- I. Financial Quarter
    CASE 
        WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 'Q1'
        WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 'Q2'
        WHEN MONTH(OrderDate) BETWEEN 10 AND 12 THEN 'Q3'
        ELSE 'Q4'
    END AS FinancialQuarter

FROM sales_new;



#Calculate the Sales amount uning the columns(unit price,order quantity,unit discount)

DESCRIBE sales_new;

SELECT 
    UnitPrice,
    OrderQuantity,
    UnitPriceDiscount,
    SalesAmount,

    UnitPrice * OrderQuantity * (1 - UnitPriceDiscount) AS CalculatedSalesAmount

FROM sales_new;

#Calculate the Productioncost uning the columns(unit cost ,order quantity)

SELECT 
    ProductStandardCost,
    OrderQuantity,

    ProductStandardCost * OrderQuantity AS ProductionCost

FROM sales_new;

#Calculate the profit 

SELECT 
    SalesAmount - (ProductStandardCost * OrderQuantity) AS Profit
FROM sales_new;


#Create a Pivot table for month and sales (provide the Year as filter to select a particular Year)

SELECT 
    MONTHNAME(OrderDate) AS MonthName,
    SUM(SalesAmount) AS TotalSales

FROM sales_new
WHERE YEAR(OrderDate) = 2013

GROUP BY 
    MONTH(OrderDate),
    MONTHNAME(OrderDate)
ORDER BY 
    MONTH(OrderDate);

#Create a Bar chart to show yearwise Sales

SELECT 
    YEAR(OrderDate) AS Year,
    SUM(SalesAmount) AS TotalSales
FROM sales_new
GROUP BY YEAR(OrderDate)
ORDER BY Year;

#Create a Line Chart to show Monthwise sales

SELECT 
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS MonthNo,
    MONTHNAME(OrderDate) AS MonthName,
    SUM(SalesAmount) AS TotalSales
FROM sales_new
GROUP BY 
    YEAR(OrderDate),
    MONTH(OrderDate),
    MONTHNAME(OrderDate)
ORDER BY 
    YEAR,
    MONTH(OrderDate);


#Create a Pie chart to show Quarterwise sales

SELECT 
    CONCAT('Q', QUARTER(OrderDate)) AS Quarter,
    SUM(SalesAmount) AS TotalSales

FROM sales_new

WHERE YEAR(OrderDate) = 2014

GROUP BY CONCAT('Q', QUARTER(OrderDate))

ORDER BY CONCAT('Q', QUARTER(OrderDate));

#Create a combinational chart (bar and Line) to show Salesamount and Productioncost together
SELECT 
    YEAR(OrderDate) AS Year,

    SUM(SalesAmount) AS TotalSales,

    SUM(ProductStandardCost * OrderQuantity) AS TotalProductionCost

FROM sales_new

GROUP BY YEAR(OrderDate)
ORDER BY Year;

#Build addtional KPI /Charts for Performance by Products, Customers, Region
#TOTAL SALES
SELECT SUM(SalesAmount) AS Total_Sales
FROM sales_new;


#Total Profit
SELECT SUM(SalesAmount - TotalProductCost) AS Total_Profit
FROM sales_new;


#Order Quantity
SELECT SUM(OrderQuantity) AS Total_Order_Quantity
FROM sales_new;


#Profit Margin
SELECT 
  SUM(SalesAmount - TotalProductCost) / SUM(SalesAmount) AS Profit_Margin
FROM sales_new;


#Top Product by Profit
SELECT 
    product.EnglishProductName,
    SUM(sales_new.SalesAmount - sales_new.TotalProductCost) AS Total_Profit
FROM sales_new
JOIN product
ON sales_new.ProductKey = product.ProductKey
GROUP BY product.EnglishProductName
ORDER BY Total_Profit DESC
LIMIT 10;

#Top Customer by Performance
SELECT 
    CONCAT(customer.FirstName, ' ', customer.LastName) AS CustomerFullName,
    SUM(sales_new.SalesAmount) AS Total_Sales
FROM sales_new
JOIN customer
ON sales_new.CustomerKey = customer.CustomerKey
GROUP BY customer.FirstName, customer.LastName
ORDER BY Total_Sales DESC
LIMIT 10;


#Performance by Region
CREATE TABLE dimsalesterritory (
    SalesTerritoryKey INT,
    SalesTerritoryAlternateKey INT,
    SalesTerritoryRegion VARCHAR(50),
    SalesTerritoryCountry VARCHAR(50),
    SalesTerritoryGroup VARCHAR(50)
);

SELECT 
    dimsalesterritory.SalesTerritoryRegion AS Region,
    SUM(sales_new.SalesAmount) AS Total_Sales,
    SUM(sales_new.SalesAmount - sales_new.TotalProductCost) AS Total_Profit
FROM sales_new
JOIN dimsalesterritory
ON sales_new.SalesTerritoryKey = dimsalesterritory.SalesTerritoryKey
GROUP BY dimsalesterritory.SalesTerritoryRegion
ORDER BY Total_Sales DESC;

