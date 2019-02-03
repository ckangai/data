CREATE TABLE OrderDetails 
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
