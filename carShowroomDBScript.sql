USE [CarShowroomDB]
GO
/****** Object:  Table [dbo].[AdditionalParams]    Script Date: 24.12.2018 16:16:24 ******/
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
/****** Object:  Table [dbo].[Autos]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[CarEquipments]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[OrderParams]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[ParamsPrices]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Passwords]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[Streets]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  Table [dbo].[TestDriveRecords]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestDriveRecords](
	[UserId] [int] NOT NULL,
	[AutoId] [int] NOT NULL,
	[Time] [int] NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_TestDriveRecords] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
GO
ALTER TABLE [dbo].[TestDriveRecords] CHECK CONSTRAINT [FK_TestDriveRecords_Auto]
GO
ALTER TABLE [dbo].[TestDriveRecords]  WITH CHECK ADD  CONSTRAINT [FK_TestDriveRecords_Clients] FOREIGN KEY([UserId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[TestDriveRecords] CHECK CONSTRAINT [FK_TestDriveRecords_Clients]
GO
/****** Object:  StoredProcedure [dbo].[CountAllOrdersPrice]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAllOrdersPrice]
AS
BEGIN
	SET NOCOUNT ON;
	Select SUM(o.[TotalPrice]) as TotalMarketPrice
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	Where os.Title = 'Pending'
END
GO
/****** Object:  StoredProcedure [dbo].[CountAllOrdersPriceByBrand]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountAllOrdersPriceByBrand]
	@Brand nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	Select SUM(o.[TotalPrice]) as TotalMarketPrice
	from [dbo].[Orders] as o
	JOIN [dbo].[OrderStatuses] as os on o.StatusId = os.Id
	JOIN [dbo].[Autos] as a on a.Id = o.AutoId
	Where os.Title = 'Pending' and a.Brand = @Brand
END
GO
/****** Object:  StoredProcedure [dbo].[CreateAdditionalParams]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateAdditionalParamsPrices]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateAuto]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateCarEquipment]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateClient]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateCountry]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateLog]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrderParams]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrderStatus]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateRole]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateTestDriveRecord]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTestDriveRecord]
	@UserId int,
	@AutoId int,
	@Time int,
	@Date datetimeoffset(7)
AS
BEGIN
	SET NOCOUNT ON;

	Insert into [dbo].[TestDriveRecords] 
	(
	UserId,
	AutoId,
	[Time],
	[Date]
	)
	 Values (
	 @UserId,
	 @AutoId,
	 @Time,
	 @Date)

	 END
GO
/****** Object:  StoredProcedure [dbo].[DeleteAuto]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsByAutoId]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsById]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAdditionalParamsPricesById]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllAutos]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllClients]    Script Date: 24.12.2018 16:16:25 ******/
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
	  s.Title as StreetTitle, 
	  s.[Type] as StreetType
	from [dbo].[Clients] as u
	join [dbo].[Roles] as r on r.Id = u.RoleId
	left join [dbo].[Streets] as s on s.Id = u.StreetId

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCountries]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllOrders]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllOrdersByUser]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllRoles]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllStatuses]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllStreets]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutoByBrandAndModel]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutoById]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetClientById]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetClientByPhone]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetLogs]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPassword]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoleByTitle]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[GetStatusByTitle]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[InitialDBSetup]    Script Date: 24.12.2018 16:16:25 ******/
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
	Values ('Admin', 'Admin', '89053434334', @AdminRoleID, 0)
	End
	IF NOT EXISTS(SELECT * FROM [dbo].[Roles] WHERE Title = 'User')
	BEGIN
	Insert Into [dbo].[Roles](Title) Values('User')
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SetPassword]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateAuto]    Script Date: 24.12.2018 16:16:25 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateClient]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateClient]
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
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 24.12.2018 16:16:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateOrder]
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
/****** Object:  StoredProcedure [dbo].[UpdateOutdatedOrders]    Script Date: 24.12.2018 16:16:25 ******/
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
