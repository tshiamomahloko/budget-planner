CREATE TABLE ExpensesBudget (
	[ExpenseBudgetID] int IDENTITY(1,1) NOT NULL, 
	[BudgetID] int NOT NULL,
	[ExpenseID] int NOT NULL,
	[ExpenseAmount] money,
	CONSTRAINT [PK_Expenses_Budget] PRIMARY KEY (ExpenseBudgetID),
	CONSTRAINT [FK_Expenses_Budget_BudgetID]
		FOREIGN KEY (BudgetID)
		REFERENCES [BudgetDatabase].[Budget](BudgetID)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT [FK_Expenses_Budget_ExpenseID]
		FOREIGN KEY (ExpenseID)
		REFERENCES [BudgetDatabase].[Expenses](ExpenseID)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)