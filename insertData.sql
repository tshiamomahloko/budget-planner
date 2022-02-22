USE BudgetDatabase;
GO

INSERT INTO dbo.Customer(
		Name,
		Email,
		Password
	) VALUES
		('Rudolph Esterhuysen', 'rudolphe@bbdsoftware.com', '0b14d501a594442a01c6859541bcb3e8164d183d32937b851835442f69d5c94e'),
		('Lucky Nkosi', 'lucky@bbd.co.za', '6cf615d5bcaac778352a8f1f3360d23f02f34ec182e259897fd6ce485d7870d4');


INSERT INTO dbo.Budget(
		CustomerID,
		StartDate,
		EndDate
	)
	VALUES
		(1, '2021-12-01', '2021-12-31'),
		(1, '2022-01-01', '2022-01-31'),
		(1, '2022-02-01', '2022-02-28'),
		(2, '2022-01-01', '2022-01-31');
		

INSERT INTO ExpenseType(
		ExpenseTypeName,
		ExpenseDescription
	) VALUES
		('Entertainment', 'Personal enjoyment'),
		('Food and Groceries', 'Food/Drinks'),
		('Housing Costs', 'What it costs to live in ones home'),
		('Savings', 'An amount that goes off of your income to put away for a targetted expense such as a rainy day/buying a car/buying a house'),
		('Medical Aid', 'Mainly for medical emergencies, and sometimes added benefits are included'),
		('Pet Insurance', 'Incase of an emergency medical procedure for a pet, sometimes with added benefits');


INSERT INTO Expense(
		ExpenseTypeID,
		CustomerID,
		ExpenseName
	) VALUES
		('1', '1', 'Cigarettes'),
		('2', '1', 'Pet Food'),
		('6', '1', 'Medi-pet'),
		('1', '2', 'Horse Riding'),
		('2', '2', 'Beer'),
		('3', '2', 'Rent');


INSERT INTO ExpenseBudget(
		BudgetID,
		ExpenseID,
		ExpenseAmount
	) VALUES 
		('1', '1', '750'),
		('1', '2', '550'),
		('1', '3', '100'),
		('2', '1', '725'),
		('2', '2', '300'),
		('2', '3', '100'),
		('3', '1', '920'),
		('3', '2', '350'),
		('3', '3', '100'),
		('4', '4', '400'),
		('4', '5', '5000'),
		('4', '6', '8500');
		
		
INSERT INTO [dbo].[IncomeType]
           ([IncomeTypeName]
           ,[IncomeTypeDescription])
     VALUES
           ('Salary', 'Money earnt from a job.'),
	   ('Commission', 'Money earnt from completing a task'),
	   ('Investments', 'Money earnt from capital growth from property, shares and/or art');


INSERT INTO [dbo].[Income]
           ([IncomeName]
           ,[IncomeTypeID]
           ,[CustomerID])
     VALUES
           ('BBD Salary', 1, 1),
	   ('Main property', 3, 1),
	   ('Sales', 2, 1),
	   ('Salary', 1, 2);


INSERT INTO [dbo].[IncomeBudget]
           ([BudgetID]
           ,[IncomeID]
           ,[IncomeAmount])
     VALUES
           (1, 1, 420.01),
	   (2, 2, 9001.04),
	   (3, 3, 3001.04),
	   (4, 4, 5001.04);
