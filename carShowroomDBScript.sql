USE [master]
GO
/****** Object:  Database [CarShowroomDB]    Script Date: 27.12.2018 2:22:54 ******/
CREATE DATABASE [CarShowroomDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarShowroomDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CarShowroomDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarShowroomDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CarShowroomDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarShowroomDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarShowroomDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarShowroomDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarShowroomDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarShowroomDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarShowroomDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarShowroomDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarShowroomDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarShowroomDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarShowroomDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarShowroomDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarShowroomDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarShowroomDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarShowroomDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarShowroomDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarShowroomDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarShowroomDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarShowroomDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarShowroomDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarShowroomDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarShowroomDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarShowroomDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarShowroomDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarShowroomDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarShowroomDB] SET RECOVERY FULL 
GO
ALTER DATABASE [CarShowroomDB] SET  MULTI_USER 
GO
ALTER DATABASE [CarShowroomDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarShowroomDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarShowroomDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarShowroomDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarShowroomDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CarShowroomDB', N'ON'
GO
ALTER DATABASE [CarShowroomDB] SET QUERY_STORE = OFF
GO
USE [CarShowroomDB]
GO
/****** Object:  Table [dbo].[AdditionalParams]    Script Date: 27.12.2018 2:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdditionalParams](
	[Id] [int] NOT NULL,
	[WindowRaisers] [nvarchar](50) NULL,
	[ParkingSensors] [bit] NULL,
	[RearViewCamera] [bit] NULL,
	[HeatedSteeringWheel] [bit] NULL,
	[WheelDisks] [nvarchar](50) NULL,
	[AdaptiveHeadlights] [bit] NULL,
	[CabinMaterial] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdditionalParams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 27.12.2018 2:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Brand] [nvarchar](100) NOT NULL,
	[Model] [nvarchar](200) NOT NULL,
	[Price] [bigint] NOT NULL,
	[WarehouseCount] [int] NULL,
 CONSTRAINT [PK_Auto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarEquipments]    Script Date: 27.12.2018 2:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarEquipments](
	[Id] [int] NOT NULL,
	[BodyType] [nvarchar](50) NOT NULL,
	[PlacesCount] [int] NOT NULL,
	[EngineType] [nvarchar](50) NOT NULL,
	[AirConditioning] [nvarchar](50) NOT NULL,
	[DriveUnit] [nvarchar](50) NOT NULL,
	[Transmission] [nvarchar](50) NOT NULL,
	[MaxSpeed] [int] NOT NULL,
 CONSTRAINT [PK_CarEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27.12.2018 2:22:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[RoleId] [int] NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[DeliveryType] [bit] NULL,
	[StreetId] [int] NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
	[Action] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Logging] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderParams]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderParams](
	[Id] [int] NOT NULL,
	[WindowRaisers] [bit] NULL,
	[ParkingSensors] [bit] NULL,
	[RearViewCamera] [bit] NULL,
	[HeatedSteeringWheel] [bit] NULL,
	[WheelDisks] [bit] NULL,
	[AdaptiveHeadlights] [bit] NULL,
	[CabinMaterial] [bit] NULL,
 CONSTRAINT [PK_OrderParams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[AutoId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
	[TotalPrice] [bigint] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParamsPrices]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParamsPrices](
	[Id] [int] NOT NULL,
	[WindowRaisers] [bigint] NULL,
	[ParkingSensors] [bigint] NULL,
	[RearViewCamera] [bigint] NULL,
	[HeatedSteeringWheel] [bigint] NULL,
	[WheelDisks] [bigint] NULL,
	[AdaptiveHeadlights] [bigint] NULL,
	[CabinMaterial] [bigint] NULL,
 CONSTRAINT [PK_ParamsPrices] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Passwords]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passwords](
	[UserId] [int] NOT NULL,
	[Hash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Password] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Streets]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Streets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Streets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestDriveRecords]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestDriveRecords](
	[UserId] [int] NOT NULL,
	[AutoId] [int] NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_TestDriveRecords] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (17, N'qwe', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (19, N'electric', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (20, N'electronic', 1, 1, 1, N'lithium', 1, N'chromium')
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (22, N'electronic', 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (23, N'electronic', 1, 1, 1, NULL, 1, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (24, N'electronic', 1, 1, 1, NULL, 1, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (26, N'electronic', 1, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (27, N'asasd', 1, 1, NULL, NULL, 1, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (28, N'ae', NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (29, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AdditionalParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (32, NULL, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Autos] ON 

INSERT [dbo].[Autos] ([Id], [CountryId], [Brand], [Model], [Price], [WarehouseCount]) VALUES (28, 1, N'RERE', N'qweqew', 12345, 123)
INSERT [dbo].[Autos] ([Id], [CountryId], [Brand], [Model], [Price], [WarehouseCount]) VALUES (32, 1, N'q', N'123', 123, 4)
SET IDENTITY_INSERT [dbo].[Autos] OFF
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (9, N'4', 4, N'-', N'-', N'-', N'-', 200)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (10, N'-', 4, N'-', N'-', N'-', N'-', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (11, N'-', 4, N'-', N'-', N'-', N'-', 200)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (12, N'sadqew', 5, N'qwe', N'qwe', N'asd', N'asd', 13)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (13, N'Седан', 4, N'Восьмицилиндровый', N'-', N'-', N'-', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (14, N'седан', 4, N'хкхкх', N'-', N'-', N'-', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (15, N'qwe', 4, N'qwe', N'qwe', N'qwe', N'qwe', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (17, N'qwe', 4, N'qwe', N'qwe', N'qwe', N'qwe', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (19, N'sedan', 4, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (20, N'Sedan', 4, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (21, N'-', 4, N'-', N'-', N'-', N'-', 150)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (22, N'sport-car', 4, N'V8', N'-', N'-', N'-', 300)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (23, N'-', 5, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (24, N'-', 56, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (26, N'-', 4, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (27, N'-', 4, N'-', N'-', N'-', N'-', 250)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (28, N'sda', 89, N'asd', N'q', N'q', N'q', 56)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (29, N'-', 123, N'-', N'-', N'-', N'-', 120)
INSERT [dbo].[CarEquipments] ([Id], [BodyType], [PlacesCount], [EngineType], [AirConditioning], [DriveUnit], [Transmission], [MaxSpeed]) VALUES (32, N'qw', 4, N'-', N'-', N'-', N'-', 23)
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (5, N'Admin', N'Admin', NULL, 1, N'88005553535', 0, NULL)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (8, N'Vw', N'Re', NULL, 3, N'776677', 1, 2)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (9, N'Vl', N'Vl', NULL, 2, N'88005553536', 1, 1)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (10, N'hehe', N'hehe', NULL, 2, N'555555', 1, 3)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (11, N'artem', N'artem', NULL, 2, N'445544', 1, 3)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (12, N'artem', N'artem', NULL, 2, N'770077', 1, 1)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (13, N'Artem', N'heh', NULL, 2, N'77-00-77', 1, 1)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (14, N'User', N'Puser', NULL, 3, N'88005553537', 1, 1)
INSERT [dbo].[Clients] ([Id], [Name], [Surname], [Patronymic], [RoleId], [Phone], [DeliveryType], [StreetId]) VALUES (15, N'qwe', N'qwe', NULL, 2, N'22-22-22', 0, 1)
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [Title]) VALUES (1, N'Japan')
INSERT [dbo].[Countries] ([Id], [Title]) VALUES (2, N'Russia')
SET IDENTITY_INSERT [dbo].[Countries] OFF
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (4, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (5, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (6, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (7, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (8, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (9, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (12, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (13, 1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (14, 1, 1, 1, 1, NULL, 1, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (15, 1, 1, 1, 1, NULL, 1, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (16, 1, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (18, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (19, NULL, NULL, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (26, NULL, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderParams] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (28, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (18, 13, 28, 5, CAST(N'2018-12-27T14:00:00.0000000+04:00' AS DateTimeOffset), 566778)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (19, 14, 28, 5, CAST(N'2018-12-25T15:00:00.0900000+04:00' AS DateTimeOffset), 566778)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (20, 15, 32, 5, CAST(N'2018-12-30T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (21, 15, 32, 5, CAST(N'2018-12-27T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (22, 15, 32, 1, CAST(N'2018-12-27T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (23, 15, 32, 1, CAST(N'2018-12-27T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (24, 15, 32, 1, CAST(N'2018-12-27T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (25, 15, 32, 5, CAST(N'2019-01-02T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (26, 15, 32, 5, CAST(N'2019-01-03T00:00:00.0000000+04:00' AS DateTimeOffset), 1123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (27, 15, 32, 1, CAST(N'2018-12-27T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
INSERT [dbo].[Orders] ([Id], [UserId], [AutoId], [StatusId], [Date], [TotalPrice]) VALUES (28, 15, 32, 5, CAST(N'2019-01-03T00:00:00.0000000+04:00' AS DateTimeOffset), 123)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([Id], [Title]) VALUES (1, N'Pending')
INSERT [dbo].[OrderStatuses] ([Id], [Title]) VALUES (2, N'Approved')
INSERT [dbo].[OrderStatuses] ([Id], [Title]) VALUES (3, N'In Progress')
INSERT [dbo].[OrderStatuses] ([Id], [Title]) VALUES (4, N'Rejected')
INSERT [dbo].[OrderStatuses] ([Id], [Title]) VALUES (5, N'Paid')
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (17, 1233, NULL, NULL, 123, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (19, 20000, 10000, 15000, NULL, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (20, 20000, 30000, 25000, 1233, 40000, 25000, 50000)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (22, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (23, 560, 50000, 70000, 890, NULL, 4568, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (24, 12000, 15000, 16000, 14556, NULL, 17890, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (26, 20000, 15000, 25000, NULL, NULL, 15600, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (27, 15000, 14560, 55667, NULL, NULL, 13445, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (28, 560, NULL, NULL, 554433, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (29, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ParamsPrices] ([Id], [WindowRaisers], [ParkingSensors], [RearViewCamera], [HeatedSteeringWheel], [WheelDisks], [AdaptiveHeadlights], [CabinMaterial]) VALUES (32, NULL, NULL, 1000, NULL, NULL, NULL, NULL)
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (5, N'123456')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (6, N'1234')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (7, N'123456')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (8, N'1234')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (9, N'12345')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (10, N'1234')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (11, N'12345')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (12, N'1234')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (13, N'123456')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (14, N'225588')
INSERT [dbo].[Passwords] ([UserId], [Hash]) VALUES (15, N'qwe')
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Title]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([Id], [Title]) VALUES (2, N'User')
INSERT [dbo].[Roles] ([Id], [Title]) VALUES (3, N'Manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Streets] ON 

INSERT [dbo].[Streets] ([Id], [Title], [Type]) VALUES (1, N'Gvardeiskaya', N'st')
INSERT [dbo].[Streets] ([Id], [Title], [Type]) VALUES (2, N'Kirova', N'av')
INSERT [dbo].[Streets] ([Id], [Title], [Type]) VALUES (3, N'Zelenogorskaya', N'st')
SET IDENTITY_INSERT [dbo].[Streets] OFF
INSERT [dbo].[TestDriveRecords] ([UserId], [AutoId], [Date]) VALUES (12, 28, CAST(N'2018-12-25T10:00:00.7260000+04:00' AS DateTimeOffset))
INSERT [dbo].[TestDriveRecords] ([UserId], [AutoId], [Date]) VALUES (13, 28, CAST(N'2018-12-29T14:00:00.0000000+04:00' AS DateTimeOffset))
ALTER TABLE [dbo].[AdditionalParams]  WITH NOCHECK ADD  CONSTRAINT [FK_AdditionalParams_ParamsPrices] FOREIGN KEY([Id])
REFERENCES [dbo].[ParamsPrices] ([Id])
ON DELETE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[AdditionalParams] NOCHECK CONSTRAINT [FK_AdditionalParams_ParamsPrices]
GO
ALTER TABLE [dbo].[Autos]  WITH NOCHECK ADD  CONSTRAINT [FK_Auto_CarEquipment] FOREIGN KEY([Id])
REFERENCES [dbo].[CarEquipments] ([Id])
GO
ALTER TABLE [dbo].[Autos] NOCHECK CONSTRAINT [FK_Auto_CarEquipment]
GO
ALTER TABLE [dbo].[Autos]  WITH CHECK ADD  CONSTRAINT [FK_Auto_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Autos] CHECK CONSTRAINT [FK_Auto_Countries]
GO
ALTER TABLE [dbo].[Autos]  WITH NOCHECK ADD  CONSTRAINT [FK_Autos_AdditionalParams] FOREIGN KEY([Id])
REFERENCES [dbo].[AdditionalParams] ([Id])
GO
ALTER TABLE [dbo].[Autos] NOCHECK CONSTRAINT [FK_Autos_AdditionalParams]
GO
ALTER TABLE [dbo].[Clients]  WITH NOCHECK ADD  CONSTRAINT [FK_Clients_Password] FOREIGN KEY([Id])
REFERENCES [dbo].[Passwords] ([UserId])
GO
ALTER TABLE [dbo].[Clients] NOCHECK CONSTRAINT [FK_Clients_Password]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Roles]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Streets] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Streets] ([Id])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Streets]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Auto] FOREIGN KEY([AutoId])
REFERENCES [dbo].[Autos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Auto]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([UserId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_OrderParams] FOREIGN KEY([Id])
REFERENCES [dbo].[OrderParams] ([Id])
GO
ALTER TABLE [dbo].[Orders] NOCHECK CONSTRAINT [FK_Orders_OrderParams]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[OrderStatuses] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatuses]
GO
ALTER TABLE [dbo].[TestDriveRecords]  WITH CHECK ADD  CONSTRAINT [FK_TestDriveRecords_Auto] FOREIGN KEY([AutoId])
REFERENCES [dbo].[Autos] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TestDriveRecords] CHECK CONSTRAINT [FK_TestDriveRecords_Auto]
GO
ALTER TABLE [dbo].[TestDriveRecords]  WITH CHECK ADD  CONSTRAINT [FK_TestDriveRecords_Clients] FOREIGN KEY([UserId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[TestDriveRecords] CHECK CONSTRAINT [FK_TestDriveRecords_Clients]
GO
/****** Object:  StoredProcedure [dbo].[CountAllOrdersPrice]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAllOrdersPrice]
AS
BEGIN
	SET NOCOUNT ON;
	Select SUM(o.[TotalPrice]) as TotalMarketPrice,
	COUNT(o.[TotalPrice]) as OrdersCount
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	Where os.Title = 'Paid'
END
GO
/****** Object:  StoredProcedure [dbo].[CountAllOrdersPriceByBrand]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAllOrdersPriceByBrand]
AS
BEGIN
	SET NOCOUNT ON;
	Select SUM(o.[TotalPrice]) as TotalMarketPrice,
	Count(o.[TotalPrice]) as OrdersCount,
	a.Brand
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	JOIN [dbo].[Autos] as a on a.Id = o.AutoId
	Where os.Title = 'Paid'
	Group by a.Brand
END
GO
/****** Object:  StoredProcedure [dbo].[CreateAdditionalParams]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAdditionalParams]
	@WindowRaisers nvarchar(50) = null,
	@ParkingSensors bit = null,
	@RearViewCamera bit = null,
	@HeatedSteeringWheel bit = null,
	@WheelDisks nvarchar(50) = null,
	@AdaptiveHeadlights bit = null,
	@CabinMaterial nvarchar(50) = null,
	@AutoId int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[AdditionalParams] (WindowRaisers,
	ParkingSensors,
	RearViewCamera,
	HeatedSteeringWheel,
	WheelDisks,
	AdaptiveHeadlights ,
	CabinMaterial,
	Id)
	 Values (@WindowRaisers,
	@ParkingSensors,
	@RearViewCamera,
	@HeatedSteeringWheel,
	@WheelDisks,
	@AdaptiveHeadlights ,
	@CabinMaterial,
	@AutoId)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateAdditionalParamsPrices]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAdditionalParamsPrices]
	@AutoId int,
	@WindowRaisers bigint = null,
	@ParkingSensors bigint = null,
	@RearViewCamera bigint = null,
	@HeatedSteeringWheel bigint = null,
	@WheelDisks bigint = null,
	@AdaptiveHeadlights bigint = null,
	@CabinMaterial bigint = null
AS
BEGIN
	SET NOCOUNT ON;


	Insert into [dbo].[ParamsPrices] (WindowRaisers,
	ParkingSensors,
	RearViewCamera,
	HeatedSteeringWheel,
	WheelDisks,
	AdaptiveHeadlights ,
	CabinMaterial,
	Id)
	 Values (@WindowRaisers,
	@ParkingSensors,
	@RearViewCamera,
	@HeatedSteeringWheel,
	@WheelDisks,
	@AdaptiveHeadlights ,
	@CabinMaterial,
	@AutoId)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateAuto]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAuto]
	@Brand nvarchar(100),
	@Model nvarchar(200),
	@Price bigint,
	@CountryId int,
	@WarehouseCount int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Id int;

	Insert into [dbo].[Autos] ([Brand],
	Model,
	Price,
	WarehouseCount,
	CountryId)
	 Values (@Brand,
	 @Model,
	 @Price,
	 @WarehouseCount,
	 @CountryId)

	 Set @Id = (SELECT [Id] from [dbo].[Autos] Where [Brand] = @Brand AND [Model] = @Model AND [Price] = @Price);

	  Select * from [dbo].[Autos] Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CreateCarEquipment]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCarEquipment]
	@Id int,
	@BodyType nvarchar(50),
	@PlacesCount int,
	@EngineType nvarchar(50),
	@AirConditioning nvarchar(50),
	@DriveUnit nvarchar(50),
	@Transmission nvarchar(50),
	@MaxSpeed int
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[CarEquipments] 
	(Id,
	BodyType,
	PlacesCount,
	EngineType,
	AirConditioning,
	DriveUnit,
	Transmission,
	MaxSpeed
	)
	 Values (
	 @Id,
	 @BodyType,
	 @PlacesCount,
	 @EngineType,
	 @AirConditioning,
	 @DriveUnit,
	 @Transmission,
	 @MaxSpeed
	 )
END
GO
/****** Object:  StoredProcedure [dbo].[CreateClient]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateClient]
	@Name nvarchar(50),
	@Surname nvarchar(50),
	@Password nvarchar(MAX),
	@RoleId int,
	@Phone nvarchar(20),
	@DeliveryType bit = 0,
	@Patronymic nvarchar(50) = NULL,
	@StreetId int = NULL
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Id int;

	Insert into [dbo].[Clients] ([Name],
	Surname,
	RoleId,
	Phone,
	DeliveryType,
	Patronymic,
	StreetId)
	 Values (@Name,
	 @Surname,
	 @RoleId,
	 @Phone,
	 @DeliveryType,
	 @Patronymic,
	 @StreetId)

	 Set @Id = (SELECT [Id] from [dbo].[Clients] Where [Phone] = @Phone AND [Name] = @Name AND [Surname] = @Surname);

	Select u.Id, u.[Name], u.Surname, u.Patronymic, u.Phone, u.DeliveryType, r.Title as RoleTitle, s.Title as StreetTitle
	from [dbo].[Clients] as u
	join [dbo].[Roles] as r on r.Id = u.RoleId
	left join [dbo].[Streets] as s on s.Id = u.StreetId
	Where u.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CreateCountry]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateCountry]
	@Title nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Id int;

	Insert into [dbo].[Countries] (Title)
	 Values (@Title)

	Set @Id = (SELECT [Id] from [dbo].[Countries] Where [Title] = @Title);

	  Select * from [dbo].[Countries] Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CreateLog]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateLog]
	@Action nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Date datetimeoffset(7);
	Set @Date = SYSDATETIMEOFFSET();

	Insert into [dbo].[Logs] ([Action], [Date])
	 Values (@Action, @Date)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrder]
	@UserId int,
	@AutoId int,
	@StatusId int,
	@Date datetimeoffset(7),
	@TotalPrice bigint
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[Orders] 
	(
	UserId,
	AutoId,
	StatusId,
	[Date],
	TotalPrice
	)
	 Values (
	 @UserId,
	 @AutoId,
	 @StatusId,
	 @Date,
	 @TotalPrice
	 )

	 Select * from [dbo].[Orders] 
	 Where [Date] = @Date AND UserId = @UserId AND AutoId = @AutoId AND TotalPrice = @TotalPrice

	 END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrderParams]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrderParams]
	@Id int,
	@WindowRaisers bit = null,
	@ParkingSensors bit = null,
	@RearViewCamera bit = null,
	@HeatedSteeringWheel bit = null,
	@WheelDisks bit = null,
	@AdaptiveHeadlights bit = null,
	@CabinMaterial bit = null
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[OrderParams] (
	Id,
	WindowRaisers,
	ParkingSensors,
	RearViewCamera,
	HeatedSteeringWheel,
	WheelDisks,
	AdaptiveHeadlights,
	CabinMaterial)
	 Values (
	@Id,
	@WindowRaisers,
	@ParkingSensors,
	@RearViewCamera,
	@HeatedSteeringWheel,
	@WheelDisks,
	@AdaptiveHeadlights,
	@CabinMaterial)

	SELECT * from [dbo].[OrderParams]
	 Where [WindowRaisers] = @WindowRaisers AND 
	 [ParkingSensors] = @ParkingSensors AND 
	 [RearViewCamera] = @RearViewCamera And 
	 HeatedSteeringWheel = @HeatedSteeringWheel And
	 WheelDisks = @WheelDisks And
	 AdaptiveHeadlights = @AdaptiveHeadlights And
	 CabinMaterial = @CabinMaterial
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrderStatus]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrderStatus]
	@Title nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Id int;

	Insert into [dbo].[OrderStatuses] (Title)
	 Values (@Title)

	Set @Id = (SELECT [Id] from [dbo].[OrderStatuses] Where [Title] = @Title);

	  Select * from [dbo].[OrderStatuses] Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRole]
	@Title nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	Declare @Id int;

	Insert into [dbo].[Roles] (Title)
	 Values (@Title)

	Set @Id = (SELECT [Id] from [dbo].[Roles] Where [Title] = @Title);

	  Select * from [dbo].[Roles] Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[CreateTestDriveRecord]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTestDriveRecord]
	@UserId int,
	@AutoId int,
	@Date datetimeoffset(7)
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[TestDriveRecords] 
	(
	UserId,
	AutoId,
	[Date]
	)
	 Values (
	 @UserId,
	 @AutoId,
	 @Date)

	 END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAuto]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAuto]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [dbo].[Autos] Where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestDriveRecord]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestDriveRecord]
	@UserId int,
	@AutoId int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [dbo].[TestDriveRecords] Where UserId = @UserId and AutoId = @AutoId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsByAutoId]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdditionalParamsByAutoId]
	@AutoId int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[AdditionalParams]
	WHERE Id = @AutoId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsById]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdditionalParamsById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[AdditionalParams]
	WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsPricesById]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdditionalParamsPricesById]
	@AutoId int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[ParamsPrices]
	WHERE Id = @AutoId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAutos]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAutos]
AS
BEGIN
	SET NOCOUNT ON;
	Select a.Id, a.Brand, a.Model, a.Price, a.WarehouseCount,
	ce.BodyType, ce.PlacesCount, ce.EngineType, ce.AirConditioning, ce.DriveUnit, ce.Transmission, ce.MaxSpeed,
	c.Title as CountryTitle
	from [dbo].[Autos] as a
	left join [dbo].[CarEquipments] as ce on ce.Id = a.Id
	join [dbo].[Countries] as c on c.Id = a.CountryId

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllClients]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllClients]
AS
BEGIN
	SET NOCOUNT ON;
	Select u.Id, 
	 u.[Name],
	 u.Surname, 
	 u.Patronymic,
	 u.Phone, 
	 u.DeliveryType,
	  r.Title as RoleTitle,
	  r.Id as RoleId,
	  s.Title as StreetTitle, 
	  s.[Type] as StreetType
	from [dbo].[Clients] as u
	join [dbo].[Roles] as r on r.Id = u.RoleId
	left join [dbo].[Streets] as s on s.Id = u.StreetId

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCountries]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllCountries]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[Countries]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrders]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrders]
AS
BEGIN
	SET NOCOUNT ON;
	Select o.[Date],
	o.[Id],
	o.[TotalPrice],
	os.[Id] as StatusId,
	os.[Title] as StatusTitle,
	op.WindowRaisers,
	op.WheelDisks,
	op.AdaptiveHeadlights,
	op.CabinMaterial,
	op.HeatedSteeringWheel,
	op.ParkingSensors,
	op.RearViewCamera,
	a.Brand,
	a.Model,
	c.DeliveryType,
	c.[Name],
	c.Phone
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	JOIN [dbo].[OrderParams] as op on o.Id = op.Id
	JOIN [dbo].[Autos] as a on o.AutoId = a.Id
	JOIN [dbo].[Clients] as c on o.UserId = c.Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrdersByUser]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrdersByUser]
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;
	Select o.[Date],
	o.[Id],
	o.[TotalPrice],
	os.[Title] as StatusTitle,
	op.WindowRaisers,
	op.WheelDisks,
	op.AdaptiveHeadlights,
	op.CabinMaterial,
	op.HeatedSteeringWheel,
	op.ParkingSensors,
	op.RearViewCamera,
	a.Brand,
	a.Model
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	JOIN [dbo].[OrderParams] as op on o.Id = op.Id
	JOIN [dbo].[Autos] as a on o.AutoId = a.Id
	Where o.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllRoles]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[Roles]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStatuses]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStatuses]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[OrderStatuses]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllStreets]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllStreets]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[Streets]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTestDrives]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTestDrives]
AS
BEGIN
	SET NOCOUNT ON;
	Select t.[Date],
	t.[UserId],
	t.[AutoId],
	a.Brand,
	a.Model,
	c.DeliveryType,
	c.[Name],
	c.Phone
	from [dbo].[TestDriveRecords] as t
	JOIN [dbo].[Autos] as a on t.AutoId = a.Id
	JOIN [dbo].[Clients] as c on t.UserId = c.Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllTestDrivesByUser]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllTestDrivesByUser]
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;
	Select t.[Date],
	t.[UserId],
	t.[AutoId],
	a.Brand,
	a.Model
	from [dbo].[TestDriveRecords] as t
	JOIN [dbo].[Autos] as a on t.AutoId = a.Id
	Where t.UserId = @UserId
END
GO
/****** Object:  StoredProcedure [dbo].[GetAutoByBrandAndModel]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAutoByBrandAndModel]
	@Brand nvarchar(100),
	@Model nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;
	Select a.Id, a.Brand, a.Model, a.Price, a.WarehouseCount,
	ce.BodyType, ce.PlacesCount, ce.EngineType, ce.AirConditioning, ce.DriveUnit, ce.Transmission, ce.MaxSpeed,
	c.Title as CountryTitle
	from [dbo].[Autos] as a
	left join [dbo].[CarEquipments] as ce on ce.Id = a.Id
	join [dbo].[Countries] as c on c.Id = a.CountryId
	Where a.Brand = @Brand and a.Model = @Model
END
GO
/****** Object:  StoredProcedure [dbo].[GetAutoById]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAutoById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Select a.Id, a.Brand, a.Model, a.Price, a.WarehouseCount,
	ce.BodyType, ce.PlacesCount, ce.EngineType, ce.AirConditioning, ce.DriveUnit, ce.Transmission, ce.MaxSpeed,
	c.Title as CountryTitle
	from [dbo].[Autos] as a
	left join [dbo].[CarEquipments] as ce on ce.Id = a.Id
	join [dbo].[Countries] as c on c.Id = a.CountryId
	Where a.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClientById]
	@Id int
AS
BEGIN
	SET NOCOUNT ON;
	Select u.Id, u.[Name], u.Surname, u.Patronymic, u.Phone, u.DeliveryType, r.Title as RoleTitle, s.Title as StreetTitle
	from [dbo].[Clients] as u
	join [dbo].[Roles] as r on r.Id = u.RoleId
	left join [dbo].[Streets] as s on s.Id = u.StreetId
	Where u.Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetClientByPhone]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetClientByPhone]
	@Phone nvarchar(20)
AS
BEGIN
	SET NOCOUNT ON;
	Select u.Id, u.[Name], u.Surname, u.Patronymic, u.Phone, u.DeliveryType, r.Title as RoleTitle, s.Title as StreetTitle
	from [dbo].[Clients] as u
	join [dbo].[Roles] as r on r.Id = u.RoleId
	left join [dbo].[Streets] as s on s.Id = u.StreetId
	Where u.Phone = @Phone
END
GO
/****** Object:  StoredProcedure [dbo].[GetLogs]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLogs]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[Logs]
END
GO
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPassword]
	@UserId int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * from [dbo].[Passwords] as p Where p.UserId = @UserId 
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoleByTitle]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoleByTitle]
	@Title nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[Roles] as r Where r.Title = @Title 
END
GO
/****** Object:  StoredProcedure [dbo].[GetStatusByTitle]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetStatusByTitle]
	@Title nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	Select * from [dbo].[OrderStatuses]
	Where Title = @Title
END
GO
/****** Object:  StoredProcedure [dbo].[InitialDBSetup]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InitialDBSetup]
AS

BEGIN
	Declare @AdminRoleID int;
	Declare @UserRoleID uniqueidentifier;
	Declare @PasswordID uniqueidentifier;
	Declare @HashPassword nvarchar(4000);
	Declare @InitialAdminDate datetimeoffset(7);
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT * FROM [dbo].[Roles] WHERE Title = 'Admin')
	BEGIN
	
	Insert Into [dbo].[Roles](Title) Values('Admin')
	END

	Set @AdminRoleID = (SELECT [Id] from [dbo].[Roles] WHERE Title = 'Admin');

	If not exists(Select * from [dbo].[Clients] where [Name] = 'Admin')
	Begin
	Set @InitialAdminDate = SYSDATETIMEOFFSET();

	Insert Into [dbo].[Clients]
	([Name], [Surname], [Phone], [RoleId], [DeliveryType])
	Values ('Admin', 'Admin', '88005553535', @AdminRoleID, 0)
	End
	IF NOT EXISTS(SELECT * FROM [dbo].[Roles] WHERE Title = 'User')
	BEGIN
	Insert Into [dbo].[Roles](Title) Values('User')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SetPassword]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetPassword]
	@UserId int,
	@Password nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[Passwords] (UserId, [Hash])
	 Values (@UserId, @Password)
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateAuto]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAuto]
	@Id int,
	@StatusId int,
	@Date datetimeoffset(7)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Orders]
	Set StatusId = @StatusId, [Date] = @Date
	Where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateClient]
	@Id int,
	@RoleId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Clients]
	Set RoleId = @RoleId
	Where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrder]
	@Id int,
	@StatusId int
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [dbo].[Orders]
	Set StatusId = @StatusId
	Where Id = @Id
	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOutdatedOrders]    Script Date: 27.12.2018 2:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOutdatedOrders]
AS
BEGIN
	SET NOCOUNT ON;
	Declare @NowDate datetimeoffset(7)
	Set @NowDate = SYSDATETIMEOFFSET()
	UPDATE [dbo].[Orders]
	Set StatusId = 4
	Where CAST([Date] AS DATE) < CAST(@NowDate AS DATE)
	
END
GO
USE [master]
GO
ALTER DATABASE [CarShowroomDB] SET  READ_WRITE 
GO
