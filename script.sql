USE [master]
GO
/****** Object:  Database [geminishopping]    Script Date: 12/25/2020 5:08:43 PM ******/
CREATE DATABASE [geminishopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'geminishopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\geminishopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'geminishopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\geminishopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [geminishopping] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [geminishopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [geminishopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [geminishopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [geminishopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [geminishopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [geminishopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [geminishopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [geminishopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [geminishopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [geminishopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [geminishopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [geminishopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [geminishopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [geminishopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [geminishopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [geminishopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [geminishopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [geminishopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [geminishopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [geminishopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [geminishopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [geminishopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [geminishopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [geminishopping] SET RECOVERY FULL 
GO
ALTER DATABASE [geminishopping] SET  MULTI_USER 
GO
ALTER DATABASE [geminishopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [geminishopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [geminishopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [geminishopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [geminishopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'geminishopping', N'ON'
GO
ALTER DATABASE [geminishopping] SET QUERY_STORE = OFF
GO
USE [geminishopping]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/25/2020 5:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [varchar](50) NOT NULL,
	[u_id] [int] NOT NULL,
	[buyDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 12/25/2020 5:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[id] [varchar](50) NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [float] NULL,
	[pro_id] [int] NOT NULL,
	[cat_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/25/2020 5:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cate_id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/25/2020 5:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NULL,
	[cate_id] [int] NOT NULL,
	[des] [varchar](2000) NULL,
	[image] [varchar](50) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/25/2020 5:08:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](36) NOT NULL,
	[avatar] [varchar](50) NULL,
	[role_id] [int] NULL,
	[active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'-1381617618', 10, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'-1489902126', 1021, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'-198938476', 2, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'-267574405', 2, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'1419572166', 2, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'1511130715', 6, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'1531603220', 6, CAST(N'2020-07-21' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'25a15ec4-9978-4bba-80ed-d861fd687240', 5, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'98a8ba5c-0455-4227-89d0-f1352fcee509', 6, CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'a30dc971-ac3b-4797-a570-e2a9b1c88bac', 6, CAST(N'2020-07-20' AS Date))
INSERT [dbo].[Cart] ([id], [u_id], [buyDate]) VALUES (N'cfc2666b-4762-46de-9b35-ee15f35db33e', 1023, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'1573498283', 2, 2700, 21, N'-1381617618')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'1708331369', 2, 119, 1, N'-198938476')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'29ca16c2-d841-4000-902d-23e954ec2621', 3, 119, 1, N'25a15ec4-9978-4bba-80ed-d861fd687240')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'410226924', 3, 119, 1, N'1511130715')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'802977185', 2, 80, 3, N'-1381617618')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'820302624', 2, 89, 4, N'1511130715')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'8af2d058-845a-415c-b61d-6fc081f5ac5b', 3, 99, 2, N'cfc2666b-4762-46de-9b35-ee15f35db33e')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'a2b61d27-6b24-498f-a2cc-e1aef584e52e', 3, 119, 1, N'a30dc971-ac3b-4797-a570-e2a9b1c88bac')
INSERT [dbo].[CartItem] ([id], [quantity], [unitPrice], [pro_id], [cat_id]) VALUES (N'b6c23793-a1c6-421b-aac5-040b3445e54b', 3, 15, 7, N'a30dc971-ac3b-4797-a570-e2a9b1c88bac')
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (1, N'Top')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (2, N'Bottom')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (3, N'Hat')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (4, N'Bag')
INSERT [dbo].[Category] ([cate_id], [cate_name]) VALUES (6, N'Shoes')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (1, N'Overdyed Pocket Tee Painted Camo', 119, 1, N'This is Overdyed Pocket Tee Painted Camo', N'top1.jpg', 8)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (2, N'Overdyed Pocket Tee Black', 99, 1, N'This is Overdyed Pocket Tee Black', N'top2.jpg', 9)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (3, N'Overdyed Pocket Tee Bright Yellow', 80, 1, N'This is Overdyed Pocket Tee Bright Yellow', N'top3.jpg', 10)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (4, N'Overdyed Pocket Tee Dark Red', 89, 1, N'This is Overdyed Pocket Tee Dark Red ', N'top4.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (6, N'Overdyed Pocket Tee Pink', 199, 1, N'This is Overdyed Pocket Tee Pink', N'top6.jpg', 13)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (7, N'Mesh Shorts C Logo', 15, 2, N'This is ', N'bottom1.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (8, N'Cross Trai Shorts', 25, 2, N'This is Cross Trai Shorts', N'bottom2.jpg', 12)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (9, N'Mesh Shorts C Logo', 45, 2, N'This is Mesh Shorts C Logo', N'bottom3.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (10, N'Reverser Weave ColorBlock Cut-Off Shorts', 15, 2, N'This is Reverser Weave ColorBlock Cut-Off Shorts ', N'bottom4.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (11, N'Double Dry Select Training', 20, 2, N'This is Double Dry Select Training', N'bottom5.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (12, N'Powerblend Shorts', 35, 2, N'This is Powerblend Shorts', N'bottom6.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (13, N'Multi Color Cap', 108, 3, N'This is Multi color cap', N'hat1.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (14, N'Bape Sta Jet Cap', 111, 3, N'This is Bape Sta Jet Cap', N'hat2.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (15, N'Camo Bucket Hat', 121, 3, N'This is Camo Bucket Hat', N'hat3.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (16, N'Indigo Tiger Bucket', 54, 3, N'This is Indigo Tiger Bucket', N'hat4.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (17, N'Bape Flame Panel Cap', 18, 3, N'This is Bape Flame Panel Cap', N'hat5.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (18, N'Neon Tokyo Bucket Hat', 38, 3, N'This is Neon Tokyo Bucket Hat', N'hat6.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (19, N'Ape Head Line Panel Cap', 98, 3, N'This is Ape Head Line Panel Cap', N'hat7.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (20, N'Space Camo Cap', 103, 3, N'This is Space Camo Cap', N'hat8.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (21, N'Baiadera Stripe Canvas Backpack', 2700, 4, N'This is ', N'bag1.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (22, N'GG Embossed Backpack', 3100, 4, N'This is GG Embossed Backpack', N'bag2.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (23, N'GG Embossed Backpack Green', 3000, 4, N'This is GG Embossed Backpack Green', N'bag3.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (24, N'Gucci Off The Grid backpack', 1980, 4, N'This is Gucci Off The Grid backpack', N'bag4.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (25, N'Medium GG Psychedelic backpack', 2390, 4, N'This is Medium GG Psychedelic backpack', N'bag5.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (26, N'BaBackpack with embroidery', 1590, 4, N'This is Backpack with embroidery ', N'bag6.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (27, N'AF1 Low Travis Scott', 550, 6, N'This Travis AF-1 features a patchwork upper comprised of camouflage, corduroy, duck canvas, flannel, leather, suede and wool.', N'Traviscott.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (28, N'AF1 Low Off-White Volt', 955, 6, N'Be more lit than a lightning bolt while wearing Nike and Virgil’s Air Force 1 Low Off-White Volt. This AF1 comes with a volt upper, black Nike “Swoosh”, volt midsole, and volt sole. These sneakers released in December 2018 and retailed for $170. Demand that sneaker attention and cop these on StockX today.', N'AF1Volt.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (29, N'AF1 Low Virgil Abloh Off-White', 4500, 6, N'I have nothing to say. It is very expense', N'AF1Virgil.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (30, N'AF1 Low Off-White Black White', 760, 6, N'The force is within you, as Nike uses their very own and release the Air Force 1 Low Off-White Black White. This AF1 comes with a black upper, white Nike “Swoosh”, black midsole, and a black sole. These sneakers were released December 2018 and retailed for $170. Thrive with the force and place a Bid on StockX today.', N'AF1OffWhite.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (31, N'AF1 Low WhiteBlack 2020', 75, 6, N'So beautiful with this price', N'AF1WhiteBlack2020.jpg', 11)
INSERT [dbo].[Product] ([id], [name], [price], [cate_id], [des], [image], [quantity]) VALUES (32, N'AF1 Low BHM 2020', 97, 6, N'COLORWAY DARK SMOKE GREY/TRACK RED-DARK SMOKE GREY RETAIL PRICE $130 RELEASE DATE 02/19/2020', N'AF1BHM.jpg', 11)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (2, N'minhthao@gmail.com', N'sa', N'123', N'1595316086973.jpg', 2, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (3, N'abc@gmail.com', N'abc', N'abc', N'1595316128559.jpg', 2, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (5, N'minhth6@gmail.com', N'admin', N'admin', N'1595316105507.jpg', 1, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (6, N'minhthao0606@gmail.com', N'test', N'123', N'1595319115265.jpg', 2, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (8, N'ducdqhe141450@fpt.edu.vn', N'hello', N'ssss1234', N'1595316121724.jpg', 2, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (9, N'ssss@gmail.com', N'ssss', N'ssss', N'1595316426220.jpg', 1, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (10, N'truong020900@gmail.com', N'truong', N'abc', N'top6.jpg', 2, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (1021, N'thaodmhe141@fpt.edu.vn', N'june', N'june', N'top1.jpg', 0, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (1023, N'thuytink25@gmail.com', N'thuy', N'ssss', NULL, 0, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (1025, N'thaodmhe141688@fpt.edu.vn', N'junee', N'ssss', NULL, 0, 1)
INSERT [dbo].[User] ([id], [email], [username], [password], [avatar], [role_id], [active]) VALUES (2011, N'ngoclinh@gmail.com', N'ngoclinh', N'123', NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__F3DBC572E8642869]    Script Date: 12/25/2020 5:08:43 PM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD FOREIGN KEY([cat_id])
REFERENCES [dbo].[Cart] ([id])
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD FOREIGN KEY([pro_id])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([cate_id])
GO
USE [master]
GO
ALTER DATABASE [geminishopping] SET  READ_WRITE 
GO
