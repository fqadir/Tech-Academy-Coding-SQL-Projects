Create Database db_Library_Managment_System;
GO

Create Table Library_Branch (
	BranchID Int Primary Key Not Null Identity (1,1),
	Branch_Name Varchar(20) Not Null,
	Branch_Address Varchar(50) Not Null);

Insert Into Library_Branch
	(Branch_Name, Branch_Address)
	Values
	('Central', '1308 NE Dekum St'),
	('Sharpstown', '2811 NE Holman St'),
	('Senior', '2400 NE 29th Ave'),
	('Junior', '1600 NE 27th Ave');

Create Table Borrower (
	CardNo Int Primary Key Not NUll Identity (200,1),
	Name Varchar(20) Not Null,
	Address VarChar(50) Not Null,
	Phone Varchar(10) Not Null);


Insert Into Borrower
	(Name, Address, Phone)
	Values
	('Moh Salah', '11 Anfield Road', '1234567891'),
	('Sadio Mane', '10 Anfield Road', '1234567892'),
	('Roberto Firmino', '9 Anfield Road', '1234567893'),
	('Trent Arnold', '66 Anfield Road', '1234567894'),
	('Andy Robertson', '26 Anfield Road', '1234567895'),
	('Virgil VanDijk', '4 Anfield Road', '1234567896'),
	('Jordan Henderson', '14 Anfield Road', '1234567897'),
	('Gini Wijnaldum', '5 Anfield Road', '1234567898');


Create Table Publisher (
	PublisherName VARCHAR(20) PRIMARY KEY NOT NULL,
	Address VARCHAR(10) NOT NULL,
	Phone varchar(10) NOT NULL);

Insert Into Publisher
	(PublisherName, Address, Phone)
	Values
	('Premier League', 'England', '1234567890'),
	('FA Cup', 'United Kingdom', '1234567899'),
	('Champions League', 'Europe', '1234567888');


Create Table Books (
	BookID Int Primary Key Not Null Identity (100,1),
	Title Varchar(50) Not Null,
	Publisher_Name Varchar(50) Not Null );

Insert Into Books
	(Title, Publisher_Name)
	Values
	('LiverpoolvNorwich', 'Premier League'),
	('LiverpoolvChelsea', 'Premier League'),
	('LiverpoolvSouthampton', 'Premier League'),
	('LiverpoolvArsenal', 'Premier League'),
	('LiverpoolvBurnley', 'Premier League'),
	('ChelseavLiverpool', 'FA Cup'),
	('SheffieldvLiverpool', 'Premier League'),
	('ManUvLiverpool', 'Premier League'),
	('LiverpoolvSpurs', 'FA Cup'),
	('PalacevLiverpool', 'Premier League'),
	('LiverpoolvCity', 'FA Cup'),
	('LiverpoolvEverton', 'FA Cup'),
	('BournemouthvLiverpool', 'FA Cup'),
	('The Lost Tribe', 'Champions League'),
	('LiverpoolvFlamengo', 'Champions League'),
	('AtleticovLiverpool', 'Champions League'),
	('WatfordvLiverpool', 'Champions League'),
	('LiverpoolvWolves', 'Premier League'),
	('LiverpoolvManU', 'Premier League'),
	('LiverpoolvWestHam', 'FA Cup'),
	('LiverpoolvChelsea', 'FA Cup');


Create Table Book_Authors (
	BookID Int Not Null Constraint fk_BookID Foreign Key References Books(BookID),
	AuthorName VarChar(20) Not Null);

Insert Into Book_Authors
	(BookID, AuthorName)
	Values
		(100, 'Salah'),
		(101, 'Mane'),
		(102, 'Matip'),
		(103, 'Salah'),
		(104, 'Wood'),
		(105, 'Mane'),
		(106, 'Milner'),
		(107, 'Lallana'),
		(108, 'Henderson'),
		(109, 'Firmino'),
		(110, 'Fabinho'),
		(111, 'Origi'),
		(112, 'Salah'),
		(113, 'Mark Lee'),
		(114, 'Firmino'),
		(115, 'Stephen King'),
		(116, 'Stephen King'),
		(117, 'Mane'),
		(118, 'Salah'),
		(119, 'Gini'),
		(120, 'Stephen King');



Create table Book_Copies (
	BookID Int Not Null Constraint fk_bookID Foreign Key References Books(BookID),
	BranchID Int Not Null Constraint fk_BranchID Foreign Key References library_branch(BranchID),
	Number_of_Copies INT Not Null);

Insert Into Book_Copies
		(BookID, Number_of_Copies, BranchID)
		Values
		(100,2,3),
		(101,2,2),
		(102,2,3),
		(103,4,4),
		(104,2,2),
		(105,2,3),
		(106,3,4),
		(107,2,1),
		(108,3,2),
		(109,4,3),
		(110,3,4),
		(111,2,1),
		(112,2,3),
		(113,2,2),
		(114,2,4),
		(115,4,1),
		(116,3,1),
		(117,2,1),
		(118,2,2),
		(119,3,3),
		(120,3,1);


Create Table Book_Loans (
	BookID Int Not Null Constraint fk_BookID Foreign Key References Books(BookID),
	BranchID Int Not Null Constraint fk_BranchID Foreign Key References Library_Branch(BranchID),
	CardNo Int Not Null Constraint fk_CardNo Foreign Key References Borrower(CardNo),
	Checkout Date Not Null,
	Due Date Not Null);

Insert into Book_Loans
	(BookID, BranchID, CardNo, Checkout, Due)
	Values
	(100, 1, 200, '02/29/2020', '04/01/2020'),
	(101, 2, 201, '02/29/2020', '04/01/2020'),
	(102, 4, 202, '02/29/2020', '04/01/2020'),
	(103, 2, 203, '02/29/2020', '04/01/2020'),
	(104, 3, 204, '02/29/2020', '04/01/2020'),
	(105, 2, 205, '02/29/2020', '04/01/2020'),
	(106, 1, 206, '02/29/2020', '04/01/2020'),
	(107, 3, 201, '02/29/2020', '04/01/2020'),
	(108, 3, 200, '02/29/2020', '04/01/2020'),
	(109, 4, 201, '02/29/2020', '04/01/2020'),
	(110, 3, 202, '02/29/2020', '04/01/2020'),
	(111, 2, 203, '02/29/2020', '04/01/2020'),
	(112, 2, 204, '02/29/2020', '04/01/2020'),
	(113, 2, 205, '02/29/2020', '04/01/2020'),
	(114, 4, 206, '02/29/2020', '04/01/2020'),
	(115, 2, 202, '02/29/2020', '04/01/2020'),
	(116, 1, 200, '02/29/2020', '04/01/2020'),
	(117, 4, 201, '02/29/2020', '04/01/2020'),
	(118, 4, 202, '02/29/2020', '04/01/2020'),
	(119, 4, 203, '02/29/2020', '04/01/2020'),
	(120, 2, 204, '02/29/2020', '04/01/2020'),
	(121, 3, 205, '02/29/2020', '04/01/2020'),
	(122, 4, 206, '02/29/2020', '04/01/2020'),
	(123, 4, 203, '02/29/2020', '04/01/2020'),
	(124, 2, 200, '02/29/2020', '04/01/2020'),
	(125, 1, 201, '02/29/2020', '04/01/2020'),
	(126, 1, 202, '02/29/2020', '04/01/2020'),
	(127, 1, 203, '02/29/2020', '04/01/2020'),
	(128, 2, 204, '02/29/2020', '04/01/2020'),
	(129, 3, 205, '02/29/2020', '04/01/2020'),
	(130, 4, 206, '02/29/2020', '04/01/2020'),
	(131, 1, 204, '02/29/2020', '04/01/2020'),
	(132, 1, 200, '02/29/2020', '04/01/2020'),
	(133, 2, 201, '02/29/2020', '04/01/2020'),
	(134, 2, 202, '02/29/2020', '04/01/2020'),
	(135, 3, 203, '02/29/2020', '04/01/2020'),
	(136, 1, 204, '02/29/2020', '04/01/2020'),
	(137, 1, 205, '02/29/2020', '04/01/2020'),
	(138, 1, 206, '02/29/2020', '04/01/2020'),
	(139, 3, 206, '02/29/2020', '04/01/2020'),
	(140, 4, 200, '02/29/2020', '04/01/2020'),
	(141, 4, 201, '02/29/2020', '04/01/2020'),
	(142, 4, 202, '02/29/2020', '04/01/2020'),
	(143, 2, 203, '02/29/2020', '04/01/2020'),
	(144, 3, 204, '02/29/2020', '04/01/2020'),
	(145, 3, 205, '02/29/2020', '04/01/2020'),
	(146, 2, 206, '02/29/2020', '04/01/2020'),
	(147, 2, 205, '02/29/2020', '04/03/2020'),
	(148, 3, 200, '02/29/2020', '04/01/2020'),
	(149, 4, 201, '02/29/2020', '04/01/2020');



	/*****
	Procs
	*****/

/* 1) */

	Create Proc LostTribe
	As
	Select Number_of_Copies From Book_Copies
	Where BookID = 113 And BranchID = 2;

/* 2) */
	
	Create Proc Copies
	As
	Select Number_of_Copies And BranchID
	From Book_Copies Where BookID = 113;

/* 3) */
	
	Create Proc 3_NoCheckout
	As
	Select Name from Borrower Where CardNo Null in Select CardNo From Book_loans;

/* 4) */
	
	Create Proc 4_Due
	As
	Select Title, Name, Address
	From Books, Borrower, Book_Loans, Library_Branch (BranchID = 2)
	Where BranchID = 2 and Due = Current_Date;

/* 5) */

	Create Proc 5_TotalOut
	As
	Select BranchID From Library_Branch, Book_Loans
	Where Library_Branch * Book_loans

/* 6) */

	Create Proc 6_FivePlus
    Select Name, Address, BookID
	Where BookID > 5

/* 7) */
	
	Create Proc 7_SKCentral
	As
	Select BookID = 115, 116, 120 From BranchID = 1


