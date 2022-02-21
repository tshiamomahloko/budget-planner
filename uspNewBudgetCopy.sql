USE BudgetDatabase;
GO

IF OBJECT_ID ( 'uspNewBudgetCopy', 'P' ) IS NOT NULL
    DROP PROCEDURE uspNewBudgetCopy;
GO

CREATE PROCEDURE uspNewBudgetCopy
	@budgetId varchar(20),
	@startDate date,
	@endDate date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(2048)
	DECLARE @newBudgetId nvarchar(20)
	
	-- Create new Budget
	SET @sql = FORMATMESSAGE('INSERT INTO [Budget] (CustomerID, StartDate, EndDate) VALUES ((SELECT TOP 1 [CustomerID] FROM [Budget] WHERE [BudgetID] = %s), ''%s'', ''%s''); SELECT @budgetId = SCOPE_IDENTITY();', @budgetId, CONVERT(varchar(12), @startDate, 1), CONVERT(varchar(12), @endDate, 1));
	EXEC sp_executesql @sql, N'@budgetId int out', @newBudgetId out;

	-- Add expenses
	SET @sql = FORMATMESSAGE('INSERT INTO [ExpenseBudget] SELECT %s AS [BudgetID], [ExpenseID], [ExpenseAmount] FROM [ExpenseBudget] WHERE BudgetID = %s', @newBudgetId, @budgetId);
	EXEC sp_executesql @sql;

	-- Add incomes
	SET @sql = FORMATMESSAGE('INSERT INTO [IncomeBudget] SELECT %s AS [BudgetID], [IncomeID], [IncomeAmount] FROM [IncomeBudget] WHERE BudgetID = %s', @newBudgetId, @budgetId);
	EXEC sp_executesql @sql;
END
	GO