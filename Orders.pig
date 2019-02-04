r1 = load '/OrderDetails' USING PigStorage(',') as (OrderID:INT,ProductID:INT,Quantity:INT,UnitPrice:FLOAT, Discount:FLOAT,NetAmount:FLOAT,CategoryID:INT,ProductName:CHARARRAY,CategoryName:CHARARRAY);
r2 = GROUP r1 BY OrderID;
r3 = FOREACH r2 GENERATE group, SUM(NetAmount) AS OrderAmount;
DUMP r3;
