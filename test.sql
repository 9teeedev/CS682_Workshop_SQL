SELECT OrderID, OD.ProductID, ProductName, CategoryName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalPrice,
(OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS PriceAfterDiscount
FROM [Order Details] OD INNER JOIN Products P ON OD.ProductID = P.ProductID
INNER JOIN Categories C ON P.CategoryID = C.CategoryID
WHERE OrderID = @OrderID;