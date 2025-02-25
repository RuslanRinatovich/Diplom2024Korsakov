USE [master]
GO
/****** Object:  Database [GasStationDB]    Script Date: 21.05.2024 17:04:20 ******/
CREATE DATABASE [GasStationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GasStationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GasStationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GasStationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\GasStationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GasStationDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GasStationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GasStationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GasStationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GasStationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GasStationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GasStationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GasStationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GasStationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GasStationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GasStationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GasStationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GasStationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GasStationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GasStationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GasStationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GasStationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GasStationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GasStationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GasStationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GasStationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GasStationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GasStationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GasStationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GasStationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GasStationDB] SET  MULTI_USER 
GO
ALTER DATABASE [GasStationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GasStationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GasStationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GasStationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GasStationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GasStationDB] SET QUERY_STORE = OFF
GO
USE [GasStationDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Info] [nvarchar](1000) NULL,
	[Address] [nvarchar](1000) NULL,
	[Phone] [nvarchar](50) NULL,
	[Site] [nvarchar](50) NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Rate] [float] NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[WorkTimeId] [int] NOT NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOrganization]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOrganization](
	[ServiceOrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
 CONSTRAINT [PK_ServicePharmacy] PRIMARY KEY CLUSTERED 
(
	[ServiceOrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTime]    Script Date: 21.05.2024 17:04:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
 CONSTRAINT [PK_WorkTime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Таиф-НК АЗС')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Лукойл')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Irbis')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Татнефть')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Башнефть')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Форт-римэкс')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (1, N'Irbis АЗС', N'"Здесь всегда можно рассчитывать на хороший выбор продуктов и удобное местоположение для заправки. Никогда не было проблем с качеством топлива или сервисом"', N'ул. Гоголя, 7, Зеленодольск, Респ. Татарстан, 422544', N'8‒800‒333‒15‒67', N'smart.azsirbis.ru', 55.8531326001844, 48.497197920461147, 5, N'1Screenshot_1.jpg', 3, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (3, N'Таиф-НК АЗС', N'Хорошая заправка и персонал культурный, качество бензина на высшем уровне!', N'ул. Гагарина, 4, Зеленодольск, Респ. Татарстан, 422550', N'8‒800‒333‒08‒10', N'taifazs.ru', 55.853516832115965, 48.572758249653162, 5, N'Screenshot_5.jpg', 1, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (4, N'Татнефть', N'', N'​Залесная улица, 2в​41', N'8‒800‒555‒59‒11', N'нет', 55.846273913379278, 48.915882655043447, 5, N'1Screenshot_4.jpg', 4, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (7, N'Форт-Римэкс ', N'​Заправочные станции', N'Столичная 45Б, Зеленодольск, Респ. Татарстан, 422550', N'+7 (843) 259‒30‒00', N'форт-римэкс.рф', 55.852026758500337, 48.569120446244177, 3, N'Screenshot_3.jpg', 6, 1)
INSERT [dbo].[Organization] ([Id], [Title], [Info], [Address], [Phone], [Site], [Latitude], [Longitude], [Rate], [Photo], [CategoryId], [WorkTimeId]) VALUES (8, N'Башнефть-розница', N'​Хорошее топливо, стараюсь заправляться только тут.', N'​​Молодёжная, 38, Респ. Татарстан, 422545', N'8‒800‒333‒10‒38', N'bashneft-azs.ru', 55.846209878559677, 48.549177492526105, 4, N'11Screenshot_2.jpg', 5, 1)
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Title]) VALUES (1, N'Были друзья')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (2, N'Расчет по картам')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (3, N'С фото')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (4, N'Круглосуточный')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (5, N'Доступно для инвалидов')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (6, N'Заправка через приложение')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (7, N'100')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (8, N'98+')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (9, N'98')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (10, N'95+')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (11, N'95')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (12, N'92+')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (13, N'92')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (14, N'80')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (15, N'Метан')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (16, N'Пропан')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (17, N'ДТ')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (18, N'Туалет')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (19, N'Автоматическая АЗС')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (20, N'Подкачка колёс')
INSERT [dbo].[Service] ([Id], [Title]) VALUES (21, N'Кофе с собой')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceOrganization] ON 

INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (132, 1, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (133, 2, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (134, 3, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (135, 4, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (136, 5, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (137, 6, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (138, 10, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (139, 11, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (140, 12, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (141, 13, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (142, 18, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (143, 20, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (144, 21, 1)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (156, 3, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (157, 5, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (158, 9, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (159, 10, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (160, 11, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (161, 12, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (162, 13, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (163, 17, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (164, 19, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (165, 21, 7)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (166, 1, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (167, 2, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (168, 3, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (169, 4, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (170, 5, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (171, 6, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (172, 11, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (173, 13, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (174, 14, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (175, 17, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (176, 21, 8)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (200, 3, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (201, 4, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (202, 5, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (203, 8, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (204, 9, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (205, 10, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (206, 11, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (207, 12, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (208, 13, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (209, 17, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (210, 21, 3)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (211, 2, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (212, 3, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (213, 4, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (214, 5, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (215, 6, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (216, 10, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (217, 11, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (218, 12, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (219, 13, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (220, 14, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (221, 17, 4)
INSERT [dbo].[ServiceOrganization] ([ServiceOrganizationId], [ServiceId], [OrganizationId]) VALUES (222, 21, 4)
SET IDENTITY_INSERT [dbo].[ServiceOrganization] OFF
GO
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'admin', N'2')
INSERT [dbo].[User] ([Username], [Password]) VALUES (N'user', N'1')
GO
SET IDENTITY_INSERT [dbo].[WorkTime] ON 

INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (1, N'Круглосуточно')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (2, N'8:00 - 21:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (3, N'9:00 - 22:00')
INSERT [dbo].[WorkTime] ([Id], [Title]) VALUES (4, N'7:00 - 24:00')
SET IDENTITY_INSERT [dbo].[WorkTime] OFF
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_Category]
GO
ALTER TABLE [dbo].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_WorkTime] FOREIGN KEY([WorkTimeId])
REFERENCES [dbo].[WorkTime] ([Id])
GO
ALTER TABLE [dbo].[Organization] CHECK CONSTRAINT [FK_Pharmacy_WorkTime]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOrganization_Organization] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServiceOrganization_Organization]
GO
ALTER TABLE [dbo].[ServiceOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ServicePharmacy_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceOrganization] CHECK CONSTRAINT [FK_ServicePharmacy_Service]
GO
USE [master]
GO
ALTER DATABASE [GasStationDB] SET  READ_WRITE 
GO
