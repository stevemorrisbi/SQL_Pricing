SELECT
 Cust.CustomerKey, FirstName, LastName, BusinessName, CustomerType, NoOfOrders, TotalAmount,
 CASE 
  WHEN CustomerType = 'P' THEN
   CASE WHEN NoOfOrders >= 3 THEN
     CASE WHEN TotalAmount >= 20000.00 THEN 20.00 ELSE 15.00 END
    WHEN NoOfOrders >= 2 THEN
     CASE WHEN TotalAmount >= 10000.00 THEN 18.00 ELSE 10.00 END
   ELSE 5.00 END
  WHEN CustomerType = 'B' THEN
   CASE WHEN NoOfOrders >= 3 THEN
     CASE WHEN TotalAmount >= 30000.00 THEN 25.00 ELSE 15.00 END
    WHEN NoOfOrders >= 2 THEN
     CASE WHEN TotalAmount >= 20000.00 THEN 15.00 ELSE 8.00 END
   ELSE 6.00 END
 END AS DiscountPercentage
FROM dbo.Customers AS Cust
INNER JOIN 
(
 SELECT
  CustomerKey,
  COUNT(OrderKey) AS NoOfOrders,
  SUM(OrderAmount) AS TotalAmount
 FROM dbo.Orders
 GROUP BY
  CustomerKey
) AS Ord
 ON Cust.CustomerKey = Ord.CustomerKey;