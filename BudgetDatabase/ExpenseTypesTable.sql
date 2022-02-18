CREATE TABLE ExpenseTypes(
    ExpenseTypeID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    ExpenseTypeName VARCHAR(200) NOT NULL,
    ExpenseDescription VARCHAR(250) NOT NULL
);

GO