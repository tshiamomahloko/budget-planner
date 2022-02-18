USE master

DROP DATABASE IF EXISTS BudgetDatabase;
GO

CREATE DATABASE BudgetDatabase;
GO

USE BudgetDatabase;
GO

/*
Create IncomeTypes table.
This table stores the different types of income the
user can choose from. It has columns for the record ID, the name for 
the income type and an optional description of the income type.
*/
CREATE TABLE IncomeTypes (
	[IncomeTypeID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeTypeName] [varchar](50) NOT NULL,
	[IncomeTypeDescription] [varchar](500) NULL,
	CONSTRAINT [PK_IncomeTypes] PRIMARY KEY CLUSTERED ([IncomeTypeID] ASC)
);
GO

/*
Create the Income table.
This table stores the income information of the customers. It has
columns for the record ID, the name of the income that the customer
will give it, a foreign key that links to the IncomeType table that
specifies what type of income it is, and a foreign key that links to
the customer table that specifies to which customer the Income record
belongs.
*/
CREATE TABLE Income (
	[IncomeID] [int] IDENTITY(1,1) NOT NULL,
	[IncomeName] [varchar](255) NOT NULL,
	[IncomeTypeID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL
);
GO

/*
Add constraint to Income table to set the Income_Type_ID
variable to 1 if not specified.
Do this for when a Income_Type record is deleted the
foreign key in the Income table stil points to a default
value and not just 'null'
*/
ALTER TABLE BudgetDatabase.Income
ADD CONSTRAINT [defaultIncomeType] DEFAULT 1 FOR [IncomeTypeID];
GO

/*
Foreign Key contraint on the Income_Type_ID field in
the Income table
*/
ALTER TABLE BudgetDatabase.Income
WITH CHECK ADD CONSTRAINT [FK_IncomeType] FOREIGN KEY([IncomeTypeID])
REFERENCES [BudgetDatabase].[IncomeType](IncomeTypeID)
ON UPDATE CASCADE
ON DELETE SET DEFAULT;
GO

/*
Foreign Key contraint on the Customer_ID field in
the Income table
*/
ALTER TABLE BudgetDatabase.Income
WITH CHECK ADD CONSTRAINT [FK_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [BudgetDatabase].[Customer](CustomerID)
ON UPDATE CASCADE
ON DELETE SET NULL;
GO