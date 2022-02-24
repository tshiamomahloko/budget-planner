USE BudgetDatabase;
Go

/*
View that returns all the possible income types
a customer can choose from and their descriptions.
*/
CREATE VIEW [IncomeTypeView] AS
SELECT IncomeTypeName AS Income, IncomeTypeDescription AS Explanation
FROM IncomeType;
GO

-- execute query:
-- SELECT * FROM IncomeTypeView;

/*
View that returns all the possible expense types
a customer can choose from and their descriptions.
*/
CREATE VIEW [ExpenseTypeView] AS
SELECT ExpenseTypeName AS Expense, ExpenseDescription AS Explanation
FROM ExpenseType;
GO

-- execute query:
-- SELECT * FROM ExpenseTypeView;

/*
View that returns all the customers in the database without
displaying their passwords.
*/

CREATE VIEW [customerView] AS
SELECT customerID AS ID, Name AS "Customer Name", Email
FROM Customer;
GO

-- execute query:
-- SELECT * FROM CustomerView;
