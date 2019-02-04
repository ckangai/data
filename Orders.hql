DROP TABLE IF EXISTS poem;
DROP TABLE IF EXISTS word_counts;
CREATE TABLE poem (line STRING);
LOAD DATA LOCAL INPATH 'poem' OVERWRITE INTO TABLE poem;
CREATE TABLE word_countsAS SELECT word, count(1) AS count FROM
(SELECT explode(split(line, '\\s')) AS word FROM poem) w
GROUP BY word
ORDER BY word;
SELECT * FROM word_counts;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS OrderAmounts;

CREATE TABLE OrderDetails 
(
        OrderID INT 
        ,ProductID INT
        ,Quantity INT
        ,UnitPrice FLOAT
        ,Discount FLOAT
        ,NetAmount FLOAT
        ,CategoryID INT
        ,ProductName STRING
        ,CategoryName STRING

) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

LOAD DATA INPATH '/OrderDetails' OVERWRITE INTO TABLE OrderDetails;
CREATE TABLE OrderAmounts AS SELECT OrderID, SUM(NetAmount) As OrderAmount 
FROM OrderDetails GROUP BY OrderID;
SELECT * FROM OrderAmounts;