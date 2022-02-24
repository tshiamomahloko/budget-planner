USE master;

GO 

/*
ALTER DATABASE BudgetDatabase
SET
    SINGLE_USER
WITH
    ROLLBACK IMMEDIATE;

GO 
*/

DROP DATABASE IF EXISTS BudgetDatabase;

CREATE DATABASE BudgetDatabase;

GO 

USE BudgetDatabase;

GO

/*
 Create Customer Table.
 */
 
CREATE TABLE
    Customer(
        [CustomerID] [int] NOT NULL IDENTITY(1, 1) PRIMARY KEY,
        [Name] [varchar] (50) NOT NULL,
        [Email] [varchar] (150) NOT NULL,
        [Password] [varchar] (65) NOT NULL
    );
    
ALTER TABLE 
    CUSTOMER
ADD UNIQUE (Email)

/* 
 Create Budget table.
 */
CREATE TABLE
    [Budget] (
        [BudgetID] INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
        [CustomerID] INT NOT NULL,
        [StartDate] DATE NOT NULL,
        [EndDate] DATE NOT NULL
    );

ALTER TABLE
    [Budget]
ADD
    CONSTRAINT [FK_Budget_Customer_Customer_ID] FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID);

/*
 Create IncomeTypes table.
 */
CREATE TABLE
    IncomeType (
        [IncomeTypeID] [int] IDENTITY(1, 1) NOT NULL,
        [IncomeTypeName] [varchar] (100) NOT NULL,
        [IncomeTypeDescription] [varchar] (250) NULL,
        CONSTRAINT [PK_IncomeTypes] PRIMARY KEY CLUSTERED ([IncomeTypeID] ASC)
    );

/*
 Create the Income table.
 */
CREATE TABLE
    Income (
        [IncomeID] [int] PRIMARY KEY IDENTITY(1, 1) NOT NULL,
        [IncomeName] [varchar] (255) NOT NULL,
        [IncomeTypeID] [int] NULL,
        [CustomerID] [int] NOT NULL
    );

/*
 Foreign Key contraint on the Income_Type_ID field in
 the Income table
 */
ALTER TABLE
    Income
WITH
    CHECK
ADD
    CONSTRAINT [FK_IncomeType] FOREIGN KEY([IncomeTypeID]) REFERENCES IncomeType (IncomeTypeID)
    ON
UPDATE
    CASCADE
    ON
DELETE
SET
    NULL;

/*
 Foreign Key contraint on the Customer_ID field in
 the Income table
 */
ALTER TABLE
    Income
WITH
    CHECK
ADD
    CONSTRAINT [FK_CustomerID] FOREIGN KEY([CustomerID]) REFERENCES Customer (CustomerID)
    ON
UPDATE
    CASCADE
CREATE TABLE
    IncomeBudget(
        [BudgetID] [int] NOT NULL,
        [IncomeID] [int] NOT NULL,
        [IncomeAmount] decimal(9,2) NOT NULL,
        CONSTRAINT [PK_Income_Budget] PRIMARY KEY (BudgetID, IncomeID),
        CONSTRAINT [FK_IncomeBudget_BudgetID] FOREIGN KEY (BudgetID) REFERENCES Budget (BudgetID)
        ON
        DELETE
            CASCADE
            ON
        UPDATE
            CASCADE,
            CONSTRAINT [FK_Expense_Budget_IncomeID] FOREIGN KEY (IncomeID) REFERENCES Income (IncomeID)
            ON
        DELETE
            CASCADE
            ON
        UPDATE
            CASCADE
    )
    
/*
 Create the ExpenseType table.
 */    
CREATE TABLE
    ExpenseType(
        ExpenseTypeID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
        ExpenseTypeName VARCHAR(100) NOT NULL,
        ExpenseDescription VARCHAR(250) NOT NULL
    );

/*
 Create the Expense table.
 */
CREATE TABLE
    Expense (
        ExpenseID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
        ExpenseTypeID INT NOT NULL,
        CustomerID INT NOT NULL,
        ExpenseName VARCHAR(255) NOT NULL,
        CONSTRAINT FK_Expense FOREIGN KEY(ExpenseTypeID) REFERENCES ExpenseType(ExpenseTypeID),
        CONSTRAINT FK2_Expense FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
    );

/*
 Create the ExpenseBudget table.
*/
CREATE TABLE
    ExpenseBudget (
        [BudgetID] INT NOT NULL,
        [ExpenseID] INT NOT NULL,
        [ExpenseAmount] decimal(9,2) NOT NULL,
        CONSTRAINT [PK_Expense_Budget] PRIMARY KEY (BudgetID, ExpenseID),
        CONSTRAINT [FK_ExpenseBudget_BudgetID] FOREIGN KEY (BudgetID) REFERENCES Budget (BudgetID)
        ON
        DELETE
            CASCADE
            ON
        UPDATE
            CASCADE,
            CONSTRAINT [FK_Expense_Budget_ExpenseID] FOREIGN KEY (ExpenseID) REFERENCES Expense (ExpenseID)
            ON
        DELETE
            CASCADE
            ON
        UPDATE
            CASCADE
    )
