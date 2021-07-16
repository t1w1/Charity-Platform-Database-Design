
USE FinalProjectFV_T6

--Create Table
/****** Object:  Table [dbo].[AfterCheck_Record]  ******/
	CREATE TABLE [dbo].[AfterCheck_Record](
	[CheckRecordID] [int] PRIMARY KEY NOT NULL,
	[BackOfficerID] [int] NOT NULL,
	[CharityID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL
	)

/****** Object:  Table [dbo].[BackOfficer]    ******/
CREATE TABLE [dbo].[BackOfficer](
	[BackOfficerID] [int] PRIMARY KEY NOT NULL,
	[HospitalID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL
)

/****** Object:  Table [dbo].[Charity]   ******/

CREATE TABLE [dbo].[Charity](
	[CharityID] [int] PRIMARY KEY NOT NULL,
	[CharityName] [varchar](50) NOT NULL,
	[Founder] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[EstablishedYear] [datetime] NOT NULL,
	)

/****** Object:  Table [dbo].[Demand_Record]   ******/

CREATE TABLE [dbo].[Demand_Record](
	[DemandRecordID] [int] PRIMARY KEY NOT NULL,
	[DoctorID] [int] NOT NULL,
	[BackOfficerID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL
	)


/****** Object:  Table [dbo].[Doctor]   ******/

CREATE TABLE [dbo].[Doctor](
	[DoctorID] [int] PRIMARY KEY NOT NULL,
	[HospitalID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL
	)

/****** Object:  Table [dbo].[Donation]   ******/

CREATE TABLE [dbo].[Donation](
	[DonationID] [int] PRIMARY KEY NOT NULL,
	[DonorID] [int] NOT NULL,
	[ManageID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[DonationTime] [date] NOT NULL
	)

/****** Object:  Table [dbo].[Donor]    ******/
CREATE TABLE [dbo].[Donor](
	[DonorID] [int] PRIMARY KEY NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[BankAccount] VARBINARY(250) NOT NULL
	)

/****** Object:  Table [dbo].[Driver]   ******/

CREATE TABLE [dbo].[Driver](
	[DriverID] [int] PRIMARY KEY NOT NULL,
	[CharityID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[BirthDate] [date] NULL,
	[Gender] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL
	)

/****** Object:  Table [dbo].[Evaluation_Form]     ******/
CREATE TABLE [dbo].[Evaluation_Form](
	[FormID] [int] PRIMARY KEY NOT NULL,
	[CheckRecordID] [int] NOT NULL,
	[TransformRecordID] [int] NOT NULL,
	[Feedback] [varchar](50) NOT NULL,
	[Rating] [varchar](50) NOT NULL
	)

/****** Object:  Table [dbo].[Hospital]   ******/

CREATE TABLE [dbo].[Hospital](
	[HospitalID] [int] PRIMARY KEY NOT NULL,
	[HospitalName] [varchar](100) NOT NULL,
	[StreetName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Telephone] [varchar](50) NOT NULL
	)

/****** Object:  Table [dbo].[Item]   ******/

CREATE TABLE [dbo].[Item](
	[ItemID] [int] PRIMARY KEY NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Brand] [varchar](50) NOT NULL,
	[Manufacturer] [varchar](50) NOT NULL,
	[ShelfLife] [date] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ProductionPlace] [varchar](50) NOT NULL
	)


/****** Object:  Table [dbo].[Manager]  ******/

CREATE TABLE [dbo].[Manager]
(
	[ManagerID] [int] PRIMARY KEY NOT NULL,
	[CharityID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Gender] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL
)

/****** Object:  Table [dbo].[Storage_List]   ******/

CREATE TABLE [dbo].[Storage_List](
	[ListID] [int] PRIMARY KEY NOT NULL,
	[ItemID] [int] NOT NULL,
	[WareHouseID] [int] NOT NULL,
	[StorageTime] [date] NOT NULL,
	[ItemQuantity] [int] NOT NULL
	)

/****** Object:  Table [dbo].[Transform_Record]   ******/

CREATE TABLE [dbo].[Transform_Record](
	[TransformRecordID] [int] PRIMARY KEY NOT NULL,
	[CharityID] [int] NOT NULL,
	[DriverID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[WarehouseID] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL
	)

/****** Object:  Table [dbo].[Warehouse]   ******/

CREATE TABLE [dbo].[Warehouse](
	[WarehouseID] [int] PRIMARY KEY NOT NULL,
	[UnitNumber] [varchar](50) NOT NULL,
	[StreetName] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL
	)


--=============Add Encyption (requirement1)=============--

CREATE MASTER KEY
ENCRYPTION BY PASSWORD = '1qazZAQ!';

---Create certificate to protect symmetric key
CREATE CERTIFICATE TestCertificate
WITH SUBJECT = 'FinalProjectFV_T6 Test Certificate',
EXPIRY_DATE = '2022-12-31';

-- Create symmetric key to encrypt data
CREATE SYMMETRIC KEY TestSymmetricKey
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE TestCertificate;

-- Open symmetric key
OPEN SYMMETRIC KEY TestSymmetricKey
DECRYPTION BY CERTIFICATE TestCertificate;

-- Close or Drop the symmetric key
/*
CLOSE SYMMETRIC KEY TestSymmetricKey;
DROP SYMMETRIC KEY TestSymmetricKey;
DROP CERTIFICATE TestCertificate;
DROP MASTER KEY;
USE Master;
*/


---Insert Data-------
INSERT  [dbo].[AfterCheck_Record] ([CheckRecordID], [BackOfficerID], [CharityID], [ItemID], [ItemName], [Quantity], [CreateTime]) 
	VALUES 
		(1, 1, 1, 1, N'Thermometer', 11, CAST(N'2019-01-01T10:00:00.000' AS DateTime)),
		(2, 1, 2, 3, N'Oxygen tube', 100, CAST(N'2020-03-05T10:00:00.000' AS DateTime)),
		(3, 2, 2, 3, N'Oxygen tube', 217, CAST(N'2020-04-01T10:00:00.000' AS DateTime)),
		(4, 2, 3, 4, N'Shadowless', 99, CAST(N'2019-01-01T10:00:00.000' AS DateTime)),
		(5, 4, 3, 4, N'Shadowless', 888, CAST(N'2018-01-01T10:00:00.000' AS DateTime)),
		(6, 4, 7, 5, N'Operation gown', 200, CAST(N'2020-07-01T10:00:00.000' AS DateTime)),
		(7, 5, 7, 6, N'Overalls', 300, CAST(N'2020-03-07T10:00:00.000' AS DateTime)),
		(8, 5, 9, 7, N'Mask', 999, CAST(N'2020-04-01T12:00:00.000' AS DateTime)),
		(9, 5, 9, 7, N'Mask', 800, CAST(N'2020-08-05T08:00:00.000' AS DateTime)),
		(10, 6, 9, 1, N'Thermometer', 500, CAST(N'2020-11-11T11:11:00.000' AS DateTime))
	
INSERT [dbo].[BackOfficer] ([BackOfficerID], [HospitalID], [FirstName], [LastName], [BirthDate], [Gender], [Phone], [Email]) 
	VALUES
		(1, 1, N'Reginald', N'Cattermole', CAST(N'1987-05-06' AS Date), N'F', N'8547621587', N'RC001@gmail.com'),
		(2, 1, N'Mary', N'Cattermole', CAST(N'1954-09-07' AS Date), N'F', N'8549871552', N'MC002@gmail.com'),
		(3, 1, N'Penelope', N'Clearwater', CAST(N'1965-10-07' AS Date), N'M', N'8944965172', N'PC2@gmail.com'),
		(4, 2, N'Michael', N'Corner', CAST(N'1974-12-23' AS Date), N'M', N'8965745321', N'MCORNER@gmail.com'),
		(5, 3, N'Vincent', N'Crabbe', CAST(N'1999-09-09' AS Date), N'M', N'8426975364', N'VC0999@gmail.com'),
		(6, 4, N'Colin', N'Creevey', CAST(N'1979-11-30' AS Date), N'F', N'8657412896', N'COLIN@gmail.com'),
		(7, 5, N'Dennis', N'Creevey', CAST(N'1988-08-08' AS Date), N'F', N'8745239845', N'DENNIS@gmail.com'),
		(8, 6, N'Dirk', N'Cresswell', CAST(N'1955-01-11' AS Date), N'M', N'8541783655', N'DRIK@gmail.com'),
		(9, 7, N'John', N'Dawlish', CAST(N'1977-08-25' AS Date), N'M', N'8541369856', N'JOHN@gmail.com'),
		(10, 8, N'Fleur', N'Delacour', CAST(N'1989-12-25' AS Date), N'M', N'8965326589', N'FLEUR@gmail.com')

INSERT [dbo].[Charity] ([CharityID], [CharityName], [Founder], [Location], [EstablishedYear]) 
	VALUES 
		(1, N'George Snow Scholarship Fund Inc.', N'Timothy G. Snow', N'201 Plaza Real Suite 260 Boca Raton, FL 33432', CAST(N'2015-08-11T00:00:00.000' AS DateTime)),
		(2, N'Amigos for Christ', N'John Bland', N'75 Maddox Road Suite 107 Buford, GA 30518', CAST(N'2014-07-27T00:00:00.000' AS DateTime)),
		(3, N'Orphan Grain Train', N'Grant Schmidt', N'601 West Phillip 1466 Norfolk, NE 68702', CAST(N'2001-08-04T00:00:00.000' AS DateTime)),
		(4, N'Operation Second Chance', N'Pastor Ray Wilke', N'20251 Century 130 Germantown, MD 20874', CAST(N'1995-09-02T00:00:00.000' AS DateTime)),
		(5, N'All Hands and Hearts Smart Response', N'Erik Dyson', N'6 County Road Suite 6 Mattapoisett, MA 02739', CAST(N'1965-09-04T00:00:00.000' AS DateTime)),
		(6, N'Direct Relief', N'Thomas E. Tighe', N'6100 Road Santa Barbara, CA 93117', CAST(N'1996-04-02T00:00:00.000' AS DateTime)),
		(7, N'Acadia Center', N'Daniel Sosland', N'8 Summer Street Rockport, ME 04856', CAST(N'2002-08-09T00:00:00.000' AS DateTime)),
		(8, N'Truth For Life', N'Alistair Begg', N'P.O. Box 398000 Cleveland, OH 44139', CAST(N'2001-08-03T00:00:00.000' AS DateTime)),
		(9, N'Sankara Eye Foundation, USA', N'	K. Muralidharan', N'1900 McCarthy 302 Milpitas, CA 95035', CAST(N'1766-09-24T00:00:00.000' AS DateTime)),
		(10, N'The Lustgarten Foundation for Pancreatic', N'Kerri Kaplan', N'415 Crossways Park D Woodbury, NY 11797', CAST(N'2001-09-23T00:00:00.000' AS DateTime))


INSERT [dbo].[Demand_Record] ([DemandRecordID], [DoctorID], [BackOfficerID], [ItemID], [ItemName], [Quantity], [CreateTime], [Status])
	VALUES
		(1, 1, 1, 3, N'Oxygen tube', 100, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'completed'),
		(2, 1, 2, 3, N'Oxygen tube', 150, CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'completed'),
		(3, 3, 3, 3, N'Oxygen tube', 200, CAST(N'2020-01-07T00:00:00.000' AS DateTime), N'completed'),
		(4, 4, 4, 1, N'Thermometer', 300, CAST(N'2020-01-07T00:00:00.000' AS DateTime), N'completed'),
		(5, 4, 5, 7, N'Mask', 300, CAST(N'2020-01-13T00:00:00.000' AS DateTime), N'completed'),
		(6, 5, 6, 7, N'Mask', 200, CAST(N'2020-01-13T00:00:00.000' AS DateTime), N'completed'),
		(7, 7, 7, 7, N'Mask', 400, CAST(N'2020-01-19T00:00:00.000' AS DateTime), N'completed'),
		(8, 7, 8, 7, N'Mask', 450, CAST(N'2020-01-19T00:00:00.000' AS DateTime), N'not completetd'),
		(9, 9, 9, 9, N'Defibrillator', 500, CAST(N'2020-01-25T00:00:00.000' AS DateTime), N'completed'),
		(10, 9, 10, 1, N'Thermometer', 600, CAST(N'2020-01-25T00:00:00.000' AS DateTime), N'not completed'),
		(11, 1, 1, 1, N'Thermometer', 400, CAST(N'2020-01-31T00:00:00.000' AS DateTime), N'completed'),
		(12, 1, 2, 1, N'Thermometer', 450, CAST(N'2020-01-31T00:00:00.000' AS DateTime), N'completed'),
		(13, 3, 3, 3, N'Oxygen tube', 500, CAST(N'2020-02-06T00:00:00.000' AS DateTime), N'completed'),
		(14, 4, 4, 4, N'Shadowless lamp', 600, CAST(N'2020-02-06T00:00:00.000' AS DateTime), N'completed'),
		(15, 4, 5, 5, N'Operating wn', 400, CAST(N'2020-02-12T00:00:00.000' AS DateTime), N'completed'),
		(16, 5, 6, 6, N'Overalls', 450, CAST(N'2020-02-12T00:00:00.000' AS DateTime), N'completed'),
		(17, 7, 7, 7, N'Mask', 500, CAST(N'2020-02-18T00:00:00.000' AS DateTime), N'completed'),
		(18, 7, 8, 8, N'Ventilator', 600, CAST(N'2020-02-18T00:00:00.000' AS DateTime), N'completed'),
		(19, 9, 9, 9, N'Defibrillator', 400, CAST(N'2020-02-24T00:00:00.000' AS DateTime), N'completed'),
		(20, 9, 10, 10, N'Hyperbaric oxygen chamber', 450, CAST(N'2020-02-24T00:00:00.000' AS DateTime), N'completed'),
		(21, 1, 1, 1, N'Thermometer', 500, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'completed'),
		(22, 1, 2, 2, N'Syringe', 600, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'completed'),
		(23, 3, 3, 3, N'Oxygen tube', 400, CAST(N'2020-03-07T00:00:00.000' AS DateTime), N'completed'),
		(24, 4, 4, 4, N'Shadowless lamp', 450, CAST(N'2020-03-07T00:00:00.000' AS DateTime), N'completed'),
		(25, 4, 5, 5, N'Operating wn', 500, CAST(N'2020-03-13T00:00:00.000' AS DateTime), N'completed'),
		(26, 5, 6, 6, N'Overalls', 600, CAST(N'2020-03-13T00:00:00.000' AS DateTime), N'completed'),
		(27, 7, 7, 7, N'Mask', 100, CAST(N'2020-03-19T00:00:00.000' AS DateTime), N'completed'),
		(28, 8, 8, 8, N'Ventilator', 150, CAST(N'2020-03-19T00:00:00.000' AS DateTime), N'not completetd'),
		(29, 9, 9, 9, N'Defibrillator', 200, CAST(N'2020-03-25T00:00:00.000' AS DateTime), N'completed'),
		(30, 9, 10, 10, N'Hyperbaric oxygen chamber', 250, CAST(N'2020-03-25T00:00:00.000' AS DateTime), N'not completed'),
		(31, 1, 1, 1, N'Thermometer', 300, CAST(N'2020-03-31T00:00:00.000' AS DateTime), N'completed'),
		(32, 1, 2, 1, N'Thermometer', 350, CAST(N'2020-03-31T00:00:00.000' AS DateTime), N'completed'),
		(33, 3, 3, 1, N'Thermometer', 400, CAST(N'2020-04-06T00:00:00.000' AS DateTime), N'completed'),
		(34, 4, 4, 1, N'Thermometer', 450, CAST(N'2020-04-06T00:00:00.000' AS DateTime), N'not completetd'),
		(35, 4, 5, 1, N'Thermometer', 500, CAST(N'2020-04-12T00:00:00.000' AS DateTime), N'completed'),
		(36, 6, 6, 7, N'Mask', 600, CAST(N'2020-04-12T00:00:00.000' AS DateTime), N'not completed'),
		(37, 7, 7, 7, N'Mask', 400, CAST(N'2020-04-18T00:00:00.000' AS DateTime), N'completed'),
		(38, 8, 8, 7, N'Mask', 450, CAST(N'2020-04-18T00:00:00.000' AS DateTime), N'completed'),
		(39, 9, 9, 7, N'Mask', 500, CAST(N'2020-04-24T00:00:00.000' AS DateTime), N'completed'),
		(40, 9, 10, 7, N'Mask', 600, CAST(N'2020-04-24T00:00:00.000' AS DateTime), N'not completetd'),
		(41, 1, 1, 7, N'Mask', 400, CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'completed'),
		(42, 1, 2, 1, N'Thermometer', 450, CAST(N'2020-04-30T00:00:00.000' AS DateTime), N'not completed'),
		(43, 3, 3, 1, N'Thermometer', 500, CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'completed'),
		(44, 4, 4, 1, N'Thermometer', 600, CAST(N'2020-05-06T00:00:00.000' AS DateTime), N'completed'),
		(45, 5, 5, 2, N'Syringe', 400, CAST(N'2020-05-12T00:00:00.000' AS DateTime), N'completed'),
		(46, 6, 6, 3, N'Oxygen tube', 450, CAST(N'2020-05-12T00:00:00.000' AS DateTime), N'not completetd'),
		(47, 7, 7, 4, N'Shadowless lamp', 500, CAST(N'2020-05-18T00:00:00.000' AS DateTime), N'completed'),
		(48, 8, 8, 2, N'Syringe', 600, CAST(N'2020-05-18T00:00:00.000' AS DateTime), N'not completed'),
		(49, 9, 9, 3, N'Oxygen tube', 400, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'completed'),
		(50, 9, 10, 4, N'Shadowless lamp', 450, CAST(N'2020-05-24T00:00:00.000' AS DateTime), N'completed'),
		(51, 1, 1, 2, N'Syringe', 500, CAST(N'2020-05-30T00:00:00.000' AS DateTime), N'completed'),
		(52, 1, 2, 3, N'Oxygen tube', 600, CAST(N'2020-05-30T00:00:00.000' AS DateTime), N'not completetd'),
		(53, 3, 3, 4, N'Shadowless lamp', 400, CAST(N'2020-06-05T00:00:00.000' AS DateTime), N'completed'),
		(54, 4, 4, 2, N'Syringe', 450, CAST(N'2020-06-05T00:00:00.000' AS DateTime), N'not completed'),
		(55, 5, 5, 3, N'Oxygen tube', 500, CAST(N'2020-06-11T00:00:00.000' AS DateTime), N'completed'),
		(56, 6, 6, 4, N'Shadowless lamp', 600, CAST(N'2020-06-11T00:00:00.000' AS DateTime), N'completed'),
		(57, 7, 7, 2, N'Syringe', 400, CAST(N'2020-06-17T00:00:00.000' AS DateTime), N'completed'),
		(58, 8, 8, 3, N'Oxygen tube', 450, CAST(N'2020-06-17T00:00:00.000' AS DateTime), N'completed'),
		(59, 9, 9, 4, N'Shadowless lamp', 500, CAST(N'2020-06-23T00:00:00.000' AS DateTime), N'completed'),
		(60, 9, 10, 5, N'Operating wn', 600, CAST(N'2020-06-23T00:00:00.000' AS DateTime), N'completed'),
		(61, 1, 1, 6, N'Overalls', 500, CAST(N'2020-06-29T00:00:00.000' AS DateTime), N'completed'),
		(62, 1, 2, 7, N'Mask', 600, CAST(N'2020-06-29T00:00:00.000' AS DateTime), N'completed'),
		(63, 3, 3, 8, N'Ventilator', 400, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'completed'),
		(64, 4, 4, 9, N'Defibrillator', 450, CAST(N'2020-07-05T00:00:00.000' AS DateTime), N'completed'),
		(65, 5, 5, 10, N'Hyperbaric oxygen chamber', 500, CAST(N'2020-07-11T00:00:00.000' AS DateTime), N'completed'),
		(66, 6, 6, 1, N'Thermometer', 600, CAST(N'2020-07-11T00:00:00.000' AS DateTime), N'completed'),
		(67, 7, 7, 1, N'Thermometer', 400, CAST(N'2020-07-17T00:00:00.000' AS DateTime), N'completed'),
		(68, 8, 8, 1, N'Thermometer', 450, CAST(N'2020-07-17T00:00:00.000' AS DateTime), N'completed'),
		(69, 9, 9, 7, N'Mask', 500, CAST(N'2020-07-23T00:00:00.000' AS DateTime), N'completed'),
		(70, 10, 10, 7, N'Mask', 600, CAST(N'2020-07-23T00:00:00.000' AS DateTime), N'completed'),
		(71, 1, 1, 7, N'Mask', 400, CAST(N'2020-07-29T00:00:00.000' AS DateTime), N'not completetd'),
		(72, 2, 2, 7, N'Mask', 450, CAST(N'2020-07-29T00:00:00.000' AS DateTime), N'completed'),
		(73, 3, 3, 1, N'Thermometer', 500, CAST(N'2020-08-04T00:00:00.000' AS DateTime), N'not completed'),
		(74, 4, 4, 5, N'Operating wn', 600, CAST(N'2020-08-04T00:00:00.000' AS DateTime), N'completed'),
		(75, 5, 5, 6, N'Overalls', 450, CAST(N'2020-08-10T00:00:00.000' AS DateTime), N'completed'),
		(76, 6, 6, 7, N'Mask', 500, CAST(N'2020-08-15T00:00:00.000' AS DateTime), N'completed'),
		(77, 7, 7, 8, N'Ventilator', 600, CAST(N'2020-08-20T00:00:00.000' AS DateTime), N'completed'),
		(78, 8, 8, 9, N'Defibrillator', 500, CAST(N'2020-08-25T00:00:00.000' AS DateTime), N'completed'),
		(79, 9, 9, 10, N'Hyperbaric oxygen chamber', 600, CAST(N'2020-08-30T00:00:00.000' AS DateTime), N'completed'),
		(80, 10, 10, 1, N'Thermometer', 400, CAST(N'2020-09-04T00:00:00.000' AS DateTime), N'completed'),
		(81, 1, 1, 1, N'Thermometer', 450, CAST(N'2020-09-09T00:00:00.000' AS DateTime), N'completed'),
		(82, 2, 2, 1, N'Thermometer', 500, CAST(N'2020-09-14T00:00:00.000' AS DateTime), N'completed'),
		(83, 3, 3, 7, N'Mask', 600, CAST(N'2020-09-19T00:00:00.000' AS DateTime), N'completed'),
		(84, 4, 4, 7, N'Mask', 400, CAST(N'2020-09-24T00:00:00.000' AS DateTime), N'completed'),
		(85, 5, 5, 1, N'Thermometer', 450, CAST(N'2020-09-29T00:00:00.000' AS DateTime), N'completed'),
		(86, 6, 6, 1, N'Thermometer', 500, CAST(N'2020-10-04T00:00:00.000' AS DateTime), N'completed'),
		(87, 7, 7, 1, N'Thermometer', 450, CAST(N'2020-10-09T00:00:00.000' AS DateTime), N'completed'),
		(88, 8, 8, 8, N'Ventilator', 500, CAST(N'2020-10-14T00:00:00.000' AS DateTime), N'completed'),
		(89, 9, 9, 9, N'Defibrillator', 600, CAST(N'2020-10-19T00:00:00.000' AS DateTime), N'completed'),
		(90, 10, 10, 10, N'Hyperbaric oxygen chamber', 500, CAST(N'2020-10-24T00:00:00.000' AS DateTime), N'not completetd'),
		(91, 1, 1, 1, N'Thermometer', 600, CAST(N'2020-10-29T00:00:00.000' AS DateTime), N'completed'),
		(92, 2, 2, 1, N'Thermometer', 400, CAST(N'2020-11-03T00:00:00.000' AS DateTime), N'not completed'),
		(93, 3, 3, 8, N'Ventilator', 450, CAST(N'2020-11-08T00:00:00.000' AS DateTime), N'completed'),
		(94, 4, 4, 9, N'Defibrillator', 500, CAST(N'2020-11-13T00:00:00.000' AS DateTime), N'completed'),
		(95, 5, 5, 10, N'Hyperbaric oxygen chamber', 600, CAST(N'2020-11-18T00:00:00.000' AS DateTime), N'completed'),
		(96, 6, 6, 1, N'Thermometer', 400, CAST(N'2020-11-23T00:00:00.000' AS DateTime), N'not completetd'),
		(97, 7, 7, 1, N'Thermometer', 450, CAST(N'2020-11-28T00:00:00.000' AS DateTime), N'completed'),
		(98, 8, 8, 10, N'Hyperbaric oxygen chamber', 500, CAST(N'2020-12-03T00:00:00.000' AS DateTime), N'not completed'),
		(99, 9, 9, 1, N'Thermometer', 450, CAST(N'2020-12-08T00:00:00.000' AS DateTime), N'completed')

INSERT [dbo].[Doctor] ([DoctorID], [HospitalID], [FirstName], [LastName], [BirthDate], [Gender], [Department], [Phone]) 
	VALUES
		(1, 1, N'Ludo', N'Bagman', CAST(N'1980-01-02' AS Date), N'M', N'Accident and Emergency', N'8578470236'),
		(2, 1, N'Bathilda', N'Bagshot', CAST(N'1987-02-03' AS Date), N'F', N'Anaesthetics', N'8426571456'),
		(3, 1, N'Katie', N'Bell', CAST(N'1957-03-09' AS Date), N'M', N'Breast Screening', N'8759654217'),
		(4, 1, N'Cuthbert', N'Binns', CAST(N'1988-05-23' AS Date), N'M', N'Cardiology', N'8569741456'),
		(5, 2, N'Sirius', N'Black', CAST(N'1955-06-14' AS Date), N'F', N'Anaesthetics', N'8599664715'),
		(6, 2, N'Amelia', N'Bones', CAST(N'1967-11-11' AS Date), N'F', N'Chaplaincy', N'8574002000'),
		(7, 2, N'Terry', N'Boot', CAST(N'1987-01-02' AS Date), N'M', N'Chaplaincy', N'8574967833'),
		(8, 3, N'Lavender', N'Brown', CAST(N'1999-01-02' AS Date), N'F', N'Diagnostic Imaging', N'8479652111'),
		(9, 4, N'Charity', N'Burbage', CAST(N'1977-04-05' AS Date), N'M', N'Gastroenterology', N'8765124444'),
		(10, 5, N'Alecto', N'Carrow', CAST(N'1997-06-09' AS Date), N'M', N'Gynaecology', N'8555414541')

INSERT [dbo].[Donation] ([DonationID], [DonorID], [ManageID], [ItemID], [Quantity], [DonationTime]) 
	VALUES
		(1, 1, 1, 1, 20, CAST(N'2020-01-01' AS Date)),
		(2, 2, 2, 2, 30, CAST(N'2019-09-23' AS Date)),
		(3, 3, 3, 3, 40, CAST(N'2019-06-27' AS Date)),
		(4, 4, 4, 4, 50, CAST(N'2019-07-23' AS Date)),
		(5, 5, 5, 5, 60, CAST(N'2019-08-23' AS Date)),
		(6, 6, 6, 6, 70, CAST(N'2020-09-17' AS Date)),
		(7, 7, 7, 7, 80, CAST(N'2020-12-02' AS Date)),
		(8, 8, 8, 8, 90, CAST(N'2019-08-17' AS Date)),
		(9, 9, 9, 9, 100, CAST(N'2020-01-10' AS Date)),
		(10, 10, 10, 10, 110, CAST(N'2020-09-09' AS Date))


INSERT [dbo].[Donor] ([DonorID], [FirstName], [LastName], [BirthDate], [Gender], [Phone], [Email],[BankAccount])
	VALUES 
		(1, N'Andy', N'Wu', CAST(N'1998-01-01' AS Date), N'Male', N'7952718534', N'andywu@123.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'232312332322'))),
		(2, N'Haojie', N'Zhang', CAST(N'2000-09-01' AS Date), N'Male', N'5678901234', N'haojiezhang@321.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'547895412358'))),
		(3, N'Jiangnan', N'Wang', CAST(N'1999-05-27' AS Date), N'Female', N'5556789876', N'helpme@163.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'512874125963'))),
		(4, N'Jinning', N'Yang', CAST(N'1997-01-25' AS Date), N'Female', N'7742919801', N'jinning@dongbei.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'987554658921'))),
		(5, N'Wei', N'Wang', CAST(N'2010-05-23' AS Date), N'Male', N'2321234532', N'weiwang@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'596348874112'))),
		(6, N'Bai', N'Li', CAST(N'2000-06-29' AS Date), N'Male', N'1234567890', N'baili@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'445215963555'))),
		(7, N'Fu', N'Du', CAST(N'1920-07-29' AS Date), N'Male', N'3456216756', N'fudu@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'985745621895'))),
		(8, N'Juyi', N'Bai', CAST(N'1999-09-11' AS Date), N'Male', N'2146571234', N'juyibai@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'554456214785'))),
		(9, N'Shangyin', N'Li', CAST(N'1985-09-10' AS Date), N'Male', N'1232356546', N'shangyinli@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'874498201002'))),
		(10, N'Qingzhao', N'Li', CAST(N'1993-01-23' AS Date), N'Female', N'2342131232', N'qingzhaoli@tang.com',ENCRYPTBYKEY(key_GUID(N'TestSymmetricKey'),convert(varbinary,'238887456552')))


INSERT [dbo].[Driver] ([DriverID], [CharityID], [FirstName], [LastName], [BirthDate], [Gender], [Phone], [Email]) 
	VALUES 
		(1, 1, N'Stephen', N'Curry', CAST(N'1997-08-25' AS Date), N'Male', N'857-888-1832', N'sdfjvshadf@gmail.com'),
		(2, 2, N'Kobe', N'Bryant', CAST(N'1998-09-24' AS Date), N'Male', N'657-222-1542', N'dasjkbdouigasdu@gmail.com'),
		(3, 3, N'Tim ', N'Duncan', CAST(N'1997-09-22' AS Date), N'Male', N'857-222-1234', N'dcsvsdbjkfk@gmail.com'),
		(4, 4, N'Shaquille', N'O''Neal', CAST(N'1995-09-04' AS Date), N'Male', N'677-213-2131', N'kajsgdjk@gmail.com'),
		(5, 5, N'Jerry', N'West', CAST(N'1996-02-12' AS Date), N'Male', N'232-122-2131', N'jasvdfjksagv@gmail.com'),
		(6, 6, N'Michael', N'Jordan', CAST(N'1994-07-02' AS Date), N'Male', N'243-123-2423', N'dfjasgjbj@qq.com'),
		(7, 7, N'Kevin', N'Garnett', CAST(N'1992-09-12' AS Date), N'Male', N'213-434-1231', N'kajgdjklasg@gjad.com'),
		(8, 8, N'Larry', N'Bird', CAST(N'1987-09-12' AS Date), N'Male', N'867-231-3253', N'sdfsdf@gmail.com'),
		(9, 9, N'John', N'Havicek', CAST(N'1995-09-21' AS Date), N'Male', N'546-213-1232', N'sdfsdfgj@jak.com'),
		(10, 10, N'Lebron', N'James', CAST(N'2000-01-01' AS Date), N'Male', N'435-234-2342', N'akjsdgj@kjvw.com')


INSERT [dbo].[Evaluation_Form] ([FormID], [CheckRecordID], [TransformRecordID], [Feedback], [Rating]) 
	VALUES
		(1, 1, 1, N'Not so od', N'10'),
		(2, 2, 2, N'alright', N'65'),
		(3, 3, 3, N'KeepUp', N'75'),
		(4, 4, 4, N'odJob', N'90'),
		(5, 5, 5, N'Awful', N'55'),
		(6, 6, 6, N'Neat', N'80'),
		(7, 7, 7, N'Aoligei', N'95'),
		(8, 8, 8, N'Bad', N'20'),
		(9, 9, 9, N'Need Improvement', N'80'),
		(10, 10, 10, N'Perfect', N'100')


INSERT [dbo].[Hospital] ([HospitalID], [HospitalName], [StreetName], [City], [State], [Telephone]) 
	VALUES 
		(1, N'Massachusetts General Hospital', N'55 Fruit Street', N'Boston', N'MA', N'(617) 726-2000'),
		(2, N'Baystate Medical Center', N'759 Chestnut Street', N'Springfield', N'MA', N'(413) 794-0000'),
		(3, N'Bridgewater State Hospital', N'20 Administration Road', N'Bridgewater', N'MA', N'(508) 279-4500'),
		(4, N'Milford Regional Medical Center', N'14 Prospect Street', N'Milford', N'MA', N'(508) 473-1190'),
		(5, N'Mercy Medical Center', N'271 Carew St. P.O. Box 9012', N'Springfield', N'MA', N'(413) 748-9000'),
		(6, N'Holy Family Hospital At Merrimack Valley', N'140 Lincoln Avenue', N'Haverhill', N'MA', N'(978) 374-2000'),
		(7, N'New England Rehab Hospital At Lowell', N'1071 Varnum Avenue', N'Lowell', N'MA', N'(978) 446-1862'),
		(8, N'Berkshire Medical Center', N'725 North Street', N'Pittsfield', N'MA', N'(413) 447-2000'),
		(9, N'AdCare Hospital', N'107 Lincoln Street', N'Worcester', N'MA', N'(508) 799-9000'),
		(10, N'Martha''s Vineyard Hospital', N'1 Hospital Road, P.O. Box 1477', N'Oak Bluffs', N'MA', N'(508) 693-0410'),
		(11, N'New England Baptist Hospital, Part of Beth Israel Lahey Health', N'125 Parker Hill Avenue', N'Boston', N'MA', N'(617) 754-5800'),
		(12, N'Tufts Medical Center', N'800 Washington Street', N'Boston', N'MA', N'(617) 636-5000'),
		(13, N'Carney Hospital', N'2100 Dorchester Avenue', N'Dorchester', N'MA', N'(617) 296-4000'),
		(14, N'Shriners Hospitals for Children - Springfield', N'516 Carew Street', N'Springfield', N'MA', N'(413) 787-2000'),
		(15, N'Cambridge Health Alliance', N'1493 Cambridge Street', N'Cambridge', N'MA', N'(617) 665-1000'),
		(16, N'Homberg Infirmary', N'25 Carleton Street', N'Cambridge', N'MA', N'(617) 253-4481'),
		(17, N'Boston Medical Center', N'1 Boston Medical Center Place', N'Boston', N'MA', N'(617) 638-8000'),
		(18, N'Brigham and Women''s Faulkner Hospital', N'1153 Centre Street', N'Boston', N'MA', N'(617) 983-7000'),
		(19, N'Beth Israel Deaconess Medical Center, Part of Beth Israel Lahey Health', N'330 Brookline Avenue', N'Boston', N'MA', N'(617) 667-8000'),
		(20, N'Boston Children''s Hospital', N'300 Longwood Avenue', N'Boston', N'MA', N'(617) 355-6000'),
		(21, N'Brigham and Women''s Hospital', N'75 Francis Street', N'Boston', N'MA', N'(617) 732-5500'),
		(22, N'Dana-Farber Cancer Institute, Inc.', N'450 Brookline Avenue', N'Boston', N'MA', N'(617) 632-3000'),
		(23, N'Dr. Solomon Carter Fuller Mental Health Center', N'85 East Newton Street', N'Boston', N'MA', N'(617) 626?200'),
		(24, N'Lemuel Shattuck Hospital', N'170 Morton Street', N'Boston', N'MA', N'(617) 522-8110'),
		(25, N'Massachusetts Eye and Ear Infirmary', N'243 Charles Street', N'Boston', N'MA', N'(617) 523-7900'),
		(26, N'Shriners Hospitals for Children-Boston', N'51 Blossom Street', N'Boston', N'MA', N'(617) 722-3000'),
		(27, N'Amesbury Health Center', N'24 Morrill Place', N'Amesbury', N'MA', N'(978) 388-5353'),
		(28, N'Isham Health Center', N'180 Main Street', N'Andover', N'MA', N'(978) 749-4455'),
		(29, N'Naukeag Hospital', N'216 Lake Road', N'Ashburnham', N'MA', N'(800) 230-8764'),
		(30, N'Athol Hospital', N'2033 Main Street', N'Athol', N'MA', N'(978) 249-3511'),
		(31, N'Sturdy Memorial Hospital', N'P.O. Box 2963', N'Attleboro', N'MA', N'(508) 222-5200'),
		(32, N'Nashoba Valley Medical Center', N'200 Groton Road', N'Ayer', N'MA', N'(978) 784-9000'),
		(33, N'Edith Nourse Rogers Memorial Veterans Hospital', N'200 Springs Road', N'Bedford', N'MA', N'(781) 687-2000'),
		(34, N'McLean Hospital', N'115 Mill Street', N'Belmont', N'MA', N'(617) 855-2000'),
		(35, N'Beverly Hospital, Part of Beth Israel Lahey Health', N'85 Herrick Street', N'Beverly', N'MA', N'(978) 922-3000'),
		(36, N'Whittier Rehabilitation Hospital-Bradford', N'145 Ward Hill', N'Bradford', N'MA', N'(978) 372-8000'),
		(37, N'Encompass Health Rehabilitation Hospital of Braintree', N'250 Pond Street', N'Braintree', N'MA', N'(781) 348-2500'),
		(38, N'Franciscan Children''s', N'30 Warren Street', N'Brighton', N'MA', N'(617) 254-3800'),
		(39, N'St. Elizabeth''s Medical Center', N'736 Cambridge Street', N'Brighton', N'MA', N'(617) 789-3000'),
		(40, N'Good Samaritan Medical Center', N'235 N. Pearl Street', N'Brockton', N'MA', N'(508) 427-3000'),
		(41, N'Signature Healthcare Brockton Hospital', N'680 Centre Street', N'Brockton', N'MA', N'(508) 941-7000'),
		(42, N'VA Boston Healthcare-Brockton', N'940 Belmont Street', N'Brockton', N'MA', N'(508) 583-4500'),
		(43, N'HRI Hospital', N'227 Babcock Street', N'Brookline', N'MA', N'(617) 731-3200'),
		(44, N'Lahey Hospital & Medical Center, Part of Beth Israel Lahey Health', N'41 Mall Road, P.O. Box 541', N'Burlington', N'MA', N'(781) 744-5100'),
		(45, N'Mount Auburn Hospital, Part of Beth Israel Lahey Health', N'330 Mount Auburn Street', N'Cambridge', N'MA', N'(617) 492-3500'),
		(46, N'Spaulding Hospital for Continuing Medical Care Cambridge', N'1575 Cambridge Street', N'Cambridge', N'MA', N'(617) 876-4344'),
		(47, N'Pappas Rehabilitation Hospital for Children', N'3 Randolph Street', N'Canton', N'MA', N'(781) 828-2440'),
		(48, N'Spaulding Rehabilitation Hospital Boston', N'300 First Ave.', N'Charlestown', N'MA', N'(617) 952-5000'),
		(49, N'(Lawrence F.) Quigley Memorial Hospital', N'91 Crest Avenue', N'Chelsea', N'MA', N'(617) 884-5660'),
		(50, N'Soldiers'' Home in Chelsea', N'91 Crest Avenue', N'Chelsea', N'MA', N'(617) 884-5660'),
		(51, N'Bournewood Hospital', N'300 South Street', N'Chestnut Hill', N'MA', N'(617) 469-0300'),
		(52, N'Emerson Hospital', N'133 Old Road To 9 Acre Corner', N'Concord', N'MA', N'(978) 369-1400'),
		(53, N'New England Rehab Hospital At Danvers', N'75 Lindall Street', N'Danvers', N'MA', N'(978) 762-0679'),
		(54, N'Deerfield Academy Infirmary', N'Albany Road', N'Deerfield', N'MA', N'(413) 772-0241'),
		(55, N'TaraVista Behavioral Health Center', N'85 Patton Road', N'Devens', N'MA', N'(978) 615-5200'),
		(56, N'Spaulding Rehabilitation Hospital Cape Cod', N'311 Service Road', N'East Sandwich', N'MA', N'(508) 833-4000'),
		(57, N'Everett Hospital', N'103 Garland Street', N'Everett', N'MA', N'(617) 389-6270'),
		(58, N'Dr John C Corrigan Mental Health Center', N'49 Hillside Street', N'Fall River', N'MA', N'(508) 235-7200'),
		(59, N'Saint Anne''s Hospital', N'795 Middle Street', N'Fall River', N'MA', N'(508) 674-5741'),
		(60, N'Southcoast Hospitals Group', N'363 Highland Avenue', N'Fall River', N'MA', N'(508) 679-3131'),
		(61, N'Charlton Memorial Hospital', N'363 Highland Avenue', N'Fall River', N'MA', N'(508) 679-3131'),
		(62, N'Falmouth Hospital', N'100 Ter Heun Drive', N'Falmouth', N'MA', N'(508) 548-5300'),
		(63, N'Burbank Hospital', N'275 Nichols Road', N'Fitchburg', N'MA', N'(978) 343-5000'),
		(64, N'MetroWest Medical Center', N'115 Lincoln Street', N'Framingham', N'MA', N'(508) 383-1000'),
		(65, N'Framingham Union Hospital', N'115 Lincoln Street', N'Framingham', N'MA', N'(508) 383-1000'),
		(66, N'Heywood Hospital', N'242 Green Street', N'Gardner', N'MA', N'(978) 632-3420'),
		(67, N'Baldpate Hospital', N'83 Baldpate Road', N'Georgetown', N'MA', N'(978) 352-2131'),
		(68, N'Addison Gilbert Hospital', N'298 Washington Street', N'Gloucester', N'MA', N'(978) 283-4000'),
		(69, N'Fairview Hospital', N'29 Lewis Avenue', N'Great Barrington', N'MA', N'(413) 528-0790'),
		(70, N'Baystate Franklin Medical Center', N'164 High Street', N'Greenfield', N'MA', N'(413) 773-0211'),
		(71, N'Groton School Infirmary', N'282 Farmers Row, PO BOX 991', N'Groton', N'MA', N'(978) 448-2844'),
		(72, N'Whittier Pavilion', N'76 Summer Street', N'Haverhill', N'MA', N'(978) 373-8222'),
		(73, N'Holyoke Medical Center', N'575 Beech Street', N'Holyoke', N'MA', N'(413) 534-2500'),
		(74, N'Providence Behavioral Health Hospital', N'1233 Main Street', N'Holyoke', N'MA', N'(413) 536-5111'),
		(75, N'Cape Cod Hospital', N'27 Park Street', N'Hyannis', N'MA', N'(508) 771-1800'),
		(76, N'Arbour Hospital', N'49 Robinwood Avenue', N'Jamaica Plain', N'MA', N'(617) 522-4400'),
		(77, N'VA Boston Healthcare-Jamaica Plain', N'150 S. Huntington Avenue', N'Jamaica Plain', N'MA', N'(617) 232-9500'),
		(78, N'Lawrence General Hospital', N'1 General Street', N'Lawrence', N'MA', N'(978) 683-4000'),
		(79, N'VA Central Western Massachusetts Healthcare System', N'421 North Main Street', N'Leeds', N'MA', N'(413) 584-4040'),
		(80, N'UMass Memorial HealthAlliance-Clinton Hospital', N'60 Hospital Rd.', N'Leominster', N'MA', N'(978) 466-2000'),
		(81, N'Leominister Hospital', N'60 Hospital Road', N'Leominster', N'MA', N'(978) 466-2000'),
		(82, N'Lowell General Hospital', N'295 Varnum Avenue', N'Lowell', N'MA', N'(978) 937-6000'),
		(83, N'Saints Medical Center', N'1 Hospital Drive', N'Lowell', N'MA', N'(978) 458-1411'),
		(84, N'Encompass Health Rehabilitation Hospital of Western Massachusetts', N'222 State Street', N'Ludlow', N'MA', N'(413) 308-3300'),
		(85, N'BayRidge Hospital', N'60 Granite Street', N'Lynn', N'MA', N'(781) 599-9200'),
		(86, N'NSMC Union Hospital', N'500 Lynnfield Street', N'Lynn', N'MA', N'(781) 581-9200'),
		(87, N'UMass Memorial Marlborough Hospital', N'157 Union Street', N'Marlborough', N'MA', N'(508) 481-5000'),
		(88, N'MelroseWakefield Healthcare (hospital)', N'170 Governors Avenue', N'Medford', N'MA', N'(781) 306-6000'),
		(89, N'Lawrence Memorial Hospital', N'170 Governors Avenue', N'Medford', N'MA', N'(781) 306-6000'),
		(90, N'Melrose-Wakefield Hospital', N'585 Lebanon Street', N'Melrose', N'MA', N'(781) 979-3000'),
		(91, N'Holy Family Hospital', N'70 East Street', N'Methuen', N'MA', N'(978) 687-0151'),
		(92, N'High Point Hospital', N'52 Oak Street', N'Middleboro', N'MA', N'(774) 213-8400'),
		(93, N'Beth Israel Deaconess Hospital-Milton, Part of Beth Israel Lahey Health', N'199 Reedsdale Road', N'Milton', N'MA', N'(617) 696-4600'),
		(94, N'Nantucket Cottage Hospital', N'57 Prospect Street', N'Nantucket', N'MA', N'(508) 825-8100'),
		(95, N'Leonard Morse Hospital', N'67 Union Street', N'Natick', N'MA', N'(508) 650-7000'),
		(96, N'Beth Israel Deaconess Hospital-Needham, Part of Beth Israel Lahey Health', N'148 Chestnut Street', N'Needham', N'MA', N'(781) 453-3000'),
		(97, N'High Point Treatment Center, Inc.', N'100 North Front Street', N'New Bedford', N'MA', N'(508) 997-0475'),
		(98, N'St. Luke''s Hospital', N'101 Page Street', N'New Bedford', N'MA', N'(508) 997-1515'),
		(99, N'Vibra Hospital of Southeastern Massachusetts', N'4499 Acushnet Avenue', N'New Bedford', N'MA', N'(508) 995-6900'),
		(100, N'Anna Jaques Hospital, Part of Beth Israel Lahey Health', N'25 Highland Avenue', N'Newburyport', N'MA', N'(978) 463-1000'),
		(101, N'Newton-Wellesley Hospital', N'2014 Washington Street', N'Newton', N'MA', N'(617) 243-6000'),
		(102, N'Southcoast Behavioral Health Hospital', N'581 Faunce Corner Road', N'North Dartmouth', N'MA', N'(508) 809-4487'),
		(103, N'Cooley Dickinson Health (Hospital)', N'30 Locust Street', N'Northampton', N'MA', N'(413) 582-2000'),
		(104, N'Norwood Hospital', N'800 Washington Street', N'Norwood', N'MA', N'(781) 769-4000'),
		(105, N'Baystate Wing Hospital', N'40 Wright Street', N'Palmer', N'MA', N'(413) 283-7651'),
		(106, N'Lahey Medical Center', N'1 Essex Center Drive', N'Peabody', N'MA', N'(978) 538-4000'),
		(107, N'Pembroke Hospital', N'199 Oak Street', N'Pembroke', N'MA', N'(781) 829-7000'),
		(108, N'Hillcrest Hospital', N'165 Tor Court', N'Pittsfield', N'MA', N'(413) 443-4761'),
		(109, N'Beth Israel Deaconess Hospital-Plymouth, Part of Beth Israel Lahey Health', N'275 Sandwich Street', N'Plymouth', N'MA', N'(508) 746-2000'),
		(110, N'High Point Treatment', N'1233 State Road', N'Plymouth', N'MA', N'(508) 224-7701'),
		(111, N'Pocasset Mental Health Center', N'830 County Road', N'Pocasset', N'MA', N'(508) 564-9600'),
		(112, N'Steward Satellite ER Facility-Quincy', N'114 Whitwell Street', N'Quincy', N'MA', N'(617) 773-6100'),
		(113, N'Vibra Hospital of Western MA,Central Cam', N'111 Huntoon Memorial Highway', N'Rochdale', N'MA', N'(508) 892-6000'),
		(114, N'Hebrew Rehabilitation Center', N'1200 Centre Street', N'Roslindale', N'MA', N'(617) 363-8000'),
		(115, N'Fuller Hospital', N'200 May Street', N'S. Attleboro', N'MA', N'(508) 761-8500'),
		(116, N'North Shore Medical Center (NSMC)', N'81 Highland Avenue', N'Salem', N'MA', N'(978) 741-1200'),
		(117, N'NSMC Salem Hospital', N'81 Highland Avenue', N'Salem', N'MA', N'(978) 741-1200'),
		(118, N'Somerville Hospital', N'33 Tower Street', N'Somerville', N'MA', N'(617) 591-4500'),
		(119, N'South Shore Hospital', N'55 Fogg Road', N'South Weymouth', N'MA', N'(781) 624-8000'),
		(120, N'Harrington Hospital', N'100 South Street', N'Southbridge', N'MA', N'(508) 765-9771'),
		(121, N'Vibra Hospital of Western Massachusetts', N'1400 State Street', N'Springfield', N'MA', N'(413) 787-6700'),
		(122, N'Austen Riggs Center', N'25 Main Street', N'Stockbridge', N'MA', N'(800) 517-4447'),
		(123, N'Curahealth Hospital Stoughton', N'909 Sumner Street, First Floor', N'Stoughton', N'MA', N'(781) 297-8200'),
		(124, N'New England Sinai Hospital', N'150 York Street', N'Stoughton', N'MA', N'(781) 344-0600'),
		(125, N'Morton Hospital', N'88 Washington Street', N'Taunton', N'MA', N'(508) 828-7000'),
		(126, N'Taunton State Hospital', N'PO Box 4007, 60 Hodges Avenue', N'Taunton', N'MA', N'(508) 977-3000'),
		(127, N'Tewksbury Hospital', N'365 East Street', N'Tewksbury', N'MA', N'(978) 851-7321'),
		(128, N'Walden Behavioral Care, LLC', N'51 Sawyer Road', N'Waltham', N'MA', N'(781) 647-6700'),
		(129, N'Tobey Hospital', N'43 High Street', N'Wareham', N'MA', N'(508) 295-0880'),
		(130, N'VA Boston Healthcare System', N'1400 VFW Parkway', N'West Roxbury', N'MA', N'(617) 323-7700'),
		(131, N'New England Recovery Center', N'153 Oak Street', N'Westborough', N'MA', N'(855) 774-0744'),
		(132, N'Westborough Behavioral Healthcare Hospital', N'300 Friberg Parkway', N'Westborough', N'MA', N'(877) 201-1583'),
		(133, N'Whittier Rehabilitation Hospital-Westborough', N'150 Flanders Road, P.O. Box 1250', N'Westborough', N'MA', N'(508) 870-2222'),
		(134, N'Baystate Noble Hospital', N'115 W. Silver St, P.O. Box 1634', N'Westfield', N'MA', N'(413) 568-2811'),
		(135, N'Western Massachusetts Hospital', N'91 East Mountain Road', N'Westfield', N'MA', N'(413) 562-4131'),
		(136, N'Winchester Hospital, Part of Beth Israel Lahey Health', N'41 Highland Avenue', N'Winchester', N'MA', N'(781) 729-9000'),
		(137, N'Encompass Health Rehabilitation Hospital of New England', N'2 Rehabilitation Way', N'Woburn', N'MA', N'(781) 935-5050'),
		(138, N'Fairlawn Rehabilitation Hospital, An Affiliate of Encompass Health', N'189 May Street', N'Worcester', N'MA', N'(508) 791-6351'),
		(139, N'Hospital for Behavioral Medicine', N'100 Century Drive', N'Worcester', N'MA', N'(844) 319-0000'),
		(140, N'Saint Vincent Hospital', N'123 Summer Street', N'Worcester', N'MA', N'(508) 363-5000'),
		(141, N'UMass Memorial Medical Center', N'119 Belmont Street', N'Worcester', N'MA', N'(508) 334-1000'),
		(142, N'UMass Memorial Medical Center-University', N'55 Lake Avenue North', N'Worcester', N'MA', N'(508) 334-1000'),
		(143, N'UMass Memorial Medical Center-Memorial', N'119 Belmont Street', N'Worcester', N'MA', N'(508) 334-1000'),
		(144, N'UMass Memorial Medical Center-Hahneman', N'281 Lincoln Street', N'Worcester', N'MA', N'(508) 334-1000'),
		(145, N'Worcester Recovery Center and Hospital', N'309 Belmont Street', N'Worcester', N'MA', N'(508) 368-4000')


INSERT [dbo].[Item] ([ItemID], [ItemName], [Price], [Brand], [Manufacturer], [ShelfLife], [ProductionDate], [ProductionPlace])
	VALUES 
		(1, N'Thermometer', 10, N'AOR', N'Lonza', CAST(N'2022-01-01' AS Date), CAST(N'2020-01-01' AS Date), N'Morristown'),
		(2, N'Syringe', 15, N'AOR', N'Lonza', CAST(N'2022-02-01' AS Date), CAST(N'2020-02-01' AS Date), N'Morristown'),
		(3, N'Oxygen tube', 50, N'AOR', N'Lonza', CAST(N'2022-03-01' AS Date), CAST(N'2020-03-01' AS Date), N'Morristown'),
		(4, N'Shadowless', 20, N'DEC', N'Patheon', CAST(N'2022-04-01' AS Date), CAST(N'2020-04-01' AS Date), N'Durham'),
		(5, N'Operation wn', 30, N'DEC', N'Patheon', CAST(N'2022-05-01' AS Date), CAST(N'2020-05-01' AS Date), N'Durham'),
		(6, N'Overalls', 45, N'DEC', N'Patheon', CAST(N'2022-06-01' AS Date), CAST(N'2020-06-01' AS Date), N'Durham'),
		(7, N'Mask', 2, N'APP', N'Pfizer', CAST(N'2022-07-01' AS Date), CAST(N'2020-07-01' AS Date), N'New York'),
		(8, N'Ventilator', 66, N'APP', N'Pfizer', CAST(N'2022-08-01' AS Date), CAST(N'2020-08-01' AS Date), N'New York'),
		(9, N'Defibrillator', 128, N'APP', N'Pfizer', CAST(N'2022-09-01' AS Date), CAST(N'2020-09-01' AS Date), N'New York'),
		(10, N'Hyperbaric oxygen chamber', 258, N'JOI', N'AbbVie', CAST(N'2022-10-01' AS Date), CAST(N'2020-10-01' AS Date), N'Chica')


INSERT [dbo].[Manager] ([ManagerID], [CharityID], [FirstName], [LastName], [BirthDate], [Gender], [Phone], [Email])
	VALUES
		(1, 1, N'Didier', N'Queloz', CAST(N'1966-02-23' AS Date), N'Male', N'7075204567', N'didier@gmail.com'),
		(2, 1, N'Reinhard', N'Genzel', CAST(N'1952-03-24' AS Date), N'Male', N'8578421204', N'reinhard@gmail.com'),
		(3, 2, N'Andrea', N'Ghez', CAST(N'1965-06-16' AS Date), N'Female', N'8573032666', N'andrea@gmail.com'),
		(4, 4, N'Emmanuelle', N'Charpentier', CAST(N'1968-12-11' AS Date), N'Female', N'7548974561', N'emma@gmail.com'),
		(5, 5, N'Jennifer ', N'Doudna', CAST(N'1964-02-19' AS Date), N'Female', N'8749854687', N'jennifer@gmail.com'),
		(6, 6, N'Peter', N'Handke', CAST(N'1942-12-06' AS Date), N'Male', N'5746587995', N'peter@gmail.com'),
		(7, 7, N'Esther', N'Duflo', CAST(N'1972-10-25' AS Date), N'Female', N'7568795226', N'esther@gmail.com'),
		(8, 7, N'Abhijit', N'Banerjee', CAST(N'1961-02-21' AS Date), N'Male', N'6574128974', N'abhijit@gmail.com'),
		(9, 9, N'Michael', N'Kremer', CAST(N'1964-11-12' AS Date), N'Male', N'8745269124', N'michael@gmail.com'),
		(10, 9, N'Olga', N'Tokarczuk', CAST(N'1962-01-29' AS Date), N'Female', N'6565885542', N'olga@gmail.com')

INSERT [dbo].[Storage_List] ([ListID], [ItemID], [WareHouseID], [StorageTime], [ItemQuantity]) 
	VALUES
		(1, 1, 1, CAST(N'2020-11-01' AS Date), 10000),
		(2, 2, 2, CAST(N'2020-11-01' AS Date), 10000),
		(3, 3, 3, CAST(N'2020-11-01' AS Date), 10000),
		(4, 4, 4, CAST(N'2020-11-02' AS Date), 5000),
		(5, 5, 5, CAST(N'2020-11-02' AS Date), 4500),
		(6, 6, 6, CAST(N'2020-11-02' AS Date), 6666),
		(7, 7, 7, CAST(N'2020-11-03' AS Date), 2345),
		(8, 8, 8, CAST(N'2020-11-03' AS Date), 5678),
		(9, 9, 9, CAST(N'2020-11-03' AS Date), 12345),
		(10, 10, 10, CAST(N'2020-11-04' AS Date), 6000)

INSERT [dbo].[Transform_Record] ([TransformRecordID], [CharityID], [DriverID], [ItemID], [WarehouseID], [ItemName], [Quantity], [CreateTime], [Status]) 
	VALUES
		(1, 1, 1, 1, 1, N'Thermometer', 4000, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'Completed'),
		(2, 2, 2, 2, 2, N'Syrin', 3000, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'Completed'),
		(3, 3, 3, 3, 3, N'Oxygen tube', 500, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'Completed'),
		(4, 4, 4, 4, 4, N'Shadowless lamp', 2000, CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'Completed'),
		(5, 5, 5, 5, 5, N'Operating wn', 800, CAST(N'2020-06-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(6, 6, 6, 6, 6, N'Overalls', 3000, CAST(N'2020-07-01T00:00:00.000' AS DateTime), N'Completed'),
		(7, 7, 7, 7, 7, N'Mask', 50000, CAST(N'2020-08-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(8, 8, 8, 8, 8, N'Ventiulator', 3000, CAST(N'2020-09-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(9, 9, 9, 9, 9, N'Defibrillator', 3600, CAST(N'2020-10-01T00:00:00.000' AS DateTime), N'Completed'),
		(10, 10, 10, 10, 10, N'Hyperbaric oxygen chamber', 480, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(11, 1, 1, 2, 2, N'Syrin', 10000, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'Completed'),
		(12, 1, 1, 1, 1, N'Thermometer', 4000, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'Completed'),
		(13, 1, 2, 2, 2, N'Syrin', 3000, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'Completed'),
		(14, 1, 3, 3, 3, N'Oxygen tube', 50000, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'Completed'),
		(15, 2, 4, 4, 4, N'Shadowless lamp', 2000, CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'Completed'),
		(16, 2, 5, 5, 5, N'Operating wn', 900, CAST(N'2020-06-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(17, 2, 2, 1, 1, N'Thermometer', 4000, CAST(N'2020-02-01T00:00:00.000' AS DateTime), N'Completed'),
		(18, 2, 3, 2, 2, N'Syrin', 10000, CAST(N'2020-03-01T00:00:00.000' AS DateTime), N'Completed'),
		(19, 2, 4, 3, 3, N'Oxygen tube', 9000, CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'Completed'),
		(20, 2, 5, 6, 6, N'Overalls', 3000, CAST(N'2020-07-01T00:00:00.000' AS DateTime), N'Completed'),
		(21, 1, 1, 2, 4, N'Shadowless lamp', 366, CAST(N'2020-07-01T00:00:00.000' AS DateTime), N'Completed'),
		(22, 3, 3, 3, 6, N'Overalls', 3000, CAST(N'2020-07-01T00:00:00.000' AS DateTime), N'Completed'),
		(23, 3, 3, 3, 10, N'Hyperbaric oxygen chamber', 200, CAST(N'2020-11-01T00:00:00.000' AS DateTime), N'Not Completed'),
		(24, 4, 4, 4, 8, N'Ventiulator', 3000, CAST(N'2020-09-01T00:00:00.000' AS DateTime), N'Not Completed')

INSERT [dbo].[Warehouse] ([WarehouseID], [UnitNumber], [StreetName], [City], [ZipCode]) 
	VALUES
		(1, N'105', N'360 Huntington Ave', N'Boston', N'02115'),
		(2, N'101', N'317 Bay State Road', N'Boston', N'02215'),
		(3, N'301', N'114 Mt. Auburn St.', N'Cambridge', N'02138'),
		(4, N'201', N'419 Boston Ave', N'Medford', N'02155'),
		(5, N'507', N'415 South St', N'Waltham', N'02453'),
		(6, N'407', N'N1 College St', N'Worcester', N'01610'),
		(7, N'109', N'140 Commonwealth Avenue', N'Chestnut Hill', N'02467'),
		(8, N'308', N'106 Central St ', N'Wellesley', N'02481'),
		(9, N'111', N'285 Old Westport Rd ', N'North Dartmouth', N'02747'),
		(10, N'241', N'591 Springs Rd', N'Bedford', N'01730')



--Add Foreign Key

ALTER TABLE [dbo].[AfterCheck_Record]  WITH CHECK ADD FOREIGN KEY([BackOfficerID]) 
REFERENCES [dbo].[BackOfficer] ([BackOfficerID])

ALTER TABLE [dbo].[AfterCheck_Record]  WITH CHECK ADD FOREIGN KEY([CharityID])
REFERENCES [dbo].[Charity] ([CharityID])

ALTER TABLE [dbo].[AfterCheck_Record]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[BackOfficer]  WITH CHECK ADD  CONSTRAINT [FK_BackOfficer_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([HospitalID])

ALTER TABLE [dbo].[BackOfficer] CHECK CONSTRAINT [FK_BackOfficer_Hospital]

ALTER TABLE [dbo].[Demand_Record]  WITH CHECK ADD  CONSTRAINT [FK_Demand_Record_BackOfficer] FOREIGN KEY([BackOfficerID])
REFERENCES [dbo].[BackOfficer] ([BackOfficerID])

ALTER TABLE [dbo].[Demand_Record] CHECK CONSTRAINT [FK_Demand_Record_BackOfficer]

ALTER TABLE [dbo].[Demand_Record]  WITH CHECK ADD  CONSTRAINT [FK_Demand_Record_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])

ALTER TABLE [dbo].[Demand_Record] CHECK CONSTRAINT [FK_Demand_Record_Doctor]

ALTER TABLE [dbo].[Demand_Record]  WITH CHECK ADD  CONSTRAINT [FK_Demand_Record_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[Demand_Record] CHECK CONSTRAINT [FK_Demand_Record_Item]

ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Doctor] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[Doctor] ([DoctorID])

ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Doctor]

ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Doctor_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([HospitalID])

ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FK_Doctor_Hospital]

ALTER TABLE [dbo].[Donation]  WITH CHECK ADD FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([DonorID])

ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Donor] FOREIGN KEY([DonorID])
REFERENCES [dbo].[Donor] ([DonorID])

ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Donor]

ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Item]

ALTER TABLE [dbo].[Donation]  WITH CHECK ADD  CONSTRAINT [FK_Donation_Manager] FOREIGN KEY([ManageID])
REFERENCES [dbo].[Manager] ([ManagerID])

ALTER TABLE [dbo].[Donation] CHECK CONSTRAINT [FK_Donation_Manager]

ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Charity] FOREIGN KEY([CharityID])
REFERENCES [dbo].[Charity] ([CharityID])

ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Charity]

ALTER TABLE [dbo].[Evaluation_Form]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_Form_AfterCheck_Record] FOREIGN KEY([CheckRecordID])
REFERENCES [dbo].[AfterCheck_Record] ([CheckRecordID])

ALTER TABLE [dbo].[Evaluation_Form] CHECK CONSTRAINT [FK_Evaluation_Form_AfterCheck_Record]

ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([CharityID])
REFERENCES [dbo].[Charity] ([CharityID])

ALTER TABLE [dbo].[Storage_List]  WITH CHECK ADD  CONSTRAINT [FK_Storage_List_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[Storage_List] CHECK CONSTRAINT [FK_Storage_List_Item]

ALTER TABLE [dbo].[Storage_List]  WITH CHECK ADD  CONSTRAINT [FK_Storage_List_Storage_List] FOREIGN KEY([WareHouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])

ALTER TABLE [dbo].[Storage_List] CHECK CONSTRAINT [FK_Storage_List_Storage_List]

ALTER TABLE [dbo].[Transform_Record]  WITH CHECK ADD FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[Transform_Record]  WITH CHECK ADD  CONSTRAINT [FK_Transform_Record_Charity] FOREIGN KEY([CharityID])
REFERENCES [dbo].[Charity] ([CharityID])

ALTER TABLE [dbo].[Transform_Record] CHECK CONSTRAINT [FK_Transform_Record_Charity]

ALTER TABLE [dbo].[Transform_Record]  WITH CHECK ADD  CONSTRAINT [FK_Transform_Record_Driver] FOREIGN KEY([DriverID])
REFERENCES [dbo].[Driver] ([DriverID])

ALTER TABLE [dbo].[Transform_Record] CHECK CONSTRAINT [FK_Transform_Record_Driver]

ALTER TABLE [dbo].[Transform_Record]  WITH CHECK ADD  CONSTRAINT [FK_Transform_Record_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[Item] ([ItemID])

ALTER TABLE [dbo].[Transform_Record] CHECK CONSTRAINT [FK_Transform_Record_Item]

ALTER TABLE [dbo].[Transform_Record]  WITH CHECK ADD  CONSTRAINT [FK_Transform_Record_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([WarehouseID])

ALTER TABLE [dbo].[Transform_Record] CHECK CONSTRAINT [FK_Transform_Record_Warehouse]
GO


--=============View Create=============--

--view1--
--This view shows details of donor's donation 
CREATE VIEW vwDonorDonation AS SELECT dr.FirstName, dr.LastName, temp.ItemName, temp.Quantity, temp.DonationTime
From Donor dr
Join 
(SELECT dn.ItemID as id, dn.Quantity, dn.DonationTime, dn.DonorID, it.ItemID, it.ItemName
From Donation dn
Join Item it
On it.ItemID = dn.ItemID
) temp
On dr.DonorID = temp.DonorID;

GO
--Execute the following line to see the Donation View
--SELECT * FROM vwDonorDonation;

--view2--
--This view shows all aspect about doctor's demand 
CREATE VIEW vwDoctorsDemand AS SELECT doc.FirstName as Doctor_FN, doc.LastName as Doctor_LN, temp1.ItemName, temp1.Quantity, temp1.CreateTime, temp1.Status,
temp1.DFN as Driver_FN, temp1.DLN as Driver_LN
From Doctor doc
Join 
 (Select dr.DoctorID, dr.ItemName, dr.Quantity, dr.CreateTime, dr.Status, dr.ItemID as ITid, temp2.ItemID, temp2.DriverID, temp2.FirstName as DFN, temp2.LastName as DLN
 From Demand_Record dr
 Join(
  Select tr.DriverID as Did, tr.ItemID, der.DriverID, der.FirstName, der.LastName
  From Transform_Record tr
  Join Driver der
  On der.DriverID = tr.DriverID
  )temp2
 On dr.ItemID = temp2.ItemID
 ) temp1
On doc.DoctorID = temp1.DoctorID;

GO
--Execute the following line to see the Doctor's Demand View
--SELECT * FROM vwDoctorsDemandNew;


--======(requirement1) is before insert data======--

--=============Age Compute (requirement2)=============--

--Compute-Age Function
CREATE FUNCTION AGE(@DateOfBirth AS DATETIME)
RETURNS INT
AS
BEGIN
DECLARE @Years AS INT
DECLARE @BirthdayDate AS DATETIME
DECLARE @Age AS INT
--Calculate difference in years
SET @Years = DATEDIFF(YY,@DateOfBirth,GETDATE())
--Add years to DateOfBirth
SET @BirthdayDate = DATEADD(YY,@Years,@DateOfBirth)
--Subtract a year if birthday is after today
SET @Age = @Years -
CASE
WHEN @BirthdayDate>GETDATE() THEN 1
ELSE 0
END
--Return the result
RETURN @Age
END
GO

--Test
SELECT Doctor.DoctorID, Doctor.FirstName, Doctor.LastName, Doctor.BirthDate, 
GETDATE() as [Today], dbo.AGE(Doctor.BirthDate) AS [Age]
FROM dbo.Doctor
GO

SELECT BackOfficer.BackOfficerID, BackOfficer.FirstName, BackOfficer.LastName, BackOfficer.BirthDate, 
GETDATE() as [Today], dbo.AGE(BackOfficer.BirthDate) AS [Age]
FROM dbo.BackOfficer
GO

SELECT Donor.DonorID, Donor.FirstName, Donor.LastName, Donor.BirthDate, 
GETDATE() as [Today], dbo.AGE(Donor.BirthDate) AS [Age]
FROM dbo.Donor
GO

SELECT Driver.DriverID, Driver.FirstName, Driver.LastName, Driver.BirthDate, 
GETDATE() as [Today], dbo.AGE(Driver.BirthDate) AS [Age]
FROM dbo.Driver
GO

SELECT Manager.ManagerID, Manager.FirstName, Manager.LastName, Manager.BirthDate, 
GETDATE() as [Today], dbo.AGE(Manager.BirthDate) AS [Age]
FROM dbo.Manager
GO


--=============Check Constraint (requirement3)=============--
--Check whether the donated item is expired, if it expires, it will not be entered
CREATE FUNCTION CheckExpired (@ItemID INT )
RETURNS INT
AS
 BEGIN
 DECLARE @IsExpired INT
 IF EXISTS(SELECT 1 
    FROM Item AS e 
    WHERE e.ShelfLife < GETDATE() AND e.ItemID = @ItemID) 
 SELECT @IsExpired = 1 ELSE SELECT @IsExpired = 0;
 RETURN @IsExpired;
 END;
GO

ALTER TABLE Item ADD CONSTRAINT CheckIFExpired CHECK (dbo.CheckExpired(ItemID) = 0);
GO

