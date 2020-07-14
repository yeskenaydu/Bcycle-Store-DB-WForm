USE [Bike Stores]
GO
/****** Object:  Schema [hr]    Script Date: 31.12.2019 10:59:13 ******/
CREATE SCHEMA [hr]
GO
/****** Object:  Schema [production]    Script Date: 31.12.2019 10:59:13 ******/
CREATE SCHEMA [production]
GO
/****** Object:  Schema [sales]    Script Date: 31.12.2019 10:59:13 ******/
CREATE SCHEMA [sales]
GO
/****** Object:  UserDefinedFunction [dbo].[IndirimYap]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[IndirimYap] (@fiyat decimal)
returns decimal
as
begin
return @fiyat*7/10
end
GO
/****** Object:  Table [dbo].[log]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[log](
	[Event] [varchar](100) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [hr].[candidates]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hr].[candidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hr].[employees]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hr].[employees](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[brands]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[brands](
	[brand_id] [int] IDENTITY(1,1) NOT NULL,
	[brand_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[categories]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[products]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](255) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [production].[stocks]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [production].[stocks](
	[store_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[customers]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NOT NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](25) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[order_items]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[order_items](
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[list_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](4, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[orders]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_status] [tinyint] NOT NULL,
	[order_date] [date] NOT NULL,
	[required_date] [date] NOT NULL,
	[shipped_date] [date] NULL,
	[store_id] [int] NOT NULL,
	[staff_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[sales_summary]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[sales_summary](
	[brand] [varchar](255) NOT NULL,
	[category] [varchar](255) NOT NULL,
	[model_year] [smallint] NOT NULL,
	[sales] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[staffs]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[staffs](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[active] [tinyint] NOT NULL,
	[store_id] [int] NOT NULL,
	[manager_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [sales].[stores]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sales].[stores](
	[store_id] [int] IDENTITY(1,1) NOT NULL,
	[store_name] [varchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[email] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](10) NULL,
	[zip_code] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Candidates tablosuna veri eklendi!', CAST(N'2019-12-24T22:14:29.177' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Candidates tablosundan veri silindi!', CAST(N'2019-12-24T22:17:49.017' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Candidates tablosunda değişiklik yapıldı!', CAST(N'2019-12-27T20:06:03.560' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Candidates tablosunda değişiklik yapıldı!', CAST(N'2019-12-27T20:07:13.433' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda ekleme yapıldı!!', CAST(N'2019-12-30T15:54:50.987' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda silme işlemi yapıldı!!', CAST(N'2019-12-30T16:00:27.413' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosundan değer silindi', CAST(N'2019-12-30T16:15:12.653' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosuna değer eklendi', CAST(N'2019-12-30T16:15:24.370' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosunda değer güncellendi.', CAST(N'2019-12-30T16:15:42.453' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosundan değer silindi', CAST(N'2019-12-30T16:15:54.290' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Products tablosuna veri girişi yapıldı.', CAST(N'2019-12-30T16:30:50.970' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Products tablosuna veri girişi yapıldı.', CAST(N'2019-12-30T16:32:49.980' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Products tablosuna veri girişi yapıldı.', CAST(N'2019-12-30T16:34:49.130' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Products tablosundan veri silindi.', CAST(N'2019-12-30T16:38:21.813' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosunda veri guncellendi.', CAST(N'2019-12-30T20:08:28.650' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosuna veri Eklendi.', CAST(N'2019-12-30T20:09:16.423' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosunda veri guncellendi.', CAST(N'2019-12-30T20:09:42.430' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Products tablosuna veri girişi yapıldı.', CAST(N'2019-12-30T20:14:50.183' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosunda veri guncellendi.', CAST(N'2019-12-30T20:26:42.913' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Customers tablosuna veri Eklendi.', CAST(N'2019-12-30T20:42:30.650' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Customers tablosuna veri Eklendi.', CAST(N'2019-12-30T20:42:54.803' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Customers tablosunda veri guncellendi.', CAST(N'2019-12-30T20:50:19.637' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Customers tablosundan veri silindi.', CAST(N'2019-12-30T20:50:19.637' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Sales tablosuna veri eklendi.', CAST(N'2019-12-30T21:28:27.353' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Staff tablosuna veri eklendi.', CAST(N'2019-12-31T10:34:20.523' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda silme işlemi yapıldı!!', CAST(N'2019-12-30T16:04:52.030' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda silme işlemi yapıldı!!', CAST(N'2019-12-30T16:04:59.543' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda silme işlemi yapıldı!!', CAST(N'2019-12-30T16:06:15.440' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda güncelleme yapıldı!!', CAST(N'2019-12-30T16:08:57.390' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda silme işlemi yapıldı!!', CAST(N'2019-12-30T16:09:06.187' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Brands tablosunda ekleme yapıldı!!', CAST(N'2019-12-30T16:09:13.760' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosuna değer eklendi', CAST(N'2019-12-30T16:14:25.023' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Categories tablosunda değer güncellendi.', CAST(N'2019-12-30T16:14:39.760' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosuna veri Eklendi.', CAST(N'2019-12-30T20:16:18.570' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosunda veri guncellendi.', CAST(N'2019-12-30T20:16:42.757' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosunda veri guncellendi.', CAST(N'2019-12-30T20:27:43.777' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stocks tablosundan veri silindi.', CAST(N'2019-12-30T20:31:03.563' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Customers tablosuna veri Eklendi.', CAST(N'2019-12-30T21:02:30.817' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Orders tablosuna veri eklendi.', CAST(N'2019-12-30T21:03:35.840' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Orders tablosuna veri eklendi.', CAST(N'2019-12-30T21:07:28.750' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Orders tablosundan veri silindi.', CAST(N'2019-12-30T21:10:19.073' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Sales tablosunda veri güncellendi.', CAST(N'2019-12-30T21:52:40.320' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Staff tablosuna veri eklendi.', CAST(N'2019-12-30T22:09:39.573' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Staff tablosunda veri gunvellendi.', CAST(N'2019-12-30T22:11:47.707' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Staff tablosundan veri silindi.', CAST(N'2019-12-30T22:11:58.997' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'log denemesi', CAST(N'2019-12-30T22:25:39.113' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'deneme2', CAST(N'2019-12-30T22:27:03.647' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosuna veri eklendi.', CAST(N'2019-12-30T22:53:00.140' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosunda veri gunvellendi.', CAST(N'2019-12-30T22:54:16.987' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosunda veri gunvellendi.', CAST(N'2019-12-30T22:56:53.413' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosunda veri gunvellendi.', CAST(N'2019-12-30T22:59:54.180' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosunda veri silindi.', CAST(N'2019-12-30T23:00:05.457' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosuna veri eklendi.', CAST(N'2019-12-31T10:52:15.547' AS DateTime))
INSERT [dbo].[log] ([Event], [Date]) VALUES (N'Stores tablosunda veri silindi.', CAST(N'2019-12-31T10:52:31.563' AS DateTime))
SET IDENTITY_INSERT [hr].[candidates] ON 

INSERT [hr].[candidates] ([id], [fullname]) VALUES (1, N'John Dor')
INSERT [hr].[candidates] ([id], [fullname]) VALUES (2, N'Asuman Krause')
INSERT [hr].[candidates] ([id], [fullname]) VALUES (3, N'Peter Drucker')
INSERT [hr].[candidates] ([id], [fullname]) VALUES (4, N'Clark Kent')
SET IDENTITY_INSERT [hr].[candidates] OFF
SET IDENTITY_INSERT [hr].[employees] ON 

INSERT [hr].[employees] ([id], [fullname]) VALUES (1, N'John Dor')
INSERT [hr].[employees] ([id], [fullname]) VALUES (2, N'Jame Doe')
INSERT [hr].[employees] ([id], [fullname]) VALUES (3, N'Michael Scott')
INSERT [hr].[employees] ([id], [fullname]) VALUES (4, N'Jack Sparrow')
SET IDENTITY_INSERT [hr].[employees] OFF
SET IDENTITY_INSERT [production].[brands] ON 

INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (1, N'Electra')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (2, N'Haro')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (3, N'Heller')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (4, N'Pure Cycles')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (5, N'Ritchey')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (6, N'Strider')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (7, N'Sun Bicycles')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (8, N'Surly')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (9, N'Trek')
INSERT [production].[brands] ([brand_id], [brand_name]) VALUES (12, N'Deneme2')
SET IDENTITY_INSERT [production].[brands] OFF
SET IDENTITY_INSERT [production].[categories] ON 

INSERT [production].[categories] ([category_id], [category_name]) VALUES (1, N'Children Bicycles')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (2, N'Comfort Bicycles')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (3, N'Cruisers Bicycles')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (4, N'Cyclocross Bicycles')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (5, N'Electric Bikes')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (6, N'Mountain Bikes')
INSERT [production].[categories] ([category_id], [category_name]) VALUES (7, N'Road Bikes')
SET IDENTITY_INSERT [production].[categories] OFF
SET IDENTITY_INSERT [production].[products] ON 

INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (1, N'Trek 820 - 2016', 9, 6, 2016, CAST(379.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (2, N'Ritchey Timberwolf Frameset - 2016', 5, 6, 2016, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (3, N'Surly Wednesday Frameset - 2016', 8, 6, 2016, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (4, N'Trek Fuel EX 8 29 - 2016', 9, 6, 2016, CAST(2899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (5, N'Heller Shagamaw Frame - 2016', 3, 6, 2016, CAST(1320.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (6, N'Surly Ice Cream Truck Frameset - 2016', 8, 6, 2016, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (7, N'Trek Slash 8 27.5 - 2016', 9, 6, 2016, CAST(3999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (8, N'Trek Remedy 29 Carbon Frameset - 2016', 9, 6, 2016, CAST(1799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (9, N'Trek Conduit+ - 2016', 9, 5, 2016, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (10, N'Surly Straggler - 2016', 8, 4, 2016, CAST(1549.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (11, N'Surly Straggler 650b - 2016', 8, 4, 2016, CAST(1680.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (12, N'Electra Townie Original 21D - 2016', 1, 3, 2016, CAST(549.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (13, N'Electra Cruiser 1 (24-Inch) - 2016', 1, 3, 2016, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (14, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 1, 3, 2016, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (15, N'Electra Moto 1 - 2016', 1, 3, 2016, CAST(529.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (16, N'Electra Townie Original 7D EQ - 2016', 1, 3, 2016, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (17, N'Pure Cycles Vine 8-Speed - 2016', 4, 3, 2016, CAST(429.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (18, N'Pure Cycles Western 3-Speed - Women''s - 2015/2016', 4, 3, 2016, CAST(449.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (19, N'Pure Cycles William 3-Speed - 2016', 4, 3, 2016, CAST(449.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (20, N'Electra Townie Original 7D EQ - Women''s - 2016', 1, 3, 2016, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (21, N'Electra Cruiser 1 (24-Inch) - 2016', 1, 1, 2016, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (22, N'Electra Girl''s Hawaii 1 (16-inch) - 2015/2016', 1, 1, 2016, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (23, N'Electra Girl''s Hawaii 1 (20-inch) - 2015/2016', 1, 1, 2016, CAST(299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (24, N'Electra Townie Original 21D - 2016', 1, 2, 2016, CAST(549.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (25, N'Electra Townie Original 7D - 2015/2016', 1, 2, 2016, CAST(499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (26, N'Electra Townie Original 7D EQ - 2016', 1, 2, 2016, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (27, N'Surly Big Dummy Frameset - 2017', 8, 6, 2017, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (28, N'Surly Karate Monkey 27.5+ Frameset - 2017', 8, 6, 2017, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (29, N'Trek X-Caliber 8 - 2017', 9, 6, 2017, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (30, N'Surly Ice Cream Truck Frameset - 2017', 8, 6, 2017, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (31, N'Surly Wednesday - 2017', 8, 6, 2017, CAST(1632.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (32, N'Trek Farley Alloy Frameset - 2017', 9, 6, 2017, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (33, N'Surly Wednesday Frameset - 2017', 8, 6, 2017, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (34, N'Trek Session DH 27.5 Carbon Frameset - 2017', 9, 6, 2017, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (35, N'Sun Bicycles Spider 3i - 2017', 7, 6, 2017, CAST(832.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (36, N'Surly Troll Frameset - 2017', 8, 6, 2017, CAST(832.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (37, N'Haro Flightline One ST - 2017', 2, 6, 2017, CAST(379.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (38, N'Haro Flightline Two 26 Plus - 2017', 2, 6, 2017, CAST(549.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (39, N'Trek Stache 5 - 2017', 9, 6, 2017, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (40, N'Trek Fuel EX 9.8 29 - 2017', 9, 6, 2017, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (41, N'Haro Shift R3 - 2017', 2, 6, 2017, CAST(1469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (42, N'Trek Fuel EX 5 27.5 Plus - 2017', 9, 6, 2017, CAST(2299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (43, N'Trek Fuel EX 9.8 27.5 Plus - 2017', 9, 6, 2017, CAST(5299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (44, N'Haro SR 1.1 - 2017', 2, 6, 2017, CAST(539.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (45, N'Haro SR 1.2 - 2017', 2, 6, 2017, CAST(869.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (46, N'Haro SR 1.3 - 2017', 2, 6, 2017, CAST(1409.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (47, N'Trek Remedy 9.8 - 2017', 9, 6, 2017, CAST(5299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (48, N'Trek Emonda S 4 - 2017', 9, 7, 2017, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (49, N'Trek Domane SL 6 - 2017', 9, 7, 2017, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (50, N'Trek Silque SLR 7 Women''s - 2017', 9, 7, 2017, CAST(5999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (51, N'Trek Silque SLR 8 Women''s - 2017', 9, 7, 2017, CAST(6499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (52, N'Surly Steamroller - 2017', 8, 7, 2017, CAST(875.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (53, N'Surly Ogre Frameset - 2017', 8, 7, 2017, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (54, N'Trek Domane SL Disc Frameset - 2017', 9, 7, 2017, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (55, N'Trek Domane S 6 - 2017', 9, 7, 2017, CAST(2699.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (56, N'Trek Domane SLR 6 Disc - 2017', 9, 7, 2017, CAST(5499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (57, N'Trek Emonda S 5 - 2017', 9, 7, 2017, CAST(1999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (58, N'Trek Madone 9.2 - 2017', 9, 7, 2017, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (59, N'Trek Domane S 5 Disc - 2017', 9, 7, 2017, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (60, N'Sun Bicycles ElectroLite - 2017', 7, 5, 2017, CAST(1559.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (61, N'Trek Powerfly 8 FS Plus - 2017', 9, 5, 2017, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (62, N'Trek Boone 7 - 2017', 9, 4, 2017, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (63, N'Trek Boone Race Shop Limited - 2017', 9, 4, 2017, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (64, N'Electra Townie Original 7D - 2017', 1, 3, 2017, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (65, N'Sun Bicycles Lil Bolt Type-R - 2017', 7, 3, 2017, CAST(346.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (66, N'Sun Bicycles Revolutions 24 - 2017', 7, 3, 2017, CAST(250.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (67, N'Sun Bicycles Revolutions 24 - Girl''s - 2017', 7, 3, 2017, CAST(250.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (68, N'Sun Bicycles Cruz 3 - 2017', 7, 3, 2017, CAST(449.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (69, N'Sun Bicycles Cruz 7 - 2017', 7, 3, 2017, CAST(416.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (70, N'Electra Amsterdam Original 3i - 2015/2017', 1, 3, 2017, CAST(659.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (71, N'Sun Bicycles Atlas X-Type - 2017', 7, 3, 2017, CAST(416.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (72, N'Sun Bicycles Biscayne Tandem 7 - 2017', 7, 3, 2017, CAST(619.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (73, N'Sun Bicycles Brickell Tandem 7 - 2017', 7, 3, 2017, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (74, N'Electra Cruiser Lux 1 - 2017', 1, 3, 2017, CAST(439.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (75, N'Electra Cruiser Lux Fat Tire 1 Ladies - 2017', 1, 3, 2017, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (76, N'Electra Girl''s Hawaii 1 16" - 2017', 1, 3, 2017, CAST(299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (77, N'Electra Glam Punk 3i Ladies'' - 2017', 1, 3, 2017, CAST(799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (78, N'Sun Bicycles Biscayne Tandem CB - 2017', 7, 3, 2017, CAST(647.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (79, N'Sun Bicycles Boardwalk (24-inch Wheels) - 2017', 7, 3, 2017, CAST(402.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (80, N'Sun Bicycles Brickell Tandem CB - 2017', 7, 3, 2017, CAST(761.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (81, N'Electra Amsterdam Fashion 7i Ladies'' - 2017', 1, 3, 2017, CAST(1099.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (82, N'Electra Amsterdam Original 3i Ladies'' - 2017', 1, 3, 2017, CAST(659.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (83, N'Trek Boy''s Kickster - 2015/2017', 9, 1, 2017, CAST(149.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (84, N'Sun Bicycles Lil Kitt''n - 2017', 7, 1, 2017, CAST(109.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (85, N'Haro Downtown 16 - 2017', 2, 1, 2017, CAST(329.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (86, N'Trek Girl''s Kickster - 2017', 9, 1, 2017, CAST(149.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (87, N'Trek Precaliber 12 Boys - 2017', 9, 1, 2017, CAST(189.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (88, N'Trek Precaliber 12 Girls - 2017', 9, 1, 2017, CAST(189.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (89, N'Trek Precaliber 16 Boys - 2017', 9, 1, 2017, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (90, N'Trek Precaliber 16 Girls - 2017', 9, 1, 2017, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (91, N'Trek Precaliber 24 (21-Speed) - Girls - 2017', 9, 1, 2017, CAST(349.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (92, N'Haro Shredder 20 - 2017', 2, 1, 2017, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (93, N'Haro Shredder 20 Girls - 2017', 2, 1, 2017, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (94, N'Haro Shredder Pro 20 - 2017', 2, 1, 2017, CAST(249.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (95, N'Electra Girl''s Hawaii 1 16" - 2017', 1, 1, 2017, CAST(299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (96, N'Electra Moto 3i (20-inch) - Boy''s - 2017', 1, 1, 2017, CAST(349.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (97, N'Electra Savannah 3i (20-inch) - Girl''s - 2017', 1, 1, 2017, CAST(349.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (98, N'Electra Straight 8 3i (20-inch) - Boy''s - 2017', 1, 1, 2017, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (99, N'Electra Sugar Skulls 1 (20-inch) - Girl''s - 2017', 1, 1, 2017, CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (100, N'Electra Townie 3i EQ (20-inch) - Boys'' - 2017', 1, 1, 2017, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (101, N'Electra Townie 7D (20-inch) - Boys'' - 2017', 1, 1, 2017, CAST(339.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (102, N'Electra Townie Original 7D - 2017', 1, 2, 2017, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (103, N'Sun Bicycles Streamway 3 - 2017', 7, 2, 2017, CAST(551.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (104, N'Sun Bicycles Streamway - 2017', 7, 2, 2017, CAST(481.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (105, N'Sun Bicycles Streamway 7 - 2017', 7, 2, 2017, CAST(533.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (106, N'Sun Bicycles Cruz 3 - 2017', 7, 2, 2017, CAST(449.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (107, N'Sun Bicycles Cruz 7 - 2017', 7, 2, 2017, CAST(416.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (108, N'Sun Bicycles Cruz 3 - Women''s - 2017', 7, 2, 2017, CAST(449.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (109, N'Sun Bicycles Cruz 7 - Women''s - 2017', 7, 2, 2017, CAST(416.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (110, N'Sun Bicycles Drifter 7 - 2017', 7, 2, 2017, CAST(470.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (111, N'Sun Bicycles Drifter 7 - Women''s - 2017', 7, 2, 2017, CAST(470.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (112, N'Trek 820 - 2018', 9, 6, 2018, CAST(379.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (113, N'Trek Marlin 5 - 2018', 9, 6, 2018, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (114, N'Trek Marlin 6 - 2018', 9, 6, 2018, CAST(579.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (115, N'Trek Fuel EX 8 29 - 2018', 9, 6, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (116, N'Trek Marlin 7 - 2017/2018', 9, 6, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (117, N'Trek Ticket S Frame - 2018', 9, 6, 2018, CAST(1469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (118, N'Trek X-Caliber 8 - 2018', 9, 6, 2018, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (119, N'Trek Kids'' Neko - 2018', 9, 6, 2018, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (120, N'Trek Fuel EX 7 29 - 2018', 9, 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (121, N'Surly Krampus Frameset - 2018', 8, 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (122, N'Surly Troll Frameset - 2018', 8, 6, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (123, N'Trek Farley Carbon Frameset - 2018', 9, 6, 2018, CAST(999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (124, N'Surly Krampus - 2018', 8, 6, 2018, CAST(1499.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (125, N'Trek Kids'' Dual Sport - 2018', 9, 6, 2018, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (126, N'Surly Big Fat Dummy Frameset - 2018', 8, 6, 2018, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (127, N'Surly Pack Rat Frameset - 2018', 8, 6, 2018, CAST(469.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (128, N'Surly ECR 27.5 - 2018', 8, 6, 2018, CAST(1899.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (129, N'Trek X-Caliber 7 - 2018', 9, 6, 2018, CAST(919.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (130, N'Trek Stache Carbon Frameset - 2018', 9, 6, 2018, CAST(919.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (131, N'Heller Bloodhound Trail - 2018', 3, 6, 2018, CAST(2599.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (132, N'Trek Procal AL Frameset - 2018', 9, 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (133, N'Trek Procaliber Frameset - 2018', 9, 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (134, N'Trek Remedy 27.5 C Frameset - 2018', 9, 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (135, N'Trek X-Caliber Frameset - 2018', 9, 6, 2018, CAST(1499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (136, N'Trek Procaliber 6 - 2018', 9, 6, 2018, CAST(1799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (137, N'Heller Shagamaw GX1 - 2018', 3, 6, 2018, CAST(2599.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (138, N'Trek Fuel EX 5 Plus - 2018', 9, 6, 2018, CAST(2249.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (139, N'Trek Remedy 7 27.5 - 2018', 9, 6, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (140, N'Trek Remedy 9.8 27.5 - 2018', 9, 6, 2018, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (141, N'Trek Stache 5 - 2018', 9, 6, 2018, CAST(1599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (142, N'Trek Fuel EX 8 29 XT - 2018', 9, 6, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (143, N'Trek Domane ALR 3 - 2018', 9, 7, 2018, CAST(1099.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (144, N'Trek Domane ALR 4 Disc - 2018', 9, 7, 2018, CAST(1549.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (145, N'Trek Domane ALR 5 Disc - 2018', 9, 7, 2018, CAST(1799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (146, N'Trek Domane SLR 6 - 2018', 9, 7, 2018, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (147, N'Trek Domane ALR 5 Gravel - 2018', 9, 7, 2018, CAST(1799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (148, N'Trek Domane SL 8 Disc - 2018', 9, 7, 2018, CAST(5499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (149, N'Trek Domane SLR 8 Disc - 2018', 9, 7, 2018, CAST(7499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (150, N'Trek Emonda SL 7 - 2018', 9, 7, 2018, CAST(4499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (151, N'Trek Domane ALR 4 Disc Women''s - 2018', 9, 7, 2018, CAST(1549.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (152, N'Trek Domane SL 5 Disc Women''s - 2018', 9, 7, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (153, N'Trek Domane SL 7 Women''s - 2018', 9, 7, 2018, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (154, N'Trek Domane SLR 6 Disc Women''s - 2018', 9, 7, 2018, CAST(5499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (155, N'Trek Domane SLR 9 Disc - 2018', 9, 7, 2018, CAST(11999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (156, N'Trek Domane SL Frameset - 2018', 9, 7, 2018, CAST(6499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (157, N'Trek Domane SL Frameset Women''s - 2018', 9, 7, 2018, CAST(6499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (158, N'Trek CrossRip 1 - 2018', 9, 7, 2018, CAST(959.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (159, N'Trek Emonda ALR 6 - 2018', 9, 7, 2018, CAST(2299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (160, N'Trek Emonda SLR 6 - 2018', 9, 7, 2018, CAST(4499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (161, N'Surly ECR - 2018', 8, 7, 2018, CAST(1899.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (162, N'Trek Emonda SL 6 Disc - 2018', 9, 7, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (163, N'Surly Pack Rat - 2018', 8, 7, 2018, CAST(1349.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (164, N'Surly Straggler 650b - 2018', 8, 7, 2018, CAST(1549.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (165, N'Trek 1120 - 2018', 9, 7, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (166, N'Trek Domane AL 2 Women''s - 2018', 9, 7, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (167, N'Surly ECR Frameset - 2018', 8, 7, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (168, N'Surly Straggler - 2018', 8, 7, 2018, CAST(1549.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (169, N'Trek Emonda SLR 8 - 2018', 9, 7, 2018, CAST(6499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (170, N'Trek CrossRip 2 - 2018', 9, 7, 2018, CAST(1299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (171, N'Trek Domane SL 6 - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (172, N'Trek Domane ALR Disc Frameset - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (173, N'Trek Domane ALR Frameset - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (174, N'Trek Domane SLR Disc Frameset - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (175, N'Trek Domane SLR Frameset - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (176, N'Trek Madone 9 Frameset - 2018', 9, 7, 2018, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (177, N'Trek Domane SLR 6 Disc - 2018', 9, 7, 2018, CAST(5499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (178, N'Trek Domane AL 2 - 2018', 9, 7, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (179, N'Trek Domane AL 3 - 2018', 9, 7, 2018, CAST(919.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (180, N'Trek Domane AL 3 Women''s - 2018', 9, 7, 2018, CAST(919.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (181, N'Trek Domane SL 5 - 2018', 9, 7, 2018, CAST(2199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (182, N'Trek Domane SL 5 Disc - 2018', 9, 7, 2018, CAST(2499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (183, N'Trek Domane SL 5 Women''s - 2018', 9, 7, 2018, CAST(2199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (184, N'Trek Domane SL 6 Disc - 2018', 9, 7, 2018, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (185, N'Trek Conduit+ - 2018', 9, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (186, N'Trek CrossRip+ - 2018', 9, 5, 2018, CAST(4499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (187, N'Trek Neko+ - 2018', 9, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (188, N'Trek XM700+ Lowstep - 2018', 9, 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (189, N'Trek Lift+ Lowstep - 2018', 9, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (190, N'Trek Dual Sport+ - 2018', 9, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (191, N'Electra Loft Go! 8i - 2018', 1, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (192, N'Electra Townie Go! 8i - 2017/2018', 1, 5, 2018, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (193, N'Trek Lift+ - 2018', 9, 5, 2018, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (194, N'Trek XM700+ - 2018', 9, 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (195, N'Electra Townie Go! 8i Ladies'' - 2018', 1, 5, 2018, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (196, N'Trek Verve+ - 2018', 9, 5, 2018, CAST(2299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (197, N'Trek Verve+ Lowstep - 2018', 9, 5, 2018, CAST(2299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (198, N'Electra Townie Commute Go! - 2018', 1, 5, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (199, N'Electra Townie Commute Go! Ladies'' - 2018', 1, 5, 2018, CAST(2999.99 AS Decimal(10, 2)))
GO
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (200, N'Trek Powerfly 5 - 2018', 9, 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (201, N'Trek Powerfly 5 FS - 2018', 9, 5, 2018, CAST(4499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (202, N'Trek Powerfly 5 Women''s - 2018', 9, 5, 2018, CAST(3499.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (203, N'Trek Powerfly 7 FS - 2018', 9, 5, 2018, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (204, N'Trek Super Commuter+ 7 - 2018', 9, 5, 2018, CAST(3599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (205, N'Trek Super Commuter+ 8S - 2018', 9, 5, 2018, CAST(4999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (206, N'Trek Boone 5 Disc - 2018', 9, 4, 2018, CAST(3299.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (207, N'Trek Boone 7 Disc - 2018', 9, 4, 2018, CAST(3999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (208, N'Trek Crockett 5 Disc - 2018', 9, 4, 2018, CAST(1799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (209, N'Trek Crockett 7 Disc - 2018', 9, 4, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (210, N'Surly Straggler - 2018', 8, 4, 2018, CAST(1549.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (211, N'Surly Straggler 650b - 2018', 8, 4, 2018, CAST(1549.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (212, N'Electra Townie Original 21D - 2018', 1, 3, 2018, CAST(559.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (213, N'Electra Cruiser 1 - 2016/2017/2018', 1, 3, 2018, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (214, N'Electra Tiger Shark 3i - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (215, N'Electra Queen of Hearts 3i - 2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (216, N'Electra Super Moto 8i - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (217, N'Electra Straight 8 3i - 2018', 1, 3, 2018, CAST(909.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (218, N'Electra Cruiser 7D - 2016/2017/2018', 1, 3, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (219, N'Electra Moto 3i - 2018', 1, 3, 2018, CAST(639.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (220, N'Electra Cruiser 1 Ladies'' - 2018', 1, 3, 2018, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (221, N'Electra Cruiser 7D Ladies'' - 2016/2018', 1, 3, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (222, N'Electra Cruiser 1 Tall - 2016/2018', 1, 3, 2018, CAST(269.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (223, N'Electra Cruiser Lux 3i - 2018', 1, 3, 2018, CAST(529.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (224, N'Electra Cruiser Lux 7D - 2018', 1, 3, 2018, CAST(479.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (225, N'Electra Delivery 3i - 2016/2017/2018', 1, 3, 2018, CAST(959.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (226, N'Electra Townie Original 21D EQ - 2017/2018', 1, 3, 2018, CAST(679.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (227, N'Electra Cruiser 7D (24-Inch) Ladies'' - 2016/2018', 1, 3, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (228, N'Electra Cruiser 7D Tall - 2016/2018', 1, 3, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (229, N'Electra Cruiser Lux 1 - 2016/2018', 1, 3, 2018, CAST(429.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (230, N'Electra Cruiser Lux 1 Ladies'' - 2018', 1, 3, 2018, CAST(429.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (231, N'Electra Cruiser Lux 3i Ladies'' - 2018', 1, 3, 2018, CAST(529.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (232, N'Electra Cruiser Lux 7D Ladies'' - 2018', 1, 3, 2018, CAST(479.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (233, N'Electra Cruiser Lux Fat Tire 7D - 2018', 1, 3, 2018, CAST(639.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (234, N'Electra Daydreamer 3i Ladies'' - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (235, N'Electra Koa 3i Ladies'' - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (236, N'Electra Morningstar 3i Ladies'' - 2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (237, N'Electra Relic 3i - 2018', 1, 3, 2018, CAST(849.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (238, N'Electra Townie Balloon 8D EQ - 2016/2017/2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (239, N'Electra Townie Balloon 8D EQ Ladies'' - 2016/2017/2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (240, N'Electra Townie Commute 27D Ladies - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (241, N'Electra Townie Commute 8D - 2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (242, N'Electra Townie Commute 8D Ladies'' - 2018', 1, 3, 2018, CAST(699.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (243, N'Electra Townie Original 21D EQ Ladies'' - 2018', 1, 3, 2018, CAST(679.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (244, N'Electra Townie Original 21D Ladies'' - 2018', 1, 3, 2018, CAST(559.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (245, N'Electra Townie Original 3i EQ - 2017/2018', 1, 3, 2018, CAST(659.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (246, N'Electra Townie Original 3i EQ Ladies'' - 2018', 1, 3, 2018, CAST(639.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (247, N'Electra Townie Original 7D EQ - 2018', 1, 3, 2018, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (248, N'Electra Townie Original 7D EQ Ladies'' - 2017/2018', 1, 3, 2018, CAST(599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (249, N'Electra White Water 3i - 2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (250, N'Electra Townie Go! 8i - 2017/2018', 1, 3, 2018, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (251, N'Electra Townie Commute Go! - 2018', 1, 3, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (252, N'Electra Townie Commute Go! Ladies'' - 2018', 1, 3, 2018, CAST(2999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (253, N'Electra Townie Go! 8i Ladies'' - 2018', 1, 3, 2018, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (254, N'Electra Townie Balloon 3i EQ - 2017/2018', 1, 3, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (255, N'Electra Townie Balloon 7i EQ Ladies'' - 2017/2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (256, N'Electra Townie Commute 27D - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (257, N'Electra Amsterdam Fashion 3i Ladies'' - 2017/2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (258, N'Electra Amsterdam Royal 8i - 2017/2018', 1, 3, 2018, CAST(1259.90 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (259, N'Electra Amsterdam Royal 8i Ladies - 2018', 1, 3, 2018, CAST(1199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (260, N'Electra Townie Balloon 3i EQ Ladies'' - 2018', 1, 3, 2018, CAST(799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (261, N'Electra Townie Balloon 7i EQ - 2018', 1, 3, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (262, N'Trek MT 201 - 2018', 9, 1, 2018, CAST(249.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (263, N'Strider Classic 12 Balance Bike - 2018', 6, 1, 2018, CAST(89.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (264, N'Strider Sport 16 - 2018', 6, 1, 2018, CAST(249.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (265, N'Strider Strider 20 Sport - 2018', 6, 1, 2018, CAST(289.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (266, N'Trek Superfly 20 - 2018', 9, 1, 2018, CAST(399.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (267, N'Trek Precaliber 12 Girl''s - 2018', 9, 1, 2018, CAST(199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (268, N'Trek Kickster - 2018', 9, 1, 2018, CAST(159.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (269, N'Trek Precaliber 12 Boy''s - 2018', 9, 1, 2018, CAST(199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (270, N'Trek Precaliber 16 Boy''s - 2018', 9, 1, 2018, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (271, N'Trek Precaliber 16 Girl''s - 2018', 9, 1, 2018, CAST(209.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (272, N'Trek Precaliber 20 6-speed Boy''s - 2018', 9, 1, 2018, CAST(289.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (273, N'Trek Precaliber 20 6-speed Girl''s - 2018', 9, 1, 2018, CAST(289.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (274, N'Trek Precaliber 20 Boy''s - 2018', 9, 1, 2018, CAST(229.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (275, N'Trek Precaliber 20 Girl''s - 2018', 9, 1, 2018, CAST(229.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (276, N'Trek Precaliber 24 (7-Speed) - Boys - 2018', 9, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (277, N'Trek Precaliber 24 21-speed Boy''s - 2018', 9, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (278, N'Trek Precaliber 24 21-speed Girl''s - 2018', 9, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (279, N'Trek Precaliber 24 7-speed Girl''s - 2018', 9, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (280, N'Trek Superfly 24 - 2017/2018', 9, 1, 2018, CAST(489.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (281, N'Electra Cruiser 7D (24-Inch) Ladies'' - 2016/2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (282, N'Electra Cyclosaurus 1 (16-inch) - Boy''s - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (283, N'Electra Heartchya 1 (20-inch) - Girl''s - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (284, N'Electra Savannah 1 (20-inch) - Girl''s - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (285, N'Electra Soft Serve 1 (16-inch) - Girl''s - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (286, N'Electra Starship 1 16" - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (287, N'Electra Straight 8 1 (16-inch) - Boy''s - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (288, N'Electra Straight 8 1 (20-inch) - Boy''s - 2018', 1, 1, 2018, CAST(389.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (289, N'Electra Superbolt 1 20" - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (290, N'Electra Superbolt 3i 20" - 2018', 1, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (291, N'Electra Sweet Ride 1 (20-inch) - Girl''s - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (292, N'Electra Sweet Ride 3i (20-inch) - Girls'' - 2018', 1, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (293, N'Electra Tiger Shark 1 (20-inch) - Boys'' - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (294, N'Electra Tiger Shark 3i (20-inch) - Boys'' - 2018', 1, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (295, N'Electra Treasure 1 20" - 2018', 1, 1, 2018, CAST(319.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (296, N'Electra Treasure 3i 20" - 2018', 1, 1, 2018, CAST(369.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (297, N'Electra Under-The-Sea 1 16" - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (298, N'Electra Water Lily 1 (16-inch) - Girl''s - 2018', 1, 1, 2018, CAST(279.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (299, N'Electra Townie Original 21D - 2018', 1, 2, 2018, CAST(559.99 AS Decimal(10, 2)))
GO
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (300, N'Electra Townie Balloon 3i EQ Ladies'' - 2018', 1, 2, 2018, CAST(799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (301, N'Electra Townie Balloon 7i EQ - 2018', 1, 2, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (302, N'Electra Townie Original 1 - 2018', 1, 2, 2018, CAST(449.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (303, N'Electra Townie Go! 8i - 2017/2018', 1, 2, 2018, CAST(2599.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (304, N'Electra Townie Original 21D EQ - 2017/2018', 1, 2, 2018, CAST(679.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (305, N'Electra Townie Balloon 3i EQ - 2017/2018', 1, 2, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (306, N'Electra Townie Balloon 7i EQ Ladies'' - 2017/2018', 1, 2, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (307, N'Electra Townie Balloon 8D EQ - 2016/2017/2018', 1, 2, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (308, N'Electra Townie Balloon 8D EQ Ladies'' - 2016/2017/2018', 1, 2, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (309, N'Electra Townie Commute 27D - 2018', 1, 2, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (310, N'Electra Townie Commute 27D Ladies - 2018', 1, 2, 2018, CAST(899.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (311, N'Electra Townie Commute 8D - 2018', 1, 2, 2018, CAST(749.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (312, N'Electra Townie Commute 8D Ladies'' - 2018', 1, 2, 2018, CAST(699.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (313, N'Electra Townie Original 1 Ladies'' - 2018', 1, 2, 2018, CAST(449.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (314, N'Electra Townie Original 21D EQ Ladies'' - 2018', 1, 2, 2018, CAST(679.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (315, N'Electra Townie Original 21D Ladies'' - 2018', 1, 2, 2018, CAST(559.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (316, N'Trek Checkpoint ALR 4 Women''s - 2019', 9, 7, 2019, CAST(1699.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (317, N'Trek Checkpoint ALR 5 - 2019', 9, 7, 2019, CAST(1999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (318, N'Trek Checkpoint ALR 5 Women''s - 2019', 9, 7, 2019, CAST(1999.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (319, N'Trek Checkpoint SL 5 Women''s - 2019', 9, 7, 2019, CAST(2799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (320, N'Trek Checkpoint SL 6 - 2019', 9, 7, 2019, CAST(3799.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (321, N'Trek Checkpoint ALR Frameset - 2019', 9, 7, 2019, CAST(3199.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (326, N'deneme2', 9, 6, 2016, CAST(39.99 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (327, N'deneme3', 9, 6, 2020, CAST(199999.00 AS Decimal(10, 2)))
INSERT [production].[products] ([product_id], [product_name], [brand_id], [category_id], [model_year], [list_price]) VALUES (330, N'Urun', 9, 6, 3020, CAST(199.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [production].[products] OFF
INSERT [production].[stocks] ([store_id], [product_id], [quantity]) VALUES (1, 1, 200)
SET IDENTITY_INSERT [sales].[customers] ON 

INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Debra', N'Burks', NULL, N'debra.burks@yahoo.com', N'9273 Thorne Ave. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Kasha', N'Todd', NULL, N'kasha.todd@yahoo.com', N'910 Vine Street ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Tameka', N'Fisher', NULL, N'tameka.fisher@aol.com', N'769C Honey Creek St. ', N'Redondo Beach', N'CA', N'90278')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (4, N'Daryl', N'Spence', NULL, N'daryl.spence@aol.com', N'988 Pearl Lane ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (5, N'Charolette', N'Rice', N'(916) 381-6003', N'charolette.rice@msn.com', N'107 River Dr. ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (6, N'Lyndsey', N'Bean', NULL, N'lyndsey.bean@hotmail.com', N'769 West Road ', N'Fairport', N'NY', N'14450')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (7, N'Latasha', N'Hays', N'(716) 986-3359', N'latasha.hays@hotmail.com', N'7014 Manor Station Rd. ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (8, N'Jacquline', N'Duncan', NULL, N'jacquline.duncan@yahoo.com', N'15 Brown St. ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (9, N'Genoveva', N'Baldwin', NULL, N'genoveva.baldwin@msn.com', N'8550 Spruce Drive ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (10, N'Pamelia', N'Newman', NULL, N'pamelia.newman@gmail.com', N'476 Chestnut Ave. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (11, N'Deshawn', N'Mendoza', NULL, N'deshawn.mendoza@yahoo.com', N'8790 Cobblestone Street ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (12, N'Robby', N'Sykes', N'(516) 583-7761', N'robby.sykes@hotmail.com', N'486 Rock Maple Street ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (13, N'Lashawn', N'Ortiz', NULL, N'lashawn.ortiz@msn.com', N'27 Washington Rd. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (14, N'Garry', N'Espinoza', NULL, N'garry.espinoza@hotmail.com', N'7858 Rockaway Court ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (15, N'Linnie', N'Branch', NULL, N'linnie.branch@gmail.com', N'314 South Columbia Ave. ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (16, N'Emmitt', N'Sanchez', N'(212) 945-8823', N'emmitt.sanchez@hotmail.com', N'461 Squaw Creek Road ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (17, N'Caren', N'Stephens', NULL, N'caren.stephens@msn.com', N'914 Brook St. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (18, N'Georgetta', N'Hardin', NULL, N'georgetta.hardin@aol.com', N'474 Chapel Dr. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (19, N'Lizzette', N'Stein', NULL, N'lizzette.stein@yahoo.com', N'19 Green Hill Lane ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (20, N'Aleta', N'Shepard', NULL, N'aleta.shepard@aol.com', N'684 Howard St. ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (21, N'Tobie', N'Little', NULL, N'tobie.little@gmail.com', N'10 Silver Spear Dr. ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (22, N'Adelle', N'Larsen', NULL, N'adelle.larsen@gmail.com', N'683 West Kirkland Dr. ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (23, N'Kaylee', N'English', NULL, N'kaylee.english@msn.com', N'8786 Fulton Rd. ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (24, N'Corene', N'Wall', NULL, N'corene.wall@msn.com', N'9601 Ocean Rd. ', N'Atwater', N'CA', N'95301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (25, N'Regenia', N'Vaughan', NULL, N'regenia.vaughan@gmail.com', N'44 Stonybrook Street ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (26, N'Theo', N'Reese', N'(562) 215-2907', N'theo.reese@gmail.com', N'8755 W. Wild Horse St. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (27, N'Santos', N'Valencia', NULL, N'santos.valencia@yahoo.com', N'7479 Carpenter Street ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (28, N'Jeanice', N'Frost', NULL, N'jeanice.frost@hotmail.com', N'76 Devon Lane ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (29, N'Syreeta', N'Hendricks', NULL, N'syreeta.hendricks@msn.com', N'193 Spruce Road ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (30, N'Jamaal', N'Albert', NULL, N'jamaal.albert@gmail.com', N'853 Stonybrook Street ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (31, N'Williemae', N'Holloway', N'(510) 246-8375', N'williemae.holloway@msn.com', N'69 Cypress St. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (32, N'Araceli', N'Golden', NULL, N'araceli.golden@msn.com', N'12 Ridgeview Ave. ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (33, N'Deloris', N'Burke', NULL, N'deloris.burke@hotmail.com', N'895 Edgemont Drive ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (34, N'Brittney', N'Woodward', NULL, N'brittney.woodward@aol.com', N'960 River St. ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (35, N'Guillermina', N'Noble', NULL, N'guillermina.noble@msn.com', N'6 Del Monte Lane ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (36, N'Bernita', N'Mcdaniel', NULL, N'bernita.mcdaniel@hotmail.com', N'2 Peg Shop Ave. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (37, N'Melia', N'Brady', NULL, N'melia.brady@gmail.com', N'907 Shirley Rd. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (38, N'Zelma', N'Browning', NULL, N'zelma.browning@aol.com', N'296 Second Street ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (39, N'Janetta', N'Aguirre', N'(717) 670-2634', N'janetta.aguirre@aol.com', N'214 Second Court ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (40, N'Ronna', N'Butler', NULL, N'ronna.butler@gmail.com', N'9438 Plymouth Court ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (41, N'Kathie', N'Freeman', NULL, N'kathie.freeman@msn.com', N'667 Temple Dr. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (42, N'Tangela', N'Quinn', NULL, N'tangela.quinn@aol.com', N'4 S. Purple Finch Road ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (43, N'Mozelle', N'Carter', N'(281) 489-9656', N'mozelle.carter@aol.com', N'895 Chestnut Ave. ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (44, N'Onita', N'Johns', NULL, N'onita.johns@msn.com', N'32 Glen Creek Lane ', N'Elmont', N'NY', N'11003')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (45, N'Bennett', N'Armstrong', NULL, N'bennett.armstrong@aol.com', N'688 Walnut Street ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (46, N'Monika', N'Berg', NULL, N'monika.berg@gmail.com', N'369 Vernon Dr. ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (47, N'Bridgette', N'Guerra', NULL, N'bridgette.guerra@hotmail.com', N'9982 Manor Drive ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (48, N'Cesar', N'Jackson', NULL, N'cesar.jackson@gmail.com', N'8068 N. Griffin Ave. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (49, N'Caroll', N'Hays', NULL, N'caroll.hays@yahoo.com', N'9381 Wrangler St. ', N'Fairport', N'NY', N'14450')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (50, N'Cleotilde', N'Booth', NULL, N'cleotilde.booth@gmail.com', N'17 Corona St. ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (51, N'Gertrud', N'Rhodes', NULL, N'gertrud.rhodes@aol.com', N'9961 Meadowbrook Street ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (52, N'Tu', N'Ramirez', NULL, N'tu.ramirez@hotmail.com', N'24 W. Courtland Street ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (53, N'Saturnina', N'Garner', NULL, N'saturnina.garner@gmail.com', N'8538 Fairground St. ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (54, N'Fran', N'Yang', NULL, N'fran.yang@hotmail.com', N'440 Pearl St. ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (55, N'Diana', N'Guerra', NULL, N'diana.guerra@hotmail.com', N'45 Chapel Ave. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (56, N'Lolita', N'Mosley', N'(281) 363-3309', N'lolita.mosley@hotmail.com', N'376 S. High Ridge St. ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (57, N'Pamala', N'Henry', NULL, N'pamala.henry@aol.com', N'197 Bridgeton Ave. ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (58, N'Damien', N'Dorsey', NULL, N'damien.dorsey@yahoo.com', N'161 Old York Street ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (59, N'Latasha', N'Stanley', NULL, N'latasha.stanley@gmail.com', N'8068 Fordham Drive ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (60, N'Neil', N'Mccall', NULL, N'neil.mccall@gmail.com', N'7476 Oakland Dr. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (61, N'Elinore', N'Aguilar', NULL, N'elinore.aguilar@msn.com', N'9766 Rockcrest Ave. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (62, N'Alica', N'Hunter', NULL, N'alica.hunter@hotmail.com', N'8 San Juan Drive ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (63, N'Tenisha', N'Lyons', NULL, N'tenisha.lyons@aol.com', N'78 E. Rock Creek Street ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (64, N'Bobbie', N'Foster', NULL, N'bobbie.foster@yahoo.com', N'988 Pineknoll Ave. ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (65, N'Kanesha', N'Vega', NULL, N'kanesha.vega@gmail.com', N'771 E. Oxford Drive ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (66, N'Lorrie', N'Becker', NULL, N'lorrie.becker@yahoo.com', N'19 North Court ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (67, N'Tommie', N'Melton', N'(916) 802-2952', N'tommie.melton@gmail.com', N'8 West Old York St. ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (68, N'Jayne', N'Kirkland', NULL, N'jayne.kirkland@hotmail.com', N'7800 Second Lane ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (69, N'Katelin', N'Kennedy', NULL, N'katelin.kennedy@gmail.com', N'286 Myrtle Lane ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (70, N'Tomasa', N'Carson', NULL, N'tomasa.carson@aol.com', N'10 Clark Avenue ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (71, N'Takako', N'Casey', NULL, N'takako.casey@aol.com', N'7548 Court Lane ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (72, N'Petronila', N'Norris', NULL, N'petronila.norris@aol.com', N'72 South Marshall Lane ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (73, N'Melanie', N'Hayes', NULL, N'melanie.hayes@msn.com', N'5 N. Hall Dr. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (74, N'Georgeann', N'Waller', NULL, N'georgeann.waller@yahoo.com', N'9797 Bald Hill Ave. ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (75, N'Abby', N'Gamble', NULL, N'abby.gamble@aol.com', N'60 Myers Dr. ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (76, N'Parker', N'Prince', NULL, N'parker.prince@hotmail.com', N'21 Sulphur Springs Drive ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (77, N'Keri', N'Bridges', NULL, N'keri.bridges@gmail.com', N'8504 Brickell Ave. ', N'Richardson', N'TX', N'75080')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (78, N'Chi', N'Goff', NULL, N'chi.goff@aol.com', N'3 W. Glen Ridge Avenue ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (79, N'Ashanti', N'Parks', NULL, N'ashanti.parks@hotmail.com', N'846 N. Helen St. ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (80, N'Sarai', N'Mckee', N'(716) 912-8110', N'sarai.mckee@msn.com', N'641 Glenwood Avenue ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (81, N'Zina', N'Bonner', NULL, N'zina.bonner@hotmail.com', N'9312 8th Street ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (82, N'Lizzie', N'Joyner', NULL, N'lizzie.joyner@msn.com', N'8541 Roberts St. ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (83, N'Tiesha', N'Daniel', NULL, N'tiesha.daniel@yahoo.com', N'6 West Bohemia Lane ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (84, N'Armand', N'Whitehead', NULL, N'armand.whitehead@hotmail.com', N'639 Harvey St. ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (85, N'Teofila', N'Fischer', NULL, N'teofila.fischer@aol.com', N'1 West Brickyard St. ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (86, N'Lissa', N'Vargas', NULL, N'lissa.vargas@yahoo.com', N'517 Victoria Ave. ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (87, N'Yan', N'Mcgowan', NULL, N'yan.mcgowan@msn.com', N'8960 Newport Ave. ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (88, N'Titus', N'Bullock', NULL, N'titus.bullock@gmail.com', N'29 Oxford Avenue ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (89, N'Arvilla', N'Osborn', NULL, N'arvilla.osborn@gmail.com', N'60 Acacia Lane ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (90, N'Marjorie', N'Logan', NULL, N'marjorie.logan@msn.com', N'95 Grandrose St. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (91, N'Marvin', N'Mullins', N'(619) 635-2027', N'marvin.mullins@aol.com', N'7489 Redwood Drive ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (92, N'Tena', N'Cruz', NULL, N'tena.cruz@yahoo.com', N'1 South St. ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (93, N'Corrina', N'Sawyer', N'(248) 370-1364', N'corrina.sawyer@yahoo.com', N'95 Briarwood Lane ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (94, N'Sharyn', N'Hopkins', NULL, N'sharyn.hopkins@hotmail.com', N'4 South Temple Ave. ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (95, N'Letitia', N'Franco', NULL, N'letitia.franco@aol.com', N'607 Lakeview Drive ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (96, N'Floretta', N'Higgins', NULL, N'floretta.higgins@hotmail.com', N'870 Lilac Dr. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (97, N'Louanne', N'Martin', NULL, N'louanne.martin@hotmail.com', N'1 Campfire Ave. ', N'Yuba City', N'CA', N'95993')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (98, N'Violet', N'Valenzuela', NULL, N'violet.valenzuela@msn.com', N'8668 Piper Street ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (99, N'Carie', N'Kidd', NULL, N'carie.kidd@yahoo.com', N'6 East Clinton Street ', N'Monroe', N'NY', N'10950')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (100, N'Kellie', N'Franco', NULL, N'kellie.franco@yahoo.com', N'444 South Walnut Rd. ', N'Commack', N'NY', N'11725')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (101, N'Nichelle', N'Howell', NULL, N'nichelle.howell@aol.com', N'7670 Forest St. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (102, N'Marisol', N'Goodman', NULL, N'marisol.goodman@gmail.com', N'864 East Cherry St. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (103, N'Sylvie', N'Wilkerson', NULL, N'sylvie.wilkerson@yahoo.com', N'750 Central Ave. ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (104, N'Katharina', N'Bates', NULL, N'katharina.bates@gmail.com', N'54 South Greenview Drive ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (105, N'Marget', N'Hodge', NULL, N'marget.hodge@msn.com', N'7199 Selby Lane ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (106, N'Raul', N'Melendez', NULL, N'raul.melendez@hotmail.com', N'9772 Manhattan St. ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (107, N'Cecil', N'Hopper', NULL, N'cecil.hopper@yahoo.com', N'471 Glenlake Ave. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (108, N'Shae', N'Hickman', NULL, N'shae.hickman@hotmail.com', N'740 Pin Oak Street ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (109, N'Monica', N'Sears', N'(408) 704-8863', N'monica.sears@aol.com', N'57 Glenholme St. ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (110, N'Ollie', N'Zimmerman', N'(657) 648-2863', N'ollie.zimmerman@yahoo.com', N'69 Wood Rd. ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (111, N'Shila', N'White', NULL, N'shila.white@msn.com', N'94 Lakeshore Street ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (112, N'Yuk', N'Vega', NULL, N'yuk.vega@yahoo.com', N'413 Wood St. ', N'West Hempstead', N'NY', N'11552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (113, N'Eliana', N'Silva', NULL, N'eliana.silva@gmail.com', N'7119 Summer Rd. ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (114, N'Thalia', N'Horne', NULL, N'thalia.horne@yahoo.com', N'9312 Harvard Street ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (115, N'Rey', N'Lindsay', NULL, N'rey.lindsay@gmail.com', N'16 Philmont St. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (116, N'Merlene', N'Vinson', NULL, N'merlene.vinson@gmail.com', N'431 Vine Dr. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (117, N'Dacia', N'William', NULL, N'dacia.william@msn.com', N'62 Cypress Drive ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (118, N'Le', N'Wood', NULL, N'le.wood@yahoo.com', N'90 Primrose Dr. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (119, N'Thalia', N'Dillard', NULL, N'thalia.dillard@yahoo.com', N'987 NE. Gates Street ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (120, N'Luz', N'House', N'(559) 114-2580', N'luz.house@gmail.com', N'491 Railroad Street ', N'Fresno', N'CA', N'93706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (121, N'Lucy', N'Woods', NULL, N'lucy.woods@gmail.com', N'8437 West Rockaway St. ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (122, N'Shena', N'Carter', NULL, N'shena.carter@yahoo.com', N'72 University Road ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (123, N'Robena', N'Hill', N'(361) 598-4414', N'robena.hill@hotmail.com', N'263 Cross St. ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (124, N'Jeni', N'Booker', NULL, N'jeni.booker@gmail.com', N'546 Railroad Dr. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (125, N'Herlinda', N'Stone', NULL, N'herlinda.stone@msn.com', N'725 Gulf St. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (126, N'Lavina', N'Dejesus', NULL, N'lavina.dejesus@msn.com', N'59 E. Valley Avenue ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (127, N'Erlinda', N'Nielsen', NULL, N'erlinda.nielsen@aol.com', N'728 Oxford Lane ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (128, N'Terrance', N'Lynn', NULL, N'terrance.lynn@yahoo.com', N'91 East Buckingham Drive ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (129, N'Walton', N'Dejesus', NULL, N'walton.dejesus@yahoo.com', N'15 Washington Rd. ', N'Lockport', N'NY', N'14094')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (130, N'Wes', N'Stanton', N'(248) 247-5074', N'wes.stanton@msn.com', N'8662 Tunnel Street ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (131, N'Tanesha', N'Hampton', NULL, N'tanesha.hampton@hotmail.com', N'19 Belmont Ave. ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (132, N'Boyd', N'Irwin', NULL, N'boyd.irwin@hotmail.com', N'221 Whitemarsh St. ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (133, N'Delbert', N'Wilkins', NULL, N'delbert.wilkins@aol.com', N'420 Greenview St. ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (134, N'Brianna', N'Moss', N'(516) 156-8031', N'brianna.moss@msn.com', N'4 Longfellow St. ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (135, N'Dorthey', N'Jackson', N'(281) 926-8010', N'dorthey.jackson@msn.com', N'9768 Brookside St. ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (136, N'Sarita', N'Parks', NULL, N'sarita.parks@msn.com', N'7809 Second Lane ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (137, N'Shonta', N'Mercer', NULL, N'shonta.mercer@aol.com', N'319 NE. La Sierra Avenue ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (138, N'Jone', N'Bernard', N'(657) 536-5165', N'jone.bernard@hotmail.com', N'99 Longbranch Court ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (139, N'Wanita', N'Davenport', NULL, N'wanita.davenport@aol.com', N'525 Dogwood Ave. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (140, N'Cleopatra', N'Tate', NULL, N'cleopatra.tate@aol.com', N'97 N. Glenwood St. ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (141, N'Ramiro', N'Byers', NULL, N'ramiro.byers@gmail.com', N'16 Pleasant St. ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (142, N'Nicholas', N'Vazquez', NULL, N'nicholas.vazquez@hotmail.com', N'9 Roosevelt Street ', N'West Hempstead', N'NY', N'11552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (143, N'Janae', N'Doyle', NULL, N'janae.doyle@gmail.com', N'760 Rose Ave. ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (144, N'Hans', N'Price', NULL, N'hans.price@hotmail.com', N'51 Glendale Road ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (145, N'Miquel', N'Neal', NULL, N'miquel.neal@hotmail.com', N'9564 Deerfield Lane ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (146, N'Stefany', N'Potter', NULL, N'stefany.potter@gmail.com', N'256 South Academy St. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (147, N'Bernetta', N'Marquez', NULL, N'bernetta.marquez@hotmail.com', N'626 E. Dunbar Street ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (148, N'Julee', N'Woodard', NULL, N'julee.woodard@yahoo.com', N'869 Summerhouse Dr. ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (149, N'Meredith', N'Bryan', NULL, N'meredith.bryan@hotmail.com', N'8935 E. Oxford St. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (150, N'Weldon', N'Michael', NULL, N'weldon.michael@hotmail.com', N'9952 Nut Swamp St. ', N'Huntington', N'NY', N'11743')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (151, N'Joesph', N'Delacruz', NULL, N'joesph.delacruz@aol.com', N'184 Cypress Street ', N'Atwater', N'CA', N'95301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (152, N'Katherina', N'Odom', NULL, N'katherina.odom@yahoo.com', N'897 N. Oak Drive ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (153, N'Laraine', N'Robbins', NULL, N'laraine.robbins@yahoo.com', N'8214 E. Pin Oak Lane ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (154, N'Jenise', N'Preston', NULL, N'jenise.preston@yahoo.com', N'9 Littleton Drive ', N'Helotes', N'TX', N'78023')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (155, N'Lory', N'Page', NULL, N'lory.page@hotmail.com', N'58 Summerhouse Street ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (156, N'Charlyn', N'Cantrell', NULL, N'charlyn.cantrell@yahoo.com', N'8756 Euclid St. ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (157, N'Carola', N'Rodriquez', NULL, N'carola.rodriquez@hotmail.com', N'9433 Heritage Lane ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (158, N'Alane', N'Kennedy', NULL, N'alane.kennedy@yahoo.com', N'34 Green Lake Street ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (159, N'Regina', N'Burns', NULL, N'regina.burns@aol.com', N'713 Buckingham St. ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (160, N'Omer', N'Estrada', NULL, N'omer.estrada@gmail.com', N'9 Honey Creek Street ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (161, N'Crystle', N'Gilliam', NULL, N'crystle.gilliam@yahoo.com', N'86 Edgewater Road ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (162, N'Kam', N'Wilder', NULL, N'kam.wilder@hotmail.com', N'500 West Clay Ave. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (163, N'Margert', N'Stevens', NULL, N'margert.stevens@aol.com', N'502 North Poplar St. ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (164, N'Tomika', N'Larson', NULL, N'tomika.larson@yahoo.com', N'254 Canal St. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (165, N'Jeromy', N'Burch', N'(408) 955-8238', N'jeromy.burch@msn.com', N'889 Mulberry Street ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (166, N'Lena', N'Mills', NULL, N'lena.mills@yahoo.com', N'42 Homestead St. ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (167, N'Loreta', N'Johnston', NULL, N'loreta.johnston@yahoo.com', N'39 Lafayette Dr. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (168, N'Nettie', N'Mcdaniel', NULL, N'nettie.mcdaniel@hotmail.com', N'7004 E. Wakehurst St. ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (169, N'Karla', N'Kirk', NULL, N'karla.kirk@yahoo.com', N'9718 Harvard Rd. ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (170, N'Regine', N'Gonzales', N'(805) 763-4045', N'regine.gonzales@gmail.com', N'798 Court Drive ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (171, N'Miriam', N'Baker', NULL, N'miriam.baker@hotmail.com', N'90 Studebaker St. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (172, N'Jeanie', N'Kirkland', NULL, N'jeanie.kirkland@aol.com', N'7643 Old Theatre St. ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (173, N'Marquerite', N'Dawson', NULL, N'marquerite.dawson@gmail.com', N'37 Hamilton Court ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (174, N'Babara', N'Ochoa', NULL, N'babara.ochoa@aol.com', N'872 Smith Store St. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (175, N'Nova', N'Hess', NULL, N'nova.hess@msn.com', N'773 South Lafayette St. ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (176, N'Carley', N'Reynolds', NULL, N'carley.reynolds@gmail.com', N'2 Snake Hill Drive ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (177, N'Carissa', N'Foreman', NULL, N'carissa.foreman@msn.com', N'69C N. Ridge Rd. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (178, N'Genoveva', N'Tyler', N'(212) 152-6381', N'genoveva.tyler@gmail.com', N'8121 Windfall Ave. ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (179, N'Deane', N'Sears', NULL, N'deane.sears@hotmail.com', N'3 Bradford Court ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (180, N'Karey', N'Steele', NULL, N'karey.steele@gmail.com', N'8879 Kent Lane ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (181, N'Olevia', N'Pitts', NULL, N'olevia.pitts@gmail.com', N'39 Fieldstone Drive ', N'Redondo Beach', N'CA', N'90278')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (182, N'Jenniffer', N'Bullock', NULL, N'jenniffer.bullock@msn.com', N'38 Oxford Avenue ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (183, N'Jeniffer', N'Ratliff', NULL, N'jeniffer.ratliff@gmail.com', N'510 Rocky River Court ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (184, N'Klara', N'Stanley', NULL, N'klara.stanley@aol.com', N'603 Mechanic St. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (185, N'Morton', N'Lee', NULL, N'morton.lee@yahoo.com', N'313 Ridge St. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (186, N'Ken', N'Charles', NULL, N'ken.charles@msn.com', N'9124 W. Piper Lane ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (187, N'Hedwig', N'Paul', NULL, N'hedwig.paul@msn.com', N'422 Manor Ave. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (188, N'Sharla', N'Flynn', N'(805) 478-7724', N'sharla.flynn@hotmail.com', N'7 Brown Drive ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (189, N'Damian', N'Dawson', NULL, N'damian.dawson@hotmail.com', N'528 St Margarets Street ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (190, N'Toya', N'Pratt', N'(562) 218-6405', N'toya.pratt@yahoo.com', N'485 San Pablo Drive ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (191, N'Graciela', N'Barber', N'(805) 656-6987', N'graciela.barber@hotmail.com', N'1 E. Young St. ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (192, N'Bong', N'Hebert', NULL, N'bong.hebert@gmail.com', N'545 Brook St. ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (193, N'Ayanna', N'Rhodes', NULL, N'ayanna.rhodes@msn.com', N'7425 Pheasant St. ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (194, N'Dorine', N'Roberson', NULL, N'dorine.roberson@msn.com', N'396 Meadowbrook Lane ', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (195, N'Addie', N'Hahn', NULL, N'addie.hahn@hotmail.com', N'8165 Baker Ave. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (196, N'Edythe', N'Valencia', NULL, N'edythe.valencia@yahoo.com', N'9346 Wall St. ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (197, N'Andy', N'O''neill', NULL, N'andy.o''neill@msn.com', N'9544 Mulberry Drive ', N'Rego Park', N'NY', N'11374')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (198, N'Luis', N'Tyler', NULL, N'luis.tyler@gmail.com', N'9568 Campfire Circle ', N'Amarillo', N'TX', N'79106')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (199, N'Clelia', N'Workman', NULL, N'clelia.workman@yahoo.com', N'620 North Somerset St. ', N'New Windsor', N'NY', N'12553')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (200, N'Ashely', N'Holmes', NULL, N'ashely.holmes@aol.com', N'45 High Ridge Ave. ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (201, N'Candis', N'Harding', NULL, N'candis.harding@gmail.com', N'33 NW. Cambridge Ave. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (202, N'Marni', N'Bolton', N'(717) 670-6268', N'marni.bolton@msn.com', N'7469 Plymouth Ave. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (203, N'Minerva', N'Decker', N'(281) 271-6390', N'minerva.decker@yahoo.com', N'794 Greenrose Street ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (204, N'Alpha', N'King', NULL, N'alpha.king@hotmail.com', N'14 Henry Smith St. ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (205, N'Harris', N'Pittman', NULL, N'harris.pittman@yahoo.com', N'404 Cherry Hill Road ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (206, N'Stephaine', N'Riddle', NULL, N'stephaine.riddle@hotmail.com', N'199 Vermont Court ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (207, N'Michel', N'Blankenship', NULL, N'michel.blankenship@msn.com', N'382 West Hill Dr. ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (208, N'Denis', N'Logan', NULL, N'denis.logan@msn.com', N'121 Rockcrest Street ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (209, N'Jutta', N'Everett', NULL, N'jutta.everett@gmail.com', N'27 Taylor Ave. ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (210, N'Priscilla', N'Wilkins', N'(229) 322-2269', N'priscilla.wilkins@aol.com', N'653 Pawnee Rd. ', N'Albany', N'NY', N'12203')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (211, N'Gilma', N'Dejesus', NULL, N'gilma.dejesus@yahoo.com', N'777 Thompson Ave. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (212, N'Buford', N'Bridges', N'(248) 604-7346', N'buford.bridges@msn.com', N'239 Oak Valley Court ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (213, N'Elenore', N'Hensley', NULL, N'elenore.hensley@hotmail.com', N'7037 Aspen St. ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (214, N'Ross', N'Pugh', NULL, N'ross.pugh@msn.com', N'8598 Saxon St. ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (215, N'Judith', N'Finley', NULL, N'judith.finley@hotmail.com', N'474 West Bank Road ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (216, N'Wai', N'Soto', NULL, N'wai.soto@msn.com', N'30 Arch Drive ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (217, N'Carline', N'Collier', N'(559) 810-6070', N'carline.collier@msn.com', N'28 Trenton Lane ', N'Fresno', N'CA', N'93706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (218, N'Casey', N'Gill', NULL, N'casey.gill@gmail.com', N'636 Prospect Avenue ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (219, N'Darcie', N'Morgan', N'(442) 618-7068', N'darcie.morgan@aol.com', N'476 East Adams Ave. ', N'Oceanside', N'NY', N'11572')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (220, N'Lucio', N'Sherman', NULL, N'lucio.sherman@gmail.com', N'842 Corona Ave. ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (221, N'Clementine', N'Mooney', NULL, N'clementine.mooney@yahoo.com', N'678 Charles Court ', N'Mcallen', N'TX', N'78501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (222, N'Anya', N'Contreras', NULL, N'anya.contreras@msn.com', N'38 Old Fairground St. ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (223, N'Scarlet', N'Yates', NULL, N'scarlet.yates@hotmail.com', N'687 Shirley St. ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (224, N'Moses', N'Pope', NULL, N'moses.pope@yahoo.com', N'654 Theatre Street ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (225, N'Barbera', N'Riggs', NULL, N'barbera.riggs@aol.com', N'12 Gartner Drive ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (226, N'Kiana', N'Rivera', NULL, N'kiana.rivera@gmail.com', N'9 Sheffield Dr. ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (227, N'Danielle', N'Bond', NULL, N'danielle.bond@msn.com', N'8589 Shub Farm Street ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (228, N'Whitney', N'Estes', N'(631) 315-4020', N'whitney.estes@gmail.com', N'454 Bear Hill Street ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (229, N'Molly', N'Langley', NULL, N'molly.langley@aol.com', N'63 Bridgeton Street ', N'Holbrook', N'NY', N'11741')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (230, N'Chelsey', N'Hardin', NULL, N'chelsey.hardin@hotmail.com', N'13 Brickyard Street ', N'Deer Park', N'NY', N'11729')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (231, N'Jenee', N'Rasmussen', N'(916) 219-1774', N'jenee.rasmussen@hotmail.com', N'19 George Lane ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (232, N'Freddie', N'Mathis', NULL, N'freddie.mathis@hotmail.com', N'31 Shady St. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (233, N'Mariana', N'Strong', NULL, N'mariana.strong@msn.com', N'972 Dunbar Dr. ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (234, N'Winfred', N'Harris', NULL, N'winfred.harris@msn.com', N'734 Glen Eagles St. ', N'East Meadow', N'NY', N'11554')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (235, N'Jeromy', N'Elliott', NULL, N'jeromy.elliott@gmail.com', N'7112 Laurel Street ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (236, N'Verona', N'O''neill', NULL, N'verona.o''neill@hotmail.com', N'8279 W. Sussex St. ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (237, N'Elvera', N'Peck', NULL, N'elvera.peck@yahoo.com', N'759 Lakewood Street ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (238, N'Cindi', N'Larson', NULL, N'cindi.larson@msn.com', N'896 Golden Star Rd. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (239, N'Felice', N'Guzman', NULL, N'felice.guzman@hotmail.com', N'7 Creekside Lane ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (240, N'Le', N'Deleon', NULL, N'le.deleon@msn.com', N'58 Clark Court ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (241, N'Manie', N'Sanchez', NULL, N'manie.sanchez@hotmail.com', N'471 Illinois Ave. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (242, N'Rutha', N'Howell', NULL, N'rutha.howell@gmail.com', N'9247 Jones Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (243, N'Natosha', N'Rowland', NULL, N'natosha.rowland@aol.com', N'51 Elmwood St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (244, N'Jessika', N'Bray', NULL, N'jessika.bray@yahoo.com', N'37 East Greystone St. ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (245, N'Delila', N'Hamilton', NULL, N'delila.hamilton@yahoo.com', N'7451 East James Ave. ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (246, N'Dionne', N'Norris', NULL, N'dionne.norris@yahoo.com', N'9993 Greenview Circle ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (247, N'Muriel', N'Juarez', NULL, N'muriel.juarez@gmail.com', N'8073 Cemetery Drive ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (248, N'Cecelia', N'Gill', NULL, N'cecelia.gill@aol.com', N'372 Silver Spear Dr. ', N'Mcallen', N'TX', N'78501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (249, N'Magda', N'Eaton', NULL, N'magda.eaton@aol.com', N'860 Middle River Street ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (250, N'Ivonne', N'Yang', N'(915) 181-1950', N'ivonne.yang@gmail.com', N'7359 North Lake View St. ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (251, N'Kasie', N'Rodriquez', NULL, N'kasie.rodriquez@aol.com', N'7 North Beech St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (252, N'Eleni', N'Gordon', NULL, N'eleni.gordon@hotmail.com', N'583 W. San Carlos Street ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (253, N'Maurice', N'Norton', NULL, N'maurice.norton@hotmail.com', N'32 Mayflower Dr. ', N'Atwater', N'CA', N'95301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (254, N'Cristobal', N'Hutchinson', NULL, N'cristobal.hutchinson@gmail.com', N'58 Washington Avenue ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (255, N'Flossie', N'Holder', NULL, N'flossie.holder@msn.com', N'8459 W. Newport Court ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (256, N'Erma', N'Salinas', NULL, N'erma.salinas@gmail.com', N'347 Sheffield St. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (257, N'Earl', N'Stanley', NULL, N'earl.stanley@gmail.com', N'569 Lake Lane ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (258, N'Maribel', N'William', NULL, N'maribel.william@aol.com', N'65 Magnolia Ave. ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (259, N'Johnathan', N'Velazquez', NULL, N'johnathan.velazquez@hotmail.com', N'9680 E. Somerset Street ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (260, N'Rodrick', N'Shelton', NULL, N'rodrick.shelton@hotmail.com', N'7157 Addison Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (261, N'Ferne', N'Kline', NULL, N'ferne.kline@hotmail.com', N'303 Shady St. ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (262, N'Rubin', N'Decker', N'(716) 950-9835', N'rubin.decker@gmail.com', N'9875 Shady Ave. ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (263, N'Dortha', N'Jarvis', N'(442) 919-8256', N'dortha.jarvis@yahoo.com', N'76 Prince Drive ', N'Oceanside', N'NY', N'11572')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (264, N'Mariela', N'Huffman', NULL, N'mariela.huffman@gmail.com', N'531 Fieldstone Road ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (265, N'Mellisa', N'Farley', NULL, N'mellisa.farley@yahoo.com', N'21 West Princess St. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (266, N'Myung', N'Hooper', NULL, N'myung.hooper@gmail.com', N'951 Mill Road ', N'Elmont', N'NY', N'11003')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (267, N'Angelina', N'Lloyd', NULL, N'angelina.lloyd@yahoo.com', N'9593 North Sherman Dr. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (268, N'Trinity', N'Riddle', NULL, N'trinity.riddle@aol.com', N'23 Oakland Lane ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (269, N'Barton', N'Crosby', NULL, N'barton.crosby@msn.com', N'896 Edgewater St. ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (270, N'Claudio', N'Wise', NULL, N'claudio.wise@hotmail.com', N'810 Oxford Ave. ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (271, N'Katheleen', N'Marks', NULL, N'katheleen.marks@yahoo.com', N'69 North Tower St. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (272, N'Deja', N'Chaney', NULL, N'deja.chaney@hotmail.com', N'52 Woodside Ave. ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (273, N'Queenie', N'Vance', NULL, N'queenie.vance@gmail.com', N'172 Arcadia Ave. ', N'Ozone Park', N'NY', N'11417')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (274, N'Josh', N'Shaw', NULL, N'josh.shaw@gmail.com', N'212 North Leeton Ridge Street ', N'Hopewell Junction', N'NY', N'12533')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (275, N'Pinkie', N'Kirkland', NULL, N'pinkie.kirkland@yahoo.com', N'18 Myers St. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (276, N'Lavette', N'Wright', NULL, N'lavette.wright@msn.com', N'6 Windsor Street ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (277, N'Mark', N'Garrett', NULL, N'mark.garrett@msn.com', N'285 Rosewood Dr. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (278, N'Myesha', N'Burgess', NULL, N'myesha.burgess@gmail.com', N'306 Trenton Rd. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (279, N'Justina', N'Long', NULL, N'justina.long@aol.com', N'39 Littleton Ave. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (280, N'Brenda', N'Tate', NULL, N'brenda.tate@msn.com', N'36 Hilltop Street ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (281, N'Rayna', N'Perry', NULL, N'rayna.perry@hotmail.com', N'7238 Oakland St. ', N'Ozone Park', N'NY', N'11417')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (282, N'Randolph', N'Chase', NULL, N'randolph.chase@yahoo.com', N'828 Bridle Ave. ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (283, N'Jaimee', N'Day', NULL, N'jaimee.day@aol.com', N'7534 Whitemarsh Ave. ', N'Poughkeepsie', N'NY', N'12601')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (284, N'Susann', N'Bass', NULL, N'susann.bass@msn.com', N'21 Old Rock Maple Ave. ', N'Commack', N'NY', N'11725')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (285, N'Leola', N'Gould', NULL, N'leola.gould@gmail.com', N'8 Kirkland St. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (286, N'Virgil', N'Frost', NULL, N'virgil.frost@gmail.com', N'9798 Beacon St. ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (287, N'Mireille', N'Puckett', N'(805) 961-9909', N'mireille.puckett@hotmail.com', N'378 Purple Finch Drive ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (288, N'Keturah', N'Massey', NULL, N'keturah.massey@msn.com', N'189 Arnold Drive ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (289, N'Charmain', N'Webster', NULL, N'charmain.webster@hotmail.com', N'36 East Stonybrook Rd. ', N'Richardson', N'TX', N'75080')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (290, N'Barry', N'Buckner', NULL, N'barry.buckner@gmail.com', N'8779 High Noon Rd. ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (291, N'Boyce', N'Burks', NULL, N'boyce.burks@gmail.com', N'879 Harvey Dr. ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (292, N'Monty', N'Frost', N'(516) 460-5396', N'monty.frost@aol.com', N'76 Foxrun Dr. ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (293, N'Tiny', N'French', NULL, N'tiny.french@hotmail.com', N'7163 Hall St. ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (294, N'Clementina', N'Sargent', NULL, N'clementina.sargent@hotmail.com', N'9853 Catherine Road ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (295, N'Danny', N'Kim', NULL, N'danny.kim@msn.com', N'74 Essex Drive ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (296, N'Sophia', N'Mcmillan', NULL, N'sophia.mcmillan@msn.com', N'8541 S. Pleasant Street ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (297, N'Christia', N'Carson', NULL, N'christia.carson@gmail.com', N'220 Orchard Street ', N'Helotes', N'TX', N'78023')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (298, N'Jennie', N'Middleton', NULL, N'jennie.middleton@gmail.com', N'95 High Noon Dr. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (299, N'Jame', N'Riggs', NULL, N'jame.riggs@hotmail.com', N'9237 Hudson Drive ', N'Bay Shore', N'NY', N'11706')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (300, N'Rayford', N'Simon', NULL, N'rayford.simon@msn.com', N'998 Whitemarsh Road ', N'Mountain View', N'CA', N'94043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (301, N'Annett', N'Garrett', NULL, N'annett.garrett@yahoo.com', N'19 Euclid Lane ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (302, N'Hayden', N'Cross', NULL, N'hayden.cross@gmail.com', N'90 Pumpkin Hill St. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (303, N'Rolanda', N'Larsen', NULL, N'rolanda.larsen@yahoo.com', N'5 West University Court ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (304, N'Jayme', N'Zamora', NULL, N'jayme.zamora@gmail.com', N'2 Ridge Lane ', N'Springfield Gardens', N'NY', N'11413')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (305, N'Hope', N'Cotton', NULL, N'hope.cotton@aol.com', N'9092 Blue Spring Dr. ', N'Redondo Beach', N'CA', N'90278')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (306, N'Vikki', N'Erickson', NULL, N'vikki.erickson@yahoo.com', N'24 Jones Street ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (307, N'Fransisca', N'Nicholson', NULL, N'fransisca.nicholson@aol.com', N'945 Schoolhouse Street ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (308, N'Mazie', N'Fernandez', NULL, N'mazie.fernandez@hotmail.com', N'583 Harvard Ave. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (309, N'Anderson', N'Martin', NULL, N'anderson.martin@hotmail.com', N'9051 Hillside Dr. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (310, N'Gilberto', N'Parsons', NULL, N'gilberto.parsons@gmail.com', N'8115 North Edgewater Drive ', N'Middle Village', N'NY', N'11379')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (311, N'Charise', N'Burt', N'(559) 888-2229', N'charise.burt@aol.com', N'582 Creek St. ', N'Fresno', N'CA', N'93706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (312, N'Cameron', N'Carroll', NULL, N'cameron.carroll@yahoo.com', N'9133 South Halifax Ave. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (313, N'Melani', N'Jarvis', NULL, N'melani.jarvis@hotmail.com', N'8 Tunnel St. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (314, N'Javier', N'Nichols', NULL, N'javier.nichols@msn.com', N'8944 Marconi St. ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (315, N'Justina', N'Jenkins', NULL, N'justina.jenkins@yahoo.com', N'8236 Creek St. ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (316, N'Hortencia', N'Graham', NULL, N'hortencia.graham@aol.com', N'7764 Greenrose Street ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (317, N'Christia', N'Wilkins', NULL, N'christia.wilkins@msn.com', N'7062 Willow Court ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (318, N'Eliz', N'Whitney', NULL, N'eliz.whitney@msn.com', N'523 Crescent Court ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (319, N'Justin', N'Newton', NULL, N'justin.newton@hotmail.com', N'93 Shore Rd. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (320, N'Aron', N'Wiggins', N'(442) 497-3353', N'aron.wiggins@aol.com', N'6 Bradford St. ', N'Oceanside', N'NY', N'11572')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (321, N'Chere', N'Hardin', NULL, N'chere.hardin@yahoo.com', N'763 Fulton Road ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (322, N'Merideth', N'Preston', NULL, N'merideth.preston@yahoo.com', N'794 Rockaway St. ', N'Poughkeepsie', N'NY', N'12601')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (323, N'Jeniffer', N'Slater', NULL, N'jeniffer.slater@aol.com', N'30 Old Orange Lane ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (324, N'Laureen', N'Paul', NULL, N'laureen.paul@yahoo.com', N'617 Squaw Creek Rd. ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (325, N'Berna', N'Moore', NULL, N'berna.moore@hotmail.com', N'7230 Lafayette Drive ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (326, N'Shiela', N'Calderon', NULL, N'shiela.calderon@msn.com', N'844 Albany St. ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (327, N'Sharie', N'Alvarez', N'(212) 211-7621', N'sharie.alvarez@msn.com', N'987 West Leatherwood Dr. ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (328, N'Bettie', N'Glover', NULL, N'bettie.glover@gmail.com', N'9083 Addison Dr. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (329, N'Marilyn', N'Frank', NULL, N'marilyn.frank@aol.com', N'8878 Branch Street ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (330, N'Sheba', N'Knapp', NULL, N'sheba.knapp@aol.com', N'86 Gates Street ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (331, N'Aleta', N'Mack', NULL, N'aleta.mack@yahoo.com', N'8869 W. Edgemont Lane ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (332, N'Reena', N'Higgins', NULL, N'reena.higgins@gmail.com', N'900 South Columbia Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (333, N'Ami', N'Mcmahon', NULL, N'ami.mcmahon@aol.com', N'566 Hilldale Drive ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (334, N'Somer', N'Jordan', NULL, N'somer.jordan@msn.com', N'7046 Helen Avenue ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (335, N'Scarlet', N'Reed', NULL, N'scarlet.reed@hotmail.com', N'151 S. Myers Court ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (336, N'Trisha', N'Johnson', N'(717) 126-8787', N'trisha.johnson@msn.com', N'59 Wild Horse St. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (337, N'Majorie', N'Wyatt', NULL, N'majorie.wyatt@yahoo.com', N'8507 Miller St. ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (338, N'Abbey', N'Pugh', NULL, N'abbey.pugh@gmail.com', N'26 Market Drive ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (339, N'Tamela', N'Harrell', NULL, N'tamela.harrell@aol.com', N'7316 Cypress Rd. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (340, N'Yanira', N'Bradshaw', NULL, N'yanira.bradshaw@gmail.com', N'7484 Ann Court ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (341, N'Delana', N'Scott', NULL, N'delana.scott@yahoo.com', N'7372 Ridgeview St. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (342, N'Cassondra', N'Pruitt', NULL, N'cassondra.pruitt@aol.com', N'4 Alderwood Circle ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (343, N'Jesica', N'Fields', NULL, N'jesica.fields@yahoo.com', N'318 Country Dr. ', N'Commack', N'NY', N'11725')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (344, N'Herta', N'Rollins', NULL, N'herta.rollins@msn.com', N'287 1st Drive ', N'Mountain View', N'CA', N'94043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (345, N'Mi', N'Gray', N'(229) 813-2130', N'mi.gray@aol.com', N'27 Roehampton Dr. ', N'Albany', N'NY', N'12203')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (346, N'Jacalyn', N'Barnett', NULL, N'jacalyn.barnett@gmail.com', N'7537 Swanson Street ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (347, N'Kanesha', N'Hudson', N'(510) 788-7298', N'kanesha.hudson@gmail.com', N'8293 Gartner Drive ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (348, N'Darren', N'Witt', NULL, N'darren.witt@aol.com', N'916 Hillcrest Ave. ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (349, N'Mable', N'Pratt', NULL, N'mable.pratt@gmail.com', N'254 SW. Temple Street ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (350, N'Christoper', N'Mccall', NULL, N'christoper.mccall@msn.com', N'72 Summit St. ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (351, N'Margorie', N'Wynn', NULL, N'margorie.wynn@gmail.com', N'707 Schoolhouse St. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (352, N'Josef', N'Greer', NULL, N'josef.greer@gmail.com', N'92 Summer Court ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (353, N'Tisa', N'Whitney', NULL, N'tisa.whitney@yahoo.com', N'549 Newbridge Dr. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (354, N'Tonda', N'Armstrong', NULL, N'tonda.armstrong@aol.com', N'19 Forest Rd. ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (355, N'Arvilla', N'Weiss', NULL, N'arvilla.weiss@msn.com', N'477 Blue Spring St. ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (356, N'Vashti', N'Rosario', NULL, N'vashti.rosario@yahoo.com', N'623 Johnson Circle ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (357, N'Sheri', N'Cole', N'(408) 658-2285', N'sheri.cole@aol.com', N'479 Chapel Court ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (358, N'Kandace', N'Giles', NULL, N'kandace.giles@msn.com', N'30 NE. Walt Whitman Drive ', N'Wantagh', N'NY', N'11793')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (359, N'Angie', N'Powers', NULL, N'angie.powers@aol.com', N'6 Rockland Dr. ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (360, N'Van', N'Peters', N'(281) 658-7772', N'van.peters@yahoo.com', N'45 Fifth Dr. ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (361, N'Virgina', N'Berg', NULL, N'virgina.berg@yahoo.com', N'804 South Purple Finch Drive ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (362, N'Olevia', N'Noel', NULL, N'olevia.noel@yahoo.com', N'39 N. Rosewood Dr. ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (363, N'Kaci', N'Gallegos', NULL, N'kaci.gallegos@gmail.com', N'8573 Halifax St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (364, N'Bev', N'Chang', NULL, N'bev.chang@yahoo.com', N'104 Rockville St. ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (365, N'Rodger', N'Rojas', NULL, N'rodger.rojas@yahoo.com', N'8442 Cooper Ave. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (366, N'Lavonne', N'Anderson', NULL, N'lavonne.anderson@aol.com', N'9420 Wintergreen Court ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (367, N'Blanca', N'Hooper', NULL, N'blanca.hooper@msn.com', N'340 Bald Hill St. ', N'Ozone Park', N'NY', N'11417')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (368, N'Alysha', N'Powers', NULL, N'alysha.powers@msn.com', N'39 West Marshall Ave. ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (369, N'Mary', N'Singleton', NULL, N'mary.singleton@hotmail.com', N'474 Amerige Ave. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (370, N'Jina', N'Cooper', NULL, N'jina.cooper@aol.com', N'8947 W. Lexington Rd. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (371, N'Loni', N'Duncan', NULL, N'loni.duncan@gmail.com', N'80 Saxton Lane ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (372, N'Collene', N'Roman', NULL, N'collene.roman@aol.com', N'30 North Argyle Dr. ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (373, N'Mariette', N'Trevino', NULL, N'mariette.trevino@aol.com', N'4 Border Court ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (374, N'Candelaria', N'Coffey', NULL, N'candelaria.coffey@aol.com', N'45 Newport Lane ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (375, N'Yan', N'Trevino', NULL, N'yan.trevino@gmail.com', N'796 Jefferson Rd. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (376, N'Elanor', N'Patrick', NULL, N'elanor.patrick@aol.com', N'51 Howard Ave. ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (377, N'Klara', N'Mosley', NULL, N'klara.mosley@gmail.com', N'518 Devon Court ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (378, N'Rosalba', N'O''neal', NULL, N'rosalba.o''neal@yahoo.com', N'7517 Pennsylvania St. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (379, N'Mina', N'Carrillo', NULL, N'mina.carrillo@aol.com', N'8659 Trenton Lane ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (380, N'Alesia', N'Horne', NULL, N'alesia.horne@aol.com', N'9229 Amherst Lane ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (381, N'Kristen', N'Alvarez', NULL, N'kristen.alvarez@aol.com', N'9778 North River St. ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (382, N'Collin', N'Webster', NULL, N'collin.webster@aol.com', N'475 Cottage Rd. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (383, N'Ashlee', N'Pena', NULL, N'ashlee.pena@aol.com', N'966 Highland St. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (384, N'Aimee', N'Merritt', NULL, N'aimee.merritt@yahoo.com', N'537 East Meadowbrook St. ', N'Flushing', N'NY', N'11354')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (385, N'Rochelle', N'Ward', NULL, N'rochelle.ward@yahoo.com', N'7855 La Sierra Street ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (386, N'Nelle', N'Beck', NULL, N'nelle.beck@aol.com', N'8998 Wakehurst Drive ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (387, N'Kaila', N'Walters', NULL, N'kaila.walters@msn.com', N'57 Gates Drive ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (388, N'Aleta', N'Stone', NULL, N'aleta.stone@aol.com', N'8 Elm Dr. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (389, N'Leif', N'Short', NULL, N'leif.short@gmail.com', N'962 Carpenter Ave. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (390, N'Lorrie', N'Pollard', NULL, N'lorrie.pollard@yahoo.com', N'7834 Shore Ave. ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (391, N'Vernita', N'Ball', NULL, N'vernita.ball@gmail.com', N'126 Arnold Dr. ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (392, N'Cyndi', N'Bush', NULL, N'cyndi.bush@gmail.com', N'18 Smoky Hollow Drive ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (393, N'Gertrude', N'Terry', NULL, N'gertrude.terry@hotmail.com', N'34 Airport Dr. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (394, N'Virgen', N'Clemons', NULL, N'virgen.clemons@gmail.com', N'354 Cactus Drive ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (395, N'Fairy', N'Robinson', NULL, N'fairy.robinson@msn.com', N'8837 Joy Ridge St. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (396, N'Laverna', N'Hernandez', NULL, N'laverna.hernandez@hotmail.com', N'34 South Longfellow St. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (397, N'Jeannie', N'Wilcox', NULL, N'jeannie.wilcox@yahoo.com', N'7744 Miles Dr. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (398, N'Suellen', N'Mercado', NULL, N'suellen.mercado@yahoo.com', N'3 Taylor Drive ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (399, N'Bart', N'Hess', NULL, N'bart.hess@aol.com', N'799 N. Maiden Street ', N'Kingston', N'NY', N'12401')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (400, N'Alfredo', N'Dodson', NULL, N'alfredo.dodson@hotmail.com', N'8960 Glenholme Dr. ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (401, N'Shaunda', N'Barnett', NULL, N'shaunda.barnett@gmail.com', N'9366 San Carlos Lane ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (402, N'Kerrie', N'Morton', NULL, N'kerrie.morton@hotmail.com', N'8772 State St. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (403, N'Elouise', N'Fry', NULL, N'elouise.fry@aol.com', N'49 Bohemia Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (404, N'Augustus', N'Steele', NULL, N'augustus.steele@aol.com', N'7474 N. Orchard St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (405, N'Greta', N'Page', NULL, N'greta.page@hotmail.com', N'8316 Augusta Drive ', N'Commack', N'NY', N'11725')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (406, N'Kerrie', N'O''neill', NULL, N'kerrie.o''neill@gmail.com', N'69 Wellington Ave. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (407, N'Dannette', N'Guerrero', NULL, N'dannette.guerrero@gmail.com', N'68 Carriage Street ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (408, N'Edra', N'Fitzgerald', NULL, N'edra.fitzgerald@msn.com', N'8892 Birchwood St. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (409, N'Jerome', N'Bolton', NULL, N'jerome.bolton@msn.com', N'9921 Argyle Street ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (410, N'Conception', N'Slater', NULL, N'conception.slater@gmail.com', N'5 Sunset Street ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (411, N'Octavia', N'Case', N'(212) 171-1335', N'octavia.case@aol.com', N'40 Charles Road ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (412, N'Dexter', N'Roberts', NULL, N'dexter.roberts@gmail.com', N'84 Thatcher Court ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (413, N'Ginette', N'Edwards', NULL, N'ginette.edwards@hotmail.com', N'9262 NW. Center Ave. ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (414, N'Romaine', N'Haley', NULL, N'romaine.haley@aol.com', N'737 Edgefield Drive ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (415, N'Gwendolyn', N'Miller', NULL, N'gwendolyn.miller@msn.com', N'90 Fordham Ave. ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (416, N'Luke', N'Fuller', N'(516) 363-2253', N'luke.fuller@hotmail.com', N'576 Cleveland Lane ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (417, N'Zoraida', N'Patton', NULL, N'zoraida.patton@aol.com', N'95 Grand Dr. ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (418, N'Georgeanna', N'Webster', N'(805) 885-8830', N'georgeanna.webster@msn.com', N'40 Creekside Circle ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (419, N'Krystin', N'Marshall', NULL, N'krystin.marshall@hotmail.com', N'10 Old Proctor Lane ', N'Poughkeepsie', N'NY', N'12601')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (420, N'Vince', N'Schneider', NULL, N'vince.schneider@hotmail.com', N'473 Corona Ave. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (421, N'Iola', N'Rasmussen', NULL, N'iola.rasmussen@yahoo.com', N'283 N. Manor Station Dr. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (422, N'Valery', N'Saunders', NULL, N'valery.saunders@msn.com', N'42 Marlborough St. ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (423, N'Johna', N'Powers', NULL, N'johna.powers@hotmail.com', N'379 Central Ave. ', N'Deer Park', N'NY', N'11729')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (424, N'Charleen', N'Hurst', NULL, N'charleen.hurst@yahoo.com', N'87 Country Avenue ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (425, N'Augustina', N'Joyner', NULL, N'augustina.joyner@aol.com', N'7931 Honey Creek Court ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (426, N'Daisy', N'Ward', NULL, N'daisy.ward@msn.com', N'45 Silver Spear Ave. ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (427, N'Latonya', N'Dixon', NULL, N'latonya.dixon@hotmail.com', N'9399 Evergreen Street ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (428, N'Hipolito', N'Padilla', NULL, N'hipolito.padilla@hotmail.com', N'311 E. Rose Avenue ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (429, N'Emmett', N'Casey', NULL, N'emmett.casey@yahoo.com', N'893 Logan St. ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (430, N'Kandi', N'Mcneil', NULL, N'kandi.mcneil@msn.com', N'402 Border Street ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (431, N'Luciano', N'Marsh', NULL, N'luciano.marsh@aol.com', N'7685 South Willow Drive ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (432, N'Julius', N'Holt', NULL, N'julius.holt@aol.com', N'386 Lower River Street ', N'East Meadow', N'NY', N'11554')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (433, N'Holly', N'Nieves', NULL, N'holly.nieves@aol.com', N'60 Cleveland St. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (434, N'Douglass', N'Little', NULL, N'douglass.little@hotmail.com', N'294 Harvey Drive ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (435, N'Izola', N'Hobbs', NULL, N'izola.hobbs@gmail.com', N'685 Beacon Dr. ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (436, N'Honey', N'Camacho', NULL, N'honey.camacho@gmail.com', N'934 2nd St. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (437, N'Laureen', N'Barry', NULL, N'laureen.barry@yahoo.com', N'909 Ridge St. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (438, N'Katharine', N'Herrera', NULL, N'katharine.herrera@hotmail.com', N'395 SE. Branch St. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (439, N'Sunshine', N'Rosario', NULL, N'sunshine.rosario@aol.com', N'1 Chestnut Lane ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (440, N'Yevette', N'Todd', NULL, N'yevette.todd@aol.com', N'119 Lakewood Rd. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (441, N'Dorthea', N'Walker', NULL, N'dorthea.walker@aol.com', N'11 Third St. ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (442, N'Alane', N'Munoz', N'(914) 706-7576', N'alane.munoz@gmail.com', N'8 Strawberry Dr. ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (443, N'Ayana', N'Keith', N'(805) 230-2101', N'ayana.keith@hotmail.com', N'182 Thorne Road ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (444, N'Caridad', N'Compton', NULL, N'caridad.compton@aol.com', N'9575 SW. Kingston Court ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (445, N'Earline', N'Ballard', NULL, N'earline.ballard@hotmail.com', N'939 Lyme Road ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (446, N'Nathanael', N'Bradley', NULL, N'nathanael.bradley@aol.com', N'58 Third St. ', N'Amsterdam', N'NY', N'12010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (447, N'Chasidy', N'Tran', NULL, N'chasidy.tran@msn.com', N'9286 Anderson Street ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (448, N'Janella', N'Bright', N'(507) 616-2958', N'janella.bright@aol.com', N'7317 Tower Dr. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (449, N'Josie', N'Schultz', NULL, N'josie.schultz@hotmail.com', N'225 Mammoth Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (450, N'Ellsworth', N'Michael', NULL, N'ellsworth.michael@yahoo.com', N'9982 White St. ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (451, N'Jennette', N'Wooten', NULL, N'jennette.wooten@msn.com', N'8221 Bow Ridge Lane ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (452, N'Cassandra', N'Nichols', NULL, N'cassandra.nichols@yahoo.com', N'4 Glenwood Circle ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (453, N'Courtney', N'Wyatt', NULL, N'courtney.wyatt@gmail.com', N'369 Arrowhead St. ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (454, N'Terese', N'Palmer', NULL, N'terese.palmer@hotmail.com', N'8 Sugar Drive ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (455, N'Sherita', N'Cherry', NULL, N'sherita.cherry@gmail.com', N'9636 Old Cedarwood Street ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (456, N'Serina', N'Hensley', NULL, N'serina.hensley@yahoo.com', N'53 Proctor Drive ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (457, N'Jeni', N'Farley', NULL, N'jeni.farley@aol.com', N'4 Mill Lane ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (458, N'Everett', N'Vega', NULL, N'everett.vega@yahoo.com', N'7859 James Ave. ', N'Holbrook', N'NY', N'11741')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (459, N'Latosha', N'Dalton', N'(661) 529-4501', N'latosha.dalton@yahoo.com', N'59 E. Wintergreen Ave. ', N'Bakersfield', N'CA', N'93306')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (460, N'Romelia', N'Myers', NULL, N'romelia.myers@msn.com', N'8630 Brook St. ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (461, N'Effie', N'Jenkins', N'(631) 477-1277', N'effie.jenkins@msn.com', N'75 South Glen Eagles Court ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (462, N'Efren', N'Oliver', NULL, N'efren.oliver@gmail.com', N'9343 1st Rd. ', N'Nanuet', N'NY', N'10954')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (463, N'Jerlene', N'Rios', NULL, N'jerlene.rios@yahoo.com', N'32 Griffin St. ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (464, N'Bess', N'Mcbride', NULL, N'bess.mcbride@yahoo.com', N'9832 Winchester St. ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (465, N'Birdie', N'Kramer', N'(248) 725-2174', N'birdie.kramer@hotmail.com', N'311 Newcastle Dr. ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (466, N'Collen', N'Hayes', NULL, N'collen.hayes@yahoo.com', N'117 Eagle St. ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (467, N'Clare', N'Neal', NULL, N'clare.neal@msn.com', N'8922 Shady Ave. ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (468, N'Jeanett', N'Herman', NULL, N'jeanett.herman@hotmail.com', N'839 East Arch Street ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (469, N'Micki', N'Rutledge', NULL, N'micki.rutledge@aol.com', N'9868 Marvon Street ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (470, N'Loise', N'Walker', NULL, N'loise.walker@aol.com', N'201 Glen Eagles St. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (471, N'Burma', N'Summers', NULL, N'burma.summers@yahoo.com', N'890 East Elmwood Street ', N'Freeport', N'NY', N'11520')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (472, N'Myron', N'Ruiz', NULL, N'myron.ruiz@gmail.com', N'45 Shadow Brook Lane ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (473, N'Lashawna', N'Richardson', NULL, N'lashawna.richardson@hotmail.com', N'9920 Purple Finch St. ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (474, N'Lavern', N'Orr', NULL, N'lavern.orr@hotmail.com', N'913 N. Young Street ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (475, N'Alec', N'Peck', NULL, N'alec.peck@hotmail.com', N'4 W. Belmont St. ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (476, N'Christopher', N'Richardson', NULL, N'christopher.richardson@gmail.com', N'7846 Windfall Dr. ', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (477, N'Arminda', N'Weber', NULL, N'arminda.weber@yahoo.com', N'6 Hill Field St. ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (478, N'Emmett', N'Hahn', NULL, N'emmett.hahn@hotmail.com', N'7727 6th St. ', N'Freeport', N'NY', N'11520')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (479, N'Gertha', N'Mejia', NULL, N'gertha.mejia@yahoo.com', N'518 Orchard St. ', N'Flushing', N'NY', N'11354')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (480, N'Garland', N'Weaver', NULL, N'garland.weaver@gmail.com', N'7161 Goldfield Court ', N'Amsterdam', N'NY', N'12010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (481, N'Jayson', N'Rutledge', NULL, N'jayson.rutledge@yahoo.com', N'8672 Coffee St. ', N'Lake Jackson', N'TX', N'77566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (482, N'Narcisa', N'Knapp', NULL, N'narcisa.knapp@aol.com', N'435 Dogwood Dr. ', N'Amarillo', N'TX', N'79106')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (483, N'Gayla', N'Sims', NULL, N'gayla.sims@gmail.com', N'98 Hall Street ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (484, N'Chelsey', N'Boyd', NULL, N'chelsey.boyd@yahoo.com', N'9569 Birchpond Ave. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (485, N'Catherine', N'Miles', NULL, N'catherine.miles@msn.com', N'7189 Elm Dr. ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (486, N'Valeri', N'Marshall', NULL, N'valeri.marshall@hotmail.com', N'494 East Brewery Dr. ', N'East Meadow', N'NY', N'11554')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (487, N'Grace', N'Madden', NULL, N'grace.madden@gmail.com', N'606 East Rocky River St. ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (488, N'Joaquin', N'Hawkins', N'(657) 557-1746', N'joaquin.hawkins@aol.com', N'3 Oklahoma Lane ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (489, N'Kirstie', N'Vazquez', NULL, N'kirstie.vazquez@gmail.com', N'8006 Rockland Ave. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (490, N'Yu', N'Mcdonald', NULL, N'yu.mcdonald@aol.com', N'784 Pheasant Rd. ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (491, N'Celestine', N'Jacobs', NULL, N'celestine.jacobs@gmail.com', N'87 Hanover Rd. ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (492, N'Justa', N'Thompson', NULL, N'justa.thompson@aol.com', N'43 Manor Ave. ', N'Corona', N'NY', N'11368')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (493, N'Lise', N'Alvarado', NULL, N'lise.alvarado@gmail.com', N'9816 Newcastle Dr. ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (494, N'Pearl', N'Fox', NULL, N'pearl.fox@yahoo.com', N'9415 Honey Creek Dr. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (495, N'Travis', N'Goodman', NULL, N'travis.goodman@yahoo.com', N'65 Rockcrest Dr. ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (496, N'Shu', N'Mays', NULL, N'shu.mays@gmail.com', N'996 St Margarets Lane ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (497, N'Ezra', N'Fowler', NULL, N'ezra.fowler@hotmail.com', N'16 Pearl St. ', N'Nanuet', N'NY', N'10954')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (498, N'Edda', N'Young', NULL, N'edda.young@gmail.com', N'50 S. Airport Street ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (499, N'Lidia', N'Ashley', NULL, N'lidia.ashley@hotmail.com', N'8436 Meadow St. ', N'Baldwinsville', N'NY', N'13027')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (500, N'Moira', N'Lester', NULL, N'moira.lester@msn.com', N'496 Greystone Court ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (501, N'Tony', N'Hicks', N'(657) 260-6783', N'tony.hicks@gmail.com', N'226 Carriage Street ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (502, N'Malinda', N'Baxter', NULL, N'malinda.baxter@yahoo.com', N'7698 Briarwood Ave. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (503, N'Marlo', N'Jefferson', NULL, N'marlo.jefferson@gmail.com', N'39 Trenton Rd. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (504, N'Tiana', N'Henderson', NULL, N'tiana.henderson@aol.com', N'62 Orange St. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (505, N'Wilda', N'Petersen', NULL, N'wilda.petersen@aol.com', N'899 Helen St. ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (506, N'Irving', N'Pitts', NULL, N'irving.pitts@msn.com', N'346 College Court ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (507, N'Sheree', N'Pena', NULL, N'sheree.pena@yahoo.com', N'822 Virginia Court ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (508, N'Vance', N'Taylor', N'(717) 218-5607', N'vance.taylor@msn.com', N'8279 Military Dr. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (509, N'Terra', N'Pickett', NULL, N'terra.pickett@aol.com', N'7822 Depot Avenue ', N'Amsterdam', N'NY', N'12010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (510, N'Faustino', N'Delacruz', NULL, N'faustino.delacruz@msn.com', N'88 West Greenview Street ', N'South Richmond Hill', N'NY', N'11419')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (511, N'Julienne', N'Moody', N'(682) 841-4643', N'julienne.moody@hotmail.com', N'35 South Oxford Rd. ', N'Fort Worth', N'TX', N'76110')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (512, N'Hee', N'Greer', NULL, N'hee.greer@hotmail.com', N'41 North Garfield Ave. ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (513, N'Whitney', N'Cash', NULL, N'whitney.cash@gmail.com', N'8 Surrey Street ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (514, N'Clarita', N'Curry', NULL, N'clarita.curry@hotmail.com', N'661 Tanglewood Street ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (515, N'Reita', N'Dickson', NULL, N'reita.dickson@hotmail.com', N'7506 Mechanic Dr. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (516, N'Rosa', N'Kinney', NULL, N'rosa.kinney@yahoo.com', N'330 Highland Drive ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (517, N'Buford', N'Gilbert', NULL, N'buford.gilbert@yahoo.com', N'9 East Ketch Harbour Street ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (518, N'Homer', N'Powers', NULL, N'homer.powers@msn.com', N'8207 East El Dorado Ave. ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (519, N'Rudolf', N'Gilliam', NULL, N'rudolf.gilliam@aol.com', N'17 Marlborough Circle ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (520, N'Andreas', N'Herman', NULL, N'andreas.herman@msn.com', N'456 Rock Creek Street ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (521, N'Max', N'Charles', NULL, N'max.charles@gmail.com', N'695 St Paul Street ', N'Glen Cove', N'NY', N'11542')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (522, N'Tammera', N'Fischer', N'(510) 534-8845', N'tammera.fischer@hotmail.com', N'405 Olive St. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (523, N'Joshua', N'Robertson', NULL, N'joshua.robertson@gmail.com', N'81 Campfire Court ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (524, N'Larraine', N'Horn', NULL, N'larraine.horn@msn.com', N'368 South Summerhouse Dr. ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (525, N'Andreas', N'Mayer', NULL, N'andreas.mayer@hotmail.com', N'8577 Galvin Circle ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (526, N'Lazaro', N'Moran', NULL, N'lazaro.moran@gmail.com', N'83 E. Buttonwood Street ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (527, N'Afton', N'Juarez', NULL, N'afton.juarez@gmail.com', N'8330 Riverview Drive ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (528, N'Angele', N'Schroeder', N'(845) 804-6312', N'angele.schroeder@yahoo.com', N'33 S. Shadow Brook Street ', N'New City', N'NY', N'10956')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (529, N'Ellena', N'Clements', NULL, N'ellena.clements@aol.com', N'7918 Mulberry Street ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (530, N'Selene', N'Austin', NULL, N'selene.austin@msn.com', N'9042 Linda Circle ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (531, N'Kimberely', N'Bowen', N'(248) 199-2582', N'kimberely.bowen@hotmail.com', N'88 Belmont Street ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (532, N'Mia', N'Delgado', NULL, N'mia.delgado@yahoo.com', N'850 Wakehurst Drive ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (533, N'Garret', N'Clay', N'(361) 687-9477', N'garret.clay@yahoo.com', N'9516 College Drive ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (534, N'Alejandro', N'Haney', NULL, N'alejandro.haney@msn.com', N'3 Griffin Street ', N'Wantagh', N'NY', N'11793')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (535, N'Inge', N'Olsen', N'(562) 719-5041', N'inge.olsen@msn.com', N'295 Iroquois Rd. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (536, N'Christiane', N'Bradford', NULL, N'christiane.bradford@gmail.com', N'9043 Woodland Ave. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (537, N'Carter', N'Bentley', NULL, N'carter.bentley@yahoo.com', N'145 North Bridle Ave. ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (538, N'Sherie', N'Ayala', NULL, N'sherie.ayala@msn.com', N'5 Beech Ave. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (539, N'Jamika', N'Acevedo', NULL, N'jamika.acevedo@yahoo.com', N'8027 NW. Poplar St. ', N'Ozone Park', N'NY', N'11417')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (540, N'Shery', N'Randolph', NULL, N'shery.randolph@hotmail.com', N'602 Laurel Street ', N'Ontario', N'CA', N'91762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (541, N'Lanita', N'Burton', NULL, N'lanita.burton@msn.com', N'8980 Aspen Avenue ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (542, N'Timothy', N'Byers', NULL, N'timothy.byers@msn.com', N'8645 Devonshire Lane ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (543, N'Jasmin', N'Young', NULL, N'jasmin.young@gmail.com', N'337 Beach Street ', N'Helotes', N'TX', N'78023')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (544, N'Catarina', N'Mendez', NULL, N'catarina.mendez@hotmail.com', N'444 Hanover Court ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (545, N'Tajuana', N'Rollins', NULL, N'tajuana.rollins@msn.com', N'724 N. Glen Creek Street ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (546, N'Thad', N'Castro', N'(631) 943-1407', N'thad.castro@msn.com', N'71 Surrey Ave. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (547, N'Tena', N'Huber', NULL, N'tena.huber@gmail.com', N'185 East Littleton St. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (548, N'Dori', N'Alvarez', NULL, N'dori.alvarez@msn.com', N'8208 Brandywine St. ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (549, N'Elmo', N'Arnold', N'(562) 841-9339', N'elmo.arnold@aol.com', N'7616 Lyme Rd. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (550, N'Felicidad', N'Golden', NULL, N'felicidad.golden@yahoo.com', N'9712 Coffee Ave. ', N'Lockport', N'NY', N'14094')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (551, N'Jenine', N'Crane', N'(682) 183-6555', N'jenine.crane@msn.com', N'7381 Alderwood Drive ', N'Fort Worth', N'TX', N'76110')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (552, N'Lea', N'Key', NULL, N'lea.key@yahoo.com', N'7 Ocean St. ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (553, N'Rory', N'Cooper', NULL, N'rory.cooper@gmail.com', N'459 West Street ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (554, N'Hilde', N'Nieves', NULL, N'hilde.nieves@gmail.com', N'9437 Fordham Lane ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (555, N'Marry', N'Benjamin', NULL, N'marry.benjamin@yahoo.com', N'33 Amerige Street ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (556, N'Vernell', N'Goff', NULL, N'vernell.goff@msn.com', N'77 Cobblestone St. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (557, N'Erlene', N'Cook', NULL, N'erlene.cook@gmail.com', N'89 Blue Spring Street ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (558, N'Carroll', N'Kelly', NULL, N'carroll.kelly@yahoo.com', N'346 Grant Circle ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (559, N'Basilia', N'Thornton', N'(631) 592-9548', N'basilia.thornton@hotmail.com', N'9033 Pine Dr. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (560, N'Tricia', N'Daniels', NULL, N'tricia.daniels@gmail.com', N'8628 Crescent Court ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (561, N'Kandace', N'Hughes', NULL, N'kandace.hughes@hotmail.com', N'482 Ryan Ave. ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (562, N'Alejandro', N'Norman', NULL, N'alejandro.norman@yahoo.com', N'8918 Marsh Lane ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (563, N'Rodney', N'Odom', NULL, N'rodney.odom@yahoo.com', N'7782 North Deerfield Lane ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (564, N'Bettie', N'Pierce', NULL, N'bettie.pierce@gmail.com', N'787 North Vernon Lane ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (565, N'Dagny', N'Owen', NULL, N'dagny.owen@hotmail.com', N'8028 Thompson Drive ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (566, N'Cinthia', N'Poole', NULL, N'cinthia.poole@aol.com', N'7 Central Ave. ', N'Lake Jackson', N'TX', N'77566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (567, N'Sheila', N'Travis', NULL, N'sheila.travis@yahoo.com', N'9285 Front St. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (568, N'Arcelia', N'Vinson', NULL, N'arcelia.vinson@gmail.com', N'40 Dogwood St. ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (569, N'Lucas', N'Estes', NULL, N'lucas.estes@yahoo.com', N'99 Old Church St. ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (570, N'Marissa', N'Summers', NULL, N'marissa.summers@msn.com', N'81 Carpenter St. ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (571, N'Kaley', N'Blanchard', NULL, N'kaley.blanchard@msn.com', N'74 Evergreen Court ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (572, N'Wm', N'Pope', NULL, N'wm.pope@msn.com', N'212 Marsh Court ', N'Auburn', N'NY', N'13021')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (573, N'Rubye', N'Mccall', N'(248) 764-3359', N'rubye.mccall@hotmail.com', N'71 Sherwood Dr. ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (574, N'Adriene', N'Rivera', NULL, N'adriene.rivera@hotmail.com', N'973 Yukon Avenue ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (575, N'Laurence', N'Christian', NULL, N'laurence.christian@gmail.com', N'2 Maple St. ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (576, N'Shirely', N'Stanley', N'(915) 437-6113', N'shirely.stanley@gmail.com', N'73 White Avenue ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (577, N'Danille', N'Mcfarland', NULL, N'danille.mcfarland@msn.com', N'14 Tailwater St. ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (578, N'Salena', N'Day', NULL, N'salena.day@msn.com', N'8067 Park Court ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (579, N'Matilda', N'Larson', NULL, N'matilda.larson@hotmail.com', N'336 Saxon Court ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (580, N'Mellisa', N'Kim', N'(424) 151-6481', N'mellisa.kim@aol.com', N'17 Lyme Dr. ', N'Los Angeles', N'CA', N'90008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (581, N'Vonda', N'Berger', NULL, N'vonda.berger@yahoo.com', N'615 S. Proctor Ave. ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (582, N'Soledad', N'Moses', NULL, N'soledad.moses@yahoo.com', N'85 Hickory Ave. ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (583, N'Lashandra', N'Turner', N'(562) 327-9469', N'lashandra.turner@hotmail.com', N'11 Marlborough Rd. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (584, N'Lynne', N'Anderson', N'(915) 789-6666', N'lynne.anderson@msn.com', N'325 Inverness St. ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (585, N'Chasidy', N'Webster', NULL, N'chasidy.webster@msn.com', N'8296 S. Lookout Lane ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (586, N'Ulysses', N'Gaines', NULL, N'ulysses.gaines@aol.com', N'22 Gregory Lane ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (587, N'Euna', N'Lopez', NULL, N'euna.lopez@gmail.com', N'7979 South Mountainview Ave. ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (588, N'Cherelle', N'Key', NULL, N'cherelle.key@msn.com', N'7739 Snake Hill Lane ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (589, N'Jeffry', N'Church', NULL, N'jeffry.church@msn.com', N'426 Grandrose Ave. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (590, N'Cyndi', N'Dyer', NULL, N'cyndi.dyer@msn.com', N'313 West Argyle Ave. ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (591, N'Danilo', N'Holmes', NULL, N'danilo.holmes@gmail.com', N'657 Manor Station Dr. ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (592, N'Joni', N'Lee', NULL, N'joni.lee@gmail.com', N'8573 Proctor Street ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (593, N'Antony', N'Atkinson', NULL, N'antony.atkinson@msn.com', N'680 East Birchwood Lane ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (594, N'Deanne', N'Parsons', NULL, N'deanne.parsons@aol.com', N'76 Amherst Drive ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (595, N'Frederica', N'Rojas', NULL, N'frederica.rojas@yahoo.com', N'7835 West Jockey Hollow Rd. ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (596, N'Emelda', N'Dickerson', NULL, N'emelda.dickerson@aol.com', N'7457 6th St. ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (597, N'Rudolf', N'Moran', NULL, N'rudolf.moran@gmail.com', N'5 Birchwood Rd. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (598, N'Benito', N'Hendrix', NULL, N'benito.hendrix@gmail.com', N'676 S. Bowman Lane ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (599, N'Jonell', N'Rivas', NULL, N'jonell.rivas@msn.com', N'8415 East High Point St. ', N'Amarillo', N'TX', N'79106')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (600, N'Joi', N'Reeves', N'(619) 952-9613', N'joi.reeves@msn.com', N'9101 Williams Court ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (601, N'Leland', N'Mcdowell', NULL, N'leland.mcdowell@gmail.com', N'8034 E. Washington Lane ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (602, N'Delaine', N'Estes', NULL, N'delaine.estes@yahoo.com', N'8916 Hartford Rd. ', N'Amarillo', N'TX', N'79106')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (603, N'Genevieve', N'Juarez', NULL, N'genevieve.juarez@gmail.com', N'93 Goldfield Drive ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (604, N'Kylee', N'Dickson', NULL, N'kylee.dickson@gmail.com', N'7908 Sherwood Street ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (605, N'Renita', N'Henry', NULL, N'renita.henry@msn.com', N'474 Woodland Ave. ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (606, N'Sarah', N'Kirkland', NULL, N'sarah.kirkland@aol.com', N'42 N. Glendale Avenue ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (607, N'Paul', N'Lester', NULL, N'paul.lester@gmail.com', N'275 Clay St. ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (608, N'Taisha', N'Vang', NULL, N'taisha.vang@yahoo.com', N'660 East Foster Lane ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (609, N'Eliana', N'Reese', NULL, N'eliana.reese@hotmail.com', N'7079 NE. Cross Drive ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (610, N'Leonore', N'Dorsey', NULL, N'leonore.dorsey@yahoo.com', N'8213 South Branch Avenue ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (611, N'Ashleigh', N'Frank', NULL, N'ashleigh.frank@gmail.com', N'9008 Plymouth Street ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (612, N'Gabriel', N'Wagner', NULL, N'gabriel.wagner@msn.com', N'7921 Manhattan Ave. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (613, N'Margene', N'Eaton', NULL, N'margene.eaton@yahoo.com', N'43 Sugar Street ', N'Wantagh', N'NY', N'11793')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (614, N'Toshia', N'Cardenas', NULL, N'toshia.cardenas@gmail.com', N'878 Bayberry Street ', N'Amsterdam', N'NY', N'12010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (615, N'Jamika', N'Blanchard', NULL, N'jamika.blanchard@gmail.com', N'420 Cambridge Street ', N'Fresh Meadows', N'NY', N'11365')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (616, N'Shery', N'Acosta', NULL, N'shery.acosta@yahoo.com', N'17 Canal Ave. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (617, N'Jenna', N'Saunders', NULL, N'jenna.saunders@aol.com', N'4 Young St. ', N'Yorktown Heights', N'NY', N'10598')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (618, N'Skye', N'Pope', NULL, N'skye.pope@yahoo.com', N'121 S. Bay Meadows Ave. ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (619, N'Ana', N'Palmer', N'(657) 323-8684', N'ana.palmer@yahoo.com', N'7 Buckingham St. ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (620, N'Eric', N'Hardin', NULL, N'eric.hardin@gmail.com', N'39 S. Parker Drive ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (621, N'Basil', N'Ballard', NULL, N'basil.ballard@yahoo.com', N'7477 Belmont Ave. ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (622, N'Gabriel', N'Pitts', NULL, N'gabriel.pitts@gmail.com', N'8462 Marshall Drive ', N'Clifton Park', N'NY', N'12065')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (623, N'Cayla', N'Johnson', NULL, N'cayla.johnson@msn.com', N'7091 Rockaway Avenue ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (624, N'Sharika', N'Colon', N'(562) 452-6136', N'sharika.colon@gmail.com', N'509 Henry Smith St. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (625, N'Donnetta', N'Henson', NULL, N'donnetta.henson@hotmail.com', N'2 Tallwood Drive ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (626, N'Leigh', N'Burke', NULL, N'leigh.burke@hotmail.com', N'7651 Creek St. ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (627, N'Deloris', N'Larson', NULL, N'deloris.larson@aol.com', N'242 Branch Street ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (628, N'Ehtel', N'Cobb', NULL, N'ehtel.cobb@hotmail.com', N'741 Rockville Drive ', N'Lockport', N'NY', N'14094')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (629, N'Evelina', N'Byrd', N'(716) 601-7704', N'evelina.byrd@msn.com', N'628 S. Church St. ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (630, N'Zulema', N'Browning', NULL, N'zulema.browning@gmail.com', N'12 NW. Lafayette St. ', N'Amsterdam', N'NY', N'12010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (631, N'Tressa', N'Weiss', NULL, N'tressa.weiss@msn.com', N'52 Wild Rose Avenue ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (632, N'Yvette', N'Rogers', NULL, N'yvette.rogers@aol.com', N'3 SE. Oklahoma Drive ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (633, N'Kiara', N'Deleon', N'(657) 378-8011', N'kiara.deleon@gmail.com', N'164 Addison Drive ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (634, N'Taylor', N'Cole', NULL, N'taylor.cole@gmail.com', N'9408 Holly Lane ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (635, N'Myrtie', N'James', NULL, N'myrtie.james@yahoo.com', N'566 North Livingston Ave. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (636, N'Ashton', N'Lott', NULL, N'ashton.lott@hotmail.com', N'609 Windfall Lane ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (637, N'Kara', N'Higgins', NULL, N'kara.higgins@aol.com', N'758 Jennings Street ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (638, N'Tomeka', N'Higgins', NULL, N'tomeka.higgins@msn.com', N'591 W. Corona St. ', N'Poughkeepsie', N'NY', N'12601')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (639, N'Ronald', N'Parsons', NULL, N'ronald.parsons@msn.com', N'268 Pin Oak Rd. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (640, N'Allison', N'Nolan', N'(845) 276-5729', N'allison.nolan@gmail.com', N'7421 Victoria St. ', N'New City', N'NY', N'10956')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (641, N'Derrick', N'Marks', NULL, N'derrick.marks@yahoo.com', N'7247 East Prairie Lane ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (642, N'Yang', N'Roth', NULL, N'yang.roth@aol.com', N'234 E. Shub Farm Ave. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (643, N'Melba', N'Wilkinson', NULL, N'melba.wilkinson@gmail.com', N'255 Harvard Dr. ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (644, N'Valentin', N'Mclaughlin', NULL, N'valentin.mclaughlin@hotmail.com', N'56 Squaw Creek Street ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (645, N'Lewis', N'Garner', N'(631) 871-2512', N'lewis.garner@gmail.com', N'9550 East Greenrose St. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (646, N'Ann', N'Heath', NULL, N'ann.heath@msn.com', N'413 East St. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (647, N'Janelle', N'Maldonado', NULL, N'janelle.maldonado@gmail.com', N'34 Mammoth Street ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (648, N'Catrice', N'Hicks', NULL, N'catrice.hicks@yahoo.com', N'403 Inverness Street ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (649, N'Eli', N'Contreras', NULL, N'eli.contreras@hotmail.com', N'35 Highland Ave. ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (650, N'Rita', N'Bailey', NULL, N'rita.bailey@hotmail.com', N'69 Glenwood Street ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (651, N'Laure', N'Pena', NULL, N'laure.pena@yahoo.com', N'9849 West Elmwood St. ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (652, N'Tilda', N'Melton', N'(248) 767-4165', N'tilda.melton@msn.com', N'237 Elmwood Drive ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (653, N'Florencio', N'Davenport', NULL, N'florencio.davenport@yahoo.com', N'8759 Brookside Ave. ', N'Jamestown', N'NY', N'14701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (654, N'Eun', N'Harris', N'(619) 378-2432', N'eun.harris@gmail.com', N'623 Jones St. ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (655, N'Marylyn', N'Browning', NULL, N'marylyn.browning@msn.com', N'915 Lakeshore Street ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (656, N'Romana', N'Barnes', NULL, N'romana.barnes@yahoo.com', N'9776 Shipley Rd. ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (657, N'Sam', N'Lester', NULL, N'sam.lester@gmail.com', N'563 South Beacon Lane ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (658, N'Nicki', N'Larson', NULL, N'nicki.larson@yahoo.com', N'8317 West Leatherwood Dr. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (659, N'Antonetta', N'Rocha', NULL, N'antonetta.rocha@yahoo.com', N'9858 Newcastle St. ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (660, N'Shara', N'Pope', NULL, N'shara.pope@msn.com', N'194 Amherst Dr. ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (661, N'Trena', N'Hudson', NULL, N'trena.hudson@hotmail.com', N'135 Grand Ave. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (662, N'Loraine', N'Sykes', NULL, N'loraine.sykes@yahoo.com', N'9239 Windsor Ave. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (663, N'Alissa', N'Hood', NULL, N'alissa.hood@gmail.com', N'8032 Maple Drive ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (664, N'Augustus', N'Schmidt', NULL, N'augustus.schmidt@msn.com', N'624 Jones Dr. ', N'Corona', N'NY', N'11368')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (665, N'Stacie', N'Sims', N'(510) 194-5117', N'stacie.sims@hotmail.com', N'47 Orange Ave. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (666, N'Brittni', N'Green', NULL, N'brittni.green@msn.com', N'842 El Dorado Lane ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (667, N'Etsuko', N'Garrison', NULL, N'etsuko.garrison@yahoo.com', N'1 Arrowhead Street ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (668, N'Calandra', N'Stanton', NULL, N'calandra.stanton@aol.com', N'36 Livingston Dr. ', N'Lake Jackson', N'TX', N'77566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (669, N'Willis', N'Randolph', NULL, N'willis.randolph@yahoo.com', N'332 Constitution St. ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (670, N'Shawnda', N'Glover', NULL, N'shawnda.glover@gmail.com', N'138 Belmont Ave. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (671, N'Jennette', N'Baker', NULL, N'jennette.baker@gmail.com', N'798 Marvon St. ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (672, N'Elma', N'Molina', NULL, N'elma.molina@msn.com', N'8565 Devon Ave. ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (673, N'Adam', N'Henderson', NULL, N'adam.henderson@hotmail.com', N'167 James St. ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (674, N'Ira', N'Moore', NULL, N'ira.moore@gmail.com', N'1 Pineknoll Court ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (675, N'Kermit', N'Bowman', N'(915) 996-5952', N'kermit.bowman@gmail.com', N'3 Airport Street ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (676, N'Gayle', N'Wilkinson', NULL, N'gayle.wilkinson@yahoo.com', N'4 Riverside Ave. ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (677, N'Launa', N'Hull', NULL, N'launa.hull@yahoo.com', N'936 Grove Street ', N'Helotes', N'TX', N'78023')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (678, N'Myron', N'Johns', NULL, N'myron.johns@msn.com', N'5 N. Woodsman Rd. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (679, N'Tuan', N'Wolfe', NULL, N'tuan.wolfe@aol.com', N'7641 Oak Meadow Dr. ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (680, N'Mathilda', N'Pennington', N'(845) 407-9524', N'mathilda.pennington@gmail.com', N'14 S. Argyle Ave. ', N'New City', N'NY', N'10956')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (681, N'Reatha', N'Perez', NULL, N'reatha.perez@aol.com', N'9917 1st St. ', N'Holbrook', N'NY', N'11741')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (682, N'Arnita', N'Thomas', NULL, N'arnita.thomas@gmail.com', N'154 2nd St. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (683, N'Amparo', N'Burks', NULL, N'amparo.burks@aol.com', N'7781 Augusta St. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (684, N'Jenny', N'Bell', NULL, N'jenny.bell@hotmail.com', N'38 Crescent St. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (685, N'Laverne', N'Craft', NULL, N'laverne.craft@aol.com', N'829 N. Pierce Street ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (686, N'Darcel', N'Harmon', NULL, N'darcel.harmon@msn.com', N'966 Hickory Street ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (687, N'Cecilia', N'Camacho', NULL, N'cecilia.camacho@yahoo.com', N'682 Mountainview Rd. ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (688, N'Pearlie', N'Cochran', NULL, N'pearlie.cochran@msn.com', N'23 Homewood Rd. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (689, N'Deirdre', N'Ryan', NULL, N'deirdre.ryan@yahoo.com', N'83 Jefferson Lane ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (690, N'Yevette', N'Elliott', NULL, N'yevette.elliott@aol.com', N'182 Euclid Street ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (691, N'Ladawn', N'Downs', N'(281) 165-2090', N'ladawn.downs@yahoo.com', N'7452 S. Airport Court ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (692, N'Dorothea', N'Chang', NULL, N'dorothea.chang@gmail.com', N'75 Oak Ave. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (693, N'Merlin', N'Foreman', N'(516) 150-1321', N'merlin.foreman@msn.com', N'8198 North Rockaway St. ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (694, N'Lanie', N'Dunn', NULL, N'lanie.dunn@gmail.com', N'7583 Pilgrim Ave. ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (695, N'Christoper', N'Gould', NULL, N'christoper.gould@aol.com', N'8718 South Constitution St. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (696, N'Norine', N'Huffman', NULL, N'norine.huffman@aol.com', N'363 Dunbar Drive ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (697, N'Alane', N'Mccarty', N'(619) 377-8586', N'alane.mccarty@hotmail.com', N'8254 Hilldale Street ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (698, N'Charleen', N'Joyner', NULL, N'charleen.joyner@aol.com', N'735 N. John Dr. ', N'Corona', N'NY', N'11368')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (699, N'Zella', N'Fernandez', NULL, N'zella.fernandez@yahoo.com', N'8 Marshall Dr. ', N'Rockville Centre', N'NY', N'11570')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (700, N'Collene', N'Knox', N'(361) 760-1523', N'collene.knox@msn.com', N'7 North Branch Lane ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (701, N'Alysia', N'Nicholson', N'(805) 493-7311', N'alysia.nicholson@hotmail.com', N'868 Trusel St. ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (702, N'Sharie', N'Whitaker', NULL, N'sharie.whitaker@hotmail.com', N'7 Bayport Lane ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (703, N'Diana', N'Cobb', NULL, N'diana.cobb@hotmail.com', N'558 Vale St. ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (704, N'Morton', N'Barron', N'(661) 386-4884', N'morton.barron@msn.com', N'542 Circle Rd. ', N'Bakersfield', N'CA', N'93306')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (705, N'Camille', N'Harvey', NULL, N'camille.harvey@hotmail.com', N'859 Beaver Ridge Ave. ', N'Huntington', N'NY', N'11743')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (706, N'Lolita', N'O''neill', NULL, N'lolita.o''neill@aol.com', N'36 Prairie Dr. ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (707, N'Terese', N'Briggs', NULL, N'terese.briggs@msn.com', N'16 N. Oak Valley St. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (708, N'Majorie', N'Glover', NULL, N'majorie.glover@msn.com', N'4 Garden Ave. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (709, N'Vinnie', N'Chan', NULL, N'vinnie.chan@aol.com', N'8750 Surrey St. ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (710, N'Ezra', N'Silva', NULL, N'ezra.silva@msn.com', N'8629 Catherine Rd. ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (711, N'Jovita', N'Bishop', NULL, N'jovita.bishop@aol.com', N'8123 Wild Horse St. ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (712, N'Kecia', N'Olsen', NULL, N'kecia.olsen@msn.com', N'8389 Central St. ', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (713, N'Ilona', N'Spears', NULL, N'ilona.spears@gmail.com', N'984 Canterbury Lane ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (714, N'Senaida', N'Thompson', NULL, N'senaida.thompson@msn.com', N'578 Golf Drive ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (715, N'Larae', N'Carney', NULL, N'larae.carney@msn.com', N'9322 Glen Ridge Dr. ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (716, N'Sebrina', N'Hart', NULL, N'sebrina.hart@yahoo.com', N'7679 Pacific St. ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (717, N'Kristofer', N'Craig', NULL, N'kristofer.craig@yahoo.com', N'6 Delaware Lane ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (718, N'Luciana', N'Mcgee', NULL, N'luciana.mcgee@msn.com', N'8002 Cross St. ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (719, N'Nicki', N'Fry', NULL, N'nicki.fry@hotmail.com', N'950 Snake Hill Lane ', N'Endicott', N'NY', N'13760')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (720, N'Devin', N'Shaffer', N'(507) 557-2191', N'devin.shaffer@gmail.com', N'382 Third Ave. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (721, N'Erlinda', N'Osborne', NULL, N'erlinda.osborne@yahoo.com', N'148 Elm St. ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (722, N'Camila', N'Carroll', N'(210) 436-8676', N'camila.carroll@yahoo.com', N'72 Shub Farm Avenue ', N'San Antonio', N'TX', N'78213')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (723, N'Vicki', N'Wiggins', NULL, N'vicki.wiggins@hotmail.com', N'71 Broad Ave. ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (724, N'Lois', N'Steele', NULL, N'lois.steele@yahoo.com', N'7501 South Marlborough Street ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (725, N'Carola', N'Mcpherson', NULL, N'carola.mcpherson@hotmail.com', N'578 Shirley Dr. ', N'Rego Park', N'NY', N'11374')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (726, N'Rochell', N'Cantrell', NULL, N'rochell.cantrell@yahoo.com', N'437 Water Dr. ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (727, N'Kasha', N'Sullivan', NULL, N'kasha.sullivan@hotmail.com', N'48 Foster Rd. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (728, N'Viva', N'Dawson', NULL, N'viva.dawson@yahoo.com', N'446 Princess Ave. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (729, N'Hue', N'Dalton', NULL, N'hue.dalton@hotmail.com', N'7940 Oakwood Street ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (730, N'Andria', N'Rivers', NULL, N'andria.rivers@aol.com', N'183 Ohio Ave. ', N'Amarillo', N'TX', N'79106')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (731, N'Hilary', N'Savage', N'(805) 753-6881', N'hilary.savage@yahoo.com', N'696 Howard Court ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (732, N'Lavona', N'Austin', NULL, N'lavona.austin@yahoo.com', N'926 South Euclid St. ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (733, N'Doreatha', N'Ford', NULL, N'doreatha.ford@yahoo.com', N'9413 Ryan Ave. ', N'Huntington', N'NY', N'11743')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (734, N'Alina', N'Mcleod', NULL, N'alina.mcleod@msn.com', N'20 Winchester Street ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (735, N'Aide', N'Franco', NULL, N'aide.franco@msn.com', N'8017 Lake Forest St. ', N'Atwater', N'CA', N'95301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (736, N'Genny', N'Hensley', NULL, N'genny.hensley@yahoo.com', N'8849 Marconi Ave. ', N'Redondo Beach', N'CA', N'90278')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (737, N'Melita', N'Dominguez', NULL, N'melita.dominguez@msn.com', N'9903 Santa Clara Lane ', N'Auburn', N'NY', N'13021')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (738, N'Fannie', N'Jenkins', N'(805) 774-5696', N'fannie.jenkins@msn.com', N'7858 E. Pawnee Dr. ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (739, N'Bobbi', N'Banks', NULL, N'bobbi.banks@yahoo.com', N'396 Wagon Rd. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (740, N'Gwenn', N'Melton', NULL, N'gwenn.melton@yahoo.com', N'9545 Wakehurst Drive ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (741, N'Laci', N'Castro', NULL, N'laci.castro@hotmail.com', N'130 Birchpond Street ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (742, N'Evelina', N'Manning', NULL, N'evelina.manning@aol.com', N'7515 Spring St. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (743, N'Tania', N'Swanson', NULL, N'tania.swanson@yahoo.com', N'8646 Glen Eagles Ave. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (744, N'Laurel', N'Schultz', NULL, N'laurel.schultz@hotmail.com', N'812 E. 1st Lane ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (745, N'Carolyne', N'Conley', NULL, N'carolyne.conley@gmail.com', N'431 Lees Creek Drive ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (746, N'Eldridge', N'Greer', NULL, N'eldridge.greer@aol.com', N'131 E. Madison St. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (747, N'Margret', N'Barnett', NULL, N'margret.barnett@gmail.com', N'7509 Depot Rd. ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (748, N'Oliva', N'Blackwell', NULL, N'oliva.blackwell@hotmail.com', N'54 Ramblewood St. ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (749, N'Oralia', N'Farley', NULL, N'oralia.farley@hotmail.com', N'747B E. Coffee Street ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (750, N'Romaine', N'Salazar', NULL, N'romaine.salazar@yahoo.com', N'7700 Wentworth Rd. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (751, N'Hermila', N'Mckay', NULL, N'hermila.mckay@yahoo.com', N'23 Garfield Dr. ', N'Coachella', N'CA', N'92236')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (752, N'Lloyd', N'Miranda', NULL, N'lloyd.miranda@hotmail.com', N'9098 Jennings St. ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (753, N'Mandi', N'Gibbs', NULL, N'mandi.gibbs@gmail.com', N'80 Sycamore Drive ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (754, N'Hue', N'May', NULL, N'hue.may@aol.com', N'19 S. Lawrence Dr. ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (755, N'Tomika', N'Wilder', NULL, N'tomika.wilder@aol.com', N'142 South Ocean St. ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (756, N'Graig', N'Roth', NULL, N'graig.roth@aol.com', N'7516 Wrangler Street ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (757, N'Lamar', N'Greer', NULL, N'lamar.greer@gmail.com', N'7909 Golden Star Ave. ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (758, N'Raymonde', N'Garcia', NULL, N'raymonde.garcia@aol.com', N'55 NE. North St. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (759, N'Cira', N'Downs', N'(510) 788-4456', N'cira.downs@gmail.com', N'672 Sussex Ave. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (760, N'Marisa', N'Chambers', NULL, N'marisa.chambers@msn.com', N'15 E. Rock Creek Ave. ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (761, N'Rod', N'Hatfield', NULL, N'rod.hatfield@hotmail.com', N'7090 Bridge Dr. ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (762, N'Quyen', N'Houston', NULL, N'quyen.houston@gmail.com', N'7758 Homewood Dr. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (763, N'Han', N'Schneider', NULL, N'han.schneider@gmail.com', N'40 Holly Street ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (764, N'Terrell', N'Mathis', NULL, N'terrell.mathis@aol.com', N'9320 Center Ave. ', N'Selden', N'NY', N'11784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (765, N'Spring', N'Hayes', NULL, N'spring.hayes@hotmail.com', N'8591 Wentworth St. ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (766, N'Lecia', N'Hancock', NULL, N'lecia.hancock@hotmail.com', N'9167 Pineknoll St. ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (767, N'Twana', N'Arnold', N'(657) 988-1904', N'twana.arnold@msn.com', N'47 North Fairground Lane ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (768, N'Yvone', N'Yates', NULL, N'yvone.yates@gmail.com', N'9269 Blue Spring Ave. ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (769, N'Agatha', N'Melton', NULL, N'agatha.melton@yahoo.com', N'89 East Illinois Street ', N'Springfield Gardens', N'NY', N'11413')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (770, N'Lavonda', N'Stephenson', NULL, N'lavonda.stephenson@gmail.com', N'37 Birchwood Dr. ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (771, N'Agnes', N'Sims', N'(716) 780-9901', N'agnes.sims@aol.com', N'170 Queen Lane ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (772, N'Latricia', N'Lindsey', NULL, N'latricia.lindsey@hotmail.com', N'288 Campfire Dr. ', N'Yorktown Heights', N'NY', N'10598')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (773, N'Yolando', N'Wade', NULL, N'yolando.wade@hotmail.com', N'310 Wilson Ave. ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (774, N'Nenita', N'Mooney', NULL, N'nenita.mooney@hotmail.com', N'10 W. Bishop Street ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (775, N'Kermit', N'Hyde', NULL, N'kermit.hyde@hotmail.com', N'87 SE. Carson St. ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (776, N'Angelique', N'Merrill', NULL, N'angelique.merrill@gmail.com', N'8490 West High Noon Ave. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (777, N'Ilda', N'Roberson', NULL, N'ilda.roberson@aol.com', N'8853 Lake St. ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (778, N'Corrinne', N'Garrison', NULL, N'corrinne.garrison@yahoo.com', N'81 East Glenwood Ave. ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (779, N'Major', N'Merrill', NULL, N'major.merrill@aol.com', N'78 Thatcher Court ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (780, N'Ouida', N'Gregory', NULL, N'ouida.gregory@aol.com', N'7984 8th Street ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (781, N'Tajuana', N'Riddle', NULL, N'tajuana.riddle@hotmail.com', N'24 St Margarets Ave. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (782, N'Ricki', N'Bullock', NULL, N'ricki.bullock@hotmail.com', N'79 Pennington Rd. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (783, N'Celestine', N'Kent', N'(717) 890-4260', N'celestine.kent@aol.com', N'697 Fordham Street ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (784, N'Debbra', N'Jacobson', NULL, N'debbra.jacobson@yahoo.com', N'8316 West Bedford Ave. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (785, N'Kandis', N'Mills', NULL, N'kandis.mills@hotmail.com', N'64 Beechwood Drive ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (786, N'Wallace', N'Lane', NULL, N'wallace.lane@aol.com', N'901 Liberty St. ', N'South Richmond Hill', N'NY', N'11419')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (787, N'Malisa', N'Mitchell', NULL, N'malisa.mitchell@msn.com', N'87 Ridgewood Court ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (788, N'Lilliam', N'Nolan', NULL, N'lilliam.nolan@msn.com', N'8976 Berkshire Court ', N'Copperas Cove', N'TX', N'76522')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (789, N'Tad', N'Gardner', NULL, N'tad.gardner@hotmail.com', N'9745 E. Wilson St. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (790, N'Petronila', N'Gallegos', NULL, N'petronila.gallegos@gmail.com', N'8053 Aspen St. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (791, N'Yun', N'Nelson', NULL, N'yun.nelson@hotmail.com', N'529 Durham Street ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (792, N'Edgar', N'Horn', NULL, N'edgar.horn@aol.com', N'7270 W. Cherry Hill Lane ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (793, N'Chantay', N'Maynard', NULL, N'chantay.maynard@gmail.com', N'7483 1st Ave. ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (794, N'Donette', N'Mccarthy', NULL, N'donette.mccarthy@yahoo.com', N'500 NW. Maiden Dr. ', N'Redondo Beach', N'CA', N'90278')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (795, N'Mariam', N'Miranda', NULL, N'mariam.miranda@aol.com', N'18 East Washington Avenue ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (796, N'Rosalie', N'Coffey', NULL, N'rosalie.coffey@gmail.com', N'789 Amerige Dr. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (797, N'Cathey', N'Lamb', NULL, N'cathey.lamb@msn.com', N'9621 Ryan Drive ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (798, N'Alyse', N'Jacobson', NULL, N'alyse.jacobson@yahoo.com', N'10 West Devon Lane ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (799, N'India', N'Barron', NULL, N'india.barron@msn.com', N'834 W. Pleasant Rd. ', N'Huntington', N'NY', N'11743')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (800, N'Cris', N'Dunn', NULL, N'cris.dunn@yahoo.com', N'1 Pawnee Street ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (801, N'Ophelia', N'Rodgers', NULL, N'ophelia.rodgers@gmail.com', N'133 Joy Ridge Drive ', N'Hopewell Junction', N'NY', N'12533')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (802, N'Barrett', N'Sanders', NULL, N'barrett.sanders@aol.com', N'32 Hawthorne St. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (803, N'Bernardina', N'Cooper', NULL, N'bernardina.cooper@msn.com', N'223 Glen Creek Ave. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (804, N'Douglas', N'Richards', NULL, N'douglas.richards@hotmail.com', N'221 Arcadia Lane ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (805, N'Phillis', N'Fowler', NULL, N'phillis.fowler@aol.com', N'8976 N. Hall Street ', N'Clifton Park', N'NY', N'12065')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (806, N'Reyes', N'Merritt', NULL, N'reyes.merritt@yahoo.com', N'48 Lexington Rd. ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (807, N'Nathalie', N'Knowles', NULL, N'nathalie.knowles@aol.com', N'4 Cactus Street ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (808, N'Vallie', N'Dixon', NULL, N'vallie.dixon@yahoo.com', N'85 E. Ann Drive ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (809, N'Elnora', N'Simpson', NULL, N'elnora.simpson@yahoo.com', N'7157 Shore Ave. ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (810, N'Ivelisse', N'Nixon', N'(281) 941-4933', N'ivelisse.nixon@aol.com', N'782 Boston Ave. ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (811, N'Shanti', N'Johnston', NULL, N'shanti.johnston@gmail.com', N'722 Alderwood Drive ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (812, N'Martha', N'Burgess', NULL, N'martha.burgess@msn.com', N'9631 St Margarets Lane ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (813, N'Neville', N'Mcclain', NULL, N'neville.mcclain@yahoo.com', N'781 Buttonwood Ave. ', N'West Hempstead', N'NY', N'11552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (814, N'Ghislaine', N'Compton', NULL, N'ghislaine.compton@aol.com', N'8930 Princess St. ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (815, N'Leanna', N'Manning', NULL, N'leanna.manning@yahoo.com', N'39 E. Stillwater Ave. ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (816, N'Marshall', N'Johnson', NULL, N'marshall.johnson@yahoo.com', N'44 Greenview St. ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (817, N'Zelda', N'Pratt', N'(717) 428-4018', N'zelda.pratt@gmail.com', N'74 Trusel Drive ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (818, N'Joel', N'Wynn', N'(619) 210-6032', N'joel.wynn@aol.com', N'7 North Oak Ave. ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (819, N'Yahaira', N'Robertson', NULL, N'yahaira.robertson@yahoo.com', N'142 Roehampton Dr. ', N'Endicott', N'NY', N'13760')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (820, N'Sandy', N'Mills', NULL, N'sandy.mills@gmail.com', N'333 Olive Ave. ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (821, N'Cassidy', N'Clark', NULL, N'cassidy.clark@hotmail.com', N'9879 Old Kingston Road ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (822, N'Kristy', N'Watkins', NULL, N'kristy.watkins@gmail.com', N'977 South Brook Ave. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (823, N'Tina', N'Bush', NULL, N'tina.bush@aol.com', N'8038 Bellevue Street ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (824, N'Veronika', N'Rollins', NULL, N'veronika.rollins@yahoo.com', N'94 Arnold Ave. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (825, N'Kristel', N'Byrd', NULL, N'kristel.byrd@hotmail.com', N'9967 Piper Street ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (826, N'Shay', N'Stephenson', NULL, N'shay.stephenson@aol.com', N'9569 4th Lane ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (827, N'George', N'Pickett', NULL, N'george.pickett@msn.com', N'691 Rocky River St. ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (828, N'Renato', N'Morton', NULL, N'renato.morton@msn.com', N'8526 Sherwood Street ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (829, N'Marcy', N'Rodriguez', NULL, N'marcy.rodriguez@gmail.com', N'97 Trusel Drive ', N'Lockport', N'NY', N'14094')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (830, N'Edmund', N'Gaines', NULL, N'edmund.gaines@gmail.com', N'8643 Gartner St. ', N'Copperas Cove', N'TX', N'76522')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (831, N'Lory', N'Berg', NULL, N'lory.berg@aol.com', N'64 Vine Drive ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (832, N'Pamala', N'Fowler', NULL, N'pamala.fowler@gmail.com', N'399 Leatherwood St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (833, N'Leone', N'Emerson', NULL, N'leone.emerson@msn.com', N'460 Smith Store Ave. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (834, N'Brain', N'Skinner', NULL, N'brain.skinner@hotmail.com', N'8676 Ketch Harbour Ave. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (835, N'Roseanne', N'Maynard', NULL, N'roseanne.maynard@yahoo.com', N'219 Old Paris Hill Dr. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (836, N'Corinna', N'Adams', NULL, N'corinna.adams@msn.com', N'38 Trenton Court ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (837, N'Kellye', N'Campbell', NULL, N'kellye.campbell@gmail.com', N'75 Marsh St. ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (838, N'Erna', N'Sloan', NULL, N'erna.sloan@aol.com', N'9449 Fifth Avenue ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (839, N'Carolann', N'Russell', NULL, N'carolann.russell@hotmail.com', N'9308 Selby Ave. ', N'Glen Cove', N'NY', N'11542')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (840, N'Gilbert', N'Calhoun', NULL, N'gilbert.calhoun@msn.com', N'7339 Summer Drive ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (841, N'Manie', N'Maxwell', NULL, N'manie.maxwell@gmail.com', N'85 Brickell Ave. ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (842, N'Giselle', N'Robles', NULL, N'giselle.robles@hotmail.com', N'9747 N. El Dorado Dr. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (843, N'Tessie', N'Farmer', NULL, N'tessie.farmer@msn.com', N'870 Cottage Ave. ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (844, N'Felica', N'Munoz', NULL, N'felica.munoz@aol.com', N'24 West Rockwell Dr. ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (845, N'Kathyrn', N'Bush', NULL, N'kathyrn.bush@gmail.com', N'90 Devon St. ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (846, N'Sylvester', N'Chan', NULL, N'sylvester.chan@hotmail.com', N'659 Arcadia Street ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (847, N'Lizette', N'Ellison', NULL, N'lizette.ellison@hotmail.com', N'865 Sunbeam Street ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (848, N'Ernestina', N'Skinner', NULL, N'ernestina.skinner@hotmail.com', N'52 Spring Drive ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (849, N'Phyllis', N'Hill', NULL, N'phyllis.hill@yahoo.com', N'576 Devon Ave. ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (850, N'Stephanie', N'Browning', NULL, N'stephanie.browning@yahoo.com', N'9156 Lantern St. ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (851, N'Arlena', N'Buckner', NULL, N'arlena.buckner@hotmail.com', N'629 Locust Ave. ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (852, N'Lezlie', N'Thompson', NULL, N'lezlie.thompson@yahoo.com', N'73 Vernon St. ', N'Freeport', N'NY', N'11520')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (853, N'Brittney', N'Rojas', NULL, N'brittney.rojas@aol.com', N'2 E. Overlook Ave. ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (854, N'Phylis', N'Adkins', N'(212) 325-9145', N'phylis.adkins@msn.com', N'7781 James Ave. ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (855, N'Lean', N'Stark', NULL, N'lean.stark@msn.com', N'215 Old Pumpkin Hill St. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (856, N'Lara', N'Guy', NULL, N'lara.guy@aol.com', N'9809 E. Walnut Drive ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (857, N'Inga', N'Koch', NULL, N'inga.koch@msn.com', N'8445 South New Court ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (858, N'Klara', N'Kim', NULL, N'klara.kim@gmail.com', N'9660 Sherman Lane ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (859, N'Julianne', N'Shannon', NULL, N'julianne.shannon@hotmail.com', N'28 Applegate Street ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (860, N'Loni', N'Mullen', NULL, N'loni.mullen@msn.com', N'55 Thompson Avenue ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (861, N'Olympia', N'Figueroa', NULL, N'olympia.figueroa@hotmail.com', N'587 Surrey St. ', N'Hopewell Junction', N'NY', N'12533')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (862, N'Mellie', N'Puckett', NULL, N'mellie.puckett@yahoo.com', N'64 Van Dyke St. ', N'Fresh Meadows', N'NY', N'11365')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (863, N'Shonta', N'Preston', NULL, N'shonta.preston@msn.com', N'74 Division St. ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (864, N'Lore', N'Sykes', N'(716) 382-5169', N'lore.sykes@aol.com', N'7050 Beach Drive ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (865, N'Julia', N'Joyner', NULL, N'julia.joyner@msn.com', N'2 Valley View Dr. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (866, N'Lynwood', N'Jackson', NULL, N'lynwood.jackson@aol.com', N'9449 Linda Street ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (867, N'Rosalva', N'Hamilton', NULL, N'rosalva.hamilton@aol.com', N'9883 Cedar Dr. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (868, N'Domingo', N'Casey', N'(408) 761-9212', N'domingo.casey@msn.com', N'8665 Cypress Street ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (869, N'Rodrigo', N'Durham', NULL, N'rodrigo.durham@aol.com', N'82 Old Church Road ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (870, N'Dwain', N'Carlson', NULL, N'dwain.carlson@gmail.com', N'951 North Trusel Ave. ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (871, N'Erlinda', N'Humphrey', NULL, N'erlinda.humphrey@hotmail.com', N'532 South Victoria St. ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (872, N'Silas', N'Tate', N'(361) 219-2149', N'silas.tate@yahoo.com', N'9754 53rd Court ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (873, N'Patience', N'Clayton', NULL, N'patience.clayton@hotmail.com', N'68 Chestnut Dr. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (874, N'Mila', N'Good', NULL, N'mila.good@yahoo.com', N'812 East Longbranch Ave. ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (875, N'Tanesha', N'Sawyer', NULL, N'tanesha.sawyer@aol.com', N'9B Kingston Lane ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (876, N'Onita', N'Macdonald', NULL, N'onita.macdonald@yahoo.com', N'94 Wood St. ', N'Glen Cove', N'NY', N'11542')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (877, N'Janine', N'Manning', NULL, N'janine.manning@gmail.com', N'9118B Campfire St. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (878, N'Melodie', N'Melton', NULL, N'melodie.melton@yahoo.com', N'12 S. 8th Road ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (879, N'Ethelyn', N'Ray', NULL, N'ethelyn.ray@yahoo.com', N'80 South Sutor Lane ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (880, N'Phebe', N'Turner', NULL, N'phebe.turner@aol.com', N'4 West York Street ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (881, N'Chloe', N'Patel', NULL, N'chloe.patel@yahoo.com', N'407 Homewood Street ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (882, N'Hilda', N'Harvey', NULL, N'hilda.harvey@gmail.com', N'9808 W. Cleveland Ave. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (883, N'Gilberte', N'Duke', N'(915) 903-7860', N'gilberte.duke@gmail.com', N'12 Birchwood Dr. ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (884, N'Willian', N'Hardin', NULL, N'willian.hardin@msn.com', N'836 West Street ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (885, N'Janna', N'Hayden', NULL, N'janna.hayden@msn.com', N'32 Hilldale Street ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (886, N'Letisha', N'May', NULL, N'letisha.may@yahoo.com', N'9965 Princeton Lane ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (887, N'Graig', N'Cannon', NULL, N'graig.cannon@gmail.com', N'36 Oklahoma Ave. ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (888, N'Coleen', N'Navarro', NULL, N'coleen.navarro@aol.com', N'990 Broad Rd. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (889, N'Lucilla', N'Williams', NULL, N'lucilla.williams@hotmail.com', N'42 Cedar Street ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (890, N'Rosanne', N'George', NULL, N'rosanne.george@yahoo.com', N'38 Pleasant St. ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (891, N'Ashlie', N'Parrish', NULL, N'ashlie.parrish@hotmail.com', N'48 Mill Drive ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (892, N'Alissa', N'Craft', NULL, N'alissa.craft@hotmail.com', N'249 Maple Street ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (893, N'Letty', N'Cobb', NULL, N'letty.cobb@msn.com', N'8652 Wellington Street ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (894, N'Nathaniel', N'Richard', NULL, N'nathaniel.richard@gmail.com', N'3 Nicolls Lane ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (895, N'Elaina', N'Key', NULL, N'elaina.key@msn.com', N'1 Main St. ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (896, N'Stefani', N'Gamble', N'(845) 724-2996', N'stefani.gamble@aol.com', N'9119 W. Victoria St. ', N'New City', N'NY', N'10956')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (897, N'Bettyann', N'Acosta', N'(717) 746-6658', N'bettyann.acosta@gmail.com', N'7949 Chapel St. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (898, N'Crysta', N'Velez', N'(281) 529-3469', N'crysta.velez@yahoo.com', N'64 South Front Street ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (899, N'Carisa', N'Carpenter', NULL, N'carisa.carpenter@hotmail.com', N'551 Belmont Lane ', N'Victoria', N'TX', N'77904')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (900, N'Jule', N'Davenport', NULL, N'jule.davenport@aol.com', N'19 River St. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (901, N'Lonna', N'Franks', NULL, N'lonna.franks@yahoo.com', N'667 Brickyard Street ', N'Ontario', N'CA', N'91762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (902, N'Elease', N'Dejesus', NULL, N'elease.dejesus@gmail.com', N'7800 Magnolia Street ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (903, N'Maira', N'Long', NULL, N'maira.long@msn.com', N'7587 Bear Hill Street ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (904, N'Jana', N'Thomas', N'(408) 624-8137', N'jana.thomas@yahoo.com', N'283 E. Spring Dr. ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (905, N'Hae', N'Ramirez', NULL, N'hae.ramirez@hotmail.com', N'9367 Lake Street ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (906, N'Erik', N'Leblanc', NULL, N'erik.leblanc@aol.com', N'7 East Nut Swamp Street ', N'Sugar Land', N'TX', N'77478')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (907, N'Daina', N'Sampson', NULL, N'daina.sampson@msn.com', N'556 Wellington St. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (908, N'Delmar', N'Wise', NULL, N'delmar.wise@yahoo.com', N'8355 Kingston Avenue ', N'Lockport', N'NY', N'14094')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (909, N'Alita', N'Salinas', NULL, N'alita.salinas@hotmail.com', N'8550 Bear Hill Ave. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (910, N'Elenore', N'William', NULL, N'elenore.william@msn.com', N'23 Rockland St. ', N'Mcallen', N'TX', N'78501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (911, N'Nikita', N'Roy', NULL, N'nikita.roy@aol.com', N'9703 N. Snake Hill St. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (912, N'Inocencia', N'Key', NULL, N'inocencia.key@hotmail.com', N'36 Wild Rose Ave. ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (913, N'Liliana', N'Kerr', NULL, N'liliana.kerr@yahoo.com', N'3 Cherry Drive ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (914, N'Hortencia', N'O''neil', NULL, N'hortencia.o''neil@hotmail.com', N'1 Gulf Rd. ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (915, N'Beryl', N'Bennett', N'(916) 422-6956', N'beryl.bennett@aol.com', N'9563 Edgemont St. ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (916, N'Alishia', N'Elliott', NULL, N'alishia.elliott@aol.com', N'8905 Courtland Ave. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (917, N'Vernia', N'Madden', N'(248) 206-3697', N'vernia.madden@aol.com', N'5 Iroquois Street ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (918, N'Kristel', N'Bullock', NULL, N'kristel.bullock@yahoo.com', N'7292 Armstrong Drive ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (919, N'Ruthanne', N'Hoover', NULL, N'ruthanne.hoover@aol.com', N'835 Paris Hill Road ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (920, N'James', N'Robles', NULL, N'james.robles@aol.com', N'9 Chapel Lane ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (921, N'Evelin', N'Vargas', NULL, N'evelin.vargas@msn.com', N'7049 Pin Oak Ave. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (922, N'Elvia', N'Cardenas', NULL, N'elvia.cardenas@hotmail.com', N'8 Paris Hill St. ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (923, N'Randee', N'Pitts', NULL, N'randee.pitts@msn.com', N'7371B Essex Street ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (924, N'Lea', N'Irwin', NULL, N'lea.irwin@gmail.com', N'845 Adams Lane ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (925, N'Bryce', N'Monroe', NULL, N'bryce.monroe@aol.com', N'52 Cooper Lane ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (926, N'Katina', N'Mcintosh', N'(661) 464-1523', N'katina.mcintosh@yahoo.com', N'263 Swanson Dr. ', N'Bakersfield', N'CA', N'93306')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (927, N'Guillermo', N'Hart', N'(212) 652-7198', N'guillermo.hart@hotmail.com', N'81 Indian Summer Drive ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (928, N'Joann', N'Barber', NULL, N'joann.barber@gmail.com', N'8945 Courtland Street ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (929, N'Thurman', N'Ellis', NULL, N'thurman.ellis@gmail.com', N'20 Augusta Road ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (930, N'Delana', N'Wagner', NULL, N'delana.wagner@aol.com', N'8499 Mill Pond Road ', N'Clifton Park', N'NY', N'12065')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (931, N'Porter', N'Bass', NULL, N'porter.bass@hotmail.com', N'370 North Alderwood Dr. ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (932, N'Yvonne', N'Bean', NULL, N'yvonne.bean@yahoo.com', N'20 W. Marsh Ave. ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (933, N'Lurline', N'Rivers', NULL, N'lurline.rivers@msn.com', N'69 Pine Street ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (934, N'Ocie', N'Slater', NULL, N'ocie.slater@msn.com', N'7799 W. Bohemia Dr. ', N'Hamburg', N'NY', N'14075')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (935, N'Genevie', N'Miles', NULL, N'genevie.miles@aol.com', N'45 West Sulphur Springs Ave. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (936, N'Sherilyn', N'Wilcox', NULL, N'sherilyn.wilcox@gmail.com', N'905 North Buckingham Lane ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (937, N'Aida', N'Koch', NULL, N'aida.koch@gmail.com', N'9778 3rd Drive ', N'West Hempstead', N'NY', N'11552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (938, N'Emory', N'O''connor', N'(507) 606-2192', N'emory.o''connor@gmail.com', N'34 Foxrun Street ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (939, N'Maximina', N'Hutchinson', N'(361) 164-3098', N'maximina.hutchinson@hotmail.com', N'53 Stillwater Avenue ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (940, N'Marina', N'Hinton', NULL, N'marina.hinton@yahoo.com', N'7440 North Oxford St. ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (941, N'Danyell', N'Dickerson', NULL, N'danyell.dickerson@msn.com', N'8306 Fieldstone Dr. ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (942, N'Davis', N'Long', N'(717) 653-1755', N'davis.long@msn.com', N'929 Elmwood Dr. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (943, N'Lynn', N'Mcmahon', NULL, N'lynn.mcmahon@msn.com', N'9 Surrey St. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (944, N'Tonja', N'Henderson', NULL, N'tonja.henderson@aol.com', N'82 Alton St. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (945, N'Krissy', N'Ochoa', NULL, N'krissy.ochoa@msn.com', N'80 Queen Ave. ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (946, N'Angella', N'Bridges', NULL, N'angella.bridges@yahoo.com', N'8708 Sycamore St. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (947, N'Angele', N'Castro', NULL, N'angele.castro@yahoo.com', N'15 Acacia Drive ', N'Palos Verdes Peninsula', N'CA', N'90274')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (948, N'Siobhan', N'Lang', NULL, N'siobhan.lang@gmail.com', N'3 Monroe Lane ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (949, N'Venessa', N'Frost', NULL, N'venessa.frost@msn.com', N'621 West School Rd. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (950, N'Verna', N'Solis', N'(507) 115-1633', N'verna.solis@yahoo.com', N'7 Lincoln Lane ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (951, N'Steve', N'Bender', NULL, N'steve.bender@gmail.com', N'908 N. Pennington Dr. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (952, N'Aileen', N'Marquez', NULL, N'aileen.marquez@msn.com', N'8899 Newbridge Street ', N'Torrance', N'CA', N'90505')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (953, N'Kattie', N'Stevenson', NULL, N'kattie.stevenson@aol.com', N'52 Carson Street ', N'Helotes', N'TX', N'78023')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (954, N'Hassan', N'Nash', NULL, N'hassan.nash@yahoo.com', N'8105 University Lane ', N'Hicksville', N'NY', N'11801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (955, N'Delfina', N'Gilliam', NULL, N'delfina.gilliam@hotmail.com', N'9463 Bayberry Rd. ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (956, N'Venus', N'Hewitt', NULL, N'venus.hewitt@msn.com', N'9835 Old Cemetery Lane ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (957, N'Stephen', N'Vega', N'(657) 288-3778', N'stephen.vega@msn.com', N'5 Briarwood St. ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (958, N'Ciera', N'Koch', NULL, N'ciera.koch@gmail.com', N'881 Lawrence Drive ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (959, N'Christel', N'Barber', N'(916) 679-3547', N'christel.barber@hotmail.com', N'320 Briarwood Lane ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (960, N'Arline', N'Lawson', N'(516) 792-3395', N'arline.lawson@gmail.com', N'48 Whitemarsh Lane ', N'Hempstead', N'NY', N'11550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (961, N'Iva', N'Wilcox', NULL, N'iva.wilcox@aol.com', N'452 South Mayflower Drive ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (962, N'Maple', N'Griffin', NULL, N'maple.griffin@gmail.com', N'20 Glendale Drive ', N'Copperas Cove', N'TX', N'76522')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (963, N'Anisha', N'Lang', NULL, N'anisha.lang@aol.com', N'265 Peachtree St. ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (964, N'Brent', N'Calderon', N'(361) 981-8725', N'brent.calderon@aol.com', N'3 Thomas St. ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (965, N'Margit', N'Osborn', NULL, N'margit.osborn@yahoo.com', N'909 Gulf Drive ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (966, N'Novella', N'Patel', NULL, N'novella.patel@gmail.com', N'500 Livingston Street ', N'Glen Cove', N'NY', N'11542')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (967, N'Laurette', N'Hebert', NULL, N'laurette.hebert@msn.com', N'18 South Constitution Court ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (968, N'Jonna', N'Brown', NULL, N'jonna.brown@aol.com', N'1 Spring Drive ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (969, N'Jennell', N'Solis', N'(507) 421-7354', N'jennell.solis@hotmail.com', N'194 2nd Rd. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (970, N'Ruth', N'Horton', NULL, N'ruth.horton@gmail.com', N'488 Mulberry Ave. ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (971, N'Samual', N'Warner', N'(631) 151-4988', N'samual.warner@gmail.com', N'8735 Thatcher Dr. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (972, N'Damian', N'Mills', N'(562) 924-3079', N'damian.mills@yahoo.com', N'7747 Elm Dr. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (973, N'Margaretta', N'Clayton', NULL, N'margaretta.clayton@yahoo.com', N'524 San Pablo Ave. ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (974, N'Marcell', N'Barrett', NULL, N'marcell.barrett@gmail.com', N'266 Elm Drive ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (975, N'Annis', N'Sanchez', N'(424) 352-6275', N'annis.sanchez@aol.com', N'4 Edgewater Road ', N'Los Angeles', N'CA', N'90008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (976, N'Ayanna', N'Cherry', NULL, N'ayanna.cherry@yahoo.com', N'8829 Galvin Rd. ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (977, N'Barton', N'Cox', NULL, N'barton.cox@yahoo.com', N'8220 Creekside Street ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (978, N'Diana', N'Reyes', NULL, N'diana.reyes@msn.com', N'7415 Annadale St. ', N'Bronx', N'NY', N'10451')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (979, N'Ingeborg', N'Ellison', NULL, N'ingeborg.ellison@yahoo.com', N'360 Trusel St. ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (980, N'Carter', N'Booth', NULL, N'carter.booth@msn.com', N'82 Beech Drive ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (981, N'Christel', N'Cardenas', N'(562) 342-8083', N'christel.cardenas@aol.com', N'428 S. Swanson Drive ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (982, N'Orval', N'Hunter', NULL, N'orval.hunter@aol.com', N'35 Wagon Drive ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (983, N'Marguerite', N'Berger', NULL, N'marguerite.berger@aol.com', N'875 Arch Lane ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (984, N'Ivette', N'Warren', NULL, N'ivette.warren@gmail.com', N'8408 Thomas Street ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (985, N'Milagros', N'Weber', NULL, N'milagros.weber@hotmail.com', N'7591 Glendale Ave. ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (986, N'Marcel', N'Lindsay', NULL, N'marcel.lindsay@hotmail.com', N'249 Peninsula St. ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (987, N'Louis', N'Powell', NULL, N'louis.powell@aol.com', N'368 Sugar Rd. ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (988, N'Vanda', N'Holmes', NULL, N'vanda.holmes@aol.com', N'9835 Wild Rose Drive ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (989, N'Loreen', N'Byers', NULL, N'loreen.byers@yahoo.com', N'83 S. Rockledge Circle ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (990, N'Casimira', N'Chapman', NULL, N'casimira.chapman@yahoo.com', N'67 Snake Hill St. ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (991, N'Brigida', N'Larson', NULL, N'brigida.larson@hotmail.com', N'8789 Sycamore Lane ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (992, N'Chere', N'Alston', NULL, N'chere.alston@gmail.com', N'16 Lower River Street ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (993, N'Giovanna', N'Jefferson', NULL, N'giovanna.jefferson@gmail.com', N'9394 Riverside St. ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (994, N'Demarcus', N'Reese', NULL, N'demarcus.reese@gmail.com', N'8087 Armstrong Dr. ', N'Yorktown Heights', N'NY', N'10598')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (995, N'Amina', N'Salazar', NULL, N'amina.salazar@aol.com', N'944 Wellington Street ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (996, N'Serafina', N'Clemons', NULL, N'serafina.clemons@gmail.com', N'851 Brown Ave. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (997, N'Trinidad', N'Mcclain', NULL, N'trinidad.mcclain@msn.com', N'98 Tunnel Drive ', N'Baldwin', N'NY', N'11510')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (998, N'Heather', N'Chaney', NULL, N'heather.chaney@yahoo.com', N'4 Morris Dr. ', N'Jamestown', N'NY', N'14701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (999, N'Latoya', N'Johns', NULL, N'latoya.johns@hotmail.com', N'7914 W. Woodsman St. ', N'Ballston Spa', N'NY', N'12020')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1000, N'Shiloh', N'Reeves', NULL, N'shiloh.reeves@msn.com', N'818 Kirkland Lane ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1001, N'Lee', N'Roman', N'(631) 913-6967', N'lee.roman@gmail.com', N'4 Canal Ave. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1002, N'Cami', N'Williamson', NULL, N'cami.williamson@hotmail.com', N'9511A Windsor Drive ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1003, N'Sharell', N'Ross', NULL, N'sharell.ross@msn.com', N'7830 Devonshire Ave. ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1004, N'Jerald', N'Blackwell', NULL, N'jerald.blackwell@hotmail.com', N'8364 South Wakehurst Ave. ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1005, N'Ruthanne', N'Franco', NULL, N'ruthanne.franco@yahoo.com', N'61 Applegate St. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1006, N'Marjory', N'Leonard', NULL, N'marjory.leonard@msn.com', N'800 Greystone Lane ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1007, N'Jimmy', N'Russell', NULL, N'jimmy.russell@hotmail.com', N'33 Iroquois Ave. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1008, N'Berneice', N'Pollard', NULL, N'berneice.pollard@hotmail.com', N'607 Bohemia Street ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1009, N'Deangelo', N'Cooley', NULL, N'deangelo.cooley@aol.com', N'3 NE. Edgewood Rd. ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1010, N'Katia', N'Henry', NULL, N'katia.henry@msn.com', N'69 E. Columbia Ave. ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1011, N'Sebrina', N'Gross', NULL, N'sebrina.gross@yahoo.com', N'993 Glendale Drive ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1012, N'Josephine', N'Dale', NULL, N'josephine.dale@aol.com', N'8214 West Drive ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1013, N'Alma', N'Peck', NULL, N'alma.peck@aol.com', N'298 South Bay Meadows Drive ', N'Corona', N'NY', N'11368')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1014, N'Ling', N'Newman', NULL, N'ling.newman@msn.com', N'832 Spring Road ', N'South Richmond Hill', N'NY', N'11419')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1015, N'Nichelle', N'Rosario', NULL, N'nichelle.rosario@hotmail.com', N'709 Dunbar Ave. ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1016, N'Shenna', N'Benton', N'(212) 578-2912', N'shenna.benton@msn.com', N'57 Shadow Brook Road ', N'New York', N'NY', N'10002')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1017, N'Philip', N'Bryan', N'(510) 533-4262', N'philip.bryan@hotmail.com', N'914 Devonshire Court ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1018, N'Carita', N'Salinas', NULL, N'carita.salinas@yahoo.com', N'90 Griffin Street ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1019, N'Janie', N'Herrera', NULL, N'janie.herrera@gmail.com', N'652 Westport Street ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1020, N'Lorraine', N'Marks', NULL, N'lorraine.marks@msn.com', N'160 North Pearl Street ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1021, N'Nicolas', N'Carlson', NULL, N'nicolas.carlson@yahoo.com', N'7899 Spruce Street ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1022, N'Hye', N'Mercer', NULL, N'hye.mercer@gmail.com', N'9681 Redwood St. ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1023, N'Adena', N'Blake', NULL, N'adena.blake@hotmail.com', N'684 Westport Drive ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1024, N'Coleman', N'Boyd', N'(915) 607-6336', N'coleman.boyd@yahoo.com', N'9740 Bay Meadows Drive ', N'El Paso', N'TX', N'79930')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1025, N'Daphine', N'Willis', NULL, N'daphine.willis@msn.com', N'152 Shady St. ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1026, N'Jenine', N'Dawson', NULL, N'jenine.dawson@msn.com', N'17 Park Street ', N'Endicott', N'NY', N'13760')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1027, N'Shanita', N'Wiley', NULL, N'shanita.wiley@yahoo.com', N'121 Bridge Lane ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1028, N'Shanna', N'Bonner', NULL, N'shanna.bonner@msn.com', N'386 Lafayette Road ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1029, N'Ping', N'Quinn', NULL, N'ping.quinn@gmail.com', N'9051 Hanover Dr. ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1030, N'Saran', N'Moses', NULL, N'saran.moses@yahoo.com', N'94 Hall Dr. ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1031, N'Tonja', N'Bean', NULL, N'tonja.bean@aol.com', N'9 Middle River St. ', N'Fairport', N'NY', N'14450')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1032, N'Vernon', N'Knowles', NULL, N'vernon.knowles@yahoo.com', N'5 Olive Lane ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1033, N'Jeannette', N'Skinner', NULL, N'jeannette.skinner@yahoo.com', N'8886 High Point Drive ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1034, N'Rico', N'Salas', NULL, N'rico.salas@msn.com', N'8041 Walt Whitman St. ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1035, N'Tangela', N'Hurley', NULL, N'tangela.hurley@msn.com', N'49 North Cross St. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1036, N'Randee', N'Lester', NULL, N'randee.lester@gmail.com', N'81 Bear Hill Street ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1037, N'Ashanti', N'Hammond', NULL, N'ashanti.hammond@msn.com', N'9202 W. Lyme Ave. ', N'Nanuet', N'NY', N'10954')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1038, N'Garry', N'Juarez', NULL, N'garry.juarez@hotmail.com', N'670 Nut Swamp Drive ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1039, N'Bee', N'Baker', NULL, N'bee.baker@aol.com', N'307 E. Magnolia St. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1040, N'Shantae', N'Hammond', NULL, N'shantae.hammond@hotmail.com', N'526 Harvard Drive ', N'Victoria', N'TX', N'77904')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1041, N'Bettye', N'Espinoza', NULL, N'bettye.espinoza@yahoo.com', N'76 Rockwell Street ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1042, N'Larissa', N'Hays', NULL, N'larissa.hays@aol.com', N'66 2nd Drive ', N'Elmont', N'NY', N'11003')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1043, N'Diane', N'Jones', NULL, N'diane.jones@gmail.com', N'859 Prince St. ', N'Fresh Meadows', N'NY', N'11365')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1044, N'Zenia', N'Bruce', NULL, N'zenia.bruce@aol.com', N'349 James Road ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1045, N'Pasquale', N'Hogan', NULL, N'pasquale.hogan@aol.com', N'403 Bank St. ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1046, N'Dane', N'Mcdaniel', NULL, N'dane.mcdaniel@hotmail.com', N'891 Court Ave. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1047, N'Jamaal', N'Baker', NULL, N'jamaal.baker@hotmail.com', N'186 Big Rock Cove Ave. ', N'Elmhurst', N'NY', N'11373')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1048, N'Ji', N'Burt', NULL, N'ji.burt@hotmail.com', N'40 S. Roberts Street ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1049, N'Marcelino', N'Mcbride', NULL, N'marcelino.mcbride@hotmail.com', N'29 Oxford Ave. ', N'Clifton Park', N'NY', N'12065')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1050, N'Rozella', N'Fitzgerald', NULL, N'rozella.fitzgerald@yahoo.com', N'7795 Myers Ave. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1051, N'Tonisha', N'Fowler', NULL, N'tonisha.fowler@msn.com', N'9270 Valley View Lane ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1052, N'Zora', N'Ford', N'(916) 192-3196', N'zora.ford@gmail.com', N'7416 La Sierra Dr. ', N'Sacramento', N'CA', N'95820')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1053, N'Parthenia', N'Figueroa', NULL, N'parthenia.figueroa@msn.com', N'550 Theatre Dr. ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1054, N'Arielle', N'Levine', NULL, N'arielle.levine@yahoo.com', N'7100 High Ridge St. ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1055, N'Hildegarde', N'Christensen', NULL, N'hildegarde.christensen@hotmail.com', N'488 East Mill Pond Ave. ', N'Maspeth', N'NY', N'11378')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1056, N'Rebbecca', N'Espinoza', NULL, N'rebbecca.espinoza@hotmail.com', N'8266 Valley Farms Road ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1057, N'Conchita', N'Boone', NULL, N'conchita.boone@gmail.com', N'814 Birchpond Lane ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1058, N'Aisha', N'Woods', NULL, N'aisha.woods@gmail.com', N'9292 Bear Hill Ave. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1059, N'Season', N'Harvey', NULL, N'season.harvey@yahoo.com', N'388 Arnold Court ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1060, N'Tommie', N'Cooley', N'(717) 634-4113', N'tommie.cooley@yahoo.com', N'92 Hickory St. ', N'Lancaster', N'NY', N'14086')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1061, N'Alanna', N'Barry', NULL, N'alanna.barry@yahoo.com', N'33 Laurel Avenue ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1062, N'Jerri', N'Guthrie', NULL, N'jerri.guthrie@msn.com', N'95 Sugar Dr. ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1063, N'Tammy', N'Austin', NULL, N'tammy.austin@yahoo.com', N'182 Stillwater Ave. ', N'Lake Jackson', N'TX', N'77566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1064, N'Patsy', N'Russo', NULL, N'patsy.russo@gmail.com', N'8438 Fairway Avenue ', N'Rowlett', N'TX', N'75088')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1065, N'Desiree', N'Branch', NULL, N'desiree.branch@msn.com', N'67 Bayport Drive ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1066, N'Raeann', N'Duncan', N'(657) 256-2008', N'raeann.duncan@aol.com', N'126 Edgewood St. ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1067, N'Lillia', N'Gillespie', NULL, N'lillia.gillespie@hotmail.com', N'382 Cardinal Dr. ', N'Rego Park', N'NY', N'11374')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1068, N'Doris', N'Kaufman', NULL, N'doris.kaufman@gmail.com', N'69 Fairground Dr. ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1069, N'Rodolfo', N'Buck', NULL, N'rodolfo.buck@gmail.com', N'8359 Brewery Street ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1070, N'Olimpia', N'Mays', NULL, N'olimpia.mays@aol.com', N'42 Nichols Lane ', N'Oakland Gardens', N'NY', N'11364')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1071, N'Shemeka', N'Lyons', NULL, N'shemeka.lyons@msn.com', N'97 South Jockey Hollow St. ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1072, N'Maryalice', N'Henry', NULL, N'maryalice.henry@msn.com', N'85 Prince Street ', N'Richardson', N'TX', N'75080')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1073, N'Leeanne', N'Cross', NULL, N'leeanne.cross@yahoo.com', N'424 Newcastle Road ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1074, N'Lanelle', N'Guerra', NULL, N'lanelle.guerra@yahoo.com', N'989 Wrangler St. ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1075, N'Dann', N'Huff', NULL, N'dann.huff@gmail.com', N'475 S. Rockville St. ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1076, N'Sherise', N'Mercer', NULL, N'sherise.mercer@gmail.com', N'9401 Catherine Dr. ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1077, N'Heather', N'Perry', NULL, N'heather.perry@gmail.com', N'982 Durham Street ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1078, N'Theresia', N'Barron', NULL, N'theresia.barron@aol.com', N'951 Wild Rose Street ', N'Forest Hills', N'NY', N'11375')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1079, N'Cindi', N'Ellis', NULL, N'cindi.ellis@yahoo.com', N'6 Cypress Lane ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1080, N'Mirella', N'Duffy', NULL, N'mirella.duffy@yahoo.com', N'43 University Ave. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1081, N'Carson', N'Macias', NULL, N'carson.macias@gmail.com', N'7 Pennington St. ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1082, N'Divina', N'Madden', N'(562) 264-3998', N'divina.madden@gmail.com', N'7314 Armstrong St. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1083, N'Cher', N'Alston', NULL, N'cher.alston@msn.com', N'38 Wild Horse Road ', N'Wantagh', N'NY', N'11793')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1084, N'Regine', N'Odom', NULL, N'regine.odom@msn.com', N'684 N. Mayfield Ave. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1085, N'Adam', N'Thornton', NULL, N'adam.thornton@hotmail.com', N'755 East Henry Lane ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1086, N'Cori', N'Schwartz', NULL, N'cori.schwartz@msn.com', N'43 Lancaster Lane ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1087, N'Willow', N'Gardner', NULL, N'willow.gardner@gmail.com', N'57 S. Lakewood Dr. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1088, N'Jane', N'Henderson', NULL, N'jane.henderson@hotmail.com', N'46 Carson Drive ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1089, N'Chere', N'Mcfadden', NULL, N'chere.mcfadden@yahoo.com', N'695 San Pablo Drive ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1090, N'Ira', N'Erickson', NULL, N'ira.erickson@aol.com', N'6 Lake Forest St. ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1091, N'Risa', N'Gallagher', NULL, N'risa.gallagher@yahoo.com', N'8281 Edgefield Drive ', N'Rocklin', N'CA', N'95677')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1092, N'Lavinia', N'Cotton', NULL, N'lavinia.cotton@yahoo.com', N'7485 Bridle Street ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1093, N'Alejandrina', N'Hodges', NULL, N'alejandrina.hodges@msn.com', N'7598 Shadow Brook St. ', N'Deer Park', N'NY', N'11729')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1094, N'Keitha', N'Black', NULL, N'keitha.black@yahoo.com', N'7670 Hilldale Ave. ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1095, N'Corene', N'Swanson', NULL, N'corene.swanson@aol.com', N'597 Lakeshore Lane ', N'Rego Park', N'NY', N'11374')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1096, N'Tonda', N'Webb', NULL, N'tonda.webb@yahoo.com', N'53 SW. Edgemont Rd. ', N'Baldwinsville', N'NY', N'13027')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1097, N'Collen', N'Dennis', NULL, N'collen.dennis@gmail.com', N'284 E. Mill Street ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1098, N'Treasa', N'Dickerson', NULL, N'treasa.dickerson@hotmail.com', N'70 W. Creekside Road ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1099, N'Jewell', N'Reyes', NULL, N'jewell.reyes@hotmail.com', N'8711 Glen Creek Drive ', N'Jackson Heights', N'NY', N'11372')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1100, N'Penny', N'Acevedo', NULL, N'penny.acevedo@yahoo.com', N'318 Mulberry Drive ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1101, N'Louise', N'Flowers', NULL, N'louise.flowers@yahoo.com', N'28 N. Gregory Court ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1102, N'Henrietta', N'Wagner', N'(682) 143-2224', N'henrietta.wagner@hotmail.com', N'54 Brickyard St. ', N'Fort Worth', N'TX', N'76110')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1103, N'Ardelia', N'Cooley', NULL, N'ardelia.cooley@aol.com', N'59 Henry Smith St. ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1104, N'Khalilah', N'Robertson', NULL, N'khalilah.robertson@aol.com', N'22 Longbranch Rd. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1105, N'Armando', N'Black', NULL, N'armando.black@gmail.com', N'8611 N. Poor House St. ', N'Richardson', N'TX', N'75080')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1106, N'Jerri', N'Henry', NULL, N'jerri.henry@msn.com', N'141 N. Purple Finch Avenue ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1107, N'Lynda', N'Newman', NULL, N'lynda.newman@msn.com', N'44 SW. Thomas Ave. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1108, N'Bao', N'Wade', NULL, N'bao.wade@gmail.com', N'7587 Church St. ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1109, N'Gussie', N'Harding', NULL, N'gussie.harding@gmail.com', N'41 Edgefield Avenue ', N'Deer Park', N'NY', N'11729')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1110, N'Shirely', N'Cantrell', NULL, N'shirely.cantrell@aol.com', N'6 Kent Street ', N'West Hempstead', N'NY', N'11552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1111, N'Caroline', N'Jenkins', NULL, N'caroline.jenkins@msn.com', N'86 River Lane ', N'Richardson', N'TX', N'75080')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1112, N'Hollis', N'Rasmussen', NULL, N'hollis.rasmussen@yahoo.com', N'8949 S. Gates Road ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1113, N'Kendra', N'Harrington', NULL, N'kendra.harrington@yahoo.com', N'768 Cooper Street ', N'Jamestown', N'NY', N'14701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1114, N'Douglass', N'Blankenship', N'(229) 891-2087', N'douglass.blankenship@hotmail.com', N'409 W. Rock Maple Lane ', N'Albany', N'NY', N'12203')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1115, N'Lina', N'Meadows', NULL, N'lina.meadows@aol.com', N'7020 Ashley Rd. ', N'Glen Cove', N'NY', N'11542')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1116, N'Patria', N'Harper', NULL, N'patria.harper@msn.com', N'90 Arlington St. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1117, N'Jeffrey', N'Hill', NULL, N'jeffrey.hill@gmail.com', N'2 Shub Farm St. ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1118, N'Ja', N'Dillard', NULL, N'ja.dillard@yahoo.com', N'25 Orchard St. ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1119, N'Tora', N'Dunlap', NULL, N'tora.dunlap@hotmail.com', N'9903 North Halifax Ave. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1120, N'Karole', N'Alvarez', NULL, N'karole.alvarez@gmail.com', N'69 Woodland St. ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1121, N'Shasta', N'Combs', NULL, N'shasta.combs@yahoo.com', N'726 James Dr. ', N'Yorktown Heights', N'NY', N'10598')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1122, N'Cicely', N'Deleon', NULL, N'cicely.deleon@yahoo.com', N'751 Newbridge Ave. ', N'Massapequa Park', N'NY', N'11762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1123, N'Raphael', N'O''neil', NULL, N'raphael.o''neil@aol.com', N'762 East Lantern Dr. ', N'Fairport', N'NY', N'14450')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1124, N'Hubert', N'Reilly', NULL, N'hubert.reilly@hotmail.com', N'9004 N. Lake Rd. ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1125, N'Caleb', N'England', NULL, N'caleb.england@gmail.com', N'649 Marvon St. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1126, N'Elmira', N'Levy', NULL, N'elmira.levy@gmail.com', N'6 Columbia Dr. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1127, N'Waldo', N'Hart', NULL, N'waldo.hart@yahoo.com', N'9782 Pineknoll Lane ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1128, N'Bea', N'Kane', NULL, N'bea.kane@aol.com', N'398 Green Lake Ave. ', N'Mahopac', N'NY', N'10541')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1129, N'Gilberto', N'Sanders', NULL, N'gilberto.sanders@hotmail.com', N'186 Roehampton Ave. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1130, N'Benny', N'Bender', NULL, N'benny.bender@aol.com', N'520 W. Hamilton St. ', N'Elmont', N'NY', N'11003')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1131, N'Desmond', N'Rose', NULL, N'desmond.rose@hotmail.com', N'9956 Lexington Rd. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1132, N'Parthenia', N'Holman', NULL, N'parthenia.holman@gmail.com', N'17 Orange Court ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1133, N'Dung', N'King', NULL, N'dung.king@aol.com', N'523 Prairie St. ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1134, N'Sherril', N'Alvarado', NULL, N'sherril.alvarado@hotmail.com', N'9434 Cypress Court ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1135, N'Alisia', N'Albert', NULL, N'alisia.albert@gmail.com', N'9490 Coffee St. ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1136, N'Kallie', N'Best', N'(507) 997-4112', N'kallie.best@aol.com', N'9842 Fairview St. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1137, N'Dottie', N'Roberts', NULL, N'dottie.roberts@aol.com', N'8252 Theatre St. ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1138, N'Hubert', N'Stone', NULL, N'hubert.stone@hotmail.com', N'203 Penn St. ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1139, N'Gabriella', N'Jones', NULL, N'gabriella.jones@hotmail.com', N'9100 Gates Ave. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1140, N'Penney', N'Hall', NULL, N'penney.hall@msn.com', N'8306 Jockey Hollow Street ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1141, N'Mallie', N'Osborn', NULL, N'mallie.osborn@gmail.com', N'9022 Bridgeton St. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1142, N'Britteny', N'Schroeder', NULL, N'britteny.schroeder@aol.com', N'855 Bohemia Dr. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1143, N'Sommer', N'Hopkins', NULL, N'sommer.hopkins@gmail.com', N'827 Laurel Ave. ', N'Tonawanda', N'NY', N'14150')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1144, N'Jewel', N'Sparks', NULL, N'jewel.sparks@aol.com', N'12 Vine Road ', N'Oakland Gardens', N'NY', N'11364')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1145, N'Deandrea', N'Vega', N'(914) 818-7312', N'deandrea.vega@gmail.com', N'613 Mill Pond St. ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1146, N'Charlsie', N'Carson', NULL, N'charlsie.carson@hotmail.com', N'3 South Grant Avenue ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1147, N'Kandace', N'Ayers', NULL, N'kandace.ayers@gmail.com', N'9005 Lookout Lane ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1148, N'Lenore', N'Valdez', NULL, N'lenore.valdez@msn.com', N'829 Birchpond Street ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1149, N'Drucilla', N'Gilliam', NULL, N'drucilla.gilliam@hotmail.com', N'8257 E. Westminster Ave. ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1150, N'Keturah', N'Reid', N'(361) 394-2024', N'keturah.reid@yahoo.com', N'747 SE. Beech Ave. ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1151, N'Herminia', N'Reyes', NULL, N'herminia.reyes@gmail.com', N'782 Stonybrook Street ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1152, N'Tuyet', N'Rosa', NULL, N'tuyet.rosa@aol.com', N'9038 Golden Star Street ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1153, N'Ara', N'Vazquez', NULL, N'ara.vazquez@msn.com', N'343 2nd Court ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1154, N'Barry', N'Albert', NULL, N'barry.albert@gmail.com', N'13 Grand St. ', N'Auburn', N'NY', N'13021')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1155, N'Verdell', N'Joyner', NULL, N'verdell.joyner@aol.com', N'9191 Sierra St. ', N'Far Rockaway', N'NY', N'11691')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1156, N'Han', N'Wade', NULL, N'han.wade@hotmail.com', N'587 Sulphur Springs St. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1157, N'Anton', N'Barton', N'(716) 472-3707', N'anton.barton@msn.com', N'7284 East Indian Spring Rd. ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1158, N'Vito', N'Pickett', NULL, N'vito.pickett@hotmail.com', N'93 High Point Street ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1159, N'Charlene', N'Norris', NULL, N'charlene.norris@msn.com', N'972 South Sierra Drive ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1160, N'Efren', N'Whitfield', NULL, N'efren.whitfield@gmail.com', N'139 Union Rd. ', N'Euless', N'TX', N'76039')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1161, N'Santa', N'Larson', NULL, N'santa.larson@gmail.com', N'5 Bellevue Dr. ', N'Valley Stream', N'NY', N'11580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1162, N'Carmelina', N'Sellers', NULL, N'carmelina.sellers@hotmail.com', N'12 Race St. ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1163, N'Carmela', N'Hays', NULL, N'carmela.hays@aol.com', N'149 Pennington Ave. ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1164, N'Patrina', N'Tanner', NULL, N'patrina.tanner@gmail.com', N'7136 Selby Road ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1165, N'Rikki', N'Morrow', N'(682) 936-1482', N'rikki.morrow@hotmail.com', N'7096 Plumb Branch Road ', N'Fort Worth', N'TX', N'76110')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1166, N'Junita', N'Reese', NULL, N'junita.reese@gmail.com', N'8773 North Walt Whitman Court ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1167, N'Ryan', N'Carter', NULL, N'ryan.carter@yahoo.com', N'8684 Studebaker Road ', N'Nanuet', N'NY', N'10954')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1168, N'Almeta', N'Benjamin', NULL, N'almeta.benjamin@aol.com', N'8456 Oakwood St. ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1169, N'Beatris', N'Joyner', NULL, N'beatris.joyner@gmail.com', N'7463 Gonzales Rd. ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1170, N'Mechelle', N'Chan', NULL, N'mechelle.chan@gmail.com', N'458 Overlook Street ', N'Richmond Hill', N'NY', N'11418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1171, N'Earlean', N'Pena', NULL, N'earlean.pena@yahoo.com', N'7698 Fulton St. ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1172, N'Katherin', N'Clark', NULL, N'katherin.clark@yahoo.com', N'996 Iroquois Street ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1173, N'Chanel', N'May', NULL, N'chanel.may@msn.com', N'806 Saxton Court ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1174, N'Aaron', N'Knapp', N'(914) 402-4335', N'aaron.knapp@yahoo.com', N'807 Grandrose Ave. ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1175, N'Sindy', N'Anderson', NULL, N'sindy.anderson@gmail.com', N'543 Halifax Ave. ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1176, N'Sheree', N'Blanchard', NULL, N'sheree.blanchard@gmail.com', N'41 Glenwood Ave. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1177, N'Charlesetta', N'Soto', NULL, N'charlesetta.soto@yahoo.com', N'25 South Colonial Drive ', N'Poughkeepsie', N'NY', N'12601')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1178, N'Wendie', N'Nash', N'(805) 389-2549', N'wendie.nash@hotmail.com', N'9 South Road ', N'Oxnard', N'CA', N'93035')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1179, N'Vernetta', N'Banks', NULL, N'vernetta.banks@aol.com', N'7633 Albany St. ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1180, N'Myrtle', N'Gardner', NULL, N'myrtle.gardner@aol.com', N'303 Creekside Street ', N'Farmingdale', N'NY', N'11735')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1181, N'Agustina', N'Lawrence', NULL, N'agustina.lawrence@yahoo.com', N'9347 Delaware Ave. ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1182, N'Trinidad', N'Chapman', NULL, N'trinidad.chapman@aol.com', N'7371 Glen Eagles Street ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1183, N'Kim', N'Clark', NULL, N'kim.clark@msn.com', N'19 Liberty St. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1184, N'Annabelle', N'Hebert', NULL, N'annabelle.hebert@aol.com', N'9745 Nicolls Lane ', N'Spring Valley', N'NY', N'10977')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1185, N'Corine', N'Stuart', NULL, N'corine.stuart@msn.com', N'5 Penn Street ', N'Clifton Park', N'NY', N'12065')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1186, N'Kiesha', N'Bond', NULL, N'kiesha.bond@aol.com', N'29 Marvon St. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1187, N'Kenyetta', N'Mason', NULL, N'kenyetta.mason@msn.com', N'98 Poplar Ave. ', N'Flushing', N'NY', N'11354')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1188, N'Marcene', N'Curtis', N'(914) 361-6045', N'marcene.curtis@msn.com', N'7699 Illinois Lane ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1189, N'Sheila', N'Goodman', NULL, N'sheila.goodman@msn.com', N'9586 Chestnut St. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1190, N'Romeo', N'Steele', NULL, N'romeo.steele@msn.com', N'162 Crescent Lane ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1191, N'Tam', N'Fisher', N'(507) 351-9375', N'tam.fisher@aol.com', N'8000 Woodsman Lane ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1192, N'Gena', N'Owens', NULL, N'gena.owens@gmail.com', N'43 Buckingham St. ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1193, N'Phebe', N'Soto', NULL, N'phebe.soto@hotmail.com', N'9239 Leatherwood Rd. ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1194, N'Leticia', N'Snyder', NULL, N'leticia.snyder@yahoo.com', N'173 Lyme Dr. ', N'Pittsford', N'NY', N'14534')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1195, N'Chantell', N'Bridges', N'(716) 941-6072', N'chantell.bridges@yahoo.com', N'8478 N. Wrangler Dr. ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1196, N'Ileana', N'Holt', NULL, N'ileana.holt@msn.com', N'817 Adams St. ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1197, N'Nakisha', N'Clay', NULL, N'nakisha.clay@gmail.com', N'8996 Beechwood Ave. ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1198, N'Cheryll', N'Snyder', NULL, N'cheryll.snyder@yahoo.com', N'77 E. Liberty St. ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1199, N'Consuela', N'Collier', NULL, N'consuela.collier@msn.com', N'338 S. Holly Avenue ', N'North Tonawanda', N'NY', N'14120')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1200, N'Aubrey', N'Durham', NULL, N'aubrey.durham@aol.com', N'14 Foster Ave. ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1201, N'Nita', N'Guy', NULL, N'nita.guy@hotmail.com', N'75 Academy Street ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1202, N'Carmina', N'Emerson', NULL, N'carmina.emerson@hotmail.com', N'7137 Monroe Road ', N'Banning', N'CA', N'92220')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1203, N'Georgeann', N'Rojas', NULL, N'georgeann.rojas@msn.com', N'691 Devon Ave. ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1204, N'Leslie', N'Higgins', NULL, N'leslie.higgins@hotmail.com', N'805 Logan Ave. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1205, N'Emmaline', N'Huber', NULL, N'emmaline.huber@gmail.com', N'7975 Harrison Rd. ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1206, N'Mercy', N'Brown', NULL, N'mercy.brown@msn.com', N'8207 Central Street ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1207, N'Jenell', N'Crosby', N'(631) 544-4772', N'jenell.crosby@hotmail.com', N'507 Fulton Street ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1208, N'Leila', N'Barr', NULL, N'leila.barr@yahoo.com', N'120 Fremont Rd. ', N'Carmel', N'NY', N'10512')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1209, N'Deandrea', N'Cox', NULL, N'deandrea.cox@msn.com', N'617 Sycamore Street ', N'Huntington', N'NY', N'11743')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1210, N'Shawnna', N'Frank', NULL, N'shawnna.frank@hotmail.com', N'17 NW. Cottage Lane ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1211, N'Brenton', N'Whitaker', NULL, N'brenton.whitaker@gmail.com', N'25 Elmwood Rd. ', N'Niagara Falls', N'NY', N'14304')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1212, N'Jaqueline', N'Cummings', NULL, N'jaqueline.cummings@hotmail.com', N'478 Wrangler St. ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1213, N'Yang', N'Giles', NULL, N'yang.giles@gmail.com', N'25 Bridle Lane ', N'San Angelo', N'TX', N'76901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1214, N'Brigid', N'Sharp', NULL, N'brigid.sharp@hotmail.com', N'495 Sleepy Hollow Court ', N'Santa Clara', N'CA', N'95050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1215, N'Karl', N'Stephens', NULL, N'karl.stephens@gmail.com', N'208 Thatcher Rd. ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1216, N'Elvina', N'Gates', NULL, N'elvina.gates@hotmail.com', N'112 Smith St. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1217, N'Carlie', N'Terrell', N'(914) 517-8036', N'carlie.terrell@yahoo.com', N'7437 Snake Hill Road ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1218, N'Donovan', N'Cantrell', N'(510) 624-3824', N'donovan.cantrell@msn.com', N'601 Winchester Dr. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1219, N'Alden', N'Atkinson', NULL, N'alden.atkinson@gmail.com', N'46 Valley St. ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1220, N'Carissa', N'Cross', NULL, N'carissa.cross@yahoo.com', N'9335 West Main Dr. ', N'Huntington Station', N'NY', N'11746')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1221, N'Joy', N'Underwood', NULL, N'joy.underwood@gmail.com', N'7297 Armstrong Dr. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1222, N'Geraldine', N'O''donnell', NULL, N'geraldine.o''donnell@hotmail.com', N'8241 Lookout Rd. ', N'Flushing', N'NY', N'11354')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1223, N'Bronwyn', N'Vargas', NULL, N'bronwyn.vargas@msn.com', N'35 James Street ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1224, N'Abram', N'Copeland', NULL, N'abram.copeland@gmail.com', N'9782 Indian Spring Lane ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1225, N'Mellisa', N'Griffin', NULL, N'mellisa.griffin@msn.com', N'49 Alton Circle ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1226, N'Qiana', N'Jackson', NULL, N'qiana.jackson@gmail.com', N'56 Galvin Street ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1227, N'Magali', N'Dixon', N'(248) 279-5331', N'magali.dixon@msn.com', N'815 Del Monte Court ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1228, N'Zulema', N'Clemons', N'(510) 565-8496', N'zulema.clemons@aol.com', N'75 W. Howard St. ', N'Oakland', N'CA', N'94603')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1229, N'Carina', N'Lynch', NULL, N'carina.lynch@gmail.com', N'64 Jennings Road ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1230, N'Jesus', N'Burch', NULL, N'jesus.burch@hotmail.com', N'7024 Squaw Creek Street ', N'Desoto', N'TX', N'75115')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1231, N'Selene', N'Vega', NULL, N'selene.vega@gmail.com', N'11 Sierra St. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1232, N'Jong', N'Guthrie', NULL, N'jong.guthrie@hotmail.com', N'889 Leatherwood Drive ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1233, N'Lise', N'Hebert', NULL, N'lise.hebert@gmail.com', N'140 East Broad Lane ', N'Vista', N'CA', N'92083')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1234, N'Joshua', N'Berg', NULL, N'joshua.berg@hotmail.com', N'16 East St. ', N'Ossining', N'NY', N'10562')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1235, N'Georgina', N'Gonzales', NULL, N'georgina.gonzales@yahoo.com', N'307 Chapel St. ', N'Endicott', N'NY', N'13760')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1236, N'Rudolph', N'Velez', NULL, N'rudolph.velez@yahoo.com', N'9397 Pleasant Drive ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1237, N'Luke', N'Kramer', NULL, N'luke.kramer@hotmail.com', N'7955 Delaware Drive ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1238, N'Edgar', N'Quinn', NULL, N'edgar.quinn@aol.com', N'556 Dogwood Ave. ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1239, N'Tara', N'Maynard', NULL, N'tara.maynard@hotmail.com', N'9375 Fordham Street ', N'Lindenhurst', N'NY', N'11757')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1240, N'Bella', N'Perez', NULL, N'bella.perez@msn.com', N'43 Green Lake Street ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1241, N'Nathaniel', N'Davidson', NULL, N'nathaniel.davidson@hotmail.com', N'7476 Henry Smith Street ', N'Rome', N'NY', N'13440')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1242, N'Chauncey', N'Donaldson', NULL, N'chauncey.donaldson@aol.com', N'7412 Golf Ave. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1243, N'Heide', N'Reed', NULL, N'heide.reed@yahoo.com', N'9174 Coffee Drive ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1244, N'Trang', N'Hardin', NULL, N'trang.hardin@yahoo.com', N'9255 Myers Drive ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1245, N'Gabriela', N'Warren', N'(562) 986-2247', N'gabriela.warren@aol.com', N'9947 Brewery Ave. ', N'Long Beach', N'NY', N'11561')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1246, N'Dale', N'Rasmussen', NULL, N'dale.rasmussen@aol.com', N'8590 Adams Street ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1247, N'Tammie', N'Cherry', NULL, N'tammie.cherry@hotmail.com', N'791 Wakehurst Dr. ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1248, N'Bethany', N'Herring', NULL, N'bethany.herring@yahoo.com', N'7563 High Point Street ', N'Port Jefferson Station', N'NY', N'11776')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1249, N'Barbra', N'Dickerson', NULL, N'barbra.dickerson@gmail.com', N'8424 E. Rockcrest Dr. ', N'Ridgecrest', N'CA', N'93555')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1250, N'Neoma', N'Daugherty', NULL, N'neoma.daugherty@gmail.com', N'80 Spring Street ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1251, N'Nanette', N'Roman', NULL, N'nanette.roman@yahoo.com', N'8254 North Riverview Street ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1252, N'Adriene', N'Rollins', NULL, N'adriene.rollins@msn.com', N'55 Cambridge Street ', N'Plainview', N'NY', N'11803')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1253, N'Susannah', N'Fields', NULL, N'susannah.fields@hotmail.com', N'17 Railroad Street ', N'Far Rockaway', N'NY', N'11691')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1254, N'Dung', N'Reid', NULL, N'dung.reid@msn.com', N'468 West Washington Ave. ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1255, N'Ben', N'Stone', NULL, N'ben.stone@gmail.com', N'8855 University St. ', N'Ithaca', N'NY', N'14850')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1256, N'Nubia', N'Anderson', NULL, N'nubia.anderson@aol.com', N'584 NW. Hilldale Drive ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1257, N'Rosamaria', N'Meyer', NULL, N'rosamaria.meyer@yahoo.com', N'446 Elizabeth St. ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1258, N'Todd', N'Waters', NULL, N'todd.waters@yahoo.com', N'92 Cedar Swamp Street ', N'Bay Shore', N'NY', N'11706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1259, N'Kimbery', N'Nieves', NULL, N'kimbery.nieves@msn.com', N'768 Roehampton St. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1260, N'Phuong', N'Wolf', NULL, N'phuong.wolf@yahoo.com', N'7765 N. Annadale Dr. ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1261, N'Adelaida', N'Hancock', NULL, N'adelaida.hancock@aol.com', N'669 S. Gartner Street ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1262, N'Brianne', N'Hays', NULL, N'brianne.hays@gmail.com', N'88 Tailwater Ave. ', N'San Pablo', N'CA', N'94806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1263, N'Rufina', N'Chandler', NULL, N'rufina.chandler@aol.com', N'7985 Alderwood Street ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1264, N'Devin', N'Velazquez', N'(631) 254-8497', N'devin.velazquez@aol.com', N'61 Redwood St. ', N'Brentwood', N'NY', N'11717')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1265, N'Bonita', N'Marshall', NULL, N'bonita.marshall@msn.com', N'48 Bald Hill Drive ', N'Endicott', N'NY', N'13760')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1266, N'Myrl', N'Gay', NULL, N'myrl.gay@hotmail.com', N'8708 Taylor Lane ', N'Garland', N'TX', N'75043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1267, N'Earline', N'Gordon', NULL, N'earline.gordon@gmail.com', N'81 Railroad Drive ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1268, N'Sung', N'Chambers', NULL, N'sung.chambers@gmail.com', N'369 N. Virginia Street ', N'Kingston', N'NY', N'12401')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1269, N'Gustavo', N'Gamble', NULL, N'gustavo.gamble@msn.com', N'8054 W. Meadowbrook Street ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1270, N'Ciera', N'Webb', NULL, N'ciera.webb@yahoo.com', N'958 Anderson Ave. ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1271, N'Roy', N'Chan', NULL, N'roy.chan@hotmail.com', N'7578 Middle River St. ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1272, N'Houston', N'Vasquez', NULL, N'houston.vasquez@msn.com', N'845 Aspen Street ', N'Fullerton', N'CA', N'92831')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1273, N'Cheree', N'Hale', NULL, N'cheree.hale@yahoo.com', N'95 Lyme Avenue ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1274, N'Odette', N'Moses', NULL, N'odette.moses@gmail.com', N'899 Overlook Lane ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1275, N'Lenita', N'Bonner', NULL, N'lenita.bonner@aol.com', N'7286 Swanson Drive ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1276, N'Shona', N'Mcmillan', NULL, N'shona.mcmillan@msn.com', N'57 West Maple Dr. ', N'Apple Valley', N'CA', N'92307')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1277, N'Piedad', N'Irwin', NULL, N'piedad.irwin@hotmail.com', N'581 Garden St. ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1278, N'Loan', N'Graham', NULL, N'loan.graham@yahoo.com', N'57 Glen Eagles St. ', N'Jackson Heights', N'NY', N'11372')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1279, N'Stan', N'Saunders', NULL, N'stan.saunders@yahoo.com', N'407 Essex Dr. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1280, N'Jackeline', N'Colon', NULL, N'jackeline.colon@msn.com', N'9916 Cedarwood Drive ', N'Wappingers Falls', N'NY', N'12590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1281, N'Marlen', N'Dawson', NULL, N'marlen.dawson@msn.com', N'67 Oak Valley Street ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1282, N'Alexis', N'Mack', N'(845) 707-6088', N'alexis.mack@aol.com', N'7767 Sutor Ave. ', N'New City', N'NY', N'10956')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1283, N'Mica', N'Barry', NULL, N'mica.barry@yahoo.com', N'3 SE. Sugar St. ', N'Hopewell Junction', N'NY', N'12533')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1284, N'Shanice', N'Spears', NULL, N'shanice.spears@msn.com', N'5 Piper Ave. ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1285, N'Garth', N'Huff', NULL, N'garth.huff@yahoo.com', N'794 East University St. ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1286, N'Dione', N'Pratt', NULL, N'dione.pratt@msn.com', N'864 Winding Way St. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1287, N'Victor', N'Pittman', NULL, N'victor.pittman@aol.com', N'9294 Devon Dr. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1288, N'Allie', N'Conley', NULL, N'allie.conley@msn.com', N'96 High Point Road ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1289, N'Shanelle', N'Anderson', NULL, N'shanelle.anderson@yahoo.com', N'646 Surrey Street ', N'Bethpage', N'NY', N'11714')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1290, N'Minnie', N'Compton', NULL, N'minnie.compton@gmail.com', N'185 Hudson Street ', N'South Richmond Hill', N'NY', N'11419')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1291, N'Shiloh', N'Bates', NULL, N'shiloh.bates@msn.com', N'15 Wellington Dr. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1292, N'Lakenya', N'Oliver', NULL, N'lakenya.oliver@yahoo.com', N'82 Bayport Court ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1293, N'Sally', N'Kinney', NULL, N'sally.kinney@msn.com', N'7565 High Dr. ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1294, N'Edith', N'Davenport', NULL, N'edith.davenport@gmail.com', N'685 Alton Road ', N'Ontario', N'CA', N'91762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1295, N'Alline', N'Beasley', NULL, N'alline.beasley@yahoo.com', N'8704 NE. Olive Ave. ', N'North Tonawanda', N'NY', N'14120')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1296, N'Travis', N'Whitley', NULL, N'travis.whitley@aol.com', N'60 Euclid Ave. ', N'Saint Albans', N'NY', N'11412')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1297, N'Vanessa', N'West', NULL, N'vanessa.west@gmail.com', N'34 Prairie Lane ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1298, N'Trudy', N'Riddle', NULL, N'trudy.riddle@aol.com', N'8943 Johnson Street ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1299, N'Shauna', N'Edwards', NULL, N'shauna.edwards@msn.com', N'8 Dogwood Ave. ', N'Yorktown Heights', N'NY', N'10598')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1300, N'Clorinda', N'Donovan', NULL, N'clorinda.donovan@msn.com', N'9690 E. Morris Ave. ', N'Jamestown', N'NY', N'14701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1301, N'Raven', N'Curtis', NULL, N'raven.curtis@aol.com', N'18 Summit Lane ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1302, N'Verda', N'Gilbert', NULL, N'verda.gilbert@gmail.com', N'54 Hillcrest Drive ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1303, N'Renay', N'Atkins', NULL, N'renay.atkins@aol.com', N'7146 Leeton Ridge Ave. ', N'Woodside', N'NY', N'11377')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1304, N'Tama', N'Berg', NULL, N'tama.berg@hotmail.com', N'3 Cardinal Avenue ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1305, N'Dalia', N'Carson', N'(507) 186-2004', N'dalia.carson@aol.com', N'7175 Galvin St. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1306, N'America', N'Swanson', NULL, N'america.swanson@msn.com', N'83 South Arlington Lane ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1307, N'Cinda', N'Rocha', NULL, N'cinda.rocha@hotmail.com', N'926 North Oklahoma Dr. ', N'Los Banos', N'CA', N'93635')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1308, N'Shea', N'Howell', NULL, N'shea.howell@msn.com', N'67 Arch Rd. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1309, N'Kimberli', N'Cline', NULL, N'kimberli.cline@yahoo.com', N'7115 Stonybrook Court ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1310, N'Emanuel', N'Mckee', NULL, N'emanuel.mckee@yahoo.com', N'9411 Lake Dr. ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1311, N'Whitley', N'Cannon', NULL, N'whitley.cannon@msn.com', N'614 High Point Lane ', N'Coram', N'NY', N'11727')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1312, N'Tereasa', N'Bird', NULL, N'tereasa.bird@aol.com', N'7526 Vine Drive ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1313, N'Dante', N'Grimes', NULL, N'dante.grimes@yahoo.com', N'23 Shore St. ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1314, N'Joeann', N'Garrison', NULL, N'joeann.garrison@yahoo.com', N'1 Harrison St. ', N'Ontario', N'CA', N'91762')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1315, N'Omega', N'Johnston', NULL, N'omega.johnston@gmail.com', N'9935 Tarkiln Hill St. ', N'Canyon Country', N'CA', N'91387')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1316, N'Conrad', N'Mueller', NULL, N'conrad.mueller@yahoo.com', N'3 Myrtle St. ', N'Massapequa', N'NY', N'11758')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1317, N'Glady', N'Wells', NULL, N'glady.wells@gmail.com', N'627 Ramblewood Ave. ', N'Syosset', N'NY', N'11791')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1318, N'Tisha', N'Petty', N'(210) 851-3122', N'tisha.petty@msn.com', N'9083 Lake View Ave. ', N'San Antonio', N'TX', N'78213')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1319, N'Claris', N'Santiago', NULL, N'claris.santiago@msn.com', N'763 Mountainview Dr. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1320, N'Obdulia', N'Barber', NULL, N'obdulia.barber@gmail.com', N'878 Lexington Rd. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1321, N'Shantel', N'Gregory', NULL, N'shantel.gregory@yahoo.com', N'7722 Second Lane ', N'West Islip', N'NY', N'11795')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1322, N'Ai', N'Forbes', NULL, N'ai.forbes@yahoo.com', N'254 Central St. ', N'Franklin Square', N'NY', N'11010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1323, N'Ebony', N'Cotton', NULL, N'ebony.cotton@yahoo.com', N'8979 Miller St. ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1324, N'Arla', N'Ellis', NULL, N'arla.ellis@yahoo.com', N'127 Crescent Ave. ', N'Utica', N'NY', N'13501')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1325, N'Magdalena', N'Sherman', NULL, N'magdalena.sherman@gmail.com', N'176 Sunbeam St. ', N'Oswego', N'NY', N'13126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1326, N'Tarra', N'Guerrero', NULL, N'tarra.guerrero@aol.com', N'10 Baker St. ', N'Auburn', N'NY', N'13021')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1327, N'Consuela', N'Romero', NULL, N'consuela.romero@hotmail.com', N'54 Elm Court ', N'Monroe', N'NY', N'10950')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1328, N'Cindie', N'Franklin', NULL, N'cindie.franklin@yahoo.com', N'7249 Franklin St. ', N'Lawndale', N'CA', N'90260')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1329, N'Sharyn', N'Brewer', NULL, N'sharyn.brewer@aol.com', N'70 Columbia Ave. ', N'Hollis', N'NY', N'11423')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1330, N'Karren', N'Stevenson', NULL, N'karren.stevenson@aol.com', N'155 Old York St. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1331, N'Divina', N'Reeves', NULL, N'divina.reeves@hotmail.com', N'767 Bradford Dr. ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1332, N'Novella', N'Ross', NULL, N'novella.ross@gmail.com', N'9418 Acacia Drive ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1333, N'Omega', N'Huff', NULL, N'omega.huff@aol.com', N'63 Devon St. ', N'Santa Monica', N'CA', N'90403')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1334, N'Ashleigh', N'Finch', NULL, N'ashleigh.finch@yahoo.com', N'82 Hudson Court ', N'Newburgh', N'NY', N'12550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1335, N'Corina', N'Lynch', NULL, N'corina.lynch@msn.com', N'44 Sunbeam Dr. ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1336, N'Joe', N'Melton', NULL, N'joe.melton@gmail.com', N'8998 Hartford Street ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1337, N'Bernetta', N'Summers', NULL, N'bernetta.summers@aol.com', N'1 Young Ave. ', N'Longview', N'TX', N'75604')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1338, N'Inez', N'Snider', NULL, N'inez.snider@gmail.com', N'837 Catherine Lane ', N'Ronkonkoma', N'NY', N'11779')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1339, N'Neida', N'King', N'(442) 778-1121', N'neida.king@aol.com', N'137 Bohemia St. ', N'Oceanside', N'NY', N'11572')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1340, N'Tona', N'Velasquez', NULL, N'tona.velasquez@msn.com', N'9166 Trout St. ', N'Whitestone', N'NY', N'11357')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1341, N'Rozanne', N'Reyes', NULL, N'rozanne.reyes@aol.com', N'11 W. Surrey Drive ', N'Garden City', N'NY', N'11530')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1342, N'Lekisha', N'Pope', NULL, N'lekisha.pope@msn.com', N'390 Livingston Avenue ', N'Freeport', N'NY', N'11520')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1343, N'Jama', N'Rodriquez', NULL, N'jama.rodriquez@msn.com', N'681 Smith Dr. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1344, N'Eloisa', N'Tucker', NULL, N'eloisa.tucker@hotmail.com', N'7268 Leatherwood Ave. ', N'Howard Beach', N'NY', N'11414')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1345, N'Arie', N'Hunter', NULL, N'arie.hunter@msn.com', N'66 Old State Rd. ', N'Flushing', N'NY', N'11354')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1346, N'Sanora', N'Webster', N'(424) 464-7290', N'sanora.webster@msn.com', N'74 Beach St. ', N'Los Angeles', N'CA', N'90008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1347, N'Kate', N'Barber', NULL, N'kate.barber@hotmail.com', N'46 W. Oak Valley Ave. ', N'Saratoga Springs', N'NY', N'12866')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1348, N'Yvone', N'Guerrero', NULL, N'yvone.guerrero@aol.com', N'8548 Jackson Ave. ', N'Merrick', N'NY', N'11566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1349, N'Kami', N'Rios', NULL, N'kami.rios@yahoo.com', N'8400 8th Dr. ', N'Encino', N'CA', N'91316')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1350, N'Annett', N'Rush', NULL, N'annett.rush@hotmail.com', N'758 Fordham Lane ', N'Rosedale', N'NY', N'11422')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1351, N'Carman', N'Hardy', NULL, N'carman.hardy@yahoo.com', N'800 Whitemarsh St. ', N'Jamestown', N'NY', N'14701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1352, N'Dorothea', N'Miranda', NULL, N'dorothea.miranda@aol.com', N'7882 Parker St. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1353, N'Agatha', N'Daniels', NULL, N'agatha.daniels@yahoo.com', N'125 Canal St. ', N'South El Monte', N'CA', N'91733')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1354, N'Alexandria', N'Zamora', NULL, N'alexandria.zamora@yahoo.com', N'95 Cherry Circle ', N'Schenectady', N'NY', N'12302')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1355, N'Thad', N'Gilliam', NULL, N'thad.gilliam@hotmail.com', N'8844 Gonzales Court ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1356, N'Inger', N'Jennings', NULL, N'inger.jennings@yahoo.com', N'38 NW. Shore Lane ', N'Patchogue', N'NY', N'11772')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1357, N'Karren', N'Lamb', N'(559) 628-2239', N'karren.lamb@aol.com', N'35 N. Chapel St. ', N'Fresno', N'CA', N'93706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1358, N'Noble', N'Glover', NULL, N'noble.glover@gmail.com', N'728 W. Rocky River Street ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1359, N'Octavia', N'Donaldson', NULL, N'octavia.donaldson@hotmail.com', N'8095 Wayne Ave. ', N'Levittown', N'NY', N'11756')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1360, N'Latashia', N'Travis', NULL, N'latashia.travis@yahoo.com', N'7877 King Rd. ', N'Upland', N'CA', N'91784')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1361, N'Destiny', N'Goodman', NULL, N'destiny.goodman@msn.com', N'29 Smoky Hollow St. ', N'Westbury', N'NY', N'11590')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1362, N'Christiana', N'Gross', NULL, N'christiana.gross@yahoo.com', N'645 North Richardson Road ', N'Orchard Park', N'NY', N'14127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1363, N'Nestor', N'Haynes', N'(281) 969-4579', N'nestor.haynes@msn.com', N'27 Nut Swamp Street ', N'Houston', N'TX', N'77016')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1364, N'Grisel', N'Maynard', NULL, N'grisel.maynard@msn.com', N'353 North Arch St. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1365, N'Shenna', N'Espinoza', NULL, N'shenna.espinoza@gmail.com', N'202 North George Street ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1366, N'Trena', N'Rogers', NULL, N'trena.rogers@aol.com', N'502 Sherwood St. ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1367, N'Lucile', N'Manning', NULL, N'lucile.manning@yahoo.com', N'511 Livingston Lane ', N'Campbell', N'CA', N'95008')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1368, N'Veronique', N'Fulton', NULL, N'veronique.fulton@yahoo.com', N'81 Hilldale Ave. ', N'Ballston Spa', N'NY', N'12020')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1369, N'Starr', N'Schneider', NULL, N'starr.schneider@aol.com', N'77 Mulberry Street ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1370, N'Rona', N'Rojas', N'(408) 611-3553', N'rona.rojas@gmail.com', N'815 Riverview St. ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1371, N'Pandora', N'Estes', NULL, N'pandora.estes@aol.com', N'228 Shadow Brook Drive ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1372, N'Renna', N'Williams', NULL, N'renna.williams@hotmail.com', N'7398 SW. Glen Ridge Road ', N'South Ozone Park', N'NY', N'11420')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1373, N'Lanora', N'Robbins', NULL, N'lanora.robbins@hotmail.com', N'31 W. Maiden Lane ', N'West Babylon', N'NY', N'11704')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1374, N'Juliane', N'Dillard', NULL, N'juliane.dillard@aol.com', N'63 Birchwood Court ', N'Glendora', N'CA', N'91740')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1375, N'Carlena', N'Salinas', NULL, N'carlena.salinas@gmail.com', N'1 Wagon Street ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1376, N'Kimberley', N'Reynolds', NULL, N'kimberley.reynolds@aol.com', N'8475 Homewood Street ', N'Port Washington', N'NY', N'11050')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1377, N'Johana', N'Jacobson', N'(507) 407-9384', N'johana.jacobson@gmail.com', N'29 San Juan St. ', N'Rochester', N'NY', N'14606')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1378, N'Enoch', N'Rosario', N'(559) 329-7615', N'enoch.rosario@hotmail.com', N'186 Arlington St. ', N'Fresno', N'CA', N'93706')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1379, N'Dorine', N'Thornton', NULL, N'dorine.thornton@gmail.com', N'8730 N. Atlantic Street ', N'Sunnyside', N'NY', N'11104')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1380, N'Eliz', N'Lynch', NULL, N'eliz.lynch@hotmail.com', N'717 West Deerfield Ave. ', N'Uniondale', N'NY', N'11553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1381, N'Mercedez', N'Brooks', NULL, N'mercedez.brooks@hotmail.com', N'7483 Ann St. ', N'Duarte', N'CA', N'91010')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1382, N'Wynona', N'Douglas', NULL, N'wynona.douglas@msn.com', N'6 Country Ave. ', N'Harlingen', N'TX', N'78552')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1383, N'Desire', N'Mcgowan', N'(661) 800-8091', N'desire.mcgowan@msn.com', N'942 North Ohio Road ', N'Bakersfield', N'CA', N'93306')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1384, N'Elmo', N'Sweeney', NULL, N'elmo.sweeney@yahoo.com', N'43 Arch Ave. ', N'San Carlos', N'CA', N'94070')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1385, N'Kenton', N'Hughes', NULL, N'kenton.hughes@gmail.com', N'632 Sleepy Hollow Drive ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1386, N'Cesar', N'Wilkins', N'(619) 685-5786', N'cesar.wilkins@hotmail.com', N'7 Inverness St. ', N'San Diego', N'CA', N'92111')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1387, N'Phylicia', N'Stout', NULL, N'phylicia.stout@aol.com', N'8842 Littleton Lane ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1388, N'Nanette', N'Harris', NULL, N'nanette.harris@hotmail.com', N'26 Pin Oak Lane ', N'East Meadow', N'NY', N'11554')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1389, N'Ulrike', N'Chan', NULL, N'ulrike.chan@aol.com', N'7949 Lancaster St. ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1390, N'Genoveva', N'Lloyd', NULL, N'genoveva.lloyd@aol.com', N'706 Devonshire St. ', N'Bayside', N'NY', N'11361')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1391, N'Sheryl', N'Chase', NULL, N'sheryl.chase@gmail.com', N'388 Cedar Avenue ', N'Floral Park', N'NY', N'11001')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1392, N'Trista', N'Lambert', NULL, N'trista.lambert@gmail.com', N'79 River Street ', N'Fairport', N'NY', N'14450')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1393, N'Vivian', N'Deleon', NULL, N'vivian.deleon@msn.com', N'9925 Hamilton Street ', N'Jamaica', N'NY', N'11432')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1394, N'Genny', N'Fields', NULL, N'genny.fields@msn.com', N'9145 San Juan Dr. ', N'Amityville', N'NY', N'11701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1395, N'Eliseo', N'Knight', NULL, N'eliseo.knight@msn.com', N'693 Holly Street ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1396, N'Delma', N'Bailey', N'(657) 454-8493', N'delma.bailey@gmail.com', N'9883 West King Lane ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1397, N'Dewayne', N'Herring', NULL, N'dewayne.herring@aol.com', N'9015 Willow Lane ', N'Webster', N'NY', N'14580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1398, N'Nevada', N'Hood', NULL, N'nevada.hood@aol.com', N'515 Bank Rd. ', N'Hopewell Junction', N'NY', N'12533')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1399, N'Angelika', N'Perry', NULL, N'angelika.perry@msn.com', N'7684 South Branch Drive ', N'Canandaigua', N'NY', N'14424')
GO
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1400, N'Shayla', N'Hart', NULL, N'shayla.hart@msn.com', N'9092 Aspen St. ', N'Woodhaven', N'NY', N'11421')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1401, N'Willetta', N'Murphy', NULL, N'willetta.murphy@msn.com', N'436 Devonshire Street ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1402, N'Sandee', N'Alvarado', NULL, N'sandee.alvarado@aol.com', N'69 Bowman Street ', N'Depew', N'NY', N'14043')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1403, N'Mila', N'Moody', N'(248) 234-5902', N'mila.moody@gmail.com', N'675 Williams St. ', N'Troy', N'NY', N'12180')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1404, N'Loyce', N'Conway', NULL, N'loyce.conway@aol.com', N'729 State Lane ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1405, N'Thanh', N'Figueroa', NULL, N'thanh.figueroa@yahoo.com', N'6 Roberts Drive ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1406, N'Farrah', N'Orr', NULL, N'farrah.orr@msn.com', N'8711 W. Ashley St. ', N'New Hyde Park', N'NY', N'11040')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1407, N'Hugh', N'Craft', NULL, N'hugh.craft@msn.com', N'8716 Homewood Court ', N'Centereach', N'NY', N'11720')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1408, N'Eleanor', N'Mendez', NULL, N'eleanor.mendez@yahoo.com', N'4 West St. ', N'Port Chester', N'NY', N'10573')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1409, N'Lamar', N'Bush', N'(716) 294-7174', N'lamar.bush@msn.com', N'76 Lilac Drive ', N'Buffalo', N'NY', N'14215')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1410, N'Lurlene', N'Finch', N'(914) 367-7691', N'lurlene.finch@msn.com', N'849 Magnolia St. ', N'Yonkers', N'NY', N'10701')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1411, N'Shanda', N'Stevenson', NULL, N'shanda.stevenson@yahoo.com', N'9547 N. Courtland St. ', N'Freeport', N'NY', N'11520')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1412, N'Adrien', N'Hunter', NULL, N'adrien.hunter@yahoo.com', N'720 Thompson Lane ', N'Rego Park', N'NY', N'11374')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1413, N'Ophelia', N'Decker', NULL, N'ophelia.decker@yahoo.com', N'69 Rockwell Court ', N'New Windsor', N'NY', N'12553')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1414, N'Sonja', N'Walls', NULL, N'sonja.walls@aol.com', N'30 Marshall Dr. ', N'Queensbury', N'NY', N'12804')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1415, N'Harold', N'O''connor', NULL, N'harold.o''connor@gmail.com', N'9530 Summerhouse Street ', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1416, N'Miranda', N'Kennedy', NULL, N'miranda.kennedy@gmail.com', N'726 East High St. ', N'Astoria', N'NY', N'11102')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1417, N'Jasper', N'Castro', NULL, N'jasper.castro@aol.com', N'977 SE. Railroad Road ', N'Forney', N'TX', N'75126')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1418, N'Penni', N'Best', N'(657) 611-2991', N'penni.best@msn.com', N'875 Second Drive ', N'Anaheim', N'CA', N'92806')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1419, N'Lurlene', N'Cotton', NULL, N'lurlene.cotton@yahoo.com', N'8218 George St. ', N'Pleasanton', N'CA', N'94566')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1420, N'Kelsey', N'Noble', NULL, N'kelsey.noble@hotmail.com', N'36 Pearl Court ', N'Mount Vernon', N'NY', N'10550')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1421, N'Edris', N'Barrett', NULL, N'edris.barrett@hotmail.com', N'36 Pulaski Drive ', N'Plattsburgh', N'NY', N'12901')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1422, N'Tempie', N'Jacobson', NULL, N'tempie.jacobson@hotmail.com', N'136 Old Fairview St. ', N'Smithtown', N'NY', N'11787')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1423, N'Dollie', N'Cervantes', N'(682) 362-7457', N'dollie.cervantes@aol.com', N'8828 Applegate Drive ', N'Fort Worth', N'TX', N'76110')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1424, N'Lashunda', N'Cole', NULL, N'lashunda.cole@hotmail.com', N'783 Baker St. ', N'Monsey', N'NY', N'10952')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1425, N'Justina', N'Jenkins', NULL, N'justina.jenkins@msn.com', N'345 SE. Green Lane ', N'Shirley', N'NY', N'11967')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1426, N'Londa', N'Gould', N'(361) 206-5550', N'londa.gould@aol.com', N'9169 Beech Lane ', N'Corpus Christi', N'TX', N'78418')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1427, N'Mikel', N'Wilkerson', NULL, N'mikel.wilkerson@msn.com', N'9233 Clinton St. ', N'Atwater', N'CA', N'95301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1428, N'Carola', N'Johns', NULL, N'carola.johns@msn.com', N'7077 Fordham Rd. ', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1429, N'Lorrie', N'Justice', NULL, N'lorrie.justice@gmail.com', N'8396 Brook Drive ', N'Pomona', N'CA', N'91768')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1430, N'Tayna', N'Wade', N'(661) 858-1224', N'tayna.wade@hotmail.com', N'65 Smith Store Dr. ', N'Bakersfield', N'CA', N'93306')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1431, N'Mark', N'Benton', NULL, N'mark.benton@aol.com', N'83 Eagle St. ', N'East Elmhurst', N'NY', N'11369')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1432, N'Zona', N'Cameron', NULL, N'zona.cameron@aol.com', N'42 Bridle Court ', N'East Northport', N'NY', N'11731')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1433, N'Nicola', N'Knight', NULL, N'nicola.knight@aol.com', N'25 SE. Miles Lane ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1434, N'Elana', N'Miles', NULL, N'elana.miles@yahoo.com', N'7077 Euclid Ave. ', N'Liverpool', N'NY', N'13090')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1435, N'Merrie', N'Fowler', NULL, N'merrie.fowler@aol.com', N'532 Leatherwood Ave. ', N'Scarsdale', N'NY', N'10583')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1436, N'Macie', N'Ayers', NULL, N'macie.ayers@msn.com', N'8730 Longfellow St. ', N'Bellmore', N'NY', N'11710')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1437, N'Son', N'Warner', NULL, N'son.warner@hotmail.com', N'20 W. Rosewood Ave. ', N'Rockville Centre', N'NY', N'11570')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1438, N'Lee', N'Dunn', N'(408) 807-6157', N'lee.dunn@aol.com', N'8626 Grand Ave. ', N'San Jose', N'CA', N'95127')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1439, N'Florrie', N'Little', NULL, N'florrie.little@yahoo.com', N'8330 Marsh St. ', N'New Rochelle', N'NY', N'10801')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1440, N'Ernest', N'Rollins', NULL, N'ernest.rollins@yahoo.com', N'4 West Ridge Dr. ', N'Oakland Gardens', N'NY', N'11364')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1441, N'Jamaal', N'Morrison', NULL, N'jamaal.morrison@msn.com', N'796 SE. Nut Swamp St. ', N'Staten Island', N'NY', N'10301')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1442, N'Cassie', N'Cline', NULL, N'cassie.cline@gmail.com', N'947 Lafayette Drive ', N'Brooklyn', N'NY', N'11201')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1443, N'Lezlie', N'Lamb', NULL, N'lezlie.lamb@gmail.com', N'401 Brandywine Street ', N'Central Islip', N'NY', N'11722')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1444, N'Ivette', N'Estes', NULL, N'ivette.estes@gmail.com', N'88 N. Canterbury Ave. ', N'Canandaigua', N'NY', N'14424')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1445, N'Ester', N'Acevedo', NULL, N'ester.acevedo@gmail.com', N'671 Miles Court ', N'San Lorenzo', N'CA', N'94580')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1447, N'Deneme', N'Deneme', N'', N'', N'', N'', N'', N'')
INSERT [sales].[customers] ([customer_id], [first_name], [last_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1448, N'Baran', N'Yüksel', N'5346950323', N'deneme@mail', N'', N'', N'', N'')
SET IDENTITY_INSERT [sales].[customers] OFF
SET IDENTITY_INSERT [sales].[orders] ON 

INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1, 259, 4, CAST(N'2016-01-01' AS Date), CAST(N'2016-01-03' AS Date), CAST(N'2016-01-03' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (2, 1212, 4, CAST(N'2016-01-01' AS Date), CAST(N'2016-01-04' AS Date), CAST(N'2016-01-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (3, 523, 4, CAST(N'2016-01-02' AS Date), CAST(N'2016-01-05' AS Date), CAST(N'2016-01-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (4, 175, 4, CAST(N'2016-01-03' AS Date), CAST(N'2016-01-04' AS Date), CAST(N'2016-01-05' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (5, 1324, 4, CAST(N'2016-01-03' AS Date), CAST(N'2016-01-06' AS Date), CAST(N'2016-01-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (6, 94, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-01-07' AS Date), CAST(N'2016-01-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (7, 324, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-01-07' AS Date), CAST(N'2016-01-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (8, 1204, 4, CAST(N'2016-01-04' AS Date), CAST(N'2016-01-05' AS Date), CAST(N'2016-01-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (9, 60, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-08' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (10, 442, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-06' AS Date), CAST(N'2016-01-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (11, 1326, 4, CAST(N'2016-01-05' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (12, 91, 4, CAST(N'2016-01-06' AS Date), CAST(N'2016-01-08' AS Date), CAST(N'2016-01-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (13, 873, 4, CAST(N'2016-01-08' AS Date), CAST(N'2016-01-11' AS Date), CAST(N'2016-01-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (14, 258, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-11' AS Date), CAST(N'2016-01-12' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (15, 450, 4, CAST(N'2016-01-09' AS Date), CAST(N'2016-01-10' AS Date), CAST(N'2016-01-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (16, 552, 4, CAST(N'2016-01-12' AS Date), CAST(N'2016-01-15' AS Date), CAST(N'2016-01-15' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (17, 1175, 4, CAST(N'2016-01-12' AS Date), CAST(N'2016-01-14' AS Date), CAST(N'2016-01-14' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (18, 541, 4, CAST(N'2016-01-14' AS Date), CAST(N'2016-01-17' AS Date), CAST(N'2016-01-15' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (19, 696, 4, CAST(N'2016-01-14' AS Date), CAST(N'2016-01-17' AS Date), CAST(N'2016-01-16' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (20, 923, 4, CAST(N'2016-01-14' AS Date), CAST(N'2016-01-16' AS Date), CAST(N'2016-01-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (21, 1250, 4, CAST(N'2016-01-15' AS Date), CAST(N'2016-01-16' AS Date), CAST(N'2016-01-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (22, 1035, 4, CAST(N'2016-01-16' AS Date), CAST(N'2016-01-18' AS Date), CAST(N'2016-01-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (23, 1149, 4, CAST(N'2016-01-16' AS Date), CAST(N'2016-01-19' AS Date), CAST(N'2016-01-19' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (24, 636, 4, CAST(N'2016-01-18' AS Date), CAST(N'2016-01-20' AS Date), CAST(N'2016-01-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (25, 657, 4, CAST(N'2016-01-18' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (26, 1280, 4, CAST(N'2016-01-18' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (27, 57, 4, CAST(N'2016-01-19' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (28, 252, 4, CAST(N'2016-01-19' AS Date), CAST(N'2016-01-20' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (29, 437, 4, CAST(N'2016-01-20' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (30, 1348, 4, CAST(N'2016-01-20' AS Date), CAST(N'2016-01-21' AS Date), CAST(N'2016-01-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (31, 1238, 4, CAST(N'2016-01-20' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2016-01-22' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (32, 1259, 4, CAST(N'2016-01-21' AS Date), CAST(N'2016-01-24' AS Date), CAST(N'2016-01-22' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (33, 236, 4, CAST(N'2016-01-21' AS Date), CAST(N'2016-01-22' AS Date), CAST(N'2016-01-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (34, 80, 4, CAST(N'2016-01-22' AS Date), CAST(N'2016-01-25' AS Date), CAST(N'2016-01-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (35, 813, 4, CAST(N'2016-01-22' AS Date), CAST(N'2016-01-25' AS Date), CAST(N'2016-01-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (36, 1321, 4, CAST(N'2016-01-23' AS Date), CAST(N'2016-01-24' AS Date), CAST(N'2016-01-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (37, 164, 4, CAST(N'2016-01-25' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (38, 583, 4, CAST(N'2016-01-25' AS Date), CAST(N'2016-01-27' AS Date), CAST(N'2016-01-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (39, 1296, 4, CAST(N'2016-01-25' AS Date), CAST(N'2016-01-26' AS Date), CAST(N'2016-01-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (40, 348, 4, CAST(N'2016-01-27' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (41, 979, 4, CAST(N'2016-01-27' AS Date), CAST(N'2016-01-30' AS Date), CAST(N'2016-01-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (42, 1095, 4, CAST(N'2016-01-27' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (43, 1434, 4, CAST(N'2016-01-27' AS Date), CAST(N'2016-01-28' AS Date), CAST(N'2016-01-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (44, 861, 4, CAST(N'2016-01-28' AS Date), CAST(N'2016-01-31' AS Date), CAST(N'2016-01-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (45, 1220, 4, CAST(N'2016-01-28' AS Date), CAST(N'2016-01-31' AS Date), CAST(N'2016-01-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (46, 746, 4, CAST(N'2016-01-29' AS Date), CAST(N'2016-01-31' AS Date), CAST(N'2016-01-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (47, 1234, 4, CAST(N'2016-01-29' AS Date), CAST(N'2016-01-30' AS Date), CAST(N'2016-01-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (48, 1012, 4, CAST(N'2016-01-30' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (49, 608, 4, CAST(N'2016-01-31' AS Date), CAST(N'2016-02-01' AS Date), CAST(N'2016-02-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (50, 872, 4, CAST(N'2016-01-31' AS Date), CAST(N'2016-02-03' AS Date), CAST(N'2016-02-02' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (51, 1047, 4, CAST(N'2016-02-01' AS Date), CAST(N'2016-02-02' AS Date), CAST(N'2016-02-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (52, 767, 4, CAST(N'2016-02-03' AS Date), CAST(N'2016-02-04' AS Date), CAST(N'2016-02-05' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (53, 965, 4, CAST(N'2016-02-03' AS Date), CAST(N'2016-02-04' AS Date), CAST(N'2016-02-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (54, 535, 4, CAST(N'2016-02-04' AS Date), CAST(N'2016-02-07' AS Date), CAST(N'2016-02-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (55, 1173, 4, CAST(N'2016-02-04' AS Date), CAST(N'2016-02-07' AS Date), CAST(N'2016-02-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (56, 1241, 4, CAST(N'2016-02-04' AS Date), CAST(N'2016-02-06' AS Date), CAST(N'2016-02-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (57, 1305, 4, CAST(N'2016-02-04' AS Date), CAST(N'2016-02-06' AS Date), CAST(N'2016-02-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (58, 504, 4, CAST(N'2016-02-05' AS Date), CAST(N'2016-02-07' AS Date), CAST(N'2016-02-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (59, 563, 4, CAST(N'2016-02-05' AS Date), CAST(N'2016-02-07' AS Date), CAST(N'2016-02-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (60, 151, 4, CAST(N'2016-02-06' AS Date), CAST(N'2016-02-08' AS Date), CAST(N'2016-02-07' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (61, 277, 4, CAST(N'2016-02-06' AS Date), CAST(N'2016-02-09' AS Date), CAST(N'2016-02-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (62, 208, 4, CAST(N'2016-02-07' AS Date), CAST(N'2016-02-10' AS Date), CAST(N'2016-02-10' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (63, 1075, 4, CAST(N'2016-02-07' AS Date), CAST(N'2016-02-09' AS Date), CAST(N'2016-02-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (64, 1185, 4, CAST(N'2016-02-07' AS Date), CAST(N'2016-02-08' AS Date), CAST(N'2016-02-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (65, 996, 4, CAST(N'2016-02-08' AS Date), CAST(N'2016-02-09' AS Date), CAST(N'2016-02-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (66, 1253, 4, CAST(N'2016-02-09' AS Date), CAST(N'2016-02-12' AS Date), CAST(N'2016-02-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (67, 526, 4, CAST(N'2016-02-09' AS Date), CAST(N'2016-02-11' AS Date), CAST(N'2016-02-10' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (68, 381, 4, CAST(N'2016-02-10' AS Date), CAST(N'2016-02-11' AS Date), CAST(N'2016-02-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (69, 1413, 4, CAST(N'2016-02-10' AS Date), CAST(N'2016-02-12' AS Date), CAST(N'2016-02-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (70, 50, 3, CAST(N'2016-02-11' AS Date), CAST(N'2016-02-11' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (71, 797, 4, CAST(N'2016-02-11' AS Date), CAST(N'2016-02-14' AS Date), CAST(N'2016-02-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (72, 1386, 4, CAST(N'2016-02-12' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2016-02-13' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (73, 612, 4, CAST(N'2016-02-12' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2016-02-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (74, 264, 4, CAST(N'2016-02-13' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2016-02-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (75, 587, 4, CAST(N'2016-02-14' AS Date), CAST(N'2016-02-15' AS Date), CAST(N'2016-02-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (76, 9, 3, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-16' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (77, 385, 4, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-19' AS Date), CAST(N'2016-02-19' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (78, 1182, 4, CAST(N'2016-02-16' AS Date), CAST(N'2016-02-18' AS Date), CAST(N'2016-02-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (79, 529, 4, CAST(N'2016-02-17' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-02-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (80, 397, 4, CAST(N'2016-02-17' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-02-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (81, 521, 4, CAST(N'2016-02-17' AS Date), CAST(N'2016-02-19' AS Date), CAST(N'2016-02-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (82, 1223, 4, CAST(N'2016-02-18' AS Date), CAST(N'2016-02-21' AS Date), CAST(N'2016-02-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (83, 393, 4, CAST(N'2016-02-19' AS Date), CAST(N'2016-02-20' AS Date), CAST(N'2016-02-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (84, 317, 4, CAST(N'2016-02-20' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (85, 1174, 4, CAST(N'2016-02-20' AS Date), CAST(N'2016-02-23' AS Date), CAST(N'2016-02-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (86, 276, 4, CAST(N'2016-02-21' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (87, 516, 4, CAST(N'2016-02-21' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (88, 1069, 4, CAST(N'2016-02-21' AS Date), CAST(N'2016-02-22' AS Date), CAST(N'2016-02-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (89, 668, 4, CAST(N'2016-02-21' AS Date), CAST(N'2016-02-24' AS Date), CAST(N'2016-02-24' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (90, 414, 4, CAST(N'2016-02-23' AS Date), CAST(N'2016-02-25' AS Date), CAST(N'2016-02-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (91, 648, 4, CAST(N'2016-02-25' AS Date), CAST(N'2016-02-27' AS Date), CAST(N'2016-02-28' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (92, 1309, 4, CAST(N'2016-02-25' AS Date), CAST(N'2016-02-28' AS Date), CAST(N'2016-02-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (93, 1328, 4, CAST(N'2016-02-26' AS Date), CAST(N'2016-02-28' AS Date), CAST(N'2016-02-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (94, 929, 4, CAST(N'2016-02-27' AS Date), CAST(N'2016-02-28' AS Date), CAST(N'2016-02-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (95, 218, 4, CAST(N'2016-02-27' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (96, 1094, 4, CAST(N'2016-02-27' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (97, 204, 4, CAST(N'2016-02-28' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-03-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (98, 1194, 4, CAST(N'2016-02-28' AS Date), CAST(N'2016-02-29' AS Date), CAST(N'2016-02-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (99, 1165, 4, CAST(N'2016-02-29' AS Date), CAST(N'2016-03-01' AS Date), CAST(N'2016-03-03' AS Date), 3, 9)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (100, 1237, 4, CAST(N'2016-03-01' AS Date), CAST(N'2016-03-04' AS Date), CAST(N'2016-03-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (101, 271, 4, CAST(N'2016-03-01' AS Date), CAST(N'2016-03-04' AS Date), CAST(N'2016-03-04' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (102, 336, 4, CAST(N'2016-03-02' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (103, 991, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-06' AS Date), CAST(N'2016-03-05' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (104, 7, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (105, 306, 4, CAST(N'2016-03-03' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (106, 422, 4, CAST(N'2016-03-04' AS Date), CAST(N'2016-03-05' AS Date), CAST(N'2016-03-05' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (107, 633, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2016-03-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (108, 12, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2016-03-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (109, 1255, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-09' AS Date), CAST(N'2016-03-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (110, 677, 4, CAST(N'2016-03-06' AS Date), CAST(N'2016-03-08' AS Date), CAST(N'2016-03-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (111, 630, 4, CAST(N'2016-03-07' AS Date), CAST(N'2016-03-10' AS Date), CAST(N'2016-03-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (112, 469, 4, CAST(N'2016-03-08' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (113, 1078, 4, CAST(N'2016-03-08' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (114, 1431, 4, CAST(N'2016-03-08' AS Date), CAST(N'2016-03-10' AS Date), CAST(N'2016-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (115, 1369, 4, CAST(N'2016-03-09' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (116, 471, 4, CAST(N'2016-03-10' AS Date), CAST(N'2016-03-11' AS Date), CAST(N'2016-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (117, 740, 4, CAST(N'2016-03-10' AS Date), CAST(N'2016-03-13' AS Date), CAST(N'2016-03-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (118, 577, 4, CAST(N'2016-03-12' AS Date), CAST(N'2016-03-14' AS Date), CAST(N'2016-03-13' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (119, 925, 4, CAST(N'2016-03-12' AS Date), CAST(N'2016-03-14' AS Date), CAST(N'2016-03-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (120, 327, 4, CAST(N'2016-03-14' AS Date), CAST(N'2016-03-15' AS Date), CAST(N'2016-03-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (121, 755, 4, CAST(N'2016-03-14' AS Date), CAST(N'2016-03-15' AS Date), CAST(N'2016-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (122, 786, 4, CAST(N'2016-03-14' AS Date), CAST(N'2016-03-16' AS Date), CAST(N'2016-03-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (123, 766, 4, CAST(N'2016-03-15' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (124, 403, 4, CAST(N'2016-03-16' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-17' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (125, 685, 4, CAST(N'2016-03-16' AS Date), CAST(N'2016-03-19' AS Date), CAST(N'2016-03-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (126, 1365, 4, CAST(N'2016-03-16' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (127, 484, 4, CAST(N'2016-03-17' AS Date), CAST(N'2016-03-18' AS Date), CAST(N'2016-03-19' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (128, 86, 4, CAST(N'2016-03-18' AS Date), CAST(N'2016-03-20' AS Date), CAST(N'2016-03-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (129, 84, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-21' AS Date), CAST(N'2016-03-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (130, 1049, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (131, 316, 4, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-20' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (132, 46, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (133, 409, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-22' AS Date), CAST(N'2016-03-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (134, 679, 4, CAST(N'2016-03-20' AS Date), CAST(N'2016-03-21' AS Date), CAST(N'2016-03-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (135, 1354, 4, CAST(N'2016-03-21' AS Date), CAST(N'2016-03-23' AS Date), CAST(N'2016-03-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (136, 1192, 4, CAST(N'2016-03-21' AS Date), CAST(N'2016-03-24' AS Date), CAST(N'2016-03-23' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (137, 370, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-26' AS Date), CAST(N'2016-03-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (138, 438, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-24' AS Date), CAST(N'2016-03-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (139, 710, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-24' AS Date), CAST(N'2016-03-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (140, 1264, 4, CAST(N'2016-03-23' AS Date), CAST(N'2016-03-26' AS Date), CAST(N'2016-03-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (141, 557, 4, CAST(N'2016-03-25' AS Date), CAST(N'2016-03-27' AS Date), CAST(N'2016-03-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (142, 170, 4, CAST(N'2016-03-26' AS Date), CAST(N'2016-03-27' AS Date), CAST(N'2016-03-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (143, 693, 4, CAST(N'2016-03-26' AS Date), CAST(N'2016-03-28' AS Date), CAST(N'2016-03-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (144, 1124, 4, CAST(N'2016-03-26' AS Date), CAST(N'2016-03-29' AS Date), CAST(N'2016-03-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (145, 366, 4, CAST(N'2016-03-27' AS Date), CAST(N'2016-03-29' AS Date), CAST(N'2016-03-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (146, 288, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (147, 55, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2016-03-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (148, 714, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (149, 763, 4, CAST(N'2016-03-28' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (150, 332, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-03-31' AS Date), CAST(N'2016-04-01' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (151, 926, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-04-01' AS Date), CAST(N'2016-03-31' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (152, 76, 4, CAST(N'2016-03-29' AS Date), CAST(N'2016-03-30' AS Date), CAST(N'2016-03-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (153, 498, 4, CAST(N'2016-03-30' AS Date), CAST(N'2016-04-02' AS Date), CAST(N'2016-04-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (154, 1286, 4, CAST(N'2016-03-31' AS Date), CAST(N'2016-04-01' AS Date), CAST(N'2016-04-01' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (155, 371, 4, CAST(N'2016-04-02' AS Date), CAST(N'2016-04-03' AS Date), CAST(N'2016-04-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (156, 357, 4, CAST(N'2016-04-03' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-05' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (157, 43, 4, CAST(N'2016-04-03' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (158, 117, 3, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-04' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (159, 32, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (160, 205, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-06' AS Date), CAST(N'2016-04-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (161, 251, 4, CAST(N'2016-04-04' AS Date), CAST(N'2016-04-07' AS Date), CAST(N'2016-04-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (162, 31, 4, CAST(N'2016-04-06' AS Date), CAST(N'2016-04-08' AS Date), CAST(N'2016-04-07' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (163, 1325, 4, CAST(N'2016-04-06' AS Date), CAST(N'2016-04-07' AS Date), CAST(N'2016-04-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (164, 610, 4, CAST(N'2016-04-07' AS Date), CAST(N'2016-04-08' AS Date), CAST(N'2016-04-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (165, 574, 4, CAST(N'2016-04-08' AS Date), CAST(N'2016-04-10' AS Date), CAST(N'2016-04-10' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (166, 338, 4, CAST(N'2016-04-08' AS Date), CAST(N'2016-04-11' AS Date), CAST(N'2016-04-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (167, 1034, 4, CAST(N'2016-04-08' AS Date), CAST(N'2016-04-09' AS Date), CAST(N'2016-04-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (168, 1147, 4, CAST(N'2016-04-09' AS Date), CAST(N'2016-04-12' AS Date), CAST(N'2016-04-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (169, 99, 4, CAST(N'2016-04-10' AS Date), CAST(N'2016-04-11' AS Date), CAST(N'2016-04-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (170, 1200, 4, CAST(N'2016-04-10' AS Date), CAST(N'2016-04-11' AS Date), CAST(N'2016-04-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (171, 237, 4, CAST(N'2016-04-11' AS Date), CAST(N'2016-04-14' AS Date), CAST(N'2016-04-14' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (172, 1079, 4, CAST(N'2016-04-11' AS Date), CAST(N'2016-04-12' AS Date), CAST(N'2016-04-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (173, 117, 4, CAST(N'2016-04-11' AS Date), CAST(N'2016-04-14' AS Date), CAST(N'2016-04-13' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (174, 1361, 4, CAST(N'2016-04-12' AS Date), CAST(N'2016-04-13' AS Date), CAST(N'2016-04-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (175, 951, 4, CAST(N'2016-04-13' AS Date), CAST(N'2016-04-14' AS Date), CAST(N'2016-04-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (176, 643, 4, CAST(N'2016-04-15' AS Date), CAST(N'2016-04-16' AS Date), CAST(N'2016-04-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (177, 121, 4, CAST(N'2016-04-16' AS Date), CAST(N'2016-04-19' AS Date), CAST(N'2016-04-19' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (178, 756, 4, CAST(N'2016-04-16' AS Date), CAST(N'2016-04-17' AS Date), CAST(N'2016-04-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (179, 616, 4, CAST(N'2016-04-17' AS Date), CAST(N'2016-04-19' AS Date), CAST(N'2016-04-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (180, 918, 4, CAST(N'2016-04-17' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (181, 459, 4, CAST(N'2016-04-18' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (182, 854, 4, CAST(N'2016-04-18' AS Date), CAST(N'2016-04-19' AS Date), CAST(N'2016-04-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (183, 22, 4, CAST(N'2016-04-19' AS Date), CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (184, 134, 4, CAST(N'2016-04-19' AS Date), CAST(N'2016-04-21' AS Date), CAST(N'2016-04-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (185, 24, 3, CAST(N'2016-04-20' AS Date), CAST(N'2016-04-20' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (186, 1127, 4, CAST(N'2016-04-21' AS Date), CAST(N'2016-04-22' AS Date), CAST(N'2016-04-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (187, 183, 4, CAST(N'2016-04-22' AS Date), CAST(N'2016-04-23' AS Date), CAST(N'2016-04-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (188, 390, 4, CAST(N'2016-04-22' AS Date), CAST(N'2016-04-23' AS Date), CAST(N'2016-04-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (189, 1288, 4, CAST(N'2016-04-23' AS Date), CAST(N'2016-04-24' AS Date), CAST(N'2016-04-26' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (190, 98, 4, CAST(N'2016-04-23' AS Date), CAST(N'2016-04-25' AS Date), CAST(N'2016-04-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (191, 919, 4, CAST(N'2016-04-27' AS Date), CAST(N'2016-04-28' AS Date), CAST(N'2016-04-28' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (192, 728, 4, CAST(N'2016-04-27' AS Date), CAST(N'2016-04-28' AS Date), CAST(N'2016-04-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (193, 1366, 4, CAST(N'2016-04-28' AS Date), CAST(N'2016-04-30' AS Date), CAST(N'2016-04-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (194, 558, 4, CAST(N'2016-04-28' AS Date), CAST(N'2016-04-30' AS Date), CAST(N'2016-05-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (195, 727, 4, CAST(N'2016-04-28' AS Date), CAST(N'2016-05-01' AS Date), CAST(N'2016-05-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (196, 1247, 4, CAST(N'2016-04-28' AS Date), CAST(N'2016-04-30' AS Date), CAST(N'2016-05-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (197, 127, 4, CAST(N'2016-04-30' AS Date), CAST(N'2016-05-03' AS Date), CAST(N'2016-05-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (198, 640, 4, CAST(N'2016-05-01' AS Date), CAST(N'2016-05-04' AS Date), CAST(N'2016-05-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (199, 760, 4, CAST(N'2016-05-01' AS Date), CAST(N'2016-05-04' AS Date), CAST(N'2016-05-04' AS Date), 2, 7)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (200, 1074, 4, CAST(N'2016-05-01' AS Date), CAST(N'2016-05-03' AS Date), CAST(N'2016-05-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (201, 280, 4, CAST(N'2016-05-01' AS Date), CAST(N'2016-05-04' AS Date), CAST(N'2016-05-02' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (202, 600, 4, CAST(N'2016-05-03' AS Date), CAST(N'2016-05-05' AS Date), CAST(N'2016-05-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (203, 1102, 4, CAST(N'2016-05-03' AS Date), CAST(N'2016-05-05' AS Date), CAST(N'2016-05-06' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (204, 591, 4, CAST(N'2016-05-04' AS Date), CAST(N'2016-05-07' AS Date), CAST(N'2016-05-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (205, 635, 4, CAST(N'2016-05-04' AS Date), CAST(N'2016-05-05' AS Date), CAST(N'2016-05-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (206, 743, 4, CAST(N'2016-05-04' AS Date), CAST(N'2016-05-06' AS Date), CAST(N'2016-05-05' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (207, 105, 4, CAST(N'2016-05-05' AS Date), CAST(N'2016-05-07' AS Date), CAST(N'2016-05-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (208, 815, 4, CAST(N'2016-05-06' AS Date), CAST(N'2016-05-07' AS Date), CAST(N'2016-05-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (209, 514, 4, CAST(N'2016-05-07' AS Date), CAST(N'2016-05-08' AS Date), CAST(N'2016-05-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (210, 943, 4, CAST(N'2016-05-07' AS Date), CAST(N'2016-05-08' AS Date), CAST(N'2016-05-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (211, 1140, 4, CAST(N'2016-05-07' AS Date), CAST(N'2016-05-09' AS Date), CAST(N'2016-05-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (212, 1373, 4, CAST(N'2016-05-08' AS Date), CAST(N'2016-05-09' AS Date), CAST(N'2016-05-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (213, 788, 4, CAST(N'2016-05-08' AS Date), CAST(N'2016-05-09' AS Date), CAST(N'2016-05-09' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (214, 363, 4, CAST(N'2016-05-10' AS Date), CAST(N'2016-05-12' AS Date), CAST(N'2016-05-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (215, 1420, 4, CAST(N'2016-05-10' AS Date), CAST(N'2016-05-13' AS Date), CAST(N'2016-05-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (216, 267, 4, CAST(N'2016-05-11' AS Date), CAST(N'2016-05-14' AS Date), CAST(N'2016-05-13' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (217, 716, 4, CAST(N'2016-05-11' AS Date), CAST(N'2016-05-12' AS Date), CAST(N'2016-05-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (218, 1179, 4, CAST(N'2016-05-12' AS Date), CAST(N'2016-05-14' AS Date), CAST(N'2016-05-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (219, 1338, 4, CAST(N'2016-05-12' AS Date), CAST(N'2016-05-15' AS Date), CAST(N'2016-05-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (220, 1358, 4, CAST(N'2016-05-12' AS Date), CAST(N'2016-05-14' AS Date), CAST(N'2016-05-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (221, 1218, 4, CAST(N'2016-05-13' AS Date), CAST(N'2016-05-16' AS Date), CAST(N'2016-05-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (222, 51, 4, CAST(N'2016-05-13' AS Date), CAST(N'2016-05-16' AS Date), CAST(N'2016-05-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (223, 1368, 4, CAST(N'2016-05-15' AS Date), CAST(N'2016-05-16' AS Date), CAST(N'2016-05-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (224, 157, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-18' AS Date), CAST(N'2016-05-19' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (225, 307, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-20' AS Date), CAST(N'2016-05-19' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (226, 501, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-19' AS Date), CAST(N'2016-05-20' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (227, 489, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-18' AS Date), CAST(N'2016-05-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (228, 615, 4, CAST(N'2016-05-17' AS Date), CAST(N'2016-05-20' AS Date), CAST(N'2016-05-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (229, 742, 4, CAST(N'2016-05-19' AS Date), CAST(N'2016-05-21' AS Date), CAST(N'2016-05-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (230, 1167, 4, CAST(N'2016-05-19' AS Date), CAST(N'2016-05-20' AS Date), CAST(N'2016-05-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (231, 1257, 4, CAST(N'2016-05-19' AS Date), CAST(N'2016-05-22' AS Date), CAST(N'2016-05-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (232, 1360, 4, CAST(N'2016-05-20' AS Date), CAST(N'2016-05-23' AS Date), CAST(N'2016-05-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (233, 737, 4, CAST(N'2016-05-21' AS Date), CAST(N'2016-05-22' AS Date), CAST(N'2016-05-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (234, 1435, 4, CAST(N'2016-05-22' AS Date), CAST(N'2016-05-24' AS Date), CAST(N'2016-05-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (235, 649, 4, CAST(N'2016-05-24' AS Date), CAST(N'2016-05-25' AS Date), CAST(N'2016-05-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (236, 206, 4, CAST(N'2016-05-25' AS Date), CAST(N'2016-05-27' AS Date), CAST(N'2016-05-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (237, 1351, 4, CAST(N'2016-05-25' AS Date), CAST(N'2016-05-26' AS Date), CAST(N'2016-05-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (238, 1350, 4, CAST(N'2016-05-26' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (239, 13, 3, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-27' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (240, 65, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (241, 1082, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (242, 1168, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-30' AS Date), CAST(N'2016-05-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (243, 802, 4, CAST(N'2016-05-27' AS Date), CAST(N'2016-05-30' AS Date), CAST(N'2016-05-28' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (244, 956, 4, CAST(N'2016-05-28' AS Date), CAST(N'2016-05-29' AS Date), CAST(N'2016-05-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (245, 223, 4, CAST(N'2016-05-29' AS Date), CAST(N'2016-05-31' AS Date), CAST(N'2016-05-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (246, 17, 3, CAST(N'2016-05-30' AS Date), CAST(N'2016-05-30' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (247, 928, 4, CAST(N'2016-05-30' AS Date), CAST(N'2016-06-01' AS Date), CAST(N'2016-06-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (248, 1376, 4, CAST(N'2016-05-30' AS Date), CAST(N'2016-06-01' AS Date), CAST(N'2016-05-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (249, 145, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (250, 150, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-02' AS Date), CAST(N'2016-06-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (251, 851, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (252, 66, 4, CAST(N'2016-06-01' AS Date), CAST(N'2016-06-04' AS Date), CAST(N'2016-06-02' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (253, 1267, 4, CAST(N'2016-06-02' AS Date), CAST(N'2016-06-05' AS Date), CAST(N'2016-06-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (254, 510, 4, CAST(N'2016-06-03' AS Date), CAST(N'2016-06-06' AS Date), CAST(N'2016-06-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (255, 801, 4, CAST(N'2016-06-03' AS Date), CAST(N'2016-06-06' AS Date), CAST(N'2016-06-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (256, 26, 4, CAST(N'2016-06-04' AS Date), CAST(N'2016-06-05' AS Date), CAST(N'2016-06-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (257, 1314, 4, CAST(N'2016-06-05' AS Date), CAST(N'2016-06-06' AS Date), CAST(N'2016-06-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (258, 107, 4, CAST(N'2016-06-06' AS Date), CAST(N'2016-06-07' AS Date), CAST(N'2016-06-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (259, 413, 4, CAST(N'2016-06-06' AS Date), CAST(N'2016-06-09' AS Date), CAST(N'2016-06-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (260, 632, 4, CAST(N'2016-06-06' AS Date), CAST(N'2016-06-08' AS Date), CAST(N'2016-06-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (261, 1045, 4, CAST(N'2016-06-08' AS Date), CAST(N'2016-06-10' AS Date), CAST(N'2016-06-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (262, 579, 4, CAST(N'2016-06-08' AS Date), CAST(N'2016-06-11' AS Date), CAST(N'2016-06-10' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (263, 1322, 4, CAST(N'2016-06-09' AS Date), CAST(N'2016-06-10' AS Date), CAST(N'2016-06-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (264, 5, 3, CAST(N'2016-06-10' AS Date), CAST(N'2016-06-10' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (265, 682, 4, CAST(N'2016-06-10' AS Date), CAST(N'2016-06-12' AS Date), CAST(N'2016-06-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (266, 933, 4, CAST(N'2016-06-10' AS Date), CAST(N'2016-06-13' AS Date), CAST(N'2016-06-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (267, 282, 4, CAST(N'2016-06-11' AS Date), CAST(N'2016-06-14' AS Date), CAST(N'2016-06-14' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (268, 540, 4, CAST(N'2016-06-11' AS Date), CAST(N'2016-06-14' AS Date), CAST(N'2016-06-12' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (269, 764, 4, CAST(N'2016-06-12' AS Date), CAST(N'2016-06-13' AS Date), CAST(N'2016-06-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (270, 879, 4, CAST(N'2016-06-12' AS Date), CAST(N'2016-06-15' AS Date), CAST(N'2016-06-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (271, 350, 4, CAST(N'2016-06-13' AS Date), CAST(N'2016-06-16' AS Date), CAST(N'2016-06-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (272, 497, 4, CAST(N'2016-06-15' AS Date), CAST(N'2016-06-18' AS Date), CAST(N'2016-06-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (273, 1340, 4, CAST(N'2016-06-16' AS Date), CAST(N'2016-06-19' AS Date), CAST(N'2016-06-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (274, 411, 4, CAST(N'2016-06-17' AS Date), CAST(N'2016-06-20' AS Date), CAST(N'2016-06-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (275, 1341, 4, CAST(N'2016-06-17' AS Date), CAST(N'2016-06-19' AS Date), CAST(N'2016-06-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (276, 1227, 4, CAST(N'2016-06-18' AS Date), CAST(N'2016-06-19' AS Date), CAST(N'2016-06-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (277, 546, 4, CAST(N'2016-06-19' AS Date), CAST(N'2016-06-20' AS Date), CAST(N'2016-06-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (278, 1301, 4, CAST(N'2016-06-20' AS Date), CAST(N'2016-06-23' AS Date), CAST(N'2016-06-21' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (279, 378, 4, CAST(N'2016-06-21' AS Date), CAST(N'2016-06-22' AS Date), CAST(N'2016-06-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (280, 638, 4, CAST(N'2016-06-21' AS Date), CAST(N'2016-06-22' AS Date), CAST(N'2016-06-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (281, 800, 4, CAST(N'2016-06-21' AS Date), CAST(N'2016-06-22' AS Date), CAST(N'2016-06-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (282, 159, 4, CAST(N'2016-06-22' AS Date), CAST(N'2016-06-25' AS Date), CAST(N'2016-06-25' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (283, 181, 4, CAST(N'2016-06-23' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-26' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (284, 1356, 4, CAST(N'2016-06-23' AS Date), CAST(N'2016-06-25' AS Date), CAST(N'2016-06-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (285, 319, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (286, 59, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (287, 133, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-26' AS Date), CAST(N'2016-06-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (288, 780, 4, CAST(N'2016-06-25' AS Date), CAST(N'2016-06-28' AS Date), CAST(N'2016-06-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (289, 849, 4, CAST(N'2016-06-27' AS Date), CAST(N'2016-06-28' AS Date), CAST(N'2016-06-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (290, 202, 4, CAST(N'2016-06-28' AS Date), CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (291, 158, 4, CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-07-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (292, 360, 4, CAST(N'2016-06-29' AS Date), CAST(N'2016-06-30' AS Date), CAST(N'2016-07-02' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (293, 573, 4, CAST(N'2016-06-30' AS Date), CAST(N'2016-07-03' AS Date), CAST(N'2016-07-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (294, 732, 4, CAST(N'2016-07-01' AS Date), CAST(N'2016-07-02' AS Date), CAST(N'2016-07-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (295, 1130, 4, CAST(N'2016-07-01' AS Date), CAST(N'2016-07-04' AS Date), CAST(N'2016-07-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (296, 1245, 4, CAST(N'2016-07-04' AS Date), CAST(N'2016-07-07' AS Date), CAST(N'2016-07-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (297, 1425, 4, CAST(N'2016-07-04' AS Date), CAST(N'2016-07-05' AS Date), CAST(N'2016-07-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (298, 885, 4, CAST(N'2016-07-04' AS Date), CAST(N'2016-07-07' AS Date), CAST(N'2016-07-07' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (299, 281, 4, CAST(N'2016-07-05' AS Date), CAST(N'2016-07-06' AS Date), CAST(N'2016-07-07' AS Date), 2, 6)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (300, 1205, 4, CAST(N'2016-07-05' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (301, 17, 4, CAST(N'2016-07-06' AS Date), CAST(N'2016-07-09' AS Date), CAST(N'2016-07-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (302, 1375, 4, CAST(N'2016-07-06' AS Date), CAST(N'2016-07-07' AS Date), CAST(N'2016-07-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (303, 36, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (304, 230, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (305, 705, 4, CAST(N'2016-07-07' AS Date), CAST(N'2016-07-08' AS Date), CAST(N'2016-07-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (306, 424, 4, CAST(N'2016-07-09' AS Date), CAST(N'2016-07-10' AS Date), CAST(N'2016-07-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (307, 695, 4, CAST(N'2016-07-09' AS Date), CAST(N'2016-07-11' AS Date), CAST(N'2016-07-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (308, 156, 4, CAST(N'2016-07-11' AS Date), CAST(N'2016-07-12' AS Date), CAST(N'2016-07-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (309, 211, 4, CAST(N'2016-07-11' AS Date), CAST(N'2016-07-13' AS Date), CAST(N'2016-07-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (310, 627, 4, CAST(N'2016-07-12' AS Date), CAST(N'2016-07-13' AS Date), CAST(N'2016-07-13' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (311, 1400, 4, CAST(N'2016-07-12' AS Date), CAST(N'2016-07-14' AS Date), CAST(N'2016-07-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (312, 299, 4, CAST(N'2016-07-13' AS Date), CAST(N'2016-07-15' AS Date), CAST(N'2016-07-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (313, 565, 4, CAST(N'2016-07-14' AS Date), CAST(N'2016-07-15' AS Date), CAST(N'2016-07-15' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (314, 1019, 4, CAST(N'2016-07-15' AS Date), CAST(N'2016-07-17' AS Date), CAST(N'2016-07-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (315, 1263, 4, CAST(N'2016-07-16' AS Date), CAST(N'2016-07-19' AS Date), CAST(N'2016-07-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (316, 670, 4, CAST(N'2016-07-17' AS Date), CAST(N'2016-07-20' AS Date), CAST(N'2016-07-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (317, 795, 4, CAST(N'2016-07-17' AS Date), CAST(N'2016-07-20' AS Date), CAST(N'2016-07-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (318, 1141, 4, CAST(N'2016-07-17' AS Date), CAST(N'2016-07-19' AS Date), CAST(N'2016-07-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (319, 941, 4, CAST(N'2016-07-18' AS Date), CAST(N'2016-07-21' AS Date), CAST(N'2016-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (320, 1428, 4, CAST(N'2016-07-19' AS Date), CAST(N'2016-07-20' AS Date), CAST(N'2016-07-21' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (321, 568, 4, CAST(N'2016-07-19' AS Date), CAST(N'2016-07-22' AS Date), CAST(N'2016-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (322, 924, 4, CAST(N'2016-07-19' AS Date), CAST(N'2016-07-22' AS Date), CAST(N'2016-07-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (323, 1243, 4, CAST(N'2016-07-19' AS Date), CAST(N'2016-07-22' AS Date), CAST(N'2016-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (324, 480, 4, CAST(N'2016-07-20' AS Date), CAST(N'2016-07-22' AS Date), CAST(N'2016-07-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (325, 848, 4, CAST(N'2016-07-20' AS Date), CAST(N'2016-07-21' AS Date), CAST(N'2016-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (326, 1337, 4, CAST(N'2016-07-20' AS Date), CAST(N'2016-07-21' AS Date), CAST(N'2016-07-22' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (327, 83, 4, CAST(N'2016-07-21' AS Date), CAST(N'2016-07-24' AS Date), CAST(N'2016-07-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (328, 528, 4, CAST(N'2016-07-23' AS Date), CAST(N'2016-07-26' AS Date), CAST(N'2016-07-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (329, 274, 4, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (330, 622, 4, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (331, 642, 4, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-26' AS Date), CAST(N'2016-07-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (332, 659, 4, CAST(N'2016-07-24' AS Date), CAST(N'2016-07-26' AS Date), CAST(N'2016-07-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (333, 779, 4, CAST(N'2016-07-25' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (334, 1112, 4, CAST(N'2016-07-25' AS Date), CAST(N'2016-07-28' AS Date), CAST(N'2016-07-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (335, 1193, 4, CAST(N'2016-07-25' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (336, 1030, 4, CAST(N'2016-07-26' AS Date), CAST(N'2016-07-29' AS Date), CAST(N'2016-07-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (337, 1252, 4, CAST(N'2016-07-26' AS Date), CAST(N'2016-07-27' AS Date), CAST(N'2016-07-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (338, 1333, 4, CAST(N'2016-07-28' AS Date), CAST(N'2016-07-29' AS Date), CAST(N'2016-07-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (339, 1110, 4, CAST(N'2016-07-28' AS Date), CAST(N'2016-07-31' AS Date), CAST(N'2016-07-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (340, 963, 4, CAST(N'2016-07-29' AS Date), CAST(N'2016-07-30' AS Date), CAST(N'2016-07-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (341, 1357, 4, CAST(N'2016-07-31' AS Date), CAST(N'2016-08-03' AS Date), CAST(N'2016-08-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (342, 806, 4, CAST(N'2016-07-31' AS Date), CAST(N'2016-08-01' AS Date), CAST(N'2016-08-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (343, 961, 4, CAST(N'2016-07-31' AS Date), CAST(N'2016-08-02' AS Date), CAST(N'2016-08-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (344, 750, 4, CAST(N'2016-08-01' AS Date), CAST(N'2016-08-03' AS Date), CAST(N'2016-08-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (345, 1299, 4, CAST(N'2016-08-01' AS Date), CAST(N'2016-08-04' AS Date), CAST(N'2016-08-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (346, 584, 4, CAST(N'2016-08-01' AS Date), CAST(N'2016-08-03' AS Date), CAST(N'2016-08-02' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (347, 1004, 4, CAST(N'2016-08-02' AS Date), CAST(N'2016-08-03' AS Date), CAST(N'2016-08-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (348, 907, 4, CAST(N'2016-08-02' AS Date), CAST(N'2016-08-05' AS Date), CAST(N'2016-08-04' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (349, 30, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (350, 31, 3, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (351, 1307, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-06' AS Date), CAST(N'2016-08-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (352, 16, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-04' AS Date), CAST(N'2016-08-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (353, 1387, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-06' AS Date), CAST(N'2016-08-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (354, 551, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-05' AS Date), CAST(N'2016-08-06' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (355, 1011, 4, CAST(N'2016-08-03' AS Date), CAST(N'2016-08-05' AS Date), CAST(N'2016-08-05' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (356, 1189, 4, CAST(N'2016-08-04' AS Date), CAST(N'2016-08-07' AS Date), CAST(N'2016-08-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (357, 14, 3, CAST(N'2016-08-05' AS Date), CAST(N'2016-08-05' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (358, 1042, 4, CAST(N'2016-08-05' AS Date), CAST(N'2016-08-07' AS Date), CAST(N'2016-08-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (359, 441, 4, CAST(N'2016-08-07' AS Date), CAST(N'2016-08-10' AS Date), CAST(N'2016-08-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (360, 1300, 4, CAST(N'2016-08-07' AS Date), CAST(N'2016-08-09' AS Date), CAST(N'2016-08-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (361, 994, 4, CAST(N'2016-08-08' AS Date), CAST(N'2016-08-09' AS Date), CAST(N'2016-08-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (362, 187, 4, CAST(N'2016-08-09' AS Date), CAST(N'2016-08-11' AS Date), CAST(N'2016-08-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (363, 834, 4, CAST(N'2016-08-11' AS Date), CAST(N'2016-08-12' AS Date), CAST(N'2016-08-13' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (364, 373, 4, CAST(N'2016-08-12' AS Date), CAST(N'2016-08-14' AS Date), CAST(N'2016-08-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (365, 981, 4, CAST(N'2016-08-13' AS Date), CAST(N'2016-08-14' AS Date), CAST(N'2016-08-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (366, 1054, 4, CAST(N'2016-08-13' AS Date), CAST(N'2016-08-14' AS Date), CAST(N'2016-08-14' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (367, 527, 4, CAST(N'2016-08-14' AS Date), CAST(N'2016-08-15' AS Date), CAST(N'2016-08-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (368, 995, 4, CAST(N'2016-08-14' AS Date), CAST(N'2016-08-15' AS Date), CAST(N'2016-08-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (369, 1285, 4, CAST(N'2016-08-15' AS Date), CAST(N'2016-08-18' AS Date), CAST(N'2016-08-18' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (370, 758, 4, CAST(N'2016-08-15' AS Date), CAST(N'2016-08-18' AS Date), CAST(N'2016-08-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (371, 891, 4, CAST(N'2016-08-15' AS Date), CAST(N'2016-08-16' AS Date), CAST(N'2016-08-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (372, 132, 4, CAST(N'2016-08-16' AS Date), CAST(N'2016-08-18' AS Date), CAST(N'2016-08-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (373, 337, 4, CAST(N'2016-08-16' AS Date), CAST(N'2016-08-19' AS Date), CAST(N'2016-08-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (374, 1313, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-19' AS Date), CAST(N'2016-08-18' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (375, 536, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-20' AS Date), CAST(N'2016-08-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (376, 825, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-19' AS Date), CAST(N'2016-08-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (377, 1355, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-19' AS Date), CAST(N'2016-08-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (378, 475, 4, CAST(N'2016-08-17' AS Date), CAST(N'2016-08-20' AS Date), CAST(N'2016-08-20' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (379, 954, 4, CAST(N'2016-08-18' AS Date), CAST(N'2016-08-21' AS Date), CAST(N'2016-08-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (380, 1156, 4, CAST(N'2016-08-19' AS Date), CAST(N'2016-08-20' AS Date), CAST(N'2016-08-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (381, 1297, 4, CAST(N'2016-08-19' AS Date), CAST(N'2016-08-21' AS Date), CAST(N'2016-08-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (382, 199, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (383, 331, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (384, 410, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-22' AS Date), CAST(N'2016-08-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (385, 1274, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (386, 1362, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (387, 451, 4, CAST(N'2016-08-20' AS Date), CAST(N'2016-08-21' AS Date), CAST(N'2016-08-21' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (388, 1080, 4, CAST(N'2016-08-21' AS Date), CAST(N'2016-08-24' AS Date), CAST(N'2016-08-23' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (389, 53, 4, CAST(N'2016-08-22' AS Date), CAST(N'2016-08-24' AS Date), CAST(N'2016-08-25' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (390, 576, 4, CAST(N'2016-08-22' AS Date), CAST(N'2016-08-24' AS Date), CAST(N'2016-08-25' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (391, 61, 3, CAST(N'2016-08-23' AS Date), CAST(N'2016-08-23' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (392, 176, 4, CAST(N'2016-08-23' AS Date), CAST(N'2016-08-26' AS Date), CAST(N'2016-08-24' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (393, 368, 4, CAST(N'2016-08-25' AS Date), CAST(N'2016-08-26' AS Date), CAST(N'2016-08-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (394, 522, 4, CAST(N'2016-08-26' AS Date), CAST(N'2016-08-28' AS Date), CAST(N'2016-08-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (395, 144, 4, CAST(N'2016-08-26' AS Date), CAST(N'2016-08-27' AS Date), CAST(N'2016-08-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (396, 542, 4, CAST(N'2016-08-27' AS Date), CAST(N'2016-08-30' AS Date), CAST(N'2016-08-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (397, 1437, 4, CAST(N'2016-08-28' AS Date), CAST(N'2016-08-31' AS Date), CAST(N'2016-08-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (398, 447, 4, CAST(N'2016-08-29' AS Date), CAST(N'2016-08-30' AS Date), CAST(N'2016-09-01' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (399, 1001, 4, CAST(N'2016-08-29' AS Date), CAST(N'2016-09-01' AS Date), CAST(N'2016-09-01' AS Date), 2, 7)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (400, 1295, 4, CAST(N'2016-08-29' AS Date), CAST(N'2016-08-30' AS Date), CAST(N'2016-08-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (401, 103, 4, CAST(N'2016-08-30' AS Date), CAST(N'2016-09-02' AS Date), CAST(N'2016-09-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (402, 1335, 4, CAST(N'2016-08-30' AS Date), CAST(N'2016-09-01' AS Date), CAST(N'2016-08-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (403, 578, 4, CAST(N'2016-08-31' AS Date), CAST(N'2016-09-01' AS Date), CAST(N'2016-09-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (404, 396, 4, CAST(N'2016-08-31' AS Date), CAST(N'2016-09-03' AS Date), CAST(N'2016-09-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (405, 603, 4, CAST(N'2016-08-31' AS Date), CAST(N'2016-09-01' AS Date), CAST(N'2016-09-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (406, 1380, 4, CAST(N'2016-08-31' AS Date), CAST(N'2016-09-02' AS Date), CAST(N'2016-09-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (407, 77, 3, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-01' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (408, 1071, 4, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-02' AS Date), CAST(N'2016-09-02' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (409, 416, 4, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (410, 1151, 4, CAST(N'2016-09-01' AS Date), CAST(N'2016-09-03' AS Date), CAST(N'2016-09-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (411, 261, 4, CAST(N'2016-09-02' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (412, 1202, 4, CAST(N'2016-09-02' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (413, 717, 4, CAST(N'2016-09-02' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (414, 917, 4, CAST(N'2016-09-03' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (415, 1265, 4, CAST(N'2016-09-03' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (416, 1377, 4, CAST(N'2016-09-03' AS Date), CAST(N'2016-09-04' AS Date), CAST(N'2016-09-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (417, 359, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (418, 88, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-05' AS Date), CAST(N'2016-09-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (419, 14, 4, CAST(N'2016-09-04' AS Date), CAST(N'2016-09-07' AS Date), CAST(N'2016-09-06' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (420, 72, 4, CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-07' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (421, 240, 4, CAST(N'2016-09-05' AS Date), CAST(N'2016-09-06' AS Date), CAST(N'2016-09-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (422, 398, 4, CAST(N'2016-09-06' AS Date), CAST(N'2016-09-07' AS Date), CAST(N'2016-09-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (423, 1397, 4, CAST(N'2016-09-06' AS Date), CAST(N'2016-09-09' AS Date), CAST(N'2016-09-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (424, 67, 4, CAST(N'2016-09-08' AS Date), CAST(N'2016-09-11' AS Date), CAST(N'2016-09-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (425, 843, 4, CAST(N'2016-09-08' AS Date), CAST(N'2016-09-11' AS Date), CAST(N'2016-09-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (426, 944, 4, CAST(N'2016-09-08' AS Date), CAST(N'2016-09-10' AS Date), CAST(N'2016-09-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (427, 434, 4, CAST(N'2016-09-09' AS Date), CAST(N'2016-09-10' AS Date), CAST(N'2016-09-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (428, 1039, 4, CAST(N'2016-09-09' AS Date), CAST(N'2016-09-12' AS Date), CAST(N'2016-09-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (429, 153, 4, CAST(N'2016-09-10' AS Date), CAST(N'2016-09-12' AS Date), CAST(N'2016-09-12' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (430, 272, 4, CAST(N'2016-09-11' AS Date), CAST(N'2016-09-13' AS Date), CAST(N'2016-09-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (431, 1217, 4, CAST(N'2016-09-11' AS Date), CAST(N'2016-09-12' AS Date), CAST(N'2016-09-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (432, 169, 4, CAST(N'2016-09-12' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (433, 1062, 4, CAST(N'2016-09-12' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (434, 726, 4, CAST(N'2016-09-13' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (435, 77, 4, CAST(N'2016-09-14' AS Date), CAST(N'2016-09-15' AS Date), CAST(N'2016-09-16' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (436, 791, 4, CAST(N'2016-09-16' AS Date), CAST(N'2016-09-19' AS Date), CAST(N'2016-09-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (437, 1085, 4, CAST(N'2016-09-16' AS Date), CAST(N'2016-09-18' AS Date), CAST(N'2016-09-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (438, 314, 4, CAST(N'2016-09-16' AS Date), CAST(N'2016-09-19' AS Date), CAST(N'2016-09-18' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (439, 149, 4, CAST(N'2016-09-17' AS Date), CAST(N'2016-09-20' AS Date), CAST(N'2016-09-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (440, 882, 4, CAST(N'2016-09-17' AS Date), CAST(N'2016-09-18' AS Date), CAST(N'2016-09-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (441, 704, 4, CAST(N'2016-09-18' AS Date), CAST(N'2016-09-19' AS Date), CAST(N'2016-09-19' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (442, 667, 4, CAST(N'2016-09-18' AS Date), CAST(N'2016-09-21' AS Date), CAST(N'2016-09-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (443, 1371, 4, CAST(N'2016-09-18' AS Date), CAST(N'2016-09-19' AS Date), CAST(N'2016-09-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (444, 30, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-20' AS Date), CAST(N'2016-09-21' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (445, 362, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-22' AS Date), CAST(N'2016-09-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (446, 399, 4, CAST(N'2016-09-19' AS Date), CAST(N'2016-09-21' AS Date), CAST(N'2016-09-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (447, 808, 4, CAST(N'2016-09-20' AS Date), CAST(N'2016-09-23' AS Date), CAST(N'2016-09-22' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (448, 101, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-22' AS Date), CAST(N'2016-09-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (449, 492, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (450, 575, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (451, 1146, 4, CAST(N'2016-09-21' AS Date), CAST(N'2016-09-23' AS Date), CAST(N'2016-09-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (452, 997, 4, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-23' AS Date), CAST(N'2016-09-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (453, 1028, 4, CAST(N'2016-09-22' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (454, 988, 4, CAST(N'2016-09-23' AS Date), CAST(N'2016-09-25' AS Date), CAST(N'2016-09-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (455, 1055, 4, CAST(N'2016-09-23' AS Date), CAST(N'2016-09-24' AS Date), CAST(N'2016-09-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (456, 1061, 4, CAST(N'2016-09-23' AS Date), CAST(N'2016-09-26' AS Date), CAST(N'2016-09-25' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (457, 1349, 4, CAST(N'2016-09-24' AS Date), CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (458, 197, 4, CAST(N'2016-09-25' AS Date), CAST(N'2016-09-28' AS Date), CAST(N'2016-09-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (459, 874, 4, CAST(N'2016-09-25' AS Date), CAST(N'2016-09-28' AS Date), CAST(N'2016-09-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (460, 691, 4, CAST(N'2016-09-25' AS Date), CAST(N'2016-09-27' AS Date), CAST(N'2016-09-26' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (461, 853, 4, CAST(N'2016-09-26' AS Date), CAST(N'2016-09-27' AS Date), CAST(N'2016-09-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (462, 852, 4, CAST(N'2016-09-27' AS Date), CAST(N'2016-09-28' AS Date), CAST(N'2016-09-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (463, 964, 4, CAST(N'2016-09-27' AS Date), CAST(N'2016-09-28' AS Date), CAST(N'2016-09-28' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (464, 74, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-09-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (465, 1198, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-10-01' AS Date), CAST(N'2016-10-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (466, 1440, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-29' AS Date), CAST(N'2016-10-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (467, 555, 4, CAST(N'2016-09-28' AS Date), CAST(N'2016-09-30' AS Date), CAST(N'2016-09-30' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (468, 1261, 4, CAST(N'2016-09-29' AS Date), CAST(N'2016-10-02' AS Date), CAST(N'2016-09-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (469, 1089, 4, CAST(N'2016-09-29' AS Date), CAST(N'2016-10-02' AS Date), CAST(N'2016-10-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (470, 641, 4, CAST(N'2016-09-30' AS Date), CAST(N'2016-10-02' AS Date), CAST(N'2016-10-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (471, 697, 4, CAST(N'2016-09-30' AS Date), CAST(N'2016-10-02' AS Date), CAST(N'2016-10-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (472, 468, 4, CAST(N'2016-09-30' AS Date), CAST(N'2016-10-01' AS Date), CAST(N'2016-10-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (473, 549, 4, CAST(N'2016-09-30' AS Date), CAST(N'2016-10-02' AS Date), CAST(N'2016-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (474, 553, 4, CAST(N'2016-10-01' AS Date), CAST(N'2016-10-04' AS Date), CAST(N'2016-10-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (475, 241, 4, CAST(N'2016-10-01' AS Date), CAST(N'2016-10-04' AS Date), CAST(N'2016-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (476, 559, 4, CAST(N'2016-10-01' AS Date), CAST(N'2016-10-04' AS Date), CAST(N'2016-10-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (477, 449, 4, CAST(N'2016-10-02' AS Date), CAST(N'2016-10-05' AS Date), CAST(N'2016-10-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (478, 304, 4, CAST(N'2016-10-02' AS Date), CAST(N'2016-10-05' AS Date), CAST(N'2016-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (479, 984, 4, CAST(N'2016-10-03' AS Date), CAST(N'2016-10-04' AS Date), CAST(N'2016-10-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (480, 686, 4, CAST(N'2016-10-04' AS Date), CAST(N'2016-10-07' AS Date), CAST(N'2016-10-05' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (481, 481, 4, CAST(N'2016-10-04' AS Date), CAST(N'2016-10-07' AS Date), CAST(N'2016-10-06' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (482, 513, 4, CAST(N'2016-10-05' AS Date), CAST(N'2016-10-06' AS Date), CAST(N'2016-10-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (483, 703, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-07' AS Date), CAST(N'2016-10-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (484, 421, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-09' AS Date), CAST(N'2016-10-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (485, 465, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-08' AS Date), CAST(N'2016-10-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (486, 709, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-08' AS Date), CAST(N'2016-10-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (487, 827, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-09' AS Date), CAST(N'2016-10-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (488, 921, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-09' AS Date), CAST(N'2016-10-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (489, 899, 4, CAST(N'2016-10-06' AS Date), CAST(N'2016-10-08' AS Date), CAST(N'2016-10-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (490, 876, 4, CAST(N'2016-10-07' AS Date), CAST(N'2016-10-10' AS Date), CAST(N'2016-10-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (491, 1048, 4, CAST(N'2016-10-08' AS Date), CAST(N'2016-10-10' AS Date), CAST(N'2016-10-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (492, 191, 4, CAST(N'2016-10-09' AS Date), CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (493, 796, 4, CAST(N'2016-10-09' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (494, 875, 4, CAST(N'2016-10-09' AS Date), CAST(N'2016-10-10' AS Date), CAST(N'2016-10-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (495, 712, 4, CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (496, 193, 4, CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (497, 785, 4, CAST(N'2016-10-10' AS Date), CAST(N'2016-10-11' AS Date), CAST(N'2016-10-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (498, 1331, 4, CAST(N'2016-10-10' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (499, 260, 4, CAST(N'2016-10-11' AS Date), CAST(N'2016-10-14' AS Date), CAST(N'2016-10-13' AS Date), 1, 2)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (500, 148, 4, CAST(N'2016-10-11' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (501, 977, 4, CAST(N'2016-10-11' AS Date), CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (502, 401, 4, CAST(N'2016-10-12' AS Date), CAST(N'2016-10-13' AS Date), CAST(N'2016-10-13' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (503, 932, 4, CAST(N'2016-10-13' AS Date), CAST(N'2016-10-16' AS Date), CAST(N'2016-10-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (504, 1381, 4, CAST(N'2016-10-14' AS Date), CAST(N'2016-10-15' AS Date), CAST(N'2016-10-15' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (505, 721, 4, CAST(N'2016-10-14' AS Date), CAST(N'2016-10-16' AS Date), CAST(N'2016-10-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (506, 831, 4, CAST(N'2016-10-14' AS Date), CAST(N'2016-10-16' AS Date), CAST(N'2016-10-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (507, 1378, 4, CAST(N'2016-10-15' AS Date), CAST(N'2016-10-17' AS Date), CAST(N'2016-10-17' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (508, 1359, 4, CAST(N'2016-10-15' AS Date), CAST(N'2016-10-18' AS Date), CAST(N'2016-10-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (509, 235, 4, CAST(N'2016-10-16' AS Date), CAST(N'2016-10-17' AS Date), CAST(N'2016-10-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (510, 586, 4, CAST(N'2016-10-17' AS Date), CAST(N'2016-10-18' AS Date), CAST(N'2016-10-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (511, 377, 4, CAST(N'2016-10-18' AS Date), CAST(N'2016-10-20' AS Date), CAST(N'2016-10-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (512, 8, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-22' AS Date), CAST(N'2016-10-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (513, 155, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-21' AS Date), CAST(N'2016-10-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (514, 927, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-21' AS Date), CAST(N'2016-10-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (515, 986, 4, CAST(N'2016-10-19' AS Date), CAST(N'2016-10-20' AS Date), CAST(N'2016-10-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (516, 111, 4, CAST(N'2016-10-21' AS Date), CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (517, 613, 4, CAST(N'2016-10-21' AS Date), CAST(N'2016-10-22' AS Date), CAST(N'2016-10-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (518, 1374, 4, CAST(N'2016-10-22' AS Date), CAST(N'2016-10-24' AS Date), CAST(N'2016-10-25' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (519, 54, 4, CAST(N'2016-10-22' AS Date), CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (520, 639, 4, CAST(N'2016-10-23' AS Date), CAST(N'2016-10-26' AS Date), CAST(N'2016-10-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (521, 664, 4, CAST(N'2016-10-23' AS Date), CAST(N'2016-10-25' AS Date), CAST(N'2016-10-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (522, 724, 4, CAST(N'2016-10-23' AS Date), CAST(N'2016-10-24' AS Date), CAST(N'2016-10-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (523, 1056, 4, CAST(N'2016-10-24' AS Date), CAST(N'2016-10-26' AS Date), CAST(N'2016-10-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (524, 569, 4, CAST(N'2016-10-25' AS Date), CAST(N'2016-10-26' AS Date), CAST(N'2016-10-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (525, 1315, 4, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-28' AS Date), CAST(N'2016-10-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (526, 1096, 4, CAST(N'2016-10-26' AS Date), CAST(N'2016-10-28' AS Date), CAST(N'2016-10-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (527, 506, 4, CAST(N'2016-10-27' AS Date), CAST(N'2016-10-29' AS Date), CAST(N'2016-10-28' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (528, 676, 4, CAST(N'2016-10-28' AS Date), CAST(N'2016-10-31' AS Date), CAST(N'2016-10-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (529, 753, 4, CAST(N'2016-10-28' AS Date), CAST(N'2016-10-30' AS Date), CAST(N'2016-10-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (530, 773, 4, CAST(N'2016-10-28' AS Date), CAST(N'2016-10-31' AS Date), CAST(N'2016-10-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (531, 116, 4, CAST(N'2016-10-28' AS Date), CAST(N'2016-10-29' AS Date), CAST(N'2016-10-30' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (532, 817, 4, CAST(N'2016-10-29' AS Date), CAST(N'2016-10-31' AS Date), CAST(N'2016-10-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (533, 1334, 4, CAST(N'2016-10-29' AS Date), CAST(N'2016-11-01' AS Date), CAST(N'2016-11-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (534, 1406, 4, CAST(N'2016-10-29' AS Date), CAST(N'2016-10-30' AS Date), CAST(N'2016-10-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (535, 835, 4, CAST(N'2016-10-29' AS Date), CAST(N'2016-10-31' AS Date), CAST(N'2016-11-01' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (536, 759, 4, CAST(N'2016-10-31' AS Date), CAST(N'2016-11-02' AS Date), CAST(N'2016-11-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (537, 1353, 4, CAST(N'2016-10-31' AS Date), CAST(N'2016-11-01' AS Date), CAST(N'2016-11-03' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (538, 341, 4, CAST(N'2016-11-02' AS Date), CAST(N'2016-11-05' AS Date), CAST(N'2016-11-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (539, 1144, 4, CAST(N'2016-11-02' AS Date), CAST(N'2016-11-04' AS Date), CAST(N'2016-11-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (540, 1429, 4, CAST(N'2016-11-03' AS Date), CAST(N'2016-11-05' AS Date), CAST(N'2016-11-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (541, 1228, 4, CAST(N'2016-11-04' AS Date), CAST(N'2016-11-07' AS Date), CAST(N'2016-11-07' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (542, 313, 4, CAST(N'2016-11-04' AS Date), CAST(N'2016-11-06' AS Date), CAST(N'2016-11-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (543, 62, 4, CAST(N'2016-11-06' AS Date), CAST(N'2016-11-09' AS Date), CAST(N'2016-11-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (544, 321, 4, CAST(N'2016-11-06' AS Date), CAST(N'2016-11-07' AS Date), CAST(N'2016-11-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (545, 1108, 4, CAST(N'2016-11-08' AS Date), CAST(N'2016-11-10' AS Date), CAST(N'2016-11-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (546, 470, 4, CAST(N'2016-11-09' AS Date), CAST(N'2016-11-12' AS Date), CAST(N'2016-11-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (547, 20, 4, CAST(N'2016-11-09' AS Date), CAST(N'2016-11-11' AS Date), CAST(N'2016-11-10' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (548, 739, 4, CAST(N'2016-11-11' AS Date), CAST(N'2016-11-13' AS Date), CAST(N'2016-11-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (549, 64, 3, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-12' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (550, 892, 4, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (551, 1169, 4, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-13' AS Date), CAST(N'2016-11-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (552, 1282, 4, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-15' AS Date), CAST(N'2016-11-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (553, 913, 4, CAST(N'2016-11-12' AS Date), CAST(N'2016-11-13' AS Date), CAST(N'2016-11-15' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (554, 104, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-16' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (555, 212, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (556, 61, 4, CAST(N'2016-11-13' AS Date), CAST(N'2016-11-14' AS Date), CAST(N'2016-11-15' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (557, 1248, 4, CAST(N'2016-11-14' AS Date), CAST(N'2016-11-17' AS Date), CAST(N'2016-11-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (558, 1443, 4, CAST(N'2016-11-15' AS Date), CAST(N'2016-11-16' AS Date), CAST(N'2016-11-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (559, 959, 4, CAST(N'2016-11-16' AS Date), CAST(N'2016-11-17' AS Date), CAST(N'2016-11-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (560, 1405, 4, CAST(N'2016-11-18' AS Date), CAST(N'2016-11-19' AS Date), CAST(N'2016-11-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (561, 90, 4, CAST(N'2016-11-19' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (562, 942, 4, CAST(N'2016-11-19' AS Date), CAST(N'2016-11-20' AS Date), CAST(N'2016-11-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (563, 365, 4, CAST(N'2016-11-20' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (564, 1058, 4, CAST(N'2016-11-20' AS Date), CAST(N'2016-11-23' AS Date), CAST(N'2016-11-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (565, 894, 4, CAST(N'2016-11-21' AS Date), CAST(N'2016-11-22' AS Date), CAST(N'2016-11-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (566, 298, 4, CAST(N'2016-11-22' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (567, 1430, 4, CAST(N'2016-11-22' AS Date), CAST(N'2016-11-23' AS Date), CAST(N'2016-11-23' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (568, 1275, 4, CAST(N'2016-11-23' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-24' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (569, 707, 4, CAST(N'2016-11-23' AS Date), CAST(N'2016-11-24' AS Date), CAST(N'2016-11-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (570, 989, 4, CAST(N'2016-11-23' AS Date), CAST(N'2016-11-24' AS Date), CAST(N'2016-11-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (571, 5, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-25' AS Date), CAST(N'2016-11-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (572, 178, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-11-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (573, 423, 4, CAST(N'2016-11-24' AS Date), CAST(N'2016-11-26' AS Date), CAST(N'2016-11-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (574, 833, 4, CAST(N'2016-11-26' AS Date), CAST(N'2016-11-27' AS Date), CAST(N'2016-11-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (575, 33, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-28' AS Date), CAST(N'2016-11-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (576, 1272, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-11-28' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (577, 445, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-11-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (578, 819, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-28' AS Date), CAST(N'2016-11-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (579, 160, 4, CAST(N'2016-11-27' AS Date), CAST(N'2016-11-30' AS Date), CAST(N'2016-11-29' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (580, 581, 4, CAST(N'2016-11-30' AS Date), CAST(N'2016-12-02' AS Date), CAST(N'2016-12-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (581, 688, 4, CAST(N'2016-12-03' AS Date), CAST(N'2016-12-05' AS Date), CAST(N'2016-12-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (582, 32, 3, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-04' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (583, 792, 4, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-05' AS Date), CAST(N'2016-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (584, 1209, 4, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-05' AS Date), CAST(N'2016-12-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (585, 1219, 4, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-05' AS Date), CAST(N'2016-12-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (586, 1306, 4, CAST(N'2016-12-04' AS Date), CAST(N'2016-12-06' AS Date), CAST(N'2016-12-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (587, 487, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-08' AS Date), CAST(N'2016-12-08' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (588, 102, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-07' AS Date), CAST(N'2016-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (589, 719, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-07' AS Date), CAST(N'2016-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (590, 990, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-09' AS Date), CAST(N'2016-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (591, 1211, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-09' AS Date), CAST(N'2016-12-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (592, 1232, 4, CAST(N'2016-12-06' AS Date), CAST(N'2016-12-08' AS Date), CAST(N'2016-12-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (593, 50, 4, CAST(N'2016-12-07' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (594, 1318, 4, CAST(N'2016-12-07' AS Date), CAST(N'2016-12-08' AS Date), CAST(N'2016-12-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (595, 538, 4, CAST(N'2016-12-08' AS Date), CAST(N'2016-12-09' AS Date), CAST(N'2016-12-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (596, 952, 4, CAST(N'2016-12-08' AS Date), CAST(N'2016-12-09' AS Date), CAST(N'2016-12-09' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (597, 1121, 4, CAST(N'2016-12-08' AS Date), CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (598, 40, 3, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-09' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (599, 1, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-12' AS Date), 2, 6)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (600, 624, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-12' AS Date), CAST(N'2016-12-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (601, 683, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (602, 823, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (603, 1032, 4, CAST(N'2016-12-09' AS Date), CAST(N'2016-12-10' AS Date), CAST(N'2016-12-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (604, 96, 4, CAST(N'2016-12-10' AS Date), CAST(N'2016-12-13' AS Date), CAST(N'2016-12-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (605, 1208, 4, CAST(N'2016-12-10' AS Date), CAST(N'2016-12-11' AS Date), CAST(N'2016-12-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (606, 18, 4, CAST(N'2016-12-11' AS Date), CAST(N'2016-12-12' AS Date), CAST(N'2016-12-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (607, 309, 4, CAST(N'2016-12-11' AS Date), CAST(N'2016-12-14' AS Date), CAST(N'2016-12-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (608, 1103, 4, CAST(N'2016-12-12' AS Date), CAST(N'2016-12-15' AS Date), CAST(N'2016-12-14' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (609, 896, 4, CAST(N'2016-12-12' AS Date), CAST(N'2016-12-13' AS Date), CAST(N'2016-12-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (610, 711, 4, CAST(N'2016-12-13' AS Date), CAST(N'2016-12-15' AS Date), CAST(N'2016-12-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (611, 1073, 4, CAST(N'2016-12-15' AS Date), CAST(N'2016-12-17' AS Date), CAST(N'2016-12-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (612, 634, 4, CAST(N'2016-12-16' AS Date), CAST(N'2016-12-17' AS Date), CAST(N'2016-12-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (613, 1159, 4, CAST(N'2016-12-17' AS Date), CAST(N'2016-12-19' AS Date), CAST(N'2016-12-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (614, 654, 4, CAST(N'2016-12-18' AS Date), CAST(N'2016-12-21' AS Date), CAST(N'2016-12-21' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (615, 560, 4, CAST(N'2016-12-19' AS Date), CAST(N'2016-12-22' AS Date), CAST(N'2016-12-21' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (616, 1444, 4, CAST(N'2016-12-20' AS Date), CAST(N'2016-12-23' AS Date), CAST(N'2016-12-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (617, 118, 4, CAST(N'2016-12-21' AS Date), CAST(N'2016-12-23' AS Date), CAST(N'2016-12-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (618, 131, 4, CAST(N'2016-12-21' AS Date), CAST(N'2016-12-22' AS Date), CAST(N'2016-12-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (619, 454, 4, CAST(N'2016-12-22' AS Date), CAST(N'2016-12-25' AS Date), CAST(N'2016-12-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (620, 466, 4, CAST(N'2016-12-22' AS Date), CAST(N'2016-12-24' AS Date), CAST(N'2016-12-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (621, 1157, 4, CAST(N'2016-12-23' AS Date), CAST(N'2016-12-25' AS Date), CAST(N'2016-12-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (622, 1398, 4, CAST(N'2016-12-23' AS Date), CAST(N'2016-12-26' AS Date), CAST(N'2016-12-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (623, 678, 4, CAST(N'2016-12-24' AS Date), CAST(N'2016-12-26' AS Date), CAST(N'2016-12-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (624, 814, 4, CAST(N'2016-12-24' AS Date), CAST(N'2016-12-25' AS Date), CAST(N'2016-12-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (625, 1163, 4, CAST(N'2016-12-25' AS Date), CAST(N'2016-12-28' AS Date), CAST(N'2016-12-26' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (626, 130, 4, CAST(N'2016-12-25' AS Date), CAST(N'2016-12-28' AS Date), CAST(N'2016-12-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (627, 1119, 4, CAST(N'2016-12-25' AS Date), CAST(N'2016-12-26' AS Date), CAST(N'2016-12-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (628, 561, 4, CAST(N'2016-12-26' AS Date), CAST(N'2016-12-29' AS Date), CAST(N'2016-12-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (629, 973, 4, CAST(N'2016-12-26' AS Date), CAST(N'2016-12-27' AS Date), CAST(N'2016-12-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (630, 1404, 4, CAST(N'2016-12-26' AS Date), CAST(N'2016-12-27' AS Date), CAST(N'2016-12-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (631, 855, 4, CAST(N'2016-12-27' AS Date), CAST(N'2016-12-29' AS Date), CAST(N'2016-12-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (632, 163, 4, CAST(N'2016-12-27' AS Date), CAST(N'2016-12-29' AS Date), CAST(N'2016-12-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (633, 1040, 4, CAST(N'2016-12-28' AS Date), CAST(N'2016-12-31' AS Date), CAST(N'2016-12-30' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (634, 27, 4, CAST(N'2016-12-29' AS Date), CAST(N'2017-01-01' AS Date), CAST(N'2016-12-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (635, 520, 4, CAST(N'2016-12-30' AS Date), CAST(N'2017-01-02' AS Date), CAST(N'2016-12-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (636, 532, 4, CAST(N'2017-01-03' AS Date), CAST(N'2017-01-04' AS Date), CAST(N'2017-01-05' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (637, 512, 4, CAST(N'2017-01-03' AS Date), CAST(N'2017-01-05' AS Date), CAST(N'2017-01-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (638, 1302, 4, CAST(N'2017-01-04' AS Date), CAST(N'2017-01-05' AS Date), CAST(N'2017-01-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (639, 550, 4, CAST(N'2017-01-06' AS Date), CAST(N'2017-01-07' AS Date), CAST(N'2017-01-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (640, 1093, 4, CAST(N'2017-01-06' AS Date), CAST(N'2017-01-08' AS Date), CAST(N'2017-01-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (641, 673, 4, CAST(N'2017-01-07' AS Date), CAST(N'2017-01-10' AS Date), CAST(N'2017-01-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (642, 847, 4, CAST(N'2017-01-07' AS Date), CAST(N'2017-01-09' AS Date), CAST(N'2017-01-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (643, 901, 4, CAST(N'2017-01-08' AS Date), CAST(N'2017-01-09' AS Date), CAST(N'2017-01-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (644, 439, 4, CAST(N'2017-01-08' AS Date), CAST(N'2017-01-11' AS Date), CAST(N'2017-01-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (645, 1199, 4, CAST(N'2017-01-08' AS Date), CAST(N'2017-01-11' AS Date), CAST(N'2017-01-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (646, 975, 4, CAST(N'2017-01-09' AS Date), CAST(N'2017-01-12' AS Date), CAST(N'2017-01-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (647, 283, 4, CAST(N'2017-01-09' AS Date), CAST(N'2017-01-10' AS Date), CAST(N'2017-01-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (648, 684, 4, CAST(N'2017-01-09' AS Date), CAST(N'2017-01-11' AS Date), CAST(N'2017-01-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (649, 1153, 4, CAST(N'2017-01-10' AS Date), CAST(N'2017-01-11' AS Date), CAST(N'2017-01-13' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (650, 729, 4, CAST(N'2017-01-11' AS Date), CAST(N'2017-01-14' AS Date), CAST(N'2017-01-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (651, 190, 4, CAST(N'2017-01-11' AS Date), CAST(N'2017-01-13' AS Date), CAST(N'2017-01-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (652, 985, 4, CAST(N'2017-01-12' AS Date), CAST(N'2017-01-15' AS Date), CAST(N'2017-01-13' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (653, 1249, 4, CAST(N'2017-01-14' AS Date), CAST(N'2017-01-17' AS Date), CAST(N'2017-01-15' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (654, 1129, 4, CAST(N'2017-01-14' AS Date), CAST(N'2017-01-15' AS Date), CAST(N'2017-01-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (655, 347, 4, CAST(N'2017-01-16' AS Date), CAST(N'2017-01-17' AS Date), CAST(N'2017-01-18' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (656, 949, 4, CAST(N'2017-01-16' AS Date), CAST(N'2017-01-17' AS Date), CAST(N'2017-01-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (657, 349, 4, CAST(N'2017-01-17' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-20' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (658, 1051, 4, CAST(N'2017-01-17' AS Date), CAST(N'2017-01-18' AS Date), CAST(N'2017-01-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (659, 1391, 4, CAST(N'2017-01-17' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (660, 383, 4, CAST(N'2017-01-18' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (661, 626, 4, CAST(N'2017-01-18' AS Date), CAST(N'2017-01-19' AS Date), CAST(N'2017-01-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (662, 1125, 4, CAST(N'2017-01-19' AS Date), CAST(N'2017-01-20' AS Date), CAST(N'2017-01-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (663, 344, 4, CAST(N'2017-01-20' AS Date), CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (664, 681, 4, CAST(N'2017-01-20' AS Date), CAST(N'2017-01-23' AS Date), CAST(N'2017-01-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (665, 29, 4, CAST(N'2017-01-21' AS Date), CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (666, 770, 4, CAST(N'2017-01-21' AS Date), CAST(N'2017-01-22' AS Date), CAST(N'2017-01-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (667, 858, 4, CAST(N'2017-01-22' AS Date), CAST(N'2017-01-24' AS Date), CAST(N'2017-01-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (668, 297, 4, CAST(N'2017-01-22' AS Date), CAST(N'2017-01-23' AS Date), CAST(N'2017-01-24' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (669, 745, 4, CAST(N'2017-01-23' AS Date), CAST(N'2017-01-24' AS Date), CAST(N'2017-01-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (670, 361, 4, CAST(N'2017-01-24' AS Date), CAST(N'2017-01-25' AS Date), CAST(N'2017-01-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (671, 922, 4, CAST(N'2017-01-25' AS Date), CAST(N'2017-01-28' AS Date), CAST(N'2017-01-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (672, 908, 4, CAST(N'2017-01-26' AS Date), CAST(N'2017-01-29' AS Date), CAST(N'2017-01-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (673, 64, 4, CAST(N'2017-01-26' AS Date), CAST(N'2017-01-28' AS Date), CAST(N'2017-01-27' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (674, 733, 4, CAST(N'2017-01-27' AS Date), CAST(N'2017-01-28' AS Date), CAST(N'2017-01-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (675, 291, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-31' AS Date), CAST(N'2017-01-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (676, 790, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2017-01-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (677, 809, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-31' AS Date), CAST(N'2017-01-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (678, 250, 4, CAST(N'2017-01-28' AS Date), CAST(N'2017-01-29' AS Date), CAST(N'2017-01-31' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (679, 81, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2017-01-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (680, 245, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-02-01' AS Date), CAST(N'2017-01-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (681, 499, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-02-01' AS Date), CAST(N'2017-01-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (682, 614, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-01-30' AS Date), CAST(N'2017-01-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (683, 741, 4, CAST(N'2017-01-29' AS Date), CAST(N'2017-01-31' AS Date), CAST(N'2017-02-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (684, 762, 4, CAST(N'2017-01-31' AS Date), CAST(N'2017-02-01' AS Date), CAST(N'2017-02-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (685, 976, 4, CAST(N'2017-01-31' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (686, 380, 4, CAST(N'2017-02-01' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (687, 530, 4, CAST(N'2017-02-02' AS Date), CAST(N'2017-02-05' AS Date), CAST(N'2017-02-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (688, 343, 4, CAST(N'2017-02-02' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (689, 884, 4, CAST(N'2017-02-02' AS Date), CAST(N'2017-02-03' AS Date), CAST(N'2017-02-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (690, 1097, 4, CAST(N'2017-02-03' AS Date), CAST(N'2017-02-04' AS Date), CAST(N'2017-02-06' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (691, 1081, 4, CAST(N'2017-02-04' AS Date), CAST(N'2017-02-06' AS Date), CAST(N'2017-02-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (692, 2, 3, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-05' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (693, 1233, 4, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-07' AS Date), CAST(N'2017-02-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (694, 58, 4, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-06' AS Date), CAST(N'2017-02-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (695, 606, 4, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (696, 1242, 4, CAST(N'2017-02-05' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (697, 562, 4, CAST(N'2017-02-06' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (698, 543, 4, CAST(N'2017-02-06' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (699, 958, 4, CAST(N'2017-02-06' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), 3, 9)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (700, 4, 4, CAST(N'2017-02-07' AS Date), CAST(N'2017-02-10' AS Date), CAST(N'2017-02-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (701, 850, 4, CAST(N'2017-02-07' AS Date), CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (702, 1352, 4, CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), CAST(N'2017-02-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (703, 417, 4, CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), CAST(N'2017-02-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (704, 1137, 4, CAST(N'2017-02-08' AS Date), CAST(N'2017-02-09' AS Date), CAST(N'2017-02-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (705, 1196, 4, CAST(N'2017-02-08' AS Date), CAST(N'2017-02-11' AS Date), CAST(N'2017-02-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (706, 1271, 4, CAST(N'2017-02-09' AS Date), CAST(N'2017-02-12' AS Date), CAST(N'2017-02-10' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (707, 79, 4, CAST(N'2017-02-09' AS Date), CAST(N'2017-02-11' AS Date), CAST(N'2017-02-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (708, 660, 4, CAST(N'2017-02-10' AS Date), CAST(N'2017-02-12' AS Date), CAST(N'2017-02-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (709, 1162, 4, CAST(N'2017-02-11' AS Date), CAST(N'2017-02-13' AS Date), CAST(N'2017-02-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (710, 295, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-15' AS Date), CAST(N'2017-02-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (711, 1246, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-16' AS Date), CAST(N'2017-02-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (712, 173, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-16' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (713, 207, 4, CAST(N'2017-02-13' AS Date), CAST(N'2017-02-14' AS Date), CAST(N'2017-02-15' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (714, 805, 4, CAST(N'2017-02-14' AS Date), CAST(N'2017-02-17' AS Date), CAST(N'2017-02-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (715, 12, 3, CAST(N'2017-02-15' AS Date), CAST(N'2017-02-15' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (716, 672, 4, CAST(N'2017-02-15' AS Date), CAST(N'2017-02-17' AS Date), CAST(N'2017-02-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (717, 1312, 4, CAST(N'2017-02-15' AS Date), CAST(N'2017-02-18' AS Date), CAST(N'2017-02-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (718, 38, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-17' AS Date), CAST(N'2017-02-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (719, 200, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-19' AS Date), CAST(N'2017-02-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (720, 382, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-19' AS Date), CAST(N'2017-02-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (721, 625, 4, CAST(N'2017-02-16' AS Date), CAST(N'2017-02-19' AS Date), CAST(N'2017-02-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (722, 1399, 4, CAST(N'2017-02-18' AS Date), CAST(N'2017-02-20' AS Date), CAST(N'2017-02-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (723, 845, 4, CAST(N'2017-02-19' AS Date), CAST(N'2017-02-21' AS Date), CAST(N'2017-02-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (724, 864, 4, CAST(N'2017-02-19' AS Date), CAST(N'2017-02-22' AS Date), CAST(N'2017-02-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (725, 870, 4, CAST(N'2017-02-19' AS Date), CAST(N'2017-02-22' AS Date), CAST(N'2017-02-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (726, 969, 4, CAST(N'2017-02-19' AS Date), CAST(N'2017-02-22' AS Date), CAST(N'2017-02-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (727, 962, 4, CAST(N'2017-02-19' AS Date), CAST(N'2017-02-22' AS Date), CAST(N'2017-02-21' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (728, 1138, 4, CAST(N'2017-02-20' AS Date), CAST(N'2017-02-21' AS Date), CAST(N'2017-02-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (729, 897, 4, CAST(N'2017-02-20' AS Date), CAST(N'2017-02-22' AS Date), CAST(N'2017-02-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (730, 500, 4, CAST(N'2017-02-21' AS Date), CAST(N'2017-02-24' AS Date), CAST(N'2017-02-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (731, 910, 4, CAST(N'2017-02-25' AS Date), CAST(N'2017-02-27' AS Date), CAST(N'2017-02-27' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (732, 147, 4, CAST(N'2017-02-26' AS Date), CAST(N'2017-02-27' AS Date), CAST(N'2017-03-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (733, 832, 4, CAST(N'2017-02-26' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-02-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (734, 939, 4, CAST(N'2017-02-26' AS Date), CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (735, 20, 3, CAST(N'2017-02-27' AS Date), CAST(N'2017-02-27' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (736, 184, 4, CAST(N'2017-02-27' AS Date), CAST(N'2017-02-28' AS Date), CAST(N'2017-02-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (737, 694, 4, CAST(N'2017-02-27' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-02-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (738, 124, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-03' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (739, 49, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (740, 1113, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (741, 119, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-01' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (742, 433, 4, CAST(N'2017-02-28' AS Date), CAST(N'2017-03-01' AS Date), CAST(N'2017-03-01' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (743, 137, 4, CAST(N'2017-03-01' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (744, 166, 4, CAST(N'2017-03-01' AS Date), CAST(N'2017-03-02' AS Date), CAST(N'2017-03-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (745, 698, 4, CAST(N'2017-03-01' AS Date), CAST(N'2017-03-03' AS Date), CAST(N'2017-03-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (746, 391, 4, CAST(N'2017-03-02' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-05' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (747, 87, 4, CAST(N'2017-03-03' AS Date), CAST(N'2017-03-04' AS Date), CAST(N'2017-03-05' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (748, 1072, 4, CAST(N'2017-03-03' AS Date), CAST(N'2017-03-05' AS Date), CAST(N'2017-03-04' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (749, 255, 4, CAST(N'2017-03-04' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (750, 232, 4, CAST(N'2017-03-04' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-05' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (751, 731, 4, CAST(N'2017-03-05' AS Date), CAST(N'2017-03-08' AS Date), CAST(N'2017-03-07' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (752, 335, 4, CAST(N'2017-03-05' AS Date), CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (753, 1201, 4, CAST(N'2017-03-05' AS Date), CAST(N'2017-03-08' AS Date), CAST(N'2017-03-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (754, 646, 4, CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-08' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (755, 531, 4, CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (756, 1143, 4, CAST(N'2017-03-06' AS Date), CAST(N'2017-03-07' AS Date), CAST(N'2017-03-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (757, 1336, 4, CAST(N'2017-03-06' AS Date), CAST(N'2017-03-08' AS Date), CAST(N'2017-03-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (758, 953, 4, CAST(N'2017-03-06' AS Date), CAST(N'2017-03-08' AS Date), CAST(N'2017-03-07' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (759, 284, 4, CAST(N'2017-03-07' AS Date), CAST(N'2017-03-09' AS Date), CAST(N'2017-03-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (760, 1104, 4, CAST(N'2017-03-07' AS Date), CAST(N'2017-03-10' AS Date), CAST(N'2017-03-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (761, 1291, 4, CAST(N'2017-03-07' AS Date), CAST(N'2017-03-08' AS Date), CAST(N'2017-03-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (762, 572, 4, CAST(N'2017-03-08' AS Date), CAST(N'2017-03-09' AS Date), CAST(N'2017-03-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (763, 842, 4, CAST(N'2017-03-08' AS Date), CAST(N'2017-03-10' AS Date), CAST(N'2017-03-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (764, 701, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-10' AS Date), CAST(N'2017-03-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (765, 1152, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (766, 141, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (767, 564, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-10' AS Date), CAST(N'2017-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (768, 841, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-12' AS Date), CAST(N'2017-03-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (769, 946, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (770, 135, 4, CAST(N'2017-03-09' AS Date), CAST(N'2017-03-11' AS Date), CAST(N'2017-03-11' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (771, 671, 4, CAST(N'2017-03-11' AS Date), CAST(N'2017-03-14' AS Date), CAST(N'2017-03-12' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (772, 448, 4, CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), CAST(N'2017-03-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (773, 1385, 4, CAST(N'2017-03-11' AS Date), CAST(N'2017-03-12' AS Date), CAST(N'2017-03-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (774, 690, 4, CAST(N'2017-03-12' AS Date), CAST(N'2017-03-14' AS Date), CAST(N'2017-03-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (775, 968, 4, CAST(N'2017-03-12' AS Date), CAST(N'2017-03-13' AS Date), CAST(N'2017-03-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (776, 490, 4, CAST(N'2017-03-13' AS Date), CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (777, 496, 4, CAST(N'2017-03-13' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (778, 56, 3, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-15' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (779, 367, 4, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (780, 592, 4, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-17' AS Date), CAST(N'2017-03-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (781, 1018, 4, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (782, 1298, 4, CAST(N'2017-03-15' AS Date), CAST(N'2017-03-16' AS Date), CAST(N'2017-03-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (783, 1343, 4, CAST(N'2017-03-16' AS Date), CAST(N'2017-03-19' AS Date), CAST(N'2017-03-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (784, 430, 4, CAST(N'2017-03-16' AS Date), CAST(N'2017-03-19' AS Date), CAST(N'2017-03-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (785, 794, 4, CAST(N'2017-03-18' AS Date), CAST(N'2017-03-19' AS Date), CAST(N'2017-03-20' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (786, 249, 4, CAST(N'2017-03-18' AS Date), CAST(N'2017-03-20' AS Date), CAST(N'2017-03-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (787, 700, 4, CAST(N'2017-03-18' AS Date), CAST(N'2017-03-20' AS Date), CAST(N'2017-03-19' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (788, 1363, 4, CAST(N'2017-03-18' AS Date), CAST(N'2017-03-20' AS Date), CAST(N'2017-03-20' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (789, 772, 4, CAST(N'2017-03-19' AS Date), CAST(N'2017-03-20' AS Date), CAST(N'2017-03-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (790, 1015, 4, CAST(N'2017-03-19' AS Date), CAST(N'2017-03-21' AS Date), CAST(N'2017-03-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (791, 432, 4, CAST(N'2017-03-20' AS Date), CAST(N'2017-03-22' AS Date), CAST(N'2017-03-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (792, 479, 4, CAST(N'2017-03-22' AS Date), CAST(N'2017-03-23' AS Date), CAST(N'2017-03-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (793, 653, 4, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-24' AS Date), CAST(N'2017-03-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (794, 863, 4, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-25' AS Date), CAST(N'2017-03-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (795, 992, 4, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-25' AS Date), CAST(N'2017-03-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (796, 154, 4, CAST(N'2017-03-23' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-25' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (797, 374, 4, CAST(N'2017-03-24' AS Date), CAST(N'2017-03-26' AS Date), CAST(N'2017-03-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (798, 619, 4, CAST(N'2017-03-26' AS Date), CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (799, 607, 4, CAST(N'2017-03-27' AS Date), CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), 1, 3)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (800, 1057, 4, CAST(N'2017-03-27' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (801, 78, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (802, 340, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (803, 1105, 4, CAST(N'2017-03-28' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2017-03-30' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (804, 95, 4, CAST(N'2017-03-29' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2017-03-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (805, 420, 4, CAST(N'2017-03-29' AS Date), CAST(N'2017-03-30' AS Date), CAST(N'2017-04-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (806, 234, 4, CAST(N'2017-03-30' AS Date), CAST(N'2017-03-31' AS Date), CAST(N'2017-03-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (807, 1148, 4, CAST(N'2017-03-30' AS Date), CAST(N'2017-04-01' AS Date), CAST(N'2017-04-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (808, 315, 4, CAST(N'2017-03-31' AS Date), CAST(N'2017-04-02' AS Date), CAST(N'2017-04-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (809, 1222, 4, CAST(N'2017-03-31' AS Date), CAST(N'2017-04-03' AS Date), CAST(N'2017-04-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (810, 153, 3, CAST(N'2017-04-01' AS Date), CAST(N'2017-04-01' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (811, 524, 4, CAST(N'2017-04-01' AS Date), CAST(N'2017-04-04' AS Date), CAST(N'2017-04-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (812, 1164, 4, CAST(N'2017-04-01' AS Date), CAST(N'2017-04-02' AS Date), CAST(N'2017-04-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (813, 1203, 4, CAST(N'2017-04-01' AS Date), CAST(N'2017-04-03' AS Date), CAST(N'2017-04-02' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (814, 629, 4, CAST(N'2017-04-02' AS Date), CAST(N'2017-04-05' AS Date), CAST(N'2017-04-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (815, 1251, 4, CAST(N'2017-04-03' AS Date), CAST(N'2017-04-05' AS Date), CAST(N'2017-04-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (816, 811, 4, CAST(N'2017-04-03' AS Date), CAST(N'2017-04-05' AS Date), CAST(N'2017-04-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (817, 301, 4, CAST(N'2017-04-04' AS Date), CAST(N'2017-04-05' AS Date), CAST(N'2017-04-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (818, 1319, 4, CAST(N'2017-04-04' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (819, 221, 4, CAST(N'2017-04-04' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-05' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (820, 725, 4, CAST(N'2017-04-05' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (821, 1181, 4, CAST(N'2017-04-05' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (822, 294, 4, CAST(N'2017-04-06' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (823, 415, 4, CAST(N'2017-04-06' AS Date), CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (824, 993, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-09' AS Date), CAST(N'2017-04-10' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (825, 10, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-08' AS Date), CAST(N'2017-04-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (826, 45, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (827, 666, 4, CAST(N'2017-04-07' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (828, 246, 4, CAST(N'2017-04-09' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (829, 674, 4, CAST(N'2017-04-09' AS Date), CAST(N'2017-04-10' AS Date), CAST(N'2017-04-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (830, 431, 4, CAST(N'2017-04-11' AS Date), CAST(N'2017-04-14' AS Date), CAST(N'2017-04-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (831, 1000, 4, CAST(N'2017-04-11' AS Date), CAST(N'2017-04-12' AS Date), CAST(N'2017-04-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (832, 1215, 4, CAST(N'2017-04-11' AS Date), CAST(N'2017-04-12' AS Date), CAST(N'2017-04-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (833, 406, 4, CAST(N'2017-04-12' AS Date), CAST(N'2017-04-14' AS Date), CAST(N'2017-04-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (834, 890, 4, CAST(N'2017-04-12' AS Date), CAST(N'2017-04-13' AS Date), CAST(N'2017-04-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (835, 940, 4, CAST(N'2017-04-13' AS Date), CAST(N'2017-04-15' AS Date), CAST(N'2017-04-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (836, 455, 4, CAST(N'2017-04-13' AS Date), CAST(N'2017-04-16' AS Date), CAST(N'2017-04-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (837, 948, 4, CAST(N'2017-04-13' AS Date), CAST(N'2017-04-16' AS Date), CAST(N'2017-04-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (838, 1395, 4, CAST(N'2017-04-14' AS Date), CAST(N'2017-04-17' AS Date), CAST(N'2017-04-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (839, 1332, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-18' AS Date), CAST(N'2017-04-16' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (840, 372, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-16' AS Date), CAST(N'2017-04-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (841, 428, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-18' AS Date), CAST(N'2017-04-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (842, 1133, 4, CAST(N'2017-04-15' AS Date), CAST(N'2017-04-18' AS Date), CAST(N'2017-04-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (843, 1059, 4, CAST(N'2017-04-16' AS Date), CAST(N'2017-04-17' AS Date), CAST(N'2017-04-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (844, 1436, 4, CAST(N'2017-04-16' AS Date), CAST(N'2017-04-17' AS Date), CAST(N'2017-04-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (845, 662, 4, CAST(N'2017-04-17' AS Date), CAST(N'2017-04-18' AS Date), CAST(N'2017-04-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (846, 715, 4, CAST(N'2017-04-17' AS Date), CAST(N'2017-04-19' AS Date), CAST(N'2017-04-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (847, 329, 4, CAST(N'2017-04-18' AS Date), CAST(N'2017-04-19' AS Date), CAST(N'2017-04-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (848, 597, 4, CAST(N'2017-04-18' AS Date), CAST(N'2017-04-20' AS Date), CAST(N'2017-04-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (849, 776, 4, CAST(N'2017-04-19' AS Date), CAST(N'2017-04-20' AS Date), CAST(N'2017-04-21' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (850, 1346, 4, CAST(N'2017-04-19' AS Date), CAST(N'2017-04-22' AS Date), CAST(N'2017-04-22' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (851, 1139, 4, CAST(N'2017-04-20' AS Date), CAST(N'2017-04-21' AS Date), CAST(N'2017-04-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (852, 13, 4, CAST(N'2017-04-21' AS Date), CAST(N'2017-04-23' AS Date), CAST(N'2017-04-22' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (853, 883, 4, CAST(N'2017-04-21' AS Date), CAST(N'2017-04-24' AS Date), CAST(N'2017-04-24' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (854, 177, 4, CAST(N'2017-04-22' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2017-04-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (855, 775, 4, CAST(N'2017-04-22' AS Date), CAST(N'2017-04-23' AS Date), CAST(N'2017-04-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (856, 477, 4, CAST(N'2017-04-23' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2017-04-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (857, 1402, 4, CAST(N'2017-04-24' AS Date), CAST(N'2017-04-25' AS Date), CAST(N'2017-04-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (858, 162, 4, CAST(N'2017-04-25' AS Date), CAST(N'2017-04-27' AS Date), CAST(N'2017-04-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (859, 644, 4, CAST(N'2017-04-25' AS Date), CAST(N'2017-04-26' AS Date), CAST(N'2017-04-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (860, 473, 4, CAST(N'2017-04-27' AS Date), CAST(N'2017-04-29' AS Date), CAST(N'2017-04-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (861, 1177, 4, CAST(N'2017-04-27' AS Date), CAST(N'2017-04-29' AS Date), CAST(N'2017-04-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (862, 1230, 4, CAST(N'2017-04-27' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-04-29' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (863, 446, 4, CAST(N'2017-04-28' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-05-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (864, 902, 4, CAST(N'2017-04-28' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-04-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (865, 974, 4, CAST(N'2017-04-29' AS Date), CAST(N'2017-05-02' AS Date), CAST(N'2017-05-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (866, 1410, 4, CAST(N'2017-04-29' AS Date), CAST(N'2017-04-30' AS Date), CAST(N'2017-05-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (867, 97, 4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-03' AS Date), CAST(N'2017-05-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (868, 868, 4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-04' AS Date), CAST(N'2017-05-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (869, 844, 4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-04' AS Date), CAST(N'2017-05-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (870, 1416, 4, CAST(N'2017-05-01' AS Date), CAST(N'2017-05-04' AS Date), CAST(N'2017-05-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (871, 358, 4, CAST(N'2017-05-02' AS Date), CAST(N'2017-05-04' AS Date), CAST(N'2017-05-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (872, 394, 4, CAST(N'2017-05-03' AS Date), CAST(N'2017-05-06' AS Date), CAST(N'2017-05-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (873, 829, 4, CAST(N'2017-05-03' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-05-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (874, 661, 4, CAST(N'2017-05-04' AS Date), CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (875, 386, 4, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-06' AS Date), CAST(N'2017-05-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (876, 1046, 4, CAST(N'2017-05-05' AS Date), CAST(N'2017-05-08' AS Date), CAST(N'2017-05-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (877, 784, 4, CAST(N'2017-05-06' AS Date), CAST(N'2017-05-07' AS Date), CAST(N'2017-05-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (878, 224, 4, CAST(N'2017-05-07' AS Date), CAST(N'2017-05-10' AS Date), CAST(N'2017-05-09' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (879, 214, 4, CAST(N'2017-05-08' AS Date), CAST(N'2017-05-09' AS Date), CAST(N'2017-05-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (880, 1206, 4, CAST(N'2017-05-08' AS Date), CAST(N'2017-05-11' AS Date), CAST(N'2017-05-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (881, 1024, 4, CAST(N'2017-05-08' AS Date), CAST(N'2017-05-11' AS Date), CAST(N'2017-05-11' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (882, 196, 4, CAST(N'2017-05-09' AS Date), CAST(N'2017-05-12' AS Date), CAST(N'2017-05-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (883, 507, 4, CAST(N'2017-05-11' AS Date), CAST(N'2017-05-13' AS Date), CAST(N'2017-05-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (884, 871, 4, CAST(N'2017-05-11' AS Date), CAST(N'2017-05-13' AS Date), CAST(N'2017-05-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (885, 66, 3, CAST(N'2017-05-13' AS Date), CAST(N'2017-05-13' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (886, 1396, 4, CAST(N'2017-05-13' AS Date), CAST(N'2017-05-14' AS Date), CAST(N'2017-05-15' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (887, 1195, 4, CAST(N'2017-05-13' AS Date), CAST(N'2017-05-15' AS Date), CAST(N'2017-05-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (888, 1038, 4, CAST(N'2017-05-14' AS Date), CAST(N'2017-05-16' AS Date), CAST(N'2017-05-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (889, 830, 4, CAST(N'2017-05-14' AS Date), CAST(N'2017-05-17' AS Date), CAST(N'2017-05-15' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (890, 171, 4, CAST(N'2017-05-15' AS Date), CAST(N'2017-05-18' AS Date), CAST(N'2017-05-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (891, 384, 4, CAST(N'2017-05-15' AS Date), CAST(N'2017-05-18' AS Date), CAST(N'2017-05-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (892, 651, 4, CAST(N'2017-05-15' AS Date), CAST(N'2017-05-18' AS Date), CAST(N'2017-05-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (893, 1293, 4, CAST(N'2017-05-16' AS Date), CAST(N'2017-05-19' AS Date), CAST(N'2017-05-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (894, 1320, 4, CAST(N'2017-05-16' AS Date), CAST(N'2017-05-19' AS Date), CAST(N'2017-05-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (895, 857, 4, CAST(N'2017-05-18' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (896, 376, 4, CAST(N'2017-05-19' AS Date), CAST(N'2017-05-22' AS Date), CAST(N'2017-05-21' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (897, 47, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-21' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (898, 352, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (899, 605, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-21' AS Date), 2, 7)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (900, 971, 4, CAST(N'2017-05-20' AS Date), CAST(N'2017-05-21' AS Date), CAST(N'2017-05-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (901, 345, 4, CAST(N'2017-05-21' AS Date), CAST(N'2017-05-22' AS Date), CAST(N'2017-05-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (902, 1278, 4, CAST(N'2017-05-21' AS Date), CAST(N'2017-05-24' AS Date), CAST(N'2017-05-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (903, 179, 4, CAST(N'2017-05-22' AS Date), CAST(N'2017-05-23' AS Date), CAST(N'2017-05-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (904, 1020, 4, CAST(N'2017-05-23' AS Date), CAST(N'2017-05-26' AS Date), CAST(N'2017-05-24' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (905, 609, 4, CAST(N'2017-05-23' AS Date), CAST(N'2017-05-26' AS Date), CAST(N'2017-05-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (906, 877, 4, CAST(N'2017-05-23' AS Date), CAST(N'2017-05-26' AS Date), CAST(N'2017-05-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (907, 120, 4, CAST(N'2017-05-24' AS Date), CAST(N'2017-05-26' AS Date), CAST(N'2017-05-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (908, 402, 4, CAST(N'2017-05-25' AS Date), CAST(N'2017-05-28' AS Date), CAST(N'2017-05-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (909, 188, 4, CAST(N'2017-05-26' AS Date), CAST(N'2017-05-27' AS Date), CAST(N'2017-05-28' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (910, 342, 4, CAST(N'2017-05-26' AS Date), CAST(N'2017-05-28' AS Date), CAST(N'2017-05-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (911, 887, 4, CAST(N'2017-05-26' AS Date), CAST(N'2017-05-29' AS Date), CAST(N'2017-05-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (912, 519, 4, CAST(N'2017-05-27' AS Date), CAST(N'2017-05-29' AS Date), CAST(N'2017-05-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (913, 699, 4, CAST(N'2017-05-27' AS Date), CAST(N'2017-05-29' AS Date), CAST(N'2017-05-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (914, 1068, 4, CAST(N'2017-05-28' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-05-31' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (915, 215, 4, CAST(N'2017-05-28' AS Date), CAST(N'2017-05-30' AS Date), CAST(N'2017-05-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (916, 718, 4, CAST(N'2017-05-28' AS Date), CAST(N'2017-05-29' AS Date), CAST(N'2017-05-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (917, 881, 4, CAST(N'2017-05-29' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-06-01' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (918, 242, 4, CAST(N'2017-05-30' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-05-31' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (919, 781, 4, CAST(N'2017-05-30' AS Date), CAST(N'2017-05-31' AS Date), CAST(N'2017-05-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (920, 966, 4, CAST(N'2017-05-30' AS Date), CAST(N'2017-06-01' AS Date), CAST(N'2017-06-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (921, 628, 4, CAST(N'2017-05-31' AS Date), CAST(N'2017-06-02' AS Date), CAST(N'2017-06-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (922, 656, 4, CAST(N'2017-05-31' AS Date), CAST(N'2017-06-01' AS Date), CAST(N'2017-06-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (923, 769, 4, CAST(N'2017-05-31' AS Date), CAST(N'2017-06-03' AS Date), CAST(N'2017-06-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (924, 68, 3, CAST(N'2017-06-02' AS Date), CAST(N'2017-06-02' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (925, 1316, 4, CAST(N'2017-06-02' AS Date), CAST(N'2017-06-05' AS Date), CAST(N'2017-06-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (926, 233, 4, CAST(N'2017-06-03' AS Date), CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (927, 1438, 4, CAST(N'2017-06-03' AS Date), CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (928, 957, 4, CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), CAST(N'2017-06-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (929, 472, 4, CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), CAST(N'2017-06-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (930, 1224, 4, CAST(N'2017-06-05' AS Date), CAST(N'2017-06-06' AS Date), CAST(N'2017-06-06' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (931, 631, 4, CAST(N'2017-06-07' AS Date), CAST(N'2017-06-08' AS Date), CAST(N'2017-06-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (932, 804, 4, CAST(N'2017-06-07' AS Date), CAST(N'2017-06-08' AS Date), CAST(N'2017-06-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (933, 909, 4, CAST(N'2017-06-07' AS Date), CAST(N'2017-06-10' AS Date), CAST(N'2017-06-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (934, 93, 4, CAST(N'2017-06-09' AS Date), CAST(N'2017-06-10' AS Date), CAST(N'2017-06-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (935, 43, 3, CAST(N'2017-06-10' AS Date), CAST(N'2017-06-10' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (936, 265, 4, CAST(N'2017-06-10' AS Date), CAST(N'2017-06-13' AS Date), CAST(N'2017-06-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (937, 73, 4, CAST(N'2017-06-11' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (938, 129, 4, CAST(N'2017-06-11' AS Date), CAST(N'2017-06-12' AS Date), CAST(N'2017-06-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (939, 1407, 4, CAST(N'2017-06-11' AS Date), CAST(N'2017-06-12' AS Date), CAST(N'2017-06-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (940, 585, 4, CAST(N'2017-06-12' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-13' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (941, 736, 4, CAST(N'2017-06-12' AS Date), CAST(N'2017-06-14' AS Date), CAST(N'2017-06-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (942, 537, 4, CAST(N'2017-06-13' AS Date), CAST(N'2017-06-16' AS Date), CAST(N'2017-06-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (943, 1025, 4, CAST(N'2017-06-13' AS Date), CAST(N'2017-06-15' AS Date), CAST(N'2017-06-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (944, 138, 4, CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), CAST(N'2017-06-17' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (945, 167, 4, CAST(N'2017-06-14' AS Date), CAST(N'2017-06-15' AS Date), CAST(N'2017-06-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (946, 525, 4, CAST(N'2017-06-14' AS Date), CAST(N'2017-06-16' AS Date), CAST(N'2017-06-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (947, 278, 4, CAST(N'2017-06-15' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-17' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (948, 618, 4, CAST(N'2017-06-15' AS Date), CAST(N'2017-06-17' AS Date), CAST(N'2017-06-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (949, 867, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-17' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (950, 142, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (951, 339, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (952, 355, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (953, 658, 4, CAST(N'2017-06-16' AS Date), CAST(N'2017-06-18' AS Date), CAST(N'2017-06-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (954, 611, 4, CAST(N'2017-06-17' AS Date), CAST(N'2017-06-20' AS Date), CAST(N'2017-06-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (955, 880, 4, CAST(N'2017-06-17' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (956, 1184, 4, CAST(N'2017-06-17' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (957, 722, 4, CAST(N'2017-06-17' AS Date), CAST(N'2017-06-20' AS Date), CAST(N'2017-06-20' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (958, 1276, 4, CAST(N'2017-06-18' AS Date), CAST(N'2017-06-20' AS Date), CAST(N'2017-06-19' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (959, 650, 4, CAST(N'2017-06-18' AS Date), CAST(N'2017-06-21' AS Date), CAST(N'2017-06-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (960, 1390, 4, CAST(N'2017-06-18' AS Date), CAST(N'2017-06-19' AS Date), CAST(N'2017-06-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (961, 82, 4, CAST(N'2017-06-19' AS Date), CAST(N'2017-06-21' AS Date), CAST(N'2017-06-22' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (962, 570, 4, CAST(N'2017-06-19' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (963, 1432, 4, CAST(N'2017-06-19' AS Date), CAST(N'2017-06-21' AS Date), CAST(N'2017-06-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (964, 404, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (965, 457, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (966, 389, 4, CAST(N'2017-06-20' AS Date), CAST(N'2017-06-22' AS Date), CAST(N'2017-06-22' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (967, 1323, 4, CAST(N'2017-06-21' AS Date), CAST(N'2017-06-24' AS Date), CAST(N'2017-06-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (968, 1403, 4, CAST(N'2017-06-21' AS Date), CAST(N'2017-06-23' AS Date), CAST(N'2017-06-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (969, 248, 4, CAST(N'2017-06-21' AS Date), CAST(N'2017-06-24' AS Date), CAST(N'2017-06-22' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (970, 836, 4, CAST(N'2017-06-22' AS Date), CAST(N'2017-06-25' AS Date), CAST(N'2017-06-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (971, 1426, 4, CAST(N'2017-06-22' AS Date), CAST(N'2017-06-23' AS Date), CAST(N'2017-06-24' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (972, 270, 4, CAST(N'2017-06-23' AS Date), CAST(N'2017-06-24' AS Date), CAST(N'2017-06-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (973, 238, 4, CAST(N'2017-06-24' AS Date), CAST(N'2017-06-27' AS Date), CAST(N'2017-06-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (974, 511, 4, CAST(N'2017-06-24' AS Date), CAST(N'2017-06-27' AS Date), CAST(N'2017-06-27' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (975, 1092, 4, CAST(N'2017-06-25' AS Date), CAST(N'2017-06-27' AS Date), CAST(N'2017-06-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (976, 1266, 4, CAST(N'2017-06-25' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (977, 400, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (978, 1123, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (979, 1190, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-29' AS Date), CAST(N'2017-06-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (980, 328, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-27' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (981, 687, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-29' AS Date), CAST(N'2017-06-28' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (982, 1423, 4, CAST(N'2017-06-26' AS Date), CAST(N'2017-06-29' AS Date), CAST(N'2017-06-28' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (983, 1158, 4, CAST(N'2017-06-27' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (984, 1287, 4, CAST(N'2017-06-27' AS Date), CAST(N'2017-06-28' AS Date), CAST(N'2017-06-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (985, 461, 4, CAST(N'2017-06-30' AS Date), CAST(N'2017-07-02' AS Date), CAST(N'2017-07-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (986, 556, 4, CAST(N'2017-06-30' AS Date), CAST(N'2017-07-03' AS Date), CAST(N'2017-07-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (987, 172, 4, CAST(N'2017-07-02' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (988, 436, 4, CAST(N'2017-07-02' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (989, 1145, 4, CAST(N'2017-07-02' AS Date), CAST(N'2017-07-04' AS Date), CAST(N'2017-07-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (990, 706, 4, CAST(N'2017-07-04' AS Date), CAST(N'2017-07-07' AS Date), CAST(N'2017-07-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (991, 751, 4, CAST(N'2017-07-06' AS Date), CAST(N'2017-07-07' AS Date), CAST(N'2017-07-09' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (992, 723, 4, CAST(N'2017-07-07' AS Date), CAST(N'2017-07-10' AS Date), CAST(N'2017-07-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (993, 1415, 4, CAST(N'2017-07-09' AS Date), CAST(N'2017-07-11' AS Date), CAST(N'2017-07-11' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (994, 419, 4, CAST(N'2017-07-09' AS Date), CAST(N'2017-07-11' AS Date), CAST(N'2017-07-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (995, 621, 4, CAST(N'2017-07-11' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (996, 915, 4, CAST(N'2017-07-11' AS Date), CAST(N'2017-07-12' AS Date), CAST(N'2017-07-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (997, 485, 4, CAST(N'2017-07-11' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (998, 219, 4, CAST(N'2017-07-12' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (999, 590, 4, CAST(N'2017-07-12' AS Date), CAST(N'2017-07-13' AS Date), CAST(N'2017-07-14' AS Date), 2, 6)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1000, 645, 4, CAST(N'2017-07-12' AS Date), CAST(N'2017-07-14' AS Date), CAST(N'2017-07-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1001, 354, 4, CAST(N'2017-07-13' AS Date), CAST(N'2017-07-16' AS Date), CAST(N'2017-07-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1002, 1418, 4, CAST(N'2017-07-14' AS Date), CAST(N'2017-07-16' AS Date), CAST(N'2017-07-16' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1003, 503, 4, CAST(N'2017-07-14' AS Date), CAST(N'2017-07-16' AS Date), CAST(N'2017-07-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1004, 1389, 4, CAST(N'2017-07-14' AS Date), CAST(N'2017-07-17' AS Date), CAST(N'2017-07-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1005, 266, 4, CAST(N'2017-07-15' AS Date), CAST(N'2017-07-17' AS Date), CAST(N'2017-07-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1006, 1070, 4, CAST(N'2017-07-15' AS Date), CAST(N'2017-07-18' AS Date), CAST(N'2017-07-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1007, 1115, 4, CAST(N'2017-07-16' AS Date), CAST(N'2017-07-17' AS Date), CAST(N'2017-07-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1008, 1345, 4, CAST(N'2017-07-16' AS Date), CAST(N'2017-07-18' AS Date), CAST(N'2017-07-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1009, 1064, 4, CAST(N'2017-07-16' AS Date), CAST(N'2017-07-19' AS Date), CAST(N'2017-07-19' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1010, 8, 3, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-18' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1011, 495, 4, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-21' AS Date), CAST(N'2017-07-21' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1012, 620, 4, CAST(N'2017-07-18' AS Date), CAST(N'2017-07-20' AS Date), CAST(N'2017-07-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1013, 174, 4, CAST(N'2017-07-19' AS Date), CAST(N'2017-07-22' AS Date), CAST(N'2017-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1014, 748, 4, CAST(N'2017-07-19' AS Date), CAST(N'2017-07-21' AS Date), CAST(N'2017-07-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1015, 799, 4, CAST(N'2017-07-19' AS Date), CAST(N'2017-07-22' AS Date), CAST(N'2017-07-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1016, 1417, 4, CAST(N'2017-07-19' AS Date), CAST(N'2017-07-20' AS Date), CAST(N'2017-07-21' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1017, 168, 4, CAST(N'2017-07-20' AS Date), CAST(N'2017-07-21' AS Date), CAST(N'2017-07-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1018, 290, 4, CAST(N'2017-07-22' AS Date), CAST(N'2017-07-23' AS Date), CAST(N'2017-07-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1019, 408, 4, CAST(N'2017-07-22' AS Date), CAST(N'2017-07-23' AS Date), CAST(N'2017-07-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1020, 16, 3, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-23' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1021, 125, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-24' AS Date), CAST(N'2017-07-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1022, 353, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-26' AS Date), CAST(N'2017-07-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1023, 356, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-26' AS Date), CAST(N'2017-07-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1024, 837, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-25' AS Date), CAST(N'2017-07-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1025, 1304, 4, CAST(N'2017-07-23' AS Date), CAST(N'2017-07-26' AS Date), CAST(N'2017-07-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1026, 1370, 4, CAST(N'2017-07-26' AS Date), CAST(N'2017-07-28' AS Date), CAST(N'2017-07-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1027, 588, 4, CAST(N'2017-07-26' AS Date), CAST(N'2017-07-28' AS Date), CAST(N'2017-07-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1028, 1273, 4, CAST(N'2017-07-27' AS Date), CAST(N'2017-07-28' AS Date), CAST(N'2017-07-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1029, 407, 4, CAST(N'2017-07-29' AS Date), CAST(N'2017-07-30' AS Date), CAST(N'2017-08-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1030, 161, 4, CAST(N'2017-07-29' AS Date), CAST(N'2017-07-30' AS Date), CAST(N'2017-07-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1031, 1308, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-08-01' AS Date), CAST(N'2017-08-02' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1032, 429, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-08-02' AS Date), CAST(N'2017-08-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1033, 582, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-07-31' AS Date), CAST(N'2017-08-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1034, 895, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-07-31' AS Date), CAST(N'2017-07-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1035, 1283, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-08-02' AS Date), CAST(N'2017-08-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1036, 1442, 4, CAST(N'2017-07-30' AS Date), CAST(N'2017-08-01' AS Date), CAST(N'2017-07-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1037, 1229, 4, CAST(N'2017-07-31' AS Date), CAST(N'2017-08-02' AS Date), CAST(N'2017-08-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1038, 1281, 4, CAST(N'2017-07-31' AS Date), CAST(N'2017-08-01' AS Date), CAST(N'2017-08-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1039, 1077, 4, CAST(N'2017-08-02' AS Date), CAST(N'2017-08-04' AS Date), CAST(N'2017-08-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1040, 1225, 4, CAST(N'2017-08-04' AS Date), CAST(N'2017-08-07' AS Date), CAST(N'2017-08-05' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1041, 70, 4, CAST(N'2017-08-04' AS Date), CAST(N'2017-08-06' AS Date), CAST(N'2017-08-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1042, 539, 4, CAST(N'2017-08-06' AS Date), CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1043, 1235, 4, CAST(N'2017-08-06' AS Date), CAST(N'2017-08-09' AS Date), CAST(N'2017-08-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1044, 1270, 4, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-10' AS Date), CAST(N'2017-08-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1045, 185, 4, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-09' AS Date), CAST(N'2017-08-10' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1046, 1134, 4, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-09' AS Date), CAST(N'2017-08-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1047, 116, 3, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1048, 777, 4, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-10' AS Date), CAST(N'2017-08-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1049, 194, 4, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-11' AS Date), CAST(N'2017-08-10' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1050, 239, 4, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-12' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1051, 209, 4, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1052, 460, 4, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1053, 1439, 4, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-11' AS Date), CAST(N'2017-08-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1054, 189, 4, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-12' AS Date), CAST(N'2017-08-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1055, 140, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1056, 325, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1057, 456, 4, CAST(N'2017-08-12' AS Date), CAST(N'2017-08-15' AS Date), CAST(N'2017-08-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1058, 782, 4, CAST(N'2017-08-13' AS Date), CAST(N'2017-08-16' AS Date), CAST(N'2017-08-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1059, 6, 4, CAST(N'2017-08-14' AS Date), CAST(N'2017-08-17' AS Date), CAST(N'2017-08-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1060, 182, 4, CAST(N'2017-08-15' AS Date), CAST(N'2017-08-18' AS Date), CAST(N'2017-08-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1061, 655, 4, CAST(N'2017-08-15' AS Date), CAST(N'2017-08-18' AS Date), CAST(N'2017-08-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1062, 1210, 4, CAST(N'2017-08-15' AS Date), CAST(N'2017-08-17' AS Date), CAST(N'2017-08-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1063, 198, 4, CAST(N'2017-08-16' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1064, 898, 4, CAST(N'2017-08-16' AS Date), CAST(N'2017-08-18' AS Date), CAST(N'2017-08-19' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1065, 25, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1066, 106, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1067, 225, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1068, 453, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1069, 493, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1070, 596, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1071, 602, 4, CAST(N'2017-08-17' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-18' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1072, 47, 3, CAST(N'2017-08-18' AS Date), CAST(N'2017-08-18' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1073, 911, 4, CAST(N'2017-08-18' AS Date), CAST(N'2017-08-19' AS Date), CAST(N'2017-08-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1074, 11, 3, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-19' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1075, 1003, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-21' AS Date), CAST(N'2017-08-22' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1076, 42, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-22' AS Date), CAST(N'2017-08-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1077, 412, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1078, 793, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-21' AS Date), CAST(N'2017-08-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1079, 812, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1080, 1086, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-20' AS Date), CAST(N'2017-08-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1081, 1106, 4, CAST(N'2017-08-19' AS Date), CAST(N'2017-08-22' AS Date), CAST(N'2017-08-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1082, 1327, 4, CAST(N'2017-08-20' AS Date), CAST(N'2017-08-22' AS Date), CAST(N'2017-08-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1083, 1372, 4, CAST(N'2017-08-20' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1084, 2, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-24' AS Date), CAST(N'2017-08-23' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1085, 305, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1086, 220, 4, CAST(N'2017-08-21' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1087, 675, 4, CAST(N'2017-08-22' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-25' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1088, 1160, 4, CAST(N'2017-08-22' AS Date), CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1089, 46, 3, CAST(N'2017-08-23' AS Date), CAST(N'2017-08-23' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1090, 1427, 4, CAST(N'2017-08-24' AS Date), CAST(N'2017-08-26' AS Date), CAST(N'2017-08-26' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1091, 1260, 4, CAST(N'2017-08-24' AS Date), CAST(N'2017-08-25' AS Date), CAST(N'2017-08-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1092, 40, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1093, 326, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-26' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1094, 828, 4, CAST(N'2017-08-25' AS Date), CAST(N'2017-08-27' AS Date), CAST(N'2017-08-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1095, 1382, 4, CAST(N'2017-08-26' AS Date), CAST(N'2017-08-28' AS Date), CAST(N'2017-08-27' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1096, 589, 4, CAST(N'2017-08-27' AS Date), CAST(N'2017-08-29' AS Date), CAST(N'2017-08-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1097, 1311, 4, CAST(N'2017-08-27' AS Date), CAST(N'2017-08-30' AS Date), CAST(N'2017-08-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1098, 752, 4, CAST(N'2017-08-28' AS Date), CAST(N'2017-08-30' AS Date), CAST(N'2017-08-30' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1099, 1128, 4, CAST(N'2017-08-28' AS Date), CAST(N'2017-08-29' AS Date), CAST(N'2017-08-30' AS Date), 2, 6)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1100, 1392, 4, CAST(N'2017-08-28' AS Date), CAST(N'2017-08-29' AS Date), CAST(N'2017-08-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1101, 379, 4, CAST(N'2017-08-29' AS Date), CAST(N'2017-08-30' AS Date), CAST(N'2017-08-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1102, 1317, 4, CAST(N'2017-08-29' AS Date), CAST(N'2017-08-31' AS Date), CAST(N'2017-08-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1103, 1394, 4, CAST(N'2017-08-31' AS Date), CAST(N'2017-09-02' AS Date), CAST(N'2017-09-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1104, 268, 4, CAST(N'2017-09-01' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1105, 747, 4, CAST(N'2017-09-01' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-03' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1106, 1009, 4, CAST(N'2017-09-02' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1107, 1424, 4, CAST(N'2017-09-02' AS Date), CAST(N'2017-09-05' AS Date), CAST(N'2017-09-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1108, 735, 4, CAST(N'2017-09-03' AS Date), CAST(N'2017-09-05' AS Date), CAST(N'2017-09-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1109, 23, 4, CAST(N'2017-09-03' AS Date), CAST(N'2017-09-04' AS Date), CAST(N'2017-09-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1110, 912, 4, CAST(N'2017-09-04' AS Date), CAST(N'2017-09-07' AS Date), CAST(N'2017-09-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1111, 930, 4, CAST(N'2017-09-04' AS Date), CAST(N'2017-09-06' AS Date), CAST(N'2017-09-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1112, 798, 4, CAST(N'2017-09-05' AS Date), CAST(N'2017-09-08' AS Date), CAST(N'2017-09-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1113, 388, 4, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-08' AS Date), CAST(N'2017-09-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1114, 1036, 4, CAST(N'2017-09-06' AS Date), CAST(N'2017-09-08' AS Date), CAST(N'2017-09-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1115, 1100, 4, CAST(N'2017-09-07' AS Date), CAST(N'2017-09-09' AS Date), CAST(N'2017-09-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1116, 52, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-10' AS Date), CAST(N'2017-09-10' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1117, 334, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-10' AS Date), CAST(N'2017-09-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1118, 1023, 4, CAST(N'2017-09-08' AS Date), CAST(N'2017-09-11' AS Date), CAST(N'2017-09-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1119, 749, 4, CAST(N'2017-09-10' AS Date), CAST(N'2017-09-12' AS Date), CAST(N'2017-09-13' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1120, 1269, 4, CAST(N'2017-09-10' AS Date), CAST(N'2017-09-12' AS Date), CAST(N'2017-09-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1121, 143, 4, CAST(N'2017-09-11' AS Date), CAST(N'2017-09-13' AS Date), CAST(N'2017-09-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1122, 1132, 4, CAST(N'2017-09-12' AS Date), CAST(N'2017-09-14' AS Date), CAST(N'2017-09-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1123, 598, 4, CAST(N'2017-09-13' AS Date), CAST(N'2017-09-14' AS Date), CAST(N'2017-09-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1124, 275, 4, CAST(N'2017-09-13' AS Date), CAST(N'2017-09-14' AS Date), CAST(N'2017-09-16' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1125, 945, 4, CAST(N'2017-09-14' AS Date), CAST(N'2017-09-15' AS Date), CAST(N'2017-09-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1126, 1213, 4, CAST(N'2017-09-14' AS Date), CAST(N'2017-09-16' AS Date), CAST(N'2017-09-15' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1127, 494, 4, CAST(N'2017-09-15' AS Date), CAST(N'2017-09-16' AS Date), CAST(N'2017-09-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1128, 936, 4, CAST(N'2017-09-15' AS Date), CAST(N'2017-09-17' AS Date), CAST(N'2017-09-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1129, 663, 4, CAST(N'2017-09-17' AS Date), CAST(N'2017-09-18' AS Date), CAST(N'2017-09-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1130, 69, 4, CAST(N'2017-09-18' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1131, 1178, 4, CAST(N'2017-09-18' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-19' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1132, 351, 4, CAST(N'2017-09-19' AS Date), CAST(N'2017-09-20' AS Date), CAST(N'2017-09-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1133, 517, 4, CAST(N'2017-09-19' AS Date), CAST(N'2017-09-21' AS Date), CAST(N'2017-09-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1134, 978, 4, CAST(N'2017-09-19' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1135, 1347, 4, CAST(N'2017-09-19' AS Date), CAST(N'2017-09-21' AS Date), CAST(N'2017-09-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1136, 1050, 4, CAST(N'2017-09-20' AS Date), CAST(N'2017-09-21' AS Date), CAST(N'2017-09-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1137, 810, 4, CAST(N'2017-09-20' AS Date), CAST(N'2017-09-23' AS Date), CAST(N'2017-09-23' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1138, 254, 4, CAST(N'2017-09-21' AS Date), CAST(N'2017-09-23' AS Date), CAST(N'2017-09-22' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1139, 1006, 4, CAST(N'2017-09-21' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-23' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1140, 1063, 4, CAST(N'2017-09-21' AS Date), CAST(N'2017-09-22' AS Date), CAST(N'2017-09-22' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1141, 1076, 4, CAST(N'2017-09-22' AS Date), CAST(N'2017-09-23' AS Date), CAST(N'2017-09-24' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1142, 554, 4, CAST(N'2017-09-23' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-26' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1143, 1087, 4, CAST(N'2017-09-24' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-27' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1144, 1414, 4, CAST(N'2017-09-24' AS Date), CAST(N'2017-09-27' AS Date), CAST(N'2017-09-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1145, 617, 4, CAST(N'2017-09-25' AS Date), CAST(N'2017-09-27' AS Date), CAST(N'2017-09-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1146, 757, 4, CAST(N'2017-09-25' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1147, 1344, 4, CAST(N'2017-09-25' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1148, 1379, 4, CAST(N'2017-09-25' AS Date), CAST(N'2017-09-26' AS Date), CAST(N'2017-09-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1149, 787, 4, CAST(N'2017-09-27' AS Date), CAST(N'2017-09-30' AS Date), CAST(N'2017-09-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1150, 1183, 4, CAST(N'2017-09-28' AS Date), CAST(N'2017-10-01' AS Date), CAST(N'2017-09-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1151, 708, 4, CAST(N'2017-09-29' AS Date), CAST(N'2017-09-30' AS Date), CAST(N'2017-09-30' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1152, 1244, 4, CAST(N'2017-09-29' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'2017-10-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1153, 720, 4, CAST(N'2017-09-30' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1154, 789, 4, CAST(N'2017-09-30' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1155, 865, 4, CAST(N'2017-09-30' AS Date), CAST(N'2017-10-01' AS Date), CAST(N'2017-10-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1156, 869, 4, CAST(N'2017-09-30' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1157, 24, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-04' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1158, 889, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-02' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1159, 1221, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'2017-10-03' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1160, 1262, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'2017-10-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1161, 41, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-04' AS Date), CAST(N'2017-10-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1162, 888, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1163, 934, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'2017-10-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1164, 1067, 4, CAST(N'2017-10-01' AS Date), CAST(N'2017-10-02' AS Date), CAST(N'2017-10-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1165, 652, 4, CAST(N'2017-10-02' AS Date), CAST(N'2017-10-03' AS Date), CAST(N'2017-10-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1166, 286, 4, CAST(N'2017-10-03' AS Date), CAST(N'2017-10-04' AS Date), CAST(N'2017-10-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1167, 900, 4, CAST(N'2017-10-04' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-06' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1168, 1031, 4, CAST(N'2017-10-04' AS Date), CAST(N'2017-10-05' AS Date), CAST(N'2017-10-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1169, 1421, 4, CAST(N'2017-10-04' AS Date), CAST(N'2017-10-06' AS Date), CAST(N'2017-10-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1170, 534, 4, CAST(N'2017-10-05' AS Date), CAST(N'2017-10-07' AS Date), CAST(N'2017-10-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1171, 826, 4, CAST(N'2017-10-05' AS Date), CAST(N'2017-10-06' AS Date), CAST(N'2017-10-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1172, 1339, 4, CAST(N'2017-10-07' AS Date), CAST(N'2017-10-10' AS Date), CAST(N'2017-10-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1173, 548, 4, CAST(N'2017-10-08' AS Date), CAST(N'2017-10-10' AS Date), CAST(N'2017-10-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1174, 1109, 4, CAST(N'2017-10-08' AS Date), CAST(N'2017-10-10' AS Date), CAST(N'2017-10-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1175, 292, 4, CAST(N'2017-10-09' AS Date), CAST(N'2017-10-11' AS Date), CAST(N'2017-10-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1176, 1111, 4, CAST(N'2017-10-10' AS Date), CAST(N'2017-10-13' AS Date), CAST(N'2017-10-11' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1177, 21, 3, CAST(N'2017-10-12' AS Date), CAST(N'2017-10-12' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1178, 771, 4, CAST(N'2017-10-12' AS Date), CAST(N'2017-10-15' AS Date), CAST(N'2017-10-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1179, 1150, 4, CAST(N'2017-10-12' AS Date), CAST(N'2017-10-15' AS Date), CAST(N'2017-10-15' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1180, 1065, 4, CAST(N'2017-10-13' AS Date), CAST(N'2017-10-16' AS Date), CAST(N'2017-10-16' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1181, 1022, 4, CAST(N'2017-10-13' AS Date), CAST(N'2017-10-16' AS Date), CAST(N'2017-10-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1182, 1422, 4, CAST(N'2017-10-13' AS Date), CAST(N'2017-10-14' AS Date), CAST(N'2017-10-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1183, 216, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-17' AS Date), CAST(N'2017-10-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1184, 369, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-15' AS Date), CAST(N'2017-10-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1185, 960, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-16' AS Date), CAST(N'2017-10-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1186, 1120, 4, CAST(N'2017-10-14' AS Date), CAST(N'2017-10-16' AS Date), CAST(N'2017-10-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1187, 486, 4, CAST(N'2017-10-15' AS Date), CAST(N'2017-10-18' AS Date), CAST(N'2017-10-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1188, 647, 4, CAST(N'2017-10-15' AS Date), CAST(N'2017-10-18' AS Date), CAST(N'2017-10-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1189, 1090, 4, CAST(N'2017-10-15' AS Date), CAST(N'2017-10-17' AS Date), CAST(N'2017-10-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1190, 34, 4, CAST(N'2017-10-16' AS Date), CAST(N'2017-10-19' AS Date), CAST(N'2017-10-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1191, 186, 4, CAST(N'2017-10-17' AS Date), CAST(N'2017-10-18' AS Date), CAST(N'2017-10-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1192, 1114, 4, CAST(N'2017-10-17' AS Date), CAST(N'2017-10-19' AS Date), CAST(N'2017-10-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1193, 1412, 4, CAST(N'2017-10-17' AS Date), CAST(N'2017-10-19' AS Date), CAST(N'2017-10-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1194, 192, 4, CAST(N'2017-10-19' AS Date), CAST(N'2017-10-22' AS Date), CAST(N'2017-10-22' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1195, 229, 4, CAST(N'2017-10-19' AS Date), CAST(N'2017-10-21' AS Date), CAST(N'2017-10-21' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1196, 508, 4, CAST(N'2017-10-19' AS Date), CAST(N'2017-10-21' AS Date), CAST(N'2017-10-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1197, 269, 4, CAST(N'2017-10-21' AS Date), CAST(N'2017-10-23' AS Date), CAST(N'2017-10-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1198, 1289, 4, CAST(N'2017-10-22' AS Date), CAST(N'2017-10-24' AS Date), CAST(N'2017-10-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1199, 318, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), CAST(N'2017-10-26' AS Date), 1, 2)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1200, 48, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-25' AS Date), CAST(N'2017-10-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1201, 201, 4, CAST(N'2017-10-23' AS Date), CAST(N'2017-10-24' AS Date), CAST(N'2017-10-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1202, 593, 4, CAST(N'2017-10-24' AS Date), CAST(N'2017-10-25' AS Date), CAST(N'2017-10-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1203, 1191, 4, CAST(N'2017-10-25' AS Date), CAST(N'2017-10-27' AS Date), CAST(N'2017-10-26' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1204, 1277, 4, CAST(N'2017-10-25' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1205, 1091, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-28' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1206, 222, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-29' AS Date), CAST(N'2017-10-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1207, 1002, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1208, 1226, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1209, 1342, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-27' AS Date), CAST(N'2017-10-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1210, 730, 4, CAST(N'2017-10-26' AS Date), CAST(N'2017-10-27' AS Date), CAST(N'2017-10-29' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1211, 19, 4, CAST(N'2017-10-27' AS Date), CAST(N'2017-10-28' AS Date), CAST(N'2017-10-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1212, 213, 4, CAST(N'2017-10-27' AS Date), CAST(N'2017-10-30' AS Date), CAST(N'2017-10-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1213, 669, 4, CAST(N'2017-10-27' AS Date), CAST(N'2017-10-29' AS Date), CAST(N'2017-10-29' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1214, 783, 4, CAST(N'2017-10-28' AS Date), CAST(N'2017-10-29' AS Date), CAST(N'2017-10-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1215, 807, 4, CAST(N'2017-10-28' AS Date), CAST(N'2017-10-31' AS Date), CAST(N'2017-10-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1216, 886, 4, CAST(N'2017-10-28' AS Date), CAST(N'2017-10-30' AS Date), CAST(N'2017-10-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1217, 1155, 4, CAST(N'2017-10-28' AS Date), CAST(N'2017-10-31' AS Date), CAST(N'2017-10-30' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1218, 1017, 4, CAST(N'2017-10-30' AS Date), CAST(N'2017-11-01' AS Date), CAST(N'2017-10-31' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1219, 840, 4, CAST(N'2017-10-30' AS Date), CAST(N'2017-11-02' AS Date), CAST(N'2017-11-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1220, 803, 4, CAST(N'2017-10-31' AS Date), CAST(N'2017-11-03' AS Date), CAST(N'2017-11-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1221, 1290, 4, CAST(N'2017-10-31' AS Date), CAST(N'2017-11-02' AS Date), CAST(N'2017-11-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1222, 482, 4, CAST(N'2017-11-01' AS Date), CAST(N'2017-11-04' AS Date), CAST(N'2017-11-03' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1223, 1207, 4, CAST(N'2017-11-02' AS Date), CAST(N'2017-11-03' AS Date), CAST(N'2017-11-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1224, 544, 4, CAST(N'2017-11-03' AS Date), CAST(N'2017-11-04' AS Date), CAST(N'2017-11-04' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1225, 768, 4, CAST(N'2017-11-04' AS Date), CAST(N'2017-11-05' AS Date), CAST(N'2017-11-07' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1226, 226, 4, CAST(N'2017-11-04' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1227, 702, 4, CAST(N'2017-11-04' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1228, 1041, 4, CAST(N'2017-11-04' AS Date), CAST(N'2017-11-06' AS Date), CAST(N'2017-11-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1229, 89, 4, CAST(N'2017-11-05' AS Date), CAST(N'2017-11-08' AS Date), CAST(N'2017-11-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1230, 1107, 4, CAST(N'2017-11-05' AS Date), CAST(N'2017-11-06' AS Date), CAST(N'2017-11-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1231, 1180, 4, CAST(N'2017-11-05' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-06' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1232, 665, 4, CAST(N'2017-11-06' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-09' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1233, 462, 4, CAST(N'2017-11-06' AS Date), CAST(N'2017-11-07' AS Date), CAST(N'2017-11-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1234, 19, 3, CAST(N'2017-11-07' AS Date), CAST(N'2017-11-07' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1235, 210, 4, CAST(N'2017-11-07' AS Date), CAST(N'2017-11-08' AS Date), CAST(N'2017-11-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1236, 243, 4, CAST(N'2017-11-08' AS Date), CAST(N'2017-11-11' AS Date), CAST(N'2017-11-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1237, 571, 4, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-12' AS Date), CAST(N'2017-11-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1238, 998, 4, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-10' AS Date), CAST(N'2017-11-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1239, 1197, 4, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-10' AS Date), CAST(N'2017-11-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1240, 903, 4, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-11' AS Date), CAST(N'2017-11-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1241, 1170, 4, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-12' AS Date), CAST(N'2017-11-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1242, 303, 4, CAST(N'2017-11-11' AS Date), CAST(N'2017-11-12' AS Date), CAST(N'2017-11-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1243, 346, 4, CAST(N'2017-11-11' AS Date), CAST(N'2017-11-13' AS Date), CAST(N'2017-11-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1244, 333, 4, CAST(N'2017-11-12' AS Date), CAST(N'2017-11-14' AS Date), CAST(N'2017-11-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1245, 1166, 4, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-16' AS Date), CAST(N'2017-11-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1246, 1329, 4, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-16' AS Date), CAST(N'2017-11-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1247, 426, 4, CAST(N'2017-11-16' AS Date), CAST(N'2017-11-18' AS Date), CAST(N'2017-11-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1248, 1367, 4, CAST(N'2017-11-16' AS Date), CAST(N'2017-11-17' AS Date), CAST(N'2017-11-18' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1249, 545, 4, CAST(N'2017-11-17' AS Date), CAST(N'2017-11-18' AS Date), CAST(N'2017-11-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1250, 1188, 4, CAST(N'2017-11-17' AS Date), CAST(N'2017-11-19' AS Date), CAST(N'2017-11-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1251, 289, 4, CAST(N'2017-11-17' AS Date), CAST(N'2017-11-19' AS Date), CAST(N'2017-11-19' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1252, 110, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-21' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1253, 44, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1254, 1098, 4, CAST(N'2017-11-18' AS Date), CAST(N'2017-11-19' AS Date), CAST(N'2017-11-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1255, 375, 4, CAST(N'2017-11-19' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1256, 458, 4, CAST(N'2017-11-19' AS Date), CAST(N'2017-11-20' AS Date), CAST(N'2017-11-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1257, 1136, 4, CAST(N'2017-11-19' AS Date), CAST(N'2017-11-22' AS Date), CAST(N'2017-11-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1258, 1099, 4, CAST(N'2017-11-20' AS Date), CAST(N'2017-11-21' AS Date), CAST(N'2017-11-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1259, 4, 3, CAST(N'2017-11-21' AS Date), CAST(N'2017-11-21' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1260, 1117, 4, CAST(N'2017-11-22' AS Date), CAST(N'2017-11-23' AS Date), CAST(N'2017-11-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1261, 435, 4, CAST(N'2017-11-23' AS Date), CAST(N'2017-11-25' AS Date), CAST(N'2017-11-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1262, 509, 4, CAST(N'2017-11-23' AS Date), CAST(N'2017-11-26' AS Date), CAST(N'2017-11-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1263, 1408, 4, CAST(N'2017-11-23' AS Date), CAST(N'2017-11-26' AS Date), CAST(N'2017-11-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1264, 113, 4, CAST(N'2017-11-24' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'2017-11-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1265, 950, 4, CAST(N'2017-11-24' AS Date), CAST(N'2017-11-27' AS Date), CAST(N'2017-11-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1266, 387, 4, CAST(N'2017-11-25' AS Date), CAST(N'2017-11-28' AS Date), CAST(N'2017-11-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1267, 467, 4, CAST(N'2017-11-25' AS Date), CAST(N'2017-11-26' AS Date), CAST(N'2017-11-26' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1268, 774, 4, CAST(N'2017-11-26' AS Date), CAST(N'2017-11-28' AS Date), CAST(N'2017-11-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1269, 1236, 4, CAST(N'2017-11-26' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'2017-11-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1270, 1388, 4, CAST(N'2017-11-26' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'2017-11-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1271, 734, 4, CAST(N'2017-11-27' AS Date), CAST(N'2017-11-30' AS Date), CAST(N'2017-11-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1272, 935, 4, CAST(N'2017-11-27' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'2017-11-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1273, 1268, 4, CAST(N'2017-11-27' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'2017-11-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1274, 1364, 4, CAST(N'2017-11-28' AS Date), CAST(N'2017-11-29' AS Date), CAST(N'2017-12-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1275, 165, 4, CAST(N'2017-11-29' AS Date), CAST(N'2017-12-01' AS Date), CAST(N'2017-11-30' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1276, 893, 4, CAST(N'2017-11-30' AS Date), CAST(N'2017-12-03' AS Date), CAST(N'2017-12-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1277, 227, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-04' AS Date), CAST(N'2017-12-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1278, 980, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-02' AS Date), CAST(N'2017-12-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1279, 1014, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-04' AS Date), CAST(N'2017-12-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1280, 123, 4, CAST(N'2017-12-01' AS Date), CAST(N'2017-12-03' AS Date), CAST(N'2017-12-03' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1281, 1060, 4, CAST(N'2017-12-02' AS Date), CAST(N'2017-12-05' AS Date), CAST(N'2017-12-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1282, 320, 4, CAST(N'2017-12-03' AS Date), CAST(N'2017-12-05' AS Date), CAST(N'2017-12-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1283, 85, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1284, 128, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-06' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1285, 262, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1286, 1033, 4, CAST(N'2017-12-04' AS Date), CAST(N'2017-12-07' AS Date), CAST(N'2017-12-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1287, 279, 4, CAST(N'2017-12-07' AS Date), CAST(N'2017-12-10' AS Date), CAST(N'2017-12-09' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1288, 778, 4, CAST(N'2017-12-07' AS Date), CAST(N'2017-12-10' AS Date), CAST(N'2017-12-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1289, 1292, 4, CAST(N'2017-12-08' AS Date), CAST(N'2017-12-11' AS Date), CAST(N'2017-12-10' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1290, 967, 4, CAST(N'2017-12-08' AS Date), CAST(N'2017-12-10' AS Date), CAST(N'2017-12-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1291, 1284, 4, CAST(N'2017-12-09' AS Date), CAST(N'2017-12-11' AS Date), CAST(N'2017-12-12' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1292, 285, 4, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-13' AS Date), CAST(N'2017-12-11' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1293, 1401, 4, CAST(N'2017-12-10' AS Date), CAST(N'2017-12-12' AS Date), CAST(N'2017-12-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1294, 947, 4, CAST(N'2017-12-11' AS Date), CAST(N'2017-12-13' AS Date), CAST(N'2017-12-14' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1295, 37, 4, CAST(N'2017-12-11' AS Date), CAST(N'2017-12-12' AS Date), CAST(N'2017-12-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1296, 231, 4, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-15' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1297, 108, 4, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1298, 533, 4, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-16' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1299, 1216, 4, CAST(N'2017-12-15' AS Date), CAST(N'2017-12-18' AS Date), CAST(N'2017-12-16' AS Date), 1, 2)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1300, 824, 4, CAST(N'2017-12-15' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1301, 1088, 4, CAST(N'2017-12-16' AS Date), CAST(N'2017-12-19' AS Date), CAST(N'2017-12-19' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1302, 322, 4, CAST(N'2017-12-16' AS Date), CAST(N'2017-12-18' AS Date), CAST(N'2017-12-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1303, 878, 4, CAST(N'2017-12-16' AS Date), CAST(N'2017-12-19' AS Date), CAST(N'2017-12-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1304, 1409, 4, CAST(N'2017-12-16' AS Date), CAST(N'2017-12-17' AS Date), CAST(N'2017-12-17' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1305, 257, 4, CAST(N'2017-12-17' AS Date), CAST(N'2017-12-19' AS Date), CAST(N'2017-12-18' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1306, 28, 4, CAST(N'2017-12-20' AS Date), CAST(N'2017-12-21' AS Date), CAST(N'2017-12-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1307, 1384, 4, CAST(N'2017-12-22' AS Date), CAST(N'2017-12-23' AS Date), CAST(N'2017-12-25' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1308, 713, 4, CAST(N'2017-12-22' AS Date), CAST(N'2017-12-24' AS Date), CAST(N'2017-12-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1309, 821, 4, CAST(N'2017-12-22' AS Date), CAST(N'2017-12-25' AS Date), CAST(N'2017-12-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1310, 444, 4, CAST(N'2017-12-24' AS Date), CAST(N'2017-12-25' AS Date), CAST(N'2017-12-26' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1311, 1021, 4, CAST(N'2017-12-24' AS Date), CAST(N'2017-12-26' AS Date), CAST(N'2017-12-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1312, 311, 4, CAST(N'2017-12-25' AS Date), CAST(N'2017-12-28' AS Date), CAST(N'2017-12-26' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1313, 1294, 4, CAST(N'2017-12-25' AS Date), CAST(N'2017-12-27' AS Date), CAST(N'2017-12-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1314, 1027, 4, CAST(N'2017-12-25' AS Date), CAST(N'2017-12-26' AS Date), CAST(N'2017-12-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1315, 931, 4, CAST(N'2017-12-25' AS Date), CAST(N'2017-12-27' AS Date), CAST(N'2017-12-28' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1316, 846, 4, CAST(N'2017-12-26' AS Date), CAST(N'2017-12-29' AS Date), CAST(N'2017-12-27' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1317, 418, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-28' AS Date), CAST(N'2017-12-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1318, 75, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1319, 604, 4, CAST(N'2017-12-27' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1320, 244, 4, CAST(N'2017-12-28' AS Date), CAST(N'2017-12-30' AS Date), CAST(N'2017-12-29' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1321, 217, 4, CAST(N'2017-12-30' AS Date), CAST(N'2017-12-31' AS Date), CAST(N'2017-12-31' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1322, 39, 4, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-02' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1323, 273, 4, CAST(N'2017-12-31' AS Date), CAST(N'2018-01-01' AS Date), CAST(N'2018-01-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1324, 862, 4, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-04' AS Date), CAST(N'2018-01-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1325, 68, 4, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-02' AS Date), CAST(N'2018-01-03' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1326, 567, 4, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-02' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1327, 1026, 4, CAST(N'2018-01-02' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1328, 1083, 4, CAST(N'2018-01-02' AS Date), CAST(N'2018-01-03' AS Date), CAST(N'2018-01-03' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1329, 443, 4, CAST(N'2018-01-04' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-06' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1330, 761, 4, CAST(N'2018-01-04' AS Date), CAST(N'2018-01-05' AS Date), CAST(N'2018-01-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1331, 1122, 4, CAST(N'2018-01-05' AS Date), CAST(N'2018-01-06' AS Date), CAST(N'2018-01-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1332, 256, 4, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-07' AS Date), CAST(N'2018-01-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1333, 203, 4, CAST(N'2018-01-06' AS Date), CAST(N'2018-01-07' AS Date), CAST(N'2018-01-07' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1334, 425, 4, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-09' AS Date), CAST(N'2018-01-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1335, 955, 4, CAST(N'2018-01-07' AS Date), CAST(N'2018-01-08' AS Date), CAST(N'2018-01-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1336, 904, 4, CAST(N'2018-01-09' AS Date), CAST(N'2018-01-10' AS Date), CAST(N'2018-01-12' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1337, 970, 4, CAST(N'2018-01-09' AS Date), CAST(N'2018-01-12' AS Date), CAST(N'2018-01-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1338, 905, 4, CAST(N'2018-01-10' AS Date), CAST(N'2018-01-11' AS Date), CAST(N'2018-01-13' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1339, 580, 4, CAST(N'2018-01-11' AS Date), CAST(N'2018-01-14' AS Date), CAST(N'2018-01-13' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1340, 1066, 4, CAST(N'2018-01-12' AS Date), CAST(N'2018-01-13' AS Date), CAST(N'2018-01-13' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1341, 1258, 4, CAST(N'2018-01-12' AS Date), CAST(N'2018-01-13' AS Date), CAST(N'2018-01-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1342, 1393, 4, CAST(N'2018-01-12' AS Date), CAST(N'2018-01-13' AS Date), CAST(N'2018-01-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1343, 594, 4, CAST(N'2018-01-13' AS Date), CAST(N'2018-01-15' AS Date), CAST(N'2018-01-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1344, 916, 4, CAST(N'2018-01-13' AS Date), CAST(N'2018-01-16' AS Date), CAST(N'2018-01-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1345, 1037, 4, CAST(N'2018-01-14' AS Date), CAST(N'2018-01-15' AS Date), CAST(N'2018-01-15' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1346, 136, 4, CAST(N'2018-01-14' AS Date), CAST(N'2018-01-15' AS Date), CAST(N'2018-01-15' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1347, 247, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-18' AS Date), CAST(N'2018-01-18' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1348, 1214, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-17' AS Date), CAST(N'2018-01-17' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1349, 464, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-17' AS Date), CAST(N'2018-01-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1350, 637, 4, CAST(N'2018-01-15' AS Date), CAST(N'2018-01-18' AS Date), CAST(N'2018-01-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1351, 1016, 4, CAST(N'2018-01-16' AS Date), CAST(N'2018-01-19' AS Date), CAST(N'2018-01-19' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1352, 1433, 4, CAST(N'2018-01-16' AS Date), CAST(N'2018-01-18' AS Date), CAST(N'2018-01-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1353, 502, 4, CAST(N'2018-01-17' AS Date), CAST(N'2018-01-19' AS Date), CAST(N'2018-01-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1354, 476, 4, CAST(N'2018-01-19' AS Date), CAST(N'2018-01-20' AS Date), CAST(N'2018-01-21' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1355, 1010, 4, CAST(N'2018-01-19' AS Date), CAST(N'2018-01-21' AS Date), CAST(N'2018-01-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1356, 1161, 4, CAST(N'2018-01-19' AS Date), CAST(N'2018-01-21' AS Date), CAST(N'2018-01-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1357, 440, 4, CAST(N'2018-01-20' AS Date), CAST(N'2018-01-23' AS Date), CAST(N'2018-01-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1358, 253, 4, CAST(N'2018-01-21' AS Date), CAST(N'2018-01-23' AS Date), CAST(N'2018-01-24' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1359, 1008, 4, CAST(N'2018-01-21' AS Date), CAST(N'2018-01-22' AS Date), CAST(N'2018-01-22' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1360, 71, 4, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-25' AS Date), CAST(N'2018-01-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1361, 1084, 4, CAST(N'2018-01-22' AS Date), CAST(N'2018-01-24' AS Date), CAST(N'2018-01-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1362, 310, 4, CAST(N'2018-01-23' AS Date), CAST(N'2018-01-24' AS Date), CAST(N'2018-01-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1363, 860, 4, CAST(N'2018-01-24' AS Date), CAST(N'2018-01-25' AS Date), CAST(N'2018-01-25' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1364, 122, 4, CAST(N'2018-01-25' AS Date), CAST(N'2018-01-28' AS Date), CAST(N'2018-01-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1365, 689, 4, CAST(N'2018-01-25' AS Date), CAST(N'2018-01-28' AS Date), CAST(N'2018-01-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1366, 1441, 4, CAST(N'2018-01-26' AS Date), CAST(N'2018-01-27' AS Date), CAST(N'2018-01-28' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1367, 1118, 4, CAST(N'2018-01-27' AS Date), CAST(N'2018-01-28' AS Date), CAST(N'2018-01-28' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1368, 765, 4, CAST(N'2018-01-27' AS Date), CAST(N'2018-01-28' AS Date), CAST(N'2018-01-29' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1369, 92, 4, CAST(N'2018-01-28' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2018-01-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1370, 115, 4, CAST(N'2018-01-28' AS Date), CAST(N'2018-01-29' AS Date), CAST(N'2018-01-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1371, 937, 4, CAST(N'2018-01-29' AS Date), CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1372, 1013, 4, CAST(N'2018-01-29' AS Date), CAST(N'2018-02-01' AS Date), CAST(N'2018-01-30' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1373, 427, 4, CAST(N'2018-01-29' AS Date), CAST(N'2018-01-31' AS Date), CAST(N'2018-01-31' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1374, 1330, 4, CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date), CAST(N'2018-02-01' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1375, 312, 4, CAST(N'2018-01-30' AS Date), CAST(N'2018-02-01' AS Date), CAST(N'2018-02-01' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1376, 1186, 4, CAST(N'2018-02-01' AS Date), CAST(N'2018-02-02' AS Date), CAST(N'2018-02-03' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1377, 1007, 4, CAST(N'2018-02-01' AS Date), CAST(N'2018-02-03' AS Date), CAST(N'2018-02-03' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1378, 983, 4, CAST(N'2018-02-02' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-04' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1379, 1256, 4, CAST(N'2018-02-02' AS Date), CAST(N'2018-02-05' AS Date), CAST(N'2018-02-05' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1380, 818, 4, CAST(N'2018-02-05' AS Date), CAST(N'2018-02-08' AS Date), CAST(N'2018-02-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1381, 680, 4, CAST(N'2018-02-05' AS Date), CAST(N'2018-02-06' AS Date), CAST(N'2018-02-08' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1382, 1303, 4, CAST(N'2018-02-06' AS Date), CAST(N'2018-02-09' AS Date), CAST(N'2018-02-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1383, 488, 4, CAST(N'2018-02-07' AS Date), CAST(N'2018-02-08' AS Date), CAST(N'2018-02-08' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1384, 1126, 4, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-10' AS Date), CAST(N'2018-02-09' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1385, 866, 4, CAST(N'2018-02-08' AS Date), CAST(N'2018-02-11' AS Date), CAST(N'2018-02-09' AS Date), 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1386, 1254, 4, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-10' AS Date), CAST(N'2018-02-11' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1387, 11, 4, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-11' AS Date), CAST(N'2018-02-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1388, 323, 4, CAST(N'2018-02-09' AS Date), CAST(N'2018-02-12' AS Date), CAST(N'2018-02-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1389, 491, 4, CAST(N'2018-02-11' AS Date), CAST(N'2018-02-12' AS Date), CAST(N'2018-02-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1390, 63, 4, CAST(N'2018-02-12' AS Date), CAST(N'2018-02-13' AS Date), CAST(N'2018-02-13' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1391, 914, 4, CAST(N'2018-02-13' AS Date), CAST(N'2018-02-14' AS Date), CAST(N'2018-02-14' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1392, 1187, 4, CAST(N'2018-02-13' AS Date), CAST(N'2018-02-14' AS Date), CAST(N'2018-02-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1393, 547, 4, CAST(N'2018-02-14' AS Date), CAST(N'2018-02-15' AS Date), CAST(N'2018-02-15' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1394, 906, 4, CAST(N'2018-02-14' AS Date), CAST(N'2018-02-16' AS Date), CAST(N'2018-02-16' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1395, 1052, 4, CAST(N'2018-02-15' AS Date), CAST(N'2018-02-18' AS Date), CAST(N'2018-02-16' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1396, 856, 4, CAST(N'2018-02-15' AS Date), CAST(N'2018-02-18' AS Date), CAST(N'2018-02-16' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1397, 920, 4, CAST(N'2018-02-15' AS Date), CAST(N'2018-02-17' AS Date), CAST(N'2018-02-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1398, 1383, 4, CAST(N'2018-02-16' AS Date), CAST(N'2018-02-19' AS Date), CAST(N'2018-02-19' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1399, 146, 4, CAST(N'2018-02-16' AS Date), CAST(N'2018-02-18' AS Date), CAST(N'2018-02-18' AS Date), 2, 6)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1400, 987, 4, CAST(N'2018-02-17' AS Date), CAST(N'2018-02-18' AS Date), CAST(N'2018-02-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1401, 15, 4, CAST(N'2018-02-18' AS Date), CAST(N'2018-02-19' AS Date), CAST(N'2018-02-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1402, 1171, 4, CAST(N'2018-02-19' AS Date), CAST(N'2018-02-21' AS Date), CAST(N'2018-02-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1403, 452, 4, CAST(N'2018-02-21' AS Date), CAST(N'2018-02-22' AS Date), CAST(N'2018-02-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1404, 1240, 4, CAST(N'2018-02-23' AS Date), CAST(N'2018-02-26' AS Date), CAST(N'2018-02-24' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1405, 100, 4, CAST(N'2018-02-25' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-02-27' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1406, 1053, 4, CAST(N'2018-02-25' AS Date), CAST(N'2018-02-27' AS Date), CAST(N'2018-02-27' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1407, 18, 3, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-26' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1408, 1172, 4, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-27' AS Date), CAST(N'2018-03-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1409, 21, 4, CAST(N'2018-02-26' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-02-28' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1410, 1005, 4, CAST(N'2018-02-27' AS Date), CAST(N'2018-02-28' AS Date), CAST(N'2018-02-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1411, 109, 4, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-02' AS Date), CAST(N'2018-03-02' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1412, 1043, 4, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-02' AS Date), CAST(N'2018-03-04' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1413, 56, 4, CAST(N'2018-03-01' AS Date), CAST(N'2018-03-03' AS Date), CAST(N'2018-03-04' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1414, 293, 4, CAST(N'2018-03-03' AS Date), CAST(N'2018-03-05' AS Date), CAST(N'2018-03-06' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1415, 839, 4, CAST(N'2018-03-03' AS Date), CAST(N'2018-03-04' AS Date), CAST(N'2018-03-05' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1416, 566, 4, CAST(N'2018-03-03' AS Date), CAST(N'2018-03-04' AS Date), CAST(N'2018-03-06' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1417, 300, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-06' AS Date), CAST(N'2018-03-07' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1418, 364, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-05' AS Date), CAST(N'2018-03-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1419, 474, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-07' AS Date), CAST(N'2018-03-07' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1420, 838, 4, CAST(N'2018-03-04' AS Date), CAST(N'2018-03-05' AS Date), CAST(N'2018-03-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1421, 1176, 4, CAST(N'2018-03-05' AS Date), CAST(N'2018-03-07' AS Date), CAST(N'2018-03-07' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1422, 599, 4, CAST(N'2018-03-05' AS Date), CAST(N'2018-03-06' AS Date), CAST(N'2018-03-08' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1423, 1231, 4, CAST(N'2018-03-06' AS Date), CAST(N'2018-03-07' AS Date), CAST(N'2018-03-07' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1424, 1445, 4, CAST(N'2018-03-07' AS Date), CAST(N'2018-03-10' AS Date), CAST(N'2018-03-10' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1425, 126, 4, CAST(N'2018-03-07' AS Date), CAST(N'2018-03-09' AS Date), CAST(N'2018-03-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1426, 938, 4, CAST(N'2018-03-07' AS Date), CAST(N'2018-03-08' AS Date), CAST(N'2018-03-10' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1427, 999, 4, CAST(N'2018-03-07' AS Date), CAST(N'2018-03-08' AS Date), CAST(N'2018-03-08' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1428, 195, 4, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-10' AS Date), CAST(N'2018-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1429, 1116, 4, CAST(N'2018-03-08' AS Date), CAST(N'2018-03-09' AS Date), CAST(N'2018-03-09' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1430, 1239, 4, CAST(N'2018-03-10' AS Date), CAST(N'2018-03-13' AS Date), CAST(N'2018-03-11' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1431, 308, 4, CAST(N'2018-03-11' AS Date), CAST(N'2018-03-12' AS Date), CAST(N'2018-03-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1432, 483, 4, CAST(N'2018-03-11' AS Date), CAST(N'2018-03-12' AS Date), CAST(N'2018-03-14' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1433, 1142, 4, CAST(N'2018-03-11' AS Date), CAST(N'2018-03-13' AS Date), CAST(N'2018-03-12' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1434, 595, 4, CAST(N'2018-03-14' AS Date), CAST(N'2018-03-16' AS Date), CAST(N'2018-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1435, 744, 4, CAST(N'2018-03-14' AS Date), CAST(N'2018-03-15' AS Date), CAST(N'2018-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1436, 1044, 4, CAST(N'2018-03-14' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1437, 518, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-16' AS Date), CAST(N'2018-03-16' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1438, 263, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-16' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1439, 463, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1440, 859, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-18' AS Date), CAST(N'2018-03-16' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1441, 982, 4, CAST(N'2018-03-15' AS Date), CAST(N'2018-03-16' AS Date), CAST(N'2018-03-18' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1442, 478, 4, CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1443, 972, 4, CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-17' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1444, 1154, 4, CAST(N'2018-03-16' AS Date), CAST(N'2018-03-17' AS Date), CAST(N'2018-03-19' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1445, 515, 4, CAST(N'2018-03-17' AS Date), CAST(N'2018-03-18' AS Date), CAST(N'2018-03-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1446, 820, 4, CAST(N'2018-03-17' AS Date), CAST(N'2018-03-18' AS Date), CAST(N'2018-03-18' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1447, 1419, 4, CAST(N'2018-03-18' AS Date), CAST(N'2018-03-20' AS Date), CAST(N'2018-03-20' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1448, 228, 4, CAST(N'2018-03-18' AS Date), CAST(N'2018-03-19' AS Date), CAST(N'2018-03-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1449, 330, 4, CAST(N'2018-03-18' AS Date), CAST(N'2018-03-19' AS Date), CAST(N'2018-03-20' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1450, 296, 4, CAST(N'2018-03-19' AS Date), CAST(N'2018-03-20' AS Date), CAST(N'2018-03-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1451, 822, 4, CAST(N'2018-03-19' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-20' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1452, 287, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-23' AS Date), CAST(N'2018-03-23' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1453, 601, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-23' AS Date), CAST(N'2018-03-22' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1454, 395, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-03-22' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1455, 405, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-21' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1456, 754, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-21' AS Date), CAST(N'2018-03-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1457, 1411, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-23' AS Date), CAST(N'2018-03-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1458, 1029, 4, CAST(N'2018-03-20' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-21' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1459, 9, 4, CAST(N'2018-03-21' AS Date), CAST(N'2018-03-22' AS Date), CAST(N'2018-03-22' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1460, 1131, 4, CAST(N'2018-03-21' AS Date), CAST(N'2018-03-23' AS Date), CAST(N'2018-03-23' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1461, 139, 4, CAST(N'2018-03-22' AS Date), CAST(N'2018-03-25' AS Date), CAST(N'2018-03-23' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1462, 1101, 4, CAST(N'2018-03-22' AS Date), CAST(N'2018-03-24' AS Date), CAST(N'2018-03-24' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1463, 692, 4, CAST(N'2018-03-23' AS Date), CAST(N'2018-03-24' AS Date), CAST(N'2018-03-24' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1464, 1279, 4, CAST(N'2018-03-24' AS Date), CAST(N'2018-03-25' AS Date), CAST(N'2018-03-25' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1465, 623, 4, CAST(N'2018-03-25' AS Date), CAST(N'2018-03-28' AS Date), CAST(N'2018-03-28' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1466, 738, 4, CAST(N'2018-03-26' AS Date), CAST(N'2018-03-29' AS Date), CAST(N'2018-03-28' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1467, 152, 4, CAST(N'2018-03-26' AS Date), CAST(N'2018-03-27' AS Date), CAST(N'2018-03-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1468, 3, 4, CAST(N'2018-03-27' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-03-29' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1469, 1135, 4, CAST(N'2018-03-27' AS Date), CAST(N'2018-03-28' AS Date), CAST(N'2018-03-30' AS Date), 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1470, 505, 4, CAST(N'2018-03-28' AS Date), CAST(N'2018-03-31' AS Date), CAST(N'2018-03-31' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1471, 1310, 4, CAST(N'2018-03-28' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-03-29' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1472, 114, 4, CAST(N'2018-03-29' AS Date), CAST(N'2018-03-30' AS Date), CAST(N'2018-03-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1473, 302, 4, CAST(N'2018-03-30' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-02' AS Date), 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1474, 816, 4, CAST(N'2018-03-30' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-02' AS Date), 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1475, 112, 4, CAST(N'2018-03-30' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-03-31' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1476, 35, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1477, 180, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-03' AS Date), CAST(N'2018-04-01' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1478, 392, 4, CAST(N'2018-03-31' AS Date), CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1479, 23, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1480, 27, 2, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1481, 62, 1, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1482, 94, 1, CAST(N'2018-04-01' AS Date), CAST(N'2018-04-01' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1483, 15, 1, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1484, 35, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1485, 51, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1486, 84, 2, CAST(N'2018-04-02' AS Date), CAST(N'2018-04-02' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1487, 33, 1, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1488, 181, 2, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1489, 194, 1, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1490, 217, 2, CAST(N'2018-04-03' AS Date), CAST(N'2018-04-03' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1491, 82, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1492, 41, 1, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1493, 64, 2, CAST(N'2018-04-04' AS Date), CAST(N'2018-04-04' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1494, 69, 2, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-05' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1495, 86, 2, CAST(N'2018-04-05' AS Date), CAST(N'2018-04-05' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1496, 3, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1497, 31, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1498, 81, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1499, 120, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 2)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1500, 151, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1501, 52, 1, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1502, 83, 2, CAST(N'2018-04-06' AS Date), CAST(N'2018-04-06' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1503, 208, 2, CAST(N'2018-04-07' AS Date), CAST(N'2018-04-07' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1504, 237, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1505, 22, 1, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1506, 75, 1, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1507, 85, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1508, 92, 2, CAST(N'2018-04-08' AS Date), CAST(N'2018-04-08' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1509, 2, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1510, 16, 2, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1511, 25, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1512, 68, 1, CAST(N'2018-04-09' AS Date), CAST(N'2018-04-09' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1513, 32, 2, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1514, 87, 2, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1515, 61, 1, CAST(N'2018-04-10' AS Date), CAST(N'2018-04-10' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1516, 47, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1517, 97, 1, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1518, 175, 1, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1519, 26, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1520, 66, 2, CAST(N'2018-04-11' AS Date), CAST(N'2018-04-11' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1521, 53, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1522, 78, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1523, 8, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1524, 37, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1525, 38, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1526, 59, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1527, 13, 2, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1528, 20, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1529, 50, 1, CAST(N'2018-04-12' AS Date), CAST(N'2018-04-12' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1530, 110, 1, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1531, 233, 1, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1532, 7, 2, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1533, 28, 2, CAST(N'2018-04-13' AS Date), CAST(N'2018-04-13' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1534, 18, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1535, 19, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1536, 34, 2, CAST(N'2018-04-14' AS Date), CAST(N'2018-04-14' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1537, 36, 1, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1538, 79, 2, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1539, 116, 1, CAST(N'2018-04-15' AS Date), CAST(N'2018-04-15' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1540, 187, 1, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1541, 10, 2, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1542, 58, 2, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1543, 76, 1, CAST(N'2018-04-16' AS Date), CAST(N'2018-04-16' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1544, 5, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1545, 67, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1546, 91, 2, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1547, 169, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1548, 170, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1549, 17, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1550, 39, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1551, 70, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1552, 73, 1, CAST(N'2018-04-17' AS Date), CAST(N'2018-04-17' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1553, 30, 2, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1554, 172, 1, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1555, 1, 1, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1556, 4, 2, CAST(N'2018-04-18' AS Date), CAST(N'2018-04-18' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1557, 121, 2, CAST(N'2018-04-19' AS Date), CAST(N'2018-04-19' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1558, 63, 1, CAST(N'2018-04-19' AS Date), CAST(N'2018-04-19' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1559, 42, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1560, 57, 1, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1561, 65, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1562, 88, 1, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1563, 77, 2, CAST(N'2018-04-20' AS Date), CAST(N'2018-04-20' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1564, 46, 1, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1565, 60, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1566, 72, 1, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1567, 89, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1568, 192, 2, CAST(N'2018-04-21' AS Date), CAST(N'2018-04-21' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1569, 29, 2, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1570, 54, 2, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1571, 80, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1572, 14, 1, CAST(N'2018-04-22' AS Date), CAST(N'2018-04-22' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1573, 24, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1574, 124, 1, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1575, 224, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1576, 12, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1577, 48, 1, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1578, 93, 2, CAST(N'2018-04-23' AS Date), CAST(N'2018-04-23' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1579, 104, 2, CAST(N'2018-04-24' AS Date), CAST(N'2018-04-24' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1580, 191, 2, CAST(N'2018-04-24' AS Date), CAST(N'2018-04-24' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1581, 188, 2, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1582, 240, 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1583, 44, 1, CAST(N'2018-04-25' AS Date), CAST(N'2018-04-25' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1584, 109, 2, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1585, 157, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1586, 176, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1587, 231, 2, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1588, 11, 1, CAST(N'2018-04-26' AS Date), CAST(N'2018-04-26' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1589, 40, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1590, 138, 1, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1591, 165, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1592, 6, 2, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1593, 9, 1, CAST(N'2018-04-27' AS Date), CAST(N'2018-04-27' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1594, 45, 1, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1595, 71, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1596, 21, 2, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1597, 56, 1, CAST(N'2018-04-28' AS Date), CAST(N'2018-04-28' AS Date), NULL, 3, 9)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1598, 239, 2, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1599, 49, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 2, 7)
GO
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1600, 90, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1601, 43, 1, CAST(N'2018-04-29' AS Date), CAST(N'2018-04-29' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1602, 55, 1, CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1603, 74, 2, CAST(N'2018-04-30' AS Date), CAST(N'2018-04-30' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1604, 7, 3, CAST(N'2018-06-17' AS Date), CAST(N'2018-06-17' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1605, 123, 3, CAST(N'2018-07-01' AS Date), CAST(N'2018-07-01' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1606, 119, 3, CAST(N'2018-07-10' AS Date), CAST(N'2018-07-10' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1607, 33, 3, CAST(N'2018-07-11' AS Date), CAST(N'2018-07-11' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1608, 53, 3, CAST(N'2018-07-12' AS Date), CAST(N'2018-07-12' AS Date), NULL, 1, 2)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1609, 10, 3, CAST(N'2018-08-23' AS Date), CAST(N'2018-08-23' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1610, 15, 3, CAST(N'2018-08-25' AS Date), CAST(N'2018-08-25' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1611, 6, 3, CAST(N'2018-09-06' AS Date), CAST(N'2018-09-06' AS Date), NULL, 2, 7)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1612, 3, 3, CAST(N'2018-10-21' AS Date), CAST(N'2018-10-21' AS Date), NULL, 1, 3)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1613, 1, 3, CAST(N'2018-11-18' AS Date), CAST(N'2018-11-18' AS Date), NULL, 2, 6)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1614, 135, 3, CAST(N'2018-11-28' AS Date), CAST(N'2018-11-28' AS Date), NULL, 3, 8)
INSERT [sales].[orders] ([order_id], [customer_id], [order_status], [order_date], [required_date], [shipped_date], [store_id], [staff_id]) VALUES (1615, 136, 3, CAST(N'2018-12-28' AS Date), CAST(N'2018-12-28' AS Date), NULL, 3, 8)
SET IDENTITY_INSERT [sales].[orders] OFF
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Pure Cycles', N'Cruisers Bicycles', 2016, CAST(149476.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Mountain Bikes', 2017, CAST(217707.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Road Bikes', 2017, CAST(42600.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Children Bicycles', 2018, CAST(18123.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Mountain Bikes', 2017, CAST(563201.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Cyclocross Bicycles', 2017, CAST(218854.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Heller', N'Mountain Bikes', 2018, CAST(20298.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Children Bicycles', 2018, CAST(10224.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Sun Bicycles', N'Electric Bikes', 2017, CAST(47049.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Cyclocross Bicycles', 2018, CAST(9371.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Cruisers Bicycles', 2016, CAST(357865.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Children Bicycles', 2016, CAST(109819.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Strider', N'Children Bicycles', 2018, CAST(4320.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Haro', N'Mountain Bikes', 2017, CAST(156145.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Sun Bicycles', N'Comfort Bicycles', 2017, CAST(122478.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Sun Bicycles', N'Cruisers Bicycles', 2017, CAST(150647.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Electric Bikes', 2016, CAST(389249.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Comfort Bicycles', 2017, CAST(17502.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Road Bikes', 2018, CAST(25878.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Cruisers Bicycles', 2018, CAST(188608.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Mountain Bikes', 2018, CAST(157087.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Cyclocross Bicycles', 2018, CAST(52513.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Children Bicycles', 2017, CAST(38471.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Electric Bikes', 2017, CAST(188250.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Comfort Bicycles', 2018, CAST(47425.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Road Bikes', 2018, CAST(437894.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Mountain Bikes', 2018, CAST(41016.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Haro', N'Children Bicycles', 2017, CAST(29240.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Children Bicycles', 2017, CAST(79664.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Sun Bicycles', N'Children Bicycles', 2017, CAST(2328.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Comfort Bicycles', 2016, CAST(206615.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Heller', N'Mountain Bikes', 2016, CAST(151161.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Ritchey', N'Mountain Bikes', 2016, CAST(78899.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Sun Bicycles', N'Mountain Bikes', 2017, CAST(19492.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Cruisers Bicycles', 2017, CAST(148436.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Electric Bikes', 2018, CAST(260873.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Cyclocross Bicycles', 2016, CAST(430273.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Surly', N'Mountain Bikes', 2016, CAST(182660.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Electra', N'Electric Bikes', 2018, CAST(31264.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Mountain Bikes', 2016, CAST(1127412.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'Trek', N'Road Bikes', 2017, CAST(1158726.0000 AS Decimal(38, 4)))
INSERT [sales].[sales_summary] ([brand], [category], [model_year], [sales]) VALUES (N'deneme', N'deneme', 2020, CAST(201.0000 AS Decimal(38, 4)))
SET IDENTITY_INSERT [sales].[staffs] ON 

INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (1, N'Fabiola', N'Jackson', N'fabiola.jackson@bikes.shop', N'(831) 555-5554', 1, 1, NULL)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (2, N'Mireya', N'Copeland', N'mireya.copeland@bikes.shop', N'(831) 555-5555', 1, 1, 1)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (3, N'Genna', N'Serrano', N'genna.serrano@bikes.shop', N'(831) 555-5556', 1, 1, 2)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (4, N'Virgie', N'Wiggins', N'virgie.wiggins@bikes.shop', N'(831) 555-5557', 1, 1, 2)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (5, N'Jannette', N'David', N'jannette.david@bikes.shop', N'(516) 379-4444', 1, 2, 1)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (6, N'Marcelene', N'Boyer', N'marcelene.boyer@bikes.shop', N'(516) 379-4445', 1, 2, 5)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (7, N'Venita', N'Daniel', N'venita.daniel@bikes.shop', N'(516) 379-4446', 1, 2, 5)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (8, N'Kali', N'Vargas', N'kali.vargas@bikes.shop', N'(972) 530-5555', 1, 3, 1)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (9, N'Layla', N'Terrell', N'layla.terrell@bikes.shop', N'(972) 530-5556', 1, 3, 7)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (10, N'Bernardine', N'Houston', N'bernardine.houston@bikes.shop', N'(972) 530-5557', 1, 3, 7)
INSERT [sales].[staffs] ([staff_id], [first_name], [last_name], [email], [phone], [active], [store_id], [manager_id]) VALUES (12, N'Baran', N'Yüksel', N'deneme@mail', N'5346950323', 1, 1, 2)
SET IDENTITY_INSERT [sales].[staffs] OFF
SET IDENTITY_INSERT [sales].[stores] ON 

INSERT [sales].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (1, N'Santa Cruz Bikes', N'(831) 476-4321', N'santacruz@bikes.shop', N'3700 Portola Drive', N'Santa Cruz', N'CA', N'95060')
INSERT [sales].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (2, N'Baldwin Bikes', N'(516) 379-8888', N'baldwin@bikes.shop', N'4200 Chestnut Lane', N'Baldwin', N'NY', N'11432')
INSERT [sales].[stores] ([store_id], [store_name], [phone], [email], [street], [city], [state], [zip_code]) VALUES (3, N'Rowlett Bikes', N'(972) 530-5555', N'rowlett@bikes.shop', N'8000 Fairway Avenue', N'Rowlett', N'TX', N'75088')
SET IDENTITY_INSERT [sales].[stores] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__staffs__AB6E61645889F790]    Script Date: 31.12.2019 10:59:13 ******/
ALTER TABLE [sales].[staffs] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [sales].[order_items] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [production].[brands] ([brand_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [production].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [production].[stocks]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [sales].[orders] ([order_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [production].[products] ([product_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [sales].[customers] ([customer_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[orders]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [sales].[staffs] ([staff_id])
GO
ALTER TABLE [sales].[staffs]  WITH CHECK ADD FOREIGN KEY([store_id])
REFERENCES [sales].[stores] ([store_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[BrandDegistir]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BrandDegistir](@isim varchar(100),@id int)
as
begin try
begin transaction
update production.brands set brand_name=@isim where brand_id=@id
commit
end try
begin catch
select
ERROR_MESSAGE() as ErrorMessage;
rollback
if(XACT_STATE()=-1)
print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[BrandEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BrandEkle] (@isim varchar(100))
as
begin try
	begin transaction
		insert into production.brands values (@isim)
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage;
	rollback
	if(XACT_STATE()=-1)
		print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[BrandListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[BrandListele]
as
begin try
begin transaction
	select brand_id as BrandID,brand_name as BrandName  from production.brands
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[BrandSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BrandSil](@isim varchar(100))
as
begin try
	begin transaction
		delete from production.brands where brand_name=@isim
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CandidateDegistir]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CandidateDegistir](@isim varchar(100),@id int)
as
begin try
begin transaction
update hr.candidates set fullname=@isim where id=@id
commit
end try
begin catch
select
ERROR_MESSAGE() AS ErrorMessage; 
rollback
if(XACT_STATE()=-1)
print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CandidateEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CandidateEkle](@fullname varchar(100))
as
begin try
begin transaction
insert into hr.candidates values(@fullname)
commit
end try
begin catch 
select 
ERROR_MESSAGE() as ErrorMessage;
rollback
if(XACT_STATE()=-1)
print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CandidateListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CandidateListele]
as
begin try
begin transaction
Select * from hr.candidates
commit
end try
begin catch
select 
ERROR_MESSAGE() as ErrorMessage;
rollback
if(XACT_STATE()=-1)
print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CandidateSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CandidateSil](@id int)
as
begin try
begin transaction
delete from hr.candidates where id=@id
commit
end try
begin catch
select 
ERROR_MESSAGE() as ErrorMessage;
rollback
if(XACT_STATE()=-1)
print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CategoryDegistir]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryDegistir] (@isim varchar(100),@id int)
as
begin try
	begin transaction
		update production.categories set category_name=@isim where category_id=@id
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print('HATA!!!')
end catch
GO
/****** Object:  StoredProcedure [dbo].[CategoryEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategoryEkle] (@isim varchar(100))
as
begin try
	begin transaction
		insert into production.categories values (@isim)
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print('HATA!!!')
end catch
GO
/****** Object:  StoredProcedure [dbo].[CategoryListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CategoryListele]
as
begin try
	begin transaction
		select category_id as CategoryID,category_name as CategoryName from production.categories
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print('HATA!!!')
end catch
GO
/****** Object:  StoredProcedure [dbo].[CategorySil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CategorySil] (@isim varchar(100))
as
begin try
	begin transaction
		delete from production.categories where category_name=@isim
		commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print('HATA!!!')
end catch
GO
/****** Object:  StoredProcedure [dbo].[CustomerDuzenle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerDuzenle](@firstn varchar(100),@lastn varchar(100),@phone varchar(25),@mail varchar(100),@street varchar(100),@city varchar(50),@state varchar(25),@zip varchar(5) )
as
begin try
	begin transaction
		update sales.customers set first_name=@firstn,last_name=@lastn,phone=@phone,street=@street,city=@city,state=@state,zip_code=@zip where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CustomerEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerEkle](@firstn varchar(100),@lastn varchar(100),@phone varchar(25),@mail varchar(100),@street varchar(100),@city varchar(50),@state varchar(25),@zip varchar(5) )
as
begin try
	begin transaction
		insert into sales.customers values(@firstn,@lastn,@phone,@mail,@street,@city,@state,@zip)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CustomerListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerListele]
as
begin try
	begin transaction
		select * from sales.customers
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[CustomerSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CustomerSil](@mail varchar(100))
as
begin try
	begin transaction
		delete from sales.customers where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[IndirimliUrunler]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[IndirimliUrunler]
as
begin try
begin transaction
	select top 30 product_name as UrunAdi,dbo.IndirimYap(list_price) as IndirimliFiyat from production.products order by list_price desc
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[LogGir]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[LogGir](@log varchar(255))
as
begin try
begin transaction
	insert into dbo.log values(@log,GETDATE())
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[LogListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LogListele]
as
begin try
begin transaction
	select * from dbo.log order by 2 desc
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[OrderEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrderEkle](@mail varchar(100),@store varchar(100),@staffid int)
as
begin try
	begin transaction
		insert into sales.orders values(
		(select customer_id from sales.customers where email=@mail),
		1,
		GETDATE(),
		GETDATE(),
		null,
		(select store_id from sales.stores where store_name=@store),
		@staffid)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[OrderListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrderListele]
as
begin try
begin transaction
	select o.order_id as OrderID,
	c.first_name as FirstName,
	c.last_name as LastName,
	o.order_status as OrderStatus,
	o.order_date as OrderDate,
	o.required_date as RequiredDate,
	o.shipped_date as ShippedDate,
	s.store_name as StoreName,
	staff.first_name as StaffFirstName,
	staff.last_name as StaffLastName
	from sales.orders o 
	join sales.customers c on c.customer_id=o.customer_id
	join sales.stores s on o.store_id=s.store_id
	join sales.staffs staff on o.staff_id =staff.staff_id
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[OrderSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OrderSil](@mail varchar(100),@store varchar(100),@staffid int)
as
begin try
	begin transaction
		delete from sales.orders where
		customer_id=(select customer_id from sales.customers where email=@mail)
		and
		store_id=(select store_id from sales.stores where store_name=@store)
		and
		staff_id=@staffid
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[ProductAra]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductAra](@isim varchar(100))
as
begin try
	begin transaction
		select * from production.products where product_name=@isim
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[ProductDegistir]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductDegistir](@isim varchar(100),@categoryname varchar(100),@brandname varchar(100),@modelyear smallint,@listprice decimal(10,2))
as
begin try
	begin transaction
		update production.products set 
		product_name=@isim,
		brand_id=(select brand_id from production.brands where brand_name=@brandname),
		category_id=(select category_id from production.categories where category_name=@categoryname),
		model_year=@modelyear,
		list_price=@listprice
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[ProductEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductEkle](@isim varchar(100),@categoryname varchar(100),@brandname varchar(100),@modelyear smallint,@listprice decimal(10,2))
as
begin try
	begin transaction
		insert into production.products values( 
		@isim,
		(select brand_id from production.brands where brand_name=@brandname),
		(select category_id from production.categories where category_name=@categoryname),
		@modelyear,
		@listprice)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[ProductListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ProductListele]
as
begin try
	begin transaction
		select p.product_id as ProductID,
		p.product_name as ProductName,
		b.brand_name as BrandName,
		c.category_name as CategoryName,
		p.model_year as ModelYear,
		p.list_price as ListPrice
		from production.products p 
		join production.brands b on p.brand_id=b.brand_id
		join production.categories c on p.category_id =c.category_id
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[ProductSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ProductSil](@isim varchar(100))
as
begin try
	begin transaction
		delete from production.products where product_name=@isim
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[SalesEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalesEkle] (@marka varchar(100),@cat varchar(100),@modely smallint,@sales decimal)
as
begin try
	begin transaction
		if exists (select * from sales.sales_summary where brand=@marka and category=@cat and model_year=@modely)
		update sales.sales_summary set sales=sales+@sales where brand=@marka and category=@cat and model_year=@modely
		else
		insert into sales.sales_summary values (@marka,@cat,@modely,@sales)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[SalesListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SalesListele]
as
begin try
begin transaction
	select * from sales.sales_summary
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StaffEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StaffEkle] (@fname varchar(100),@lname varchar(100),@mail varchar(255),@phone varchar(25),@storeid int,@managerid int)
as
begin try
begin transaction
	insert into sales.staffs values(@fname,@lname,@mail,@phone,1,@storeid,@managerid)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StaffGuncelle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StaffGuncelle] (@fname varchar(100),@lname varchar(100),@mail varchar(255),@phone varchar(25),@storeid int,@managerid int)
as
begin try
begin transaction
	update sales.staffs set first_name=@fname,last_name=@lname,manager_id=@managerid,store_id=@storeid where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StaffListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StaffListele]
as 
begin try
begin transaction
	select * from sales.staffs
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StaffSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StaffSil] (@mail varchar(255))
as
begin try
begin transaction
	delete sales.staffs where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StockListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StockListele]
as
begin try
begin transaction
	select store.store_name as StoreName,p.product_name as ProductName,s.quantity as Quantity 
	from production.stocks s 
	join sales.stores store on s.store_id=store.store_id
	join production.products p on s.product_id = p.product_id
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StocksEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StocksEkle](@storeisim varchar(100),@productisim varchar(100),@adet int)
as
begin try
	begin transaction
	if not exists (select * from production.stocks where store_id =(select store_id from sales.stores where store_name=@storeisim) and product_id=(select product_id from production.products where product_name=@productisim))
		insert into production.stocks values(
		(select store_id from sales.stores where store_name=@storeisim),
		(select product_id from production.products where product_name=@productisim),
		@adet)
	else
		update production.stocks set quantity=quantity+@adet where store_id =(select store_id from sales.stores where store_name=@storeisim) and product_id=(select product_id from production.products where product_name=@productisim)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StocksGuncelle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StocksGuncelle](@storeisim varchar(100),@productisim varchar(100),@adet int)
as
begin try
	begin transaction
		update production.stocks set
		store_id=(select store_id from sales.stores where store_name=@storeisim),
		product_id=(select product_id from production.products where product_name=@productisim),
		quantity=@adet
		where 
		store_id=(select store_id from sales.stores where store_name=@storeisim) and
		product_id=(select product_id from production.products where product_name=@productisim)

	commit
end try
begin catch
	select ERROR_MESSAGE() as ErorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StocksSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StocksSil](@storeisim varchar(100),@urun varchar(100))
as
begin try
	begin transaction
		delete from production.stocks where store_id=(select store_id from sales.stores where store_name=@storeisim) and product_id=(select product_id from production.products where product_name=@urun)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErorMessage
	rollback
	if(XACT_STATE()=-1)
		print 'Hata!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StoreDuzenle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StoreDuzenle](@name varchar(100),@phone varchar(100),@mail varchar(100),@street varchar(100),@city varchar(100),@state varchar(100),@zip varchar(5))
as
begin try
begin transaction
	update sales.stores set store_name=@name,phone=@phone,street=@street,city=@city,state=@state,zip_code=@zip where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StoreEkle]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StoreEkle](@name varchar(100),@phone varchar(100),@mail varchar(100),@street varchar(100),@city varchar(100),@state varchar(100),@zip varchar(5))
as
begin try
begin transaction
	insert into sales.stores values(@name,@phone,@mail,@street,@city,@state,@zip)
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StoreListele]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StoreListele]
as 
begin try
begin transaction
	select * from sales.stores
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
/****** Object:  StoredProcedure [dbo].[StoreSil]    Script Date: 31.12.2019 10:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StoreSil](@mail varchar(100))
as
begin try
begin transaction
	delete sales.stores where email=@mail
	commit
end try
begin catch
	select ERROR_MESSAGE() as ErrorMessage
	rollback
	if(XACT_STATE()=-1)
	print 'HATA!!'
end catch
GO
