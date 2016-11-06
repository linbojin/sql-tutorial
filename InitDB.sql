/* PostgreSQL commands to seed tables */

CREATE TABLE Customers(
  CustomerID INT PRIMARY KEY NOT NULL,
  CustomerName varchar,
  ContactName varchar,
  Address varchar,
  City varchar,
  PostalCode varchar,
  Country varchar
);

COPY Customers(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
FROM '/Users/tony/opensource/sql-tutorial/tables/Customers.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Categories(
  CategoryID INT PRIMARY KEY NOT NULL,
  CategoryName varchar,
  Description varchar
);

COPY Categories(CategoryID, CategoryName, Description)
FROM '/Users/tony/opensource/sql-tutorial/tables/Categories.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Employees(
  EmployeeID INT PRIMARY KEY NOT NULL,
  LastName varchar,
  FirstName varchar,
  BirthDate date,
  Photo varchar,
  Notes varchar
);

COPY Employees(EmployeeID, LastName, FirstName, BirthDate, Photo, Notes)
FROM '/Users/tony/opensource/sql-tutorial/tables/Employees.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE OrderDetails(
  OrderDetailID INT PRIMARY KEY NOT NULL,
  OrderID INT,
  ProductID INT,
  Quantity INT
);

COPY OrderDetails(OrderDetailID, OrderID, ProductID, Quantity)
FROM '/Users/tony/opensource/sql-tutorial/tables/OrderDetails.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Orders(
  OrderID INT PRIMARY KEY NOT NULL,
  CustomerID INT,
  EmployeeID INT,
  OrderDate date,
  ShipperID INT
);

COPY Orders(OrderID, CustomerID, EmployeeID, OrderDate, ShipperID)
FROM '/Users/tony/opensource/sql-tutorial/tables/Orders.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Products(
  ProductID INT PRIMARY KEY NOT NULL,
  ProductName varchar,
  SupplierID INT,
  CategoryID INT,
  Unit varchar,
  Price real
);

COPY Products(ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
FROM '/Users/tony/opensource/sql-tutorial/tables/Products.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Shippers(
  ShipperID INT PRIMARY KEY NOT NULL,
  ShipperName varchar,
  Phone varchar
);

COPY Shippers(ShipperID, ShipperName, Phone)
FROM '/Users/tony/opensource/sql-tutorial/tables/Shippers.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Suppliers(
  SupplierID INT PRIMARY KEY NOT NULL,
  SupplierName varchar,
  ContactName varchar,
  Address varchar,
  City varchar,
  PostalCode varchar,
  Country varchar,
  Phone varchar
);

COPY Suppliers(SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
FROM '/Users/tony/opensource/sql-tutorial/tables/Suppliers.csv' DELIMITER ';' CSV HEADER;

