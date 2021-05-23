USE AdventureWorks2019
GO
--1. Przygotuj blok anonimowy, który:
--znajdzie średnią stawkę wynagrodzenia pracowników
BEGIN
SELECT AVG(Rate) as AverageRate
FROM HumanResources.EmployeePayHistory;

--wyświetli szczegóły pracowników, których stawka wynagrodzenia jest niższa niż średnia
SELECT  FirstName, MiddleName, LastName, Rate
FROM HumanResources.EmployeePayHistory
INNER JOIN Person.Person 
ON HumanResources.EmployeePayHistory.BusinessEntityID=Person.Person.BusinessEntityID
WHERE Rate < (select avg(Rate) from HumanResources.EmployeePayHistory)
order by Rate;
END;

--2.Utwórz funkcję, która zwróci datę wysyłki określonego zamówienia.
CREATE OR ALTER FUNCTION ShowShipDate (@orderID int)
RETURNS @tab TABLE (ShowShipDate DATETIME)
AS
BEGIN
INSERT INTO @tab
SELECT ShipDate FROM Sales.SalesOrderHeader
WHERE SalesOrderID=@orderID;
RETURN
END;

SELECT *  FROM Sales.SalesOrderHeader
SELECT * FROM ShowShipDate(43659)

--3. Utwórz procedurę składowaną, która jako parametr przyjmuję nazwę produktu, a jako 
--rezultat wyświetla jego identyfikator, numer i dostępność

CREATE OR ALTER PROCEDURE DisplayEx3 (@name varchar(35))
AS
BEGIN
SELECT Product.ProductID, Product.ProductNumber, Quantity
FROM Production.Product
INNER JOIN Production.ProductInventory 
ON Production.Product.ProductID=Production.ProductInventory.ProductID
WHERE Name=@name
END;

EXEC DisplayEx3 'Adjustable Race';


--4. Utwórz funkcję, która zwraca numer karty kredytowej dla konkretnego zamówienia

CREATE or ALTER FUNCTION WhichCardNumber (@OrderNr NVARCHAR(25))
RETURNS @tab TABLE (CardNr NVARCHAR(25))
AS
BEGIN
INSERT INTO @tab
SELECT Sales.CreditCard.CardNumber
FROM Sales.CreditCard
INNER JOIN Sales.SalesOrderHeader
ON CreditCard.CreditCardID = SalesOrderHeader.CreditCardID
WHERE SalesOrderNumber=@OrderNr;
RETURN
END;

SELECT * FROM WhichCardNumber ('SO43659');

--5. Utwórz procedurę składowaną, która jako parametry wejściowe przyjmuje dwie liczby, num1
--i num2, a zwraca wynik ich dzielenia. 
--Ponadto wartość num1 powinna zawsze być większa niż wartość num2. 
--Jeżeli wartość num1 jest mniejsza niż num2, wygeneruj komunikat o błędzie 
--„Niewłaściwie zdefiniowałeś dane wejściowe”

CREATE OR ALTER PROCEDURE Division (@num1 FLOAT, @num2 FLOAT)
AS
BEGIN
DECLARE @result FLOAT
	IF(@num1 < @num2)
	SELECT 'Niewłaściwie zdefiniowałeś dane wejściowe.' as Komunikat
	ELSE 
	SET @result = @num1/@num2
	SELECT ROUND(@result,5)
	RETURN 
END;

EXEC Division 3, 20;



-- 6. Napisz procedurę, która jako parametr przyjmie NationalIDNumber danej osoby, a zwróci 
-- stanowisko oraz liczbę dni urlopowych i chorobowych.

CREATE OR ALTER PROCEDURE DisplayEx6 (@NationalID int)
AS
BEGIN
SELECT JobTitle, (VacationHours/8) AS VacationDays, (SickLeaveHours/8) AS SickLeaveDays
FROM HumanResources.Employee
WHERE NationalIDNumber=@NationalID;
END;

EXEC DisplayEx6 295847284;


--7. Napisz procedurę będącą kalkulatorem walutowym. Wykorzystaj dwie tabele: Sales.Currency 
--oraz Sales.CurrencyRate. Parametrami wejściowymi mają być: kwota, waluty oraz data 
--(CurrencyRateDate). Przyjmij, iż zawsze jedną ze stron jest dolar amerykański (USD).
--Zaimplementuj kalkulację obustronną, tj:
--1400 USD → PLN lub PLN → US
CREATE OR ALTER PROCEDURE Calculator (@From CHAR(3),@To CHAR(3),@Value FLOAT,@Date DATETIME)
AS
BEGIN

if @From='USD'
SELECT (@Value*AverageRate) as EndValue
FROM Sales.Currency INNER JOIN Sales.CurrencyRate
ON Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode
WHERE CurrencyRateDate=@Date AND Currency.CurrencyCode=@To;

else if @To='USD'
SELECT (@Value*AverageRate) as EndValue
FROM Sales.Currency INNER JOIN Sales.CurrencyRate
ON Sales.Currency.CurrencyCode = Sales.CurrencyRate.ToCurrencyCode
WHERE CurrencyRateDate=@Date AND Currency.CurrencyCode=@From;
END;
 

EXEC Calculator USD, EUR, 1400, '2014-05-31 00:00:00.000';


SELECT * FROM HumanResources.EmployeePayHistory;
SELECT * FROM Sales.CurrencyRate;
SELECT * FROM Sales.Currency;
SELECT * FROM Production.Product;
