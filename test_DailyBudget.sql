USE BudgetDatabase;
GO

SELECT BudgetID, dbo.Daily_Budget([BudgetID]) AS [Daily Budget] FROM Budget