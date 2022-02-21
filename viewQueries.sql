/*
View that returns all the possible income types
a customer can choose from and their descriptions.
*/
CREATE OR VIEW [incomeTypeView] AS
SELECT IncomeTypeName AS Income, IncomeTypeDescription AS Explanation
FROM IncomeType;

-- execute query:
-- SELECT * FROM incomeTypeView;

/*
View that returns all the possible expense types
a customer can choose from and their descriptions.
*/
CREATE VIEW [expenseTypeView] AS
SELECT ExpenseTypeName AS Expense, ExpenseDescription AS Explanation
FROM ExpenseType;

-- execute query:
-- SELECT * FROM expenseTypeView;

/*
Possible other idea for a view:
View that returns all the customers in the database without
displaying their passwords.
This view can be used by an administrator to view the customers
in the database without risking them having access to the
customer's password. It is possible for an admin to delete
a customer record through the view.
*/

CREATE VIEW [customerView] AS
SELECT customerID AS ID, customerName AS Customer, customerEmail AS Email
FROM Customer;

-- execute query:
-- SELECT * FROM customerView;

/*
Can create a stored proc that will show a customer's
inserted income and expense values. I forgot it can't be
a view because you can't pass parameters to a view and
you need the customerID param in order to do the SELECT
query.

Income Example:

SELECT IncomeTypeName, IncomeName, IncomeAmount
FROM IncomeType
JOIN Income ON IncomeType.IncomeTypeID = Income.IncomeTypeID
JOIN IncomeBudget ON Income.IncomeID = IncomeBudget.IncomeID
WHERE Income.CustomerID = @customerID;

Expense Example:

SELECT ExpenseTypeName, ExpenseName, ExpenseAmount
FROM ExpenseType
JOIN Expense ON ExpenseType.ExpenseTypeID = Expense.ExpenseTypeID
JOIN ExpenseBudget ON Expense.ExpenseID = ExpenseBudget.ExpenseID
WHERE Expense.CustomerID = @customerID
*/

