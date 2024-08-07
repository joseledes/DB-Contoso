
CREATE TABLE dimcalendar (
    DateKey DATETIME PRIMARY KEY,
    CalendarYear INT,
    CalendarHalfYearLabel VARCHAR(20),
    CalendarQuarterLabel VARCHAR(20),
    CalendarMonth INT,
    CalendarMonthLabel VARCHAR(20),
    CalendarWeekLabel VARCHAR(20),
    CalendarDayOfWeekLabel VARCHAR(10),
    IsWorkDay VARCHAR(20)
);

CREATE TABLE dimchannel (
    ChannelKey INT PRIMARY KEY,
    ChannelName VARCHAR(20)
);

CREATE TABLE dimgeography (
    GeographyKey DOUBLE PRIMARY KEY,
    ContinentName VARCHAR(255),
    RegionCountryName VARCHAR(255)
);

CREATE TABLE dimproduct (
    ProductKey INT PRIMARY KEY,
    ProductName MEDIUMTEXT,
    ProductDescription MEDIUMTEXT,
    ProductSubcategoryKey INT,
    Manufacturer VARCHAR(50),
    BrandName VARCHAR(50),
    ClassID VARCHAR(10),
    ClassName VARCHAR(20),
    ColorID VARCHAR(10),
    ColorName VARCHAR(20),
    Size VARCHAR(50),
    Weight DOUBLE,
    UnitCost DOUBLE,
    UnitPrice DOUBLE
);

CREATE TABLE dimproductcategory (
    ProductCategoryKey INT PRIMARY KEY,
    ProductCategory VARCHAR(255)
);

CREATE TABLE dimproductsubcategory (
    ProductSubcategoryKey INT PRIMARY KEY,
    ProductSubcategoryName VARCHAR(50),
    ProductCategoryKey INT,
    FOREIGN KEY (ProductCategoryKey) REFERENCES dimproductcategory(ProductCategoryKey)
);

CREATE TABLE dimpromotion (
    PromotionKey INT PRIMARY KEY,
    PromotionLabel VARCHAR(100),
    PromotionName VARCHAR(100),
    DiscountPercent DOUBLE,
    StartDate DATETIME,
    EndDate DATETIME
);

CREATE TABLE dimstores (
    StoreKey INT PRIMARY KEY,
    GeographyKey DOUBLE,
    StoreType VARCHAR(255),
    StoreName VARCHAR(255),
    EmployeeCount DOUBLE,
    SellingAreaSize DOUBLE,
    FOREIGN KEY (GeographyKey) REFERENCES dimgeography(GeographyKey)
);

CREATE TABLE factsales (
    OrderID INT PRIMARY KEY,
    DateKey DATETIME,
    ChannelKey INT,
    StoreKey INT,
    ProductKey INT,
    PromotionKey INT,
    SalesQuantity INT,
    ReturnQuantity INT,
    FOREIGN KEY (DateKey) REFERENCES dimcalendar(DateKey),
    FOREIGN KEY (ChannelKey) REFERENCES dimchannel(ChannelKey),
    FOREIGN KEY (StoreKey) REFERENCES dimstores(StoreKey),
    FOREIGN KEY (ProductKey) REFERENCES dimproduct(ProductKey),
    FOREIGN KEY (PromotionKey) REFERENCES dimpromotion(PromotionKey)
);
