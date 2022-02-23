USE BudgetDatabase;
GO

IF OBJECT_ID ( 'uspBudgetReport', 'P') IS NOT NULL
    DROP PROCEDURE uspBudgetReport;
GO

CREATE PROCEDURE uspBudgetReport
    @BudgetID INT
AS
BEGIN
	--Table variable for storing income and expenses
	DECLARE @statement TABLE (IncomeAmount DECIMAL(9, 2), ExpenseAmount DECIMAL(9, 2));

	--Selecting from the IncomeBudget Table and the ExpenseBudget table joining where the budget ID is the given
	INSERT INTO @statement
		SELECT IncomeBudget.IncomeAmount, 0 AS ExpenseAmount 
		FROM Budget INNER JOIN IncomeBudget 
		ON Budget.BudgetID = IncomeBudget.BudgetID 
		WHERE Budget.BudgetID = @budgetId

		UNION

		SELECT 0 AS IncomeAmount, ExpenseBudget.ExpenseAmount 
		FROM Budget INNER JOIN ExpenseBudget 
		ON Budget.BudgetID = ExpenseBudget.BudgetID 
		WHERE Budget.BudgetID = @budgetId

	--Selecting from Budget to calculate the daily budget, and calculating total (net income) from @statement
	SELECT BudgetID, dbo.Daily_Budget(BudgetID) AS [Daily Budget], SUM(IncomeAmount) - SUM(ExpenseAmount) AS [Net Income]
	FROM Budget, @statement
	WHERE BudgetID = @BudgetID 
	GROUP BY BudgetID

	--Display the income and expenses
	SELECT * FROM @statement
END
GO