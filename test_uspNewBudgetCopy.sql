USE BudgetDatabase

GO

EXEC uspNewBudgetCopy @budgetId = 1,
	@startDate = '20000101',
	@endDate ='20001230'
