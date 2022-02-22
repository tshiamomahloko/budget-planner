USE BudgetDatabase;
GO

IF OBJECT_ID ( 'uspBudgetReport', 'P') IS NOT NULL
    DROP PROCEDURE spBudgetReport;
GO

CREATE PROCEDURE uspBudgetReport
    @BudgetID INT,
AS
--Selecting from Budget to calculate the daily budget
SELECT BudgetID, Daily_Budget(BudgetID) AS DailyBudget
FROM Budget
WHERE BudgetID = @BudgetID;

--Selecting from the IncomeBudget Table and the ExpenseBudget table joining where the budget ID is the given to join with the income table

SELECT IncomeBudget.BudgetID, IncomeBudget.IncomeAmount, ExpenseBudget.ExpenseID, ExpenseBudget.ExpenseAmount
FROM IncomeBudget
INNER JOIN ExpenseBudget ON IncomeBudget.BudgetID = ExpenseBudget.BudgetID;

--Getting the sum of amounts from prev query and getting the total

SELECT SUM(IncomeBudget.IncomeAmount) - SUM(ExpenseBudget.ExpenseAmount)
FROM IncomeBudget, ExpenseBudget
WHERE IncomeBudget.BudgetID = ExpenseBudget.BudgetID;

GO

