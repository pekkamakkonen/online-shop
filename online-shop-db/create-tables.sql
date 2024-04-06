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
	
