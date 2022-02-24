USE BudgetDatabase;
GO

IF OBJECT_ID ('Daily_Budget', 'FN') IS NOT NULL  
    DROP FUNCTION Daily_Budget;  
GO  

CREATE FUNCTION Daily_Budget
	(@budgetId int)
RETURNS DECIMAL(9, 2)
AS
BEGIN
	DECLARE @res DECIMAL(9, 2)

	SET @res = (SELECT ((Sum(IncomeAmount) - Sum(ExpenseAmount)) / (DATEDIFF(day, StartDate, EndDate) + 1)) AS [Daily Budget] FROM (
		SELECT Budget.BudgetID, Budget.StartDate, Budget.EndDate, Budget.CustomerID, IncomeBudget.IncomeAmount, 0 AS ExpenseAmount 
		FROM Budget INNER JOIN IncomeBudget 
		ON Budget.BudgetID = IncomeBudget.BudgetID 
		WHERE Budget.BudgetID = @budgetId
		
		UNION
		
		SELECT Budget.BudgetID, Budget.StartDate, Budget.EndDate, Budget.CustomerID, 0 AS IncomeAmount, ExpenseBudget.ExpenseAmount 
		FROM Budget INNER JOIN ExpenseBudget 
		ON Budget.BudgetID = ExpenseBudget.BudgetID 
		WHERE Budget.BudgetID = @budgetId) AS q
		
	GROUP BY BudgetID, StartDate, EndDate)

	IF (@res IS NULL) 
	BEGIN
		SET @res = 0
	END

	RETURN @res;
END