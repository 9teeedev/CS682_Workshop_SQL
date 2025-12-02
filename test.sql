/* CREATE PROCEDURE sp_OrderDetails
AS
BEGIN
    SELECT OrderID, OD.ProductID, ProductName, CategoryName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalPrice,
    (OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS PriceAfterDiscount
    FROM [Order Details] OD INNER JOIN Products P ON OD.ProductID = P.ProductID
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
END; */

/* ALTER PROCEDURE sp_OrderDetails
    @OrderID INT
AS
BEGIN
    SELECT OrderID, OD.ProductID, ProductName, CategoryName, OD.UnitPrice, OD.Quantity, (OD.UnitPrice * OD.Quantity) AS TotalPrice,
    (OD.UnitPrice * OD.Quantity * (1 - OD.Discount)) AS PriceAfterDiscount
    FROM [Order Details] OD INNER JOIN Products P ON OD.ProductID = P.ProductID
    INNER JOIN Categories C ON P.CategoryID = C.CategoryID
    WHERE OrderID = @OrderID;
END; */

EXEC sp_OrderDetails 10248;