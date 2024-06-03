USE OnlineShop;

CREATE TABLE Customer (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(200) UNIQUE NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    StreetAddress VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(15) NOT NULL,
    City VARCHAR(30) NOT NULL,
    Country CHAR(2) NOT NULL DEFAULT 'FI', -- Hardcoded value, not need ask info in frontend
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Product (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(100) NOT NULL,
	Description VARCHAR(1000),
	ImageUrl VARCHAR(255),
	UnitPrice DECIMAL(6,2) NOT NULL CHECK (UnitPrice >= 0),
	UnitsInStock SMALLINT NOT NULL CHECK (UnitsInStock >= 0),
	VatPercentage TINYINT NOT NULL CHECK (VatPercentage BETWEEN 0 AND 100)
);

CREATE TABLE Order (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
--	OrderLineCount SMALLINT NOT NULL CHECK (OrderLineCount >= 1),
	TotalSum DECIMAL(7,2) NOT NULL CHECK (TotalSum >= 0),  
--	CustomerFirstName VARCHAR(50) NOT NULL,
--  CustomerLastName VARCHAR(50) NOT NULL,
--  CustomerEmail VARCHAR(200) NOT NULL,
--  CustomerPhone VARCHAR(20) NOT NULL,
	CustomerId VARCHAR(255),
	DeliveryStreetAddress VARCHAR(50),
    DeliveryPostalCode VARCHAR(15),
    DeliveryCity VARCHAR(30),
    DeliveryCountry CHAR(2) DEFAULT 'FI', -- Hardcoded value, not need ask info in frontend
	InvoicingStreetAddress VARCHAR(50),
    InvoicingPostalCode VARCHAR(15),
    InvoicingCity VARCHAR(30),
    InvoicingCountry CHAR(2) DEFAULT 'FI', -- Hardcoded value, not need ask info in frontend
	IsProcessed BIT,
	IsShipped BIT
);

CREATE TABLE OrderLine (
	Id INT IDENTITY(1,1) PRIMARY KEY,
	OrderId INT NOT NULL,
	ProductId INT NOT NULL,
	UnitPrice DECIMAL(6,2) NOT NULL CHECK (UnitPrice >= 0),
	Units TINYINT NOT NULL CHECKS(Units >= 1),
	VatPercentage TINYINT NOT NULL CHECK (VatPercentage BETWEEN 0 AND 100),
	FOREIGN KEY (OrderId) REFERENCES [Order] (Id),
	FOREIGN KEY (ProductId) REFERENCES Product (Id)
);
	
	
	
	
