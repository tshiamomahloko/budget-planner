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