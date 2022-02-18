CREATE TABLE
    Expenses (
        ExpenseID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
        ExpenseTypeID INT NOT NULL,
        CustomerID INT NOT NULL,
        ExpenseName VARCHAR(200) NOT NULL,
        CONSTRAINT ExpensesFK FOREIGN KEY(ExpenseTypeID) REFERENCES ExpenseTypes(ExpenseTypeID),
        CONSTRAINT ExpensesFK2 FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
    );

GO