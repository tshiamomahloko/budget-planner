USE BudgetDatabase;
GO

IF OBJECT_ID ( 'uspNewBudgetCopy', 'P' ) IS NOT NULL
    DROP PROCEDURE uspNewBudgetCopy;
GO

CREATE PROCEDURE uspNewBudgetCopy
	@budgetId int,
	@startDate date,
	@endDate date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @newBudgetId int
	
	-- Create new Budget
	INSERT INTO [Budget] (CustomerID, StartDate, EndDate) VALUES ((SELECT TOP 1 [CustomerID] FROM [Budget] WHERE [BudgetID] = @budgetId), @startDate, @endDate); 
	
	-- Get ID of new Budget
	SET @newBudgetId = SCOPE_IDENTITY();

	-- Add expenses
	INSERT INTO [ExpenseBudget] SELECT @newBudgetId AS [BudgetID], [ExpenseID], [ExpenseAmount] FROM [ExpenseBudget] WHERE BudgetID = @budgetId

	-- Add incomes
	INSERT INTO [IncomeBudget] SELECT @newBudgetId AS [BudgetID], [IncomeID], [IncomeAmount] FROM [IncomeBudget] WHERE BudgetID = @budgetId

	PRINT FORMATMESSAGE('Successfully created new budget with id: %d', @newBudgetId);
END
GO