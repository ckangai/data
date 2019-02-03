CREATE DATABASE IF NOT EXISTS db_sales;

USE db_sales;

DROP TABLE IF NOT EXISTS OrderDetails;

CREATE TABLE IF NOT EXISTS OrderDetails 
(
	OrderID INT NOT NULL PRIMARY KEY
	,ProductID INT
	,Quantity INT
	,UnitPrice FLOAT
	,Discount FLOAT
	,NetAmount FLOAT
	,CategoryID INT
	,ProductName VARCHAR(40)
	,CategoryName VARCHAR(20)

)
;
