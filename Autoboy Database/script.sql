USE [master]
GO
/****** Object:  Database [Autoboy]    Script Date: 10/18/2014 16:08:07 ******/
CREATE DATABASE [Autoboy] ON  PRIMARY 
( NAME = N'Autoboy', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SA\MSSQL\DATA\Autoboy.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Autoboy_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SA\MSSQL\DATA\Autoboy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Autoboy] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Autoboy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Autoboy] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Autoboy] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Autoboy] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Autoboy] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Autoboy] SET ARITHABORT OFF
GO
ALTER DATABASE [Autoboy] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Autoboy] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Autoboy] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Autoboy] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Autoboy] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Autoboy] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Autoboy] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Autoboy] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Autoboy] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Autoboy] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Autoboy] SET  DISABLE_BROKER
GO
ALTER DATABASE [Autoboy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Autoboy] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Autoboy] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Autoboy] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Autoboy] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Autoboy] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Autoboy] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Autoboy] SET  READ_WRITE
GO
ALTER DATABASE [Autoboy] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Autoboy] SET  MULTI_USER
GO
ALTER DATABASE [Autoboy] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Autoboy] SET DB_CHAINING OFF
GO
USE [Autoboy]
GO
/****** Object:  Table [dbo].[UserTypeTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypeTbl](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
 CONSTRAINT [PK_UserTypeTbl] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypeTbl] ON
INSERT [dbo].[UserTypeTbl] ([TypeID], [UserType]) VALUES (1, N'Owner')
INSERT [dbo].[UserTypeTbl] ([TypeID], [UserType]) VALUES (2, N'Secretary')
INSERT [dbo].[UserTypeTbl] ([TypeID], [UserType]) VALUES (3, N'ICM')
INSERT [dbo].[UserTypeTbl] ([TypeID], [UserType]) VALUES (4, N'Walk-in Customer')
INSERT [dbo].[UserTypeTbl] ([TypeID], [UserType]) VALUES (5, N'Insured Customer')
SET IDENTITY_INSERT [dbo].[UserTypeTbl] OFF
/****** Object:  Table [dbo].[TransactionTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTbl](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NULL,
	[ServiceID] [int] NULL,
	[FinalPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TransactionTbl] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TransactionTbl] ON
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (1, 2014101801, 1, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (2, 2014101801, 2, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (3, 2014101801, 3, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (4, 2014101801, 4, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (5, 2014101801, 5, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (6, 2014101801, 6, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (7, 2014101801, 7, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (8, 2014101801, 8, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (9, 2014101801, 9, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (10, 2014101801, 10, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (11, 0, 11, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (12, 0, 15, NULL)
INSERT [dbo].[TransactionTbl] ([TID], [TransactionNumber], [ServiceID], [FinalPrice]) VALUES (13, 0, 16, NULL)
SET IDENTITY_INSERT [dbo].[TransactionTbl] OFF
/****** Object:  Table [dbo].[SupplierTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierTbl](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier] [varchar](100) NULL,
	[Street] [varchar](100) NULL,
	[Municipality] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[EmailAddress] [varchar](50) NULL,
	[MobileNo] [varchar](11) NULL,
 CONSTRAINT [PK_SupplierTbl] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SupplierTbl] ON
INSERT [dbo].[SupplierTbl] ([SupplierID], [Supplier], [Street], [Municipality], [City], [EmailAddress], [MobileNo]) VALUES (1, N'MArvin Luzon', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierTbl] ([SupplierID], [Supplier], [Street], [Municipality], [City], [EmailAddress], [MobileNo]) VALUES (2, N'Edward Wong', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierTbl] ([SupplierID], [Supplier], [Street], [Municipality], [City], [EmailAddress], [MobileNo]) VALUES (3, N'Mike Rivera', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierTbl] ([SupplierID], [Supplier], [Street], [Municipality], [City], [EmailAddress], [MobileNo]) VALUES (4, N'Hena Chan', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SupplierTbl] ([SupplierID], [Supplier], [Street], [Municipality], [City], [EmailAddress], [MobileNo]) VALUES (5, N'Abram Limpin', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SupplierTbl] OFF
/****** Object:  Table [dbo].[SupplierPartsTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierPartsTbl](
	[RefID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[SpecificID] [int] NULL,
 CONSTRAINT [PK_SupplierPartsTbl] PRIMARY KEY CLUSTERED 
(
	[RefID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SupplierPartsTbl] ON
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (1, 1, 31)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (2, 1, 32)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (3, 2, 33)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (4, 2, 34)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (5, 3, 35)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (6, 3, 36)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (7, 4, 38)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (8, 4, 39)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (9, 5, 40)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (10, 5, 41)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (11, 1, 33)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (12, 1, 35)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (13, 1, 41)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (14, 2, 31)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (15, 2, 39)
INSERT [dbo].[SupplierPartsTbl] ([RefID], [SupplierID], [SpecificID]) VALUES (16, 3, 40)
SET IDENTITY_INSERT [dbo].[SupplierPartsTbl] OFF
/****** Object:  Table [dbo].[SpecificTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpecificTbl](
	[SpecificID] [int] IDENTITY(1,1) NOT NULL,
	[PartID] [int] NULL,
	[ModelID] [int] NULL,
	[Year] [int] NULL,
	[EstPrice] [decimal](18, 2) NULL,
	[EstTime] [int] NULL,
	[ServiceTypeID] [int] NULL,
	[PaintID] [int] NULL,
 CONSTRAINT [PK_SpecificTbl] PRIMARY KEY CLUSTERED 
(
	[SpecificID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SpecificTbl] ON
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (1, 1, 1, 1992, CAST(5000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (2, 2, 1, 1992, CAST(3000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (4, 3, 1, 1992, CAST(4000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (5, 4, 1, 1992, CAST(6000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (6, 5, 1, 1992, CAST(6000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (7, 6, 1, 1992, CAST(3000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (8, 7, 1, 1992, CAST(2000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (9, 8, 1, 1992, CAST(5000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (10, 9, 1, 1992, CAST(5000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (11, 10, 1, 1992, CAST(5000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (12, 1, 2, 2008, CAST(4000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (13, 2, 2, 2008, CAST(4000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (14, 3, 2, 2008, CAST(2500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (15, 4, 2, 2008, CAST(3500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (16, 5, 2, 2008, CAST(3500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (17, 7, 2, 2008, CAST(3500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (18, 8, 2, 2008, CAST(3500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (19, 9, 2, 2008, CAST(3500.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (20, 10, 2, 2008, CAST(5000.00 AS Decimal(18, 2)), 2, 1, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (21, 1, 4, 2012, CAST(5000.00 AS Decimal(18, 2)), 2, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (22, 2, 4, 2012, CAST(5000.00 AS Decimal(18, 2)), 2, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (23, 3, 4, 2012, CAST(3000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (24, 4, 4, 2012, CAST(3000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (25, 5, 4, 2012, CAST(3000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (26, 6, 4, 2012, CAST(3000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (27, 7, 4, 2012, CAST(3000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (28, 8, 4, 2012, CAST(6500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (29, 9, 4, 2012, CAST(6500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (30, 10, 4, 2012, CAST(8000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (31, 10, 1, 2012, CAST(8000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (32, 1, 1, 2012, CAST(7500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (33, 2, 1, 2012, CAST(7500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (34, 3, 1, 2012, CAST(6500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (35, 4, 1, 2012, CAST(8500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (36, 5, 1, 2012, CAST(8500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (37, 6, 1, 2012, CAST(8500.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (38, 7, 1, 2012, CAST(4000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (39, 8, 1, 2012, CAST(8000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (40, 9, 1, 2012, CAST(8000.00 AS Decimal(18, 2)), 5, 2, NULL)
INSERT [dbo].[SpecificTbl] ([SpecificID], [PartID], [ModelID], [Year], [EstPrice], [EstTime], [ServiceTypeID], [PaintID]) VALUES (41, 10, 1, 2012, CAST(12000.00 AS Decimal(18, 2)), 5, 2, NULL)
SET IDENTITY_INSERT [dbo].[SpecificTbl] OFF
/****** Object:  Table [dbo].[ServiceTypeTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceTypeTbl](
	[ServiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceType] [nvarchar](10) NULL,
 CONSTRAINT [PK_ServiceTypeTbl] PRIMARY KEY CLUSTERED 
(
	[ServiceTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ServiceTypeTbl] ON
INSERT [dbo].[ServiceTypeTbl] ([ServiceTypeID], [ServiceType]) VALUES (1, N'Repair')
INSERT [dbo].[ServiceTypeTbl] ([ServiceTypeID], [ServiceType]) VALUES (2, N'Replace')
INSERT [dbo].[ServiceTypeTbl] ([ServiceTypeID], [ServiceType]) VALUES (3, N'Paint')
SET IDENTITY_INSERT [dbo].[ServiceTypeTbl] OFF
/****** Object:  Table [dbo].[ServiceTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceTbl](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[SpecificID] [int] NULL,
	[PaintID] [int] NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ServiceTbl] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceTbl] ON
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (1, 31, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (2, 32, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (3, 33, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (4, 34, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (5, 35, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (6, 36, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (7, 38, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (8, 41, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (9, 40, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (10, 39, NULL, N'2')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (11, 32, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (12, 35, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (13, 35, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (14, 35, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (15, 35, NULL, N'1')
INSERT [dbo].[ServiceTbl] ([ServiceID], [SpecificID], [PaintID], [Description]) VALUES (16, 34, NULL, N'1')
SET IDENTITY_INSERT [dbo].[ServiceTbl] OFF
/****** Object:  Table [dbo].[ServiceProgressTypeTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceProgressTypeTbl](
	[SPTypeID] [int] NOT NULL,
	[ServiceProgress] [varchar](100) NULL,
 CONSTRAINT [PK_ServiceProgressTypeTbl] PRIMARY KEY CLUSTERED 
(
	[SPTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceProgressTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceProgressTbl](
	[SPID] [int] NOT NULL,
	[OrderID] [int] NULL,
	[SPTypeID] [int] NULL,
	[Date] [nchar](10) NULL,
	[Picture] [varchar](100) NULL,
 CONSTRAINT [PK_ServiceProgressTbl] PRIMARY KEY CLUSTERED 
(
	[SPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportTypeTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportTypeTbl](
	[ReportTypeID] [int] NOT NULL,
	[ReportName] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[ID] [int] NULL,
 CONSTRAINT [PK_ReportTypeTbl] PRIMARY KEY CLUSTERED 
(
	[ReportTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportTbl](
	[ReportID] [int] NOT NULL,
	[ReportTypeID] [int] NULL,
	[Report] [varchar](50) NULL,
	[UID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_ReportTbl] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RateTbl](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Rating] [int] NULL,
	[Feedback] [varchar](200) NULL,
	[RateDate] [datetime] NOT NULL,
	[UID] [int] NOT NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_RateTbl] PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QueryTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QueryTbl](
	[QueryID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](80) NULL,
	[Query] [varchar](200) NOT NULL,
	[Pic1] [varchar](max) NULL,
	[Pic2] [varchar](max) NULL,
	[Pic3] [varchar](max) NULL,
	[Docs] [varchar](max) NULL,
	[QueryDate] [datetime] NOT NULL,
	[QueryReadDate] [nchar](10) NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK_QueryTbl] PRIMARY KEY CLUSTERED 
(
	[QueryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrderTbl](
	[POID] [int] IDENTITY(1,1) NOT NULL,
	[PONumber] [int] NOT NULL,
	[Date] [datetime] NULL,
	[SpecificID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	[SupplierID] [int] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_PurchaseOrderTbl_1] PRIMARY KEY CLUSTERED 
(
	[POID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[POJOTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POJOTbl](
	[POJOID] [int] IDENTITY(1,1) NOT NULL,
	[PONumber] [int] NULL,
	[TransactionNumber] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_POJOTbl] PRIMARY KEY CLUSTERED 
(
	[POJOID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PartTbl](
	[PartID] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [varchar](100) NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_PartTbl] PRIMARY KEY CLUSTERED 
(
	[PartID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PartTbl] ON
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (1, N'Front Bumper', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (2, N'Back Bumper', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (3, N'Side Mirror', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (4, N'Fog Light', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (5, N'Tail Light', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (6, N'Head Light', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (7, N'Signal Light', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (8, N'Driver Door', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (9, N'Passenger Door', NULL)
INSERT [dbo].[PartTbl] ([PartID], [PartName], [Description]) VALUES (10, N'Wind Shield', NULL)
SET IDENTITY_INSERT [dbo].[PartTbl] OFF
/****** Object:  Table [dbo].[PaintTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaintTbl](
	[PaintID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [varchar](50) NULL,
	[SupplierID] [int] NULL,
 CONSTRAINT [PK_PaintTbl] PRIMARY KEY CLUSTERED 
(
	[PaintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORTbl](
	[ORNumber] [int] NOT NULL,
	[UID] [int] NULL,
	[TransactionNumber] [int] NULL,
	[Date] [datetime] NULL,
	[AmountPaid] [float] NULL,
	[Balance] [float] NULL,
	[TotalPrice] [float] NULL,
 CONSTRAINT [PK_ORTbl] PRIMARY KEY CLUSTERED 
(
	[ORNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTbl](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[ChassisNo] [varchar](max) NOT NULL,
	[UID] [int] NOT NULL,
	[EstTime] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[EstCost] [decimal](18, 2) NOT NULL,
	[TimeStart] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[PriorityNo] [int] NULL,
	[isDelivery] [int] NULL,
	[BookingID] [int] NULL,
	[TimeEnd] [datetime] NULL,
 CONSTRAINT [PK_OrderTbl] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[OrderTbl] ON
INSERT [dbo].[OrderTbl] ([OrderID], [TransactionNumber], [ChassisNo], [UID], [EstTime], [OrderDate], [EstCost], [TimeStart], [Status], [PriorityNo], [isDelivery], [BookingID], [TimeEnd]) VALUES (7, 2014101801, N'123456789', 8, 50, CAST(0x0000A3C800E40C9F AS DateTime), CAST(78500.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderTbl] OFF
/****** Object:  Table [dbo].[ModelTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ModelTbl](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [varchar](100) NULL,
 CONSTRAINT [PK_ModelTbl] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ModelTbl] ON
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (1, N'Toyota Altis')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (2, N'Mazda 3')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (3, N'Toyota Vios')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (4, N'Honda City')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (5, N'Honda Civic')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (6, N'Honda CRV')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (7, N'Mazda 6')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (8, N'Nissan Centra')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (9, N'Toyota Cruiser')
INSERT [dbo].[ModelTbl] ([ModelID], [ModelName]) VALUES (10, N'Nissan Navara')
SET IDENTITY_INSERT [dbo].[ModelTbl] OFF
/****** Object:  Table [dbo].[InvoiceTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceTbl](
	[InvoiceID] [int] NOT NULL,
	[TransactionNumber] [int] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[UID] [int] NULL,
 CONSTRAINT [PK_InvoiceTbl] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InsuranceDocumentTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InsuranceDocumentTbl](
	[InsuranceDocID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[License] [char](3) NULL,
	[DocID_License] [int] NULL,
	[OrderReceipt] [char](3) NULL,
	[DocID_OR] [int] NULL,
	[ORCR] [char](3) NULL,
	[DocID_ORCR] [int] NULL,
	[Affidavit] [char](3) NULL,
	[DocID_Affidavit] [int] NULL,
	[DateSubmitted] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[Photo] [varchar](max) NULL,
 CONSTRAINT [PK_InsuranceDocumentTbl] PRIMARY KEY CLUSTERED 
(
	[InsuranceDocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocumentTbl](
	[DocID] [int] NOT NULL,
	[UID] [int] NULL,
	[Date] [date] NULL,
	[DocTypeID] [int] NULL,
	[Docs] [varchar](max) NULL,
 CONSTRAINT [PK_DocumentTbl] PRIMARY KEY CLUSTERED 
(
	[DocID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocTypeTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocTypeTbl](
	[DocTypeID] [int] NOT NULL,
	[DocName] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[ID] [int] NULL,
 CONSTRAINT [PK_DocTypeTbl] PRIMARY KEY CLUSTERED 
(
	[DocTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommentTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommentTbl](
	[CommentID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[Comment] [varchar](200) NULL,
	[SPID] [int] NOT NULL,
	[DateComment] [datetime] NOT NULL,
 CONSTRAINT [PK_CommentTbl] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarTbl](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[ChassisNo] [varchar](max) NOT NULL,
	[PlateNo] [varchar](7) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_CarTbl] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CarTbl] ON
INSERT [dbo].[CarTbl] ([CarID], [ChassisNo], [PlateNo], [ModelID], [Year], [UID], [Status]) VALUES (1, N'123456789', N'UOQ 932', 1, 2012, 8, N'Active')
INSERT [dbo].[CarTbl] ([CarID], [ChassisNo], [PlateNo], [ModelID], [Year], [UID], [Status]) VALUES (2, N'123456789', N'JEW068', 7, 2013, 10, N'Active')
SET IDENTITY_INSERT [dbo].[CarTbl] OFF
/****** Object:  Table [dbo].[BookingTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingTbl](
	[BookingID] [int] NOT NULL,
	[UID] [int] NULL,
	[Date] [date] NULL,
	[isRepair] [int] NULL,
	[isReplace] [int] NULL,
	[isPaint] [int] NULL,
	[Status] [varchar](20) NULL,
 CONSTRAINT [PK_BookingTbl] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditTbl](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[LogType] [varchar](20) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AuditTbl] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AuditTbl] ON
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (1, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D7A4C8 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (2, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D7B4D9 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (3, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D801F7 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (4, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8920F AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (5, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8A732 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (6, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8AE29 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (7, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8B45A AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (8, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8BC61 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (9, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8C75D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (10, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8CCE7 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (11, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8D08D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (12, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D8EB49 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (13, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9479D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (14, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D95134 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (15, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D959B8 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (16, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D95C0F AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (17, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D96048 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (18, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9639D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (19, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D96734 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (20, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D96D51 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (21, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9A2AD AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (22, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9A9E3 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (23, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9B51D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (24, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9BB0D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (25, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9C11F AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (26, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9C3AD AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (27, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9C64D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (28, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9D094 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (29, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9D313 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (30, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9DCAF AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (31, 1, N'Add', N'Added a specification', CAST(0x0000A3C800D9F73D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (32, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA11E7 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (33, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA1496 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (34, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA1F76 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (35, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA26BA AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (36, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA2D62 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (37, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA2FB9 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (38, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA39A6 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (39, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA4254 AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (40, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA454D AS DateTime))
INSERT [dbo].[AuditTbl] ([LogID], [UID], [LogType], [Description], [LogDate]) VALUES (41, 1, N'Add', N'Added a specification', CAST(0x0000A3C800DA4B7B AS DateTime))
SET IDENTITY_INSERT [dbo].[AuditTbl] OFF
/****** Object:  Table [dbo].[AccountTbl]    Script Date: 10/18/2014 16:08:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountTbl](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [varchar](50) NULL,
	[Password] [varchar](max) NULL,
	[TypeID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[MobileNo] [varchar](11) NULL,
	[Street] [varchar](200) NULL,
	[Address] [varchar](200) NULL,
	[City] [varchar](100) NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_AccountTbl] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccountTbl] ON
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (1, N'dexteryoung@gmail.com', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', 1, N'Dex', N'Young', N'09283337465', N'123 Street', N'BF Homes', N'Paranaque', N'Active')
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (2, N'henareachan@gmail.com', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', 2, N'Hena', N'Chan', N'09273336452', N'321 That Street', N'BF Homes', N'Paranaque', N'Active')
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (3, N'jortiz@gmail.com', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', 3, N'Joaquin', N'Order', N'09264523721', N'5 Onyx', N'San Antonio', N'Pasig', N'Active')
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (4, N'sabmaca@gmail.com', N'sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==', 4, N'Sabrina', N'Maca', N'09165427382', N'5 Don Rufino', N'San Antonio', N'Pasig', N'Active')
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (5, N'mkenshin@gmail.com', NULL, 4, N'Mojako', N'Kenshin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (6, N'mkenshin@gmail.com', NULL, 4, N'Mojako', N'Kenshin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (7, N'mkenshin@gmail.com', NULL, 4, N'Mojako', N'Kenshin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (8, N'mkenshin@gmail.com', NULL, 4, N'Mojako', N'Kenshin', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (9, N'johnwong@yahoo.com', NULL, 4, N'JOHN', N'WONG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AccountTbl] ([UID], [EmailAddress], [Password], [TypeID], [FirstName], [LastName], [MobileNo], [Street], [Address], [City], [Status]) VALUES (10, N'johnwong@yahoo.com', NULL, 4, N'JOHN', N'WONG', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AccountTbl] OFF
