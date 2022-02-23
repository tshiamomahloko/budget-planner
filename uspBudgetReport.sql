USE BudgetDatabase;
GO

IF OBJECT_ID ( 'uspBudgetReport', 'P') IS NOT NULL
    DROP PROCEDURE uspBudgetReport;
GO

CREATE PROCEDURE uspBudgetReport
    @BudgetID INT
AS
--Selecting from Budget to calculate the daily budget
SELECT BudgetID, dbo.Daily_Budget(BudgetID) AS DailyBudget
FROM Budget
WHERE BudgetID = @BudgetID;

--Table variable for storing income and expenses
DECLARE @statement TABLE (IncomeAmount DECIMAL(9, 2), ExpenseAmount DECIMAL(9, 2));

--Selecting from the IncomeBudget Table and the ExpenseBudget table joining where the budget ID is the given
INSERT INTO @statement SELECT IncomeBudget.IncomeAmount, 0 AS ExpenseAmount FROM Budget INNER JOIN IncomeBudget ON Budget.BudgetID = IncomeBudget.BudgetID WHERE Budget.BudgetID = @budgetId
UNION
SELECT 0 AS IncomeAmount, ExpenseBudget.ExpenseAmount FROM Budget INNER JOIN ExpenseBudget ON Budget.BudgetID = ExpenseBudget.BudgetID WHERE Budget.BudgetID = @budgetId

SELECT * FROM @statement

--Getting the sum of amounts from prev query and getting the total
SELECT SUM(IncomeAmount) - SUM(ExpenseAmount) AS Total FROM @statement;

GO

