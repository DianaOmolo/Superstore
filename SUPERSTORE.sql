SELECT * FROM projects.superstore;

-- MOST POPULAR SHIPPING MODE
SELECT ShipMode, 
 count(ShipMode) AS Shippingmodefrequency
  FROM projects.superstore
   GROUP BY ShipMode
    ORDER BY count(ShipMode) DESC;

-- NUMBER OF ORDERS SENT TO EACH STATE
SELECT State, 
 count(State) AS statecount
  FROM projects.superstore
   GROUP BY State
    ORDER BY count(State) DESC;

-- TYPES OF PRODUCT CATEGORIES
SELECT DISTINCT Category
 FROM projects.superstore;

-- ORDERS AND CUSTOMERS FROM NEW YORK OR WASHINGTON
SELECT OrderID,
CustomerID,
State
 FROM projects.superstore
  WHERE State in ('New York', 'Washington'); 

-- WHAT ORDER GAVE THE HIGHEST PROFIT
SELECT OrderID,
CustomerName,
CustomerID,
State,
ProductID,
Category,
Profit
 FROM projects.superstore
  ORDER BY Profit DESC
   LIMIT 1;

-- WHAT ORDER GAVE THE HIGHEST LOSS
SELECT OrderID,
CustomerName,
CustomerID,
State,
ProductID,
Category,
Profit
 FROM projects.superstore
  ORDER BY Profit
   LIMIT 1;

-- HIGHEST SALE MADE
SELECT OrderID,
CustomerName,
CustomerID,
State,
ProductID,
Category,
Sales
 FROM projects.superstore
  ORDER BY Sales DESC
   LIMIT 1;

-- NUMBER OF PRODUCTS BOUGHT BY EACH CUSTOMER
SELECT CustomerID,
sum(Quantity) AS TotalProducts
 FROM projects.superstore
  GROUP BY CustomerID
   ORDER BY sum(Quantity) DESC;

-- TOTAL NUMBER OF PRODUCTS SOLD 
SELECT
sum(Quantity) AS TotalProducts
 FROM projects.superstore
  ORDER BY sum(Quantity);

-- TOTAL NUMBER OF ORDERS MADE
SELECT
count(OrderID) AS TotalOrders
 FROM projects.superstore
  ORDER BY count(OrderID);

-- TOTAL NUMBER OF CUSTOMERS WHO MADE ORDERS
SELECT count(DISTINCT CustomerName) AS TotalCustomers
 FROM projects.superstore;

-- COMBINING CITY AND STATE NAMES
SELECT OrderID,
OrderDate,
ShipDate,
CustomerID,
CustomerName,
concat(City,', ', State) AS Location,
ProductID,
Sales,
Quantity,
Profit
 FROM projects.superstore
  ORDER BY Sales DESC;

-- TRIGGER
delimiter //
CREATE TRIGGER profitverify
 BEFORE INSERT ON projects.superstore
  FOR EACH ROW
   IF NEW.Profit < 0 THEN SET NEW.Profit = 0;
    END IF ; //

-- STORED PROCEDURE
delimiter //
CREATE PROCEDURE highest_sale()
BEGIN
SELECT OrderID,
CustomerName,
CustomerID,
State,
ProductID,
Category,
Sales
 FROM projects.superstore
  ORDER BY Sales DESC
   LIMIT 1;
    END ; //

CALL highest_sale();













