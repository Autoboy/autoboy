USE [master]
GO
/****** Object:  Database [Autoboy]    Script Date: 10/9/2014 9:22:13 PM ******/
CREATE DATABASE [Autoboy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Autoboy', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\Autoboy.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Autoboy_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS2012\MSSQL\DATA\Autoboy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Autoboy] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [Autoboy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Autoboy] SET  MULTI_USER 
GO
ALTER DATABASE [Autoboy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Autoboy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Autoboy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Autoboy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Autoboy]
GO
/****** Object:  Table [dbo].[AccountTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BookingTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarTbl](
	[ChassisNo] [varchar](max) NOT NULL,
	[PlateNo] [varchar](7) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[Status] [varchar](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CommentTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocTypeTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InsuranceDocumentTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceTbl](
	[InvoiceID] [int] NOT NULL,
	[Qty] [int] NULL,
	[TransactionNumber] [int] NULL,
	[PaymentMethod] [varchar](50) NULL,
	[UID] [int] NULL,
 CONSTRAINT [PK_InvoiceTbl] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ModelTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderTbl](
	[OrderID] [int] NOT NULL,
	[EstCost] [decimal](6, 2) NOT NULL,
	[TransactionNumber] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[ChassisNo] [varchar](max) NOT NULL,
	[TimeStart] [datetime] NOT NULL,
	[EstTime] [int] NOT NULL,
	[TimeEnd] [datetime] NULL,
	[isActive] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[PriorityNo] [int] NOT NULL,
	[isDelivery] [int] NOT NULL,
	[BookingID] [int] NULL,
 CONSTRAINT [PK_OrderTbl] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ORTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaintTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PartTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
	[Qty] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[SupplierID] [int] NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_PurchaseOrderTbl_1] PRIMARY KEY CLUSTERED 
(
	[POID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QueryTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RateTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportTypeTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceProgressTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceProgressTypeTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ServiceTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServiceTbl](
	[ServiceID] [int] NOT NULL,
	[SpecificID] [int] NULL,
	[isRepair] [int] NULL,
	[isReplace] [int] NULL,
	[isPaint] [int] NULL,
	[PaintID] [int] NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_ServiceTbl] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SpecificTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
 CONSTRAINT [PK_SpecificTbl] PRIMARY KEY CLUSTERED 
(
	[SpecificID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierPartsTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionTbl](
	[TID] [int] NOT NULL,
	[TransactionNumber] [int] NULL,
	[ServiceID] [int] NULL,
 CONSTRAINT [PK_TransactionTbl] PRIMARY KEY CLUSTERED 
(
	[TID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserTypeTbl]    Script Date: 10/9/2014 9:22:13 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Autoboy] SET  READ_WRITE 
GO
