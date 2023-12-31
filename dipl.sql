USE [master]
GO
/****** Object:  Database [dip2]    Script Date: 13.12.2023 19:05:01 ******/
CREATE DATABASE [dip2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dip2', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\dip2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dip2_log', FILENAME = N'D:\sql2\MSSQL15.SQLEXPRESS\MSSQL\DATA\dip2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dip2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dip2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dip2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dip2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dip2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dip2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dip2] SET ARITHABORT OFF 
GO
ALTER DATABASE [dip2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dip2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dip2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dip2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dip2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dip2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dip2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dip2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dip2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dip2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dip2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dip2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dip2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dip2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dip2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dip2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dip2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dip2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dip2] SET  MULTI_USER 
GO
ALTER DATABASE [dip2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dip2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dip2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dip2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dip2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dip2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dip2] SET QUERY_STORE = OFF
GO
USE [dip2]
GO
/****** Object:  Table [dbo].[merch]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[merch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[descreption] [nvarchar](50) NOT NULL,
	[manufacturer] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_merch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NOT NULL,
	[id_status] [int] NOT NULL,
	[id_point] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[code] [int] NOT NULL,
	[cost] [int] NOT NULL,
	[discount] [int] NULL,
	[total_cost] [int] NULL,
	[delivery_days] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[point]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[point](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_point] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sostav]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sostav](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orders] [int] NOT NULL,
	[id_merch] [int] NOT NULL,
	[count] [int] NULL,
	[quantity] [int] NULL,
	[total_cost] [int] NULL,
	[discount] [int] NULL,
 CONSTRAINT [PK_sostav] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_users]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_type_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[id_type] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vhodHis]    Script Date: 13.12.2023 19:05:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vhodHis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_users] [int] NULL,
	[DateTimeLog] [datetime] NULL,
	[TypeVhod] [nvarchar](50) NULL,
 CONSTRAINT [PK_vhodHis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[merch] ON 

INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (2, N'Подушка', N'Описание подушки', N'Текстиль Профи М', 2200, 5, N'/photo/1.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (3, N'Одеяло', N'Описание одеяла', N'Текстиль Профи М', 3000, 10, N'/photo/2.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (4, N'Наволочка', N'Описание Наволочки', N'Текстиль Профи М', 700, NULL, N'/photo/3.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (6, N'Матрас', N'Детский матрас', N'Текстиль профи М', 3000, 2, N'/photo/matras.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (7, N'Ткань', N'Ткань для постельного белья', N'Текстиль Профи М ', 500, NULL, N'/photo/tkani.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (8, N'Спец одежда', N'Спецовка', N'Текстиль профи М ', 1800, 20, N'/photo/specovka.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (9, N'Полотенце', N'Детское полотенце', N'Текстиль Профи М ', 300, 2, N'/photo/polotence.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (10, N'Простыня', N'Простыня на матрас', N'Текстиль Профи М', 400, 5, N'/photo/navolochka.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (11, N'Пододеяльник', N'Пододеяльник на молнии', N'Текстиль Профи М ', 900, NULL, N'/photo/pododeyalnick.jpg')
INSERT [dbo].[merch] ([id], [name], [descreption], [manufacturer], [price], [discount], [photo]) VALUES (13, N'fbdsb', N'dsbdsb', N'dsfbdsb', 500, 20, N'/photo/matras.jpg')
SET IDENTITY_INSERT [dbo].[merch] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (1, 3, 1, 1, CAST(N'2023-12-13' AS Date), 833, 3000, 300, 2700, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (2, 3, 1, 1, CAST(N'2023-12-13' AS Date), 316, 3700, 300, 3400, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (3, 3, 1, 1, CAST(N'2023-12-13' AS Date), 793, 4300, 320, 3980, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (4, 3, 1, 1, CAST(N'2023-12-13' AS Date), 257, 5200, -100, 4790, 6)
INSERT [dbo].[orders] ([id], [id_users], [id_status], [id_point], [order_date], [code], [cost], [discount], [total_cost], [delivery_days]) VALUES (5, 3, 1, 1, CAST(N'2023-12-13' AS Date), 588, 1300, 20, 1280, 6)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[point] ON 

INSERT [dbo].[point] ([id], [name]) VALUES (1, N'Пункт выдачи 1')
INSERT [dbo].[point] ([id], [name]) VALUES (2, N'Пункт выдачи 2')
INSERT [dbo].[point] ([id], [name]) VALUES (3, N'Пункт выдачи 3')
SET IDENTITY_INSERT [dbo].[point] OFF
GO
SET IDENTITY_INSERT [dbo].[sostav] ON 

INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (1, 1, 3, 1, 1, 3000, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (2, 2, 3, 1, 1, 3000, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (3, 2, 4, 1, 1, 700, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (4, 3, 3, 1, 1, 3000, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (5, 3, 10, 1, 1, 400, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (6, 3, 11, 1, 1, 900, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (7, 4, 2, 1, 1, 2200, 5)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (8, 4, 3, 1, 1, 3000, 10)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (9, 5, 11, 1, 1, 900, 0)
INSERT [dbo].[sostav] ([id], [id_orders], [id_merch], [count], [quantity], [total_cost], [discount]) VALUES (10, 5, 10, 1, 1, 400, 5)
SET IDENTITY_INSERT [dbo].[sostav] OFF
GO
SET IDENTITY_INSERT [dbo].[status] ON 

INSERT [dbo].[status] ([id], [status_name]) VALUES (1, N'новый')
INSERT [dbo].[status] ([id], [status_name]) VALUES (2, N'в работе')
INSERT [dbo].[status] ([id], [status_name]) VALUES (3, N'сформирован')
INSERT [dbo].[status] ([id], [status_name]) VALUES (4, N'отправлен')
SET IDENTITY_INSERT [dbo].[status] OFF
GO
SET IDENTITY_INSERT [dbo].[type_users] ON 

INSERT [dbo].[type_users] ([id], [role]) VALUES (1, N'admin')
INSERT [dbo].[type_users] ([id], [role]) VALUES (2, N'manager')
INSERT [dbo].[type_users] ([id], [role]) VALUES (3, N'client')
SET IDENTITY_INSERT [dbo].[type_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (2, N'root', N'12345', 1)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (3, N'manager', N'123456', 2)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (4, N'client', N'1234567', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (5, N'testt', N'12345', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (6, N'123456', N'123456', 3)
INSERT [dbo].[users] ([id], [login], [password], [id_type]) VALUES (7, N'1234567', N'1234567', 3)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[vhodHis] ON 

INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (1, 4, CAST(N'2023-12-13T17:30:34.693' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (2, 2, CAST(N'2023-12-13T17:30:55.313' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (3, 2, CAST(N'2023-12-13T17:33:54.143' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (4, NULL, CAST(N'2023-12-13T17:34:32.517' AS DateTime), N'Не успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (5, NULL, CAST(N'2023-12-13T17:34:43.370' AS DateTime), N'Не успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (6, 6, CAST(N'2023-12-13T17:40:34.547' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (7, 2, CAST(N'2023-12-13T17:41:30.073' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (8, 2, CAST(N'2023-12-13T18:07:25.587' AS DateTime), N'Успешно')
INSERT [dbo].[vhodHis] ([id], [id_users], [DateTimeLog], [TypeVhod]) VALUES (9, 4, CAST(N'2023-12-13T18:08:01.213' AS DateTime), N'Успешно')
SET IDENTITY_INSERT [dbo].[vhodHis] OFF
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_point] FOREIGN KEY([id_point])
REFERENCES [dbo].[point] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_point]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_status] FOREIGN KEY([id_status])
REFERENCES [dbo].[status] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_status]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_merch] FOREIGN KEY([id_merch])
REFERENCES [dbo].[merch] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_merch]
GO
ALTER TABLE [dbo].[sostav]  WITH CHECK ADD  CONSTRAINT [FK_sostav_orders] FOREIGN KEY([id_orders])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[sostav] CHECK CONSTRAINT [FK_sostav_orders]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_type_users] FOREIGN KEY([id_type])
REFERENCES [dbo].[type_users] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_type_users]
GO
ALTER TABLE [dbo].[vhodHis]  WITH CHECK ADD  CONSTRAINT [FK_vhodHis_users] FOREIGN KEY([id_users])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[vhodHis] CHECK CONSTRAINT [FK_vhodHis_users]
GO
USE [master]
GO
ALTER DATABASE [dip2] SET  READ_WRITE 
GO
