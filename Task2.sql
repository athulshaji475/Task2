USE [master]
GO
/****** Object:  Database [Task2]    Script Date: 02-08-2024 09:44:07 ******/
CREATE DATABASE [Task2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Task2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Task2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Task2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Task2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Task2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Task2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Task2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Task2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Task2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Task2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Task2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Task2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Task2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Task2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Task2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Task2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Task2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Task2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Task2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Task2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Task2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Task2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Task2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Task2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Task2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Task2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Task2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Task2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Task2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Task2] SET  MULTI_USER 
GO
ALTER DATABASE [Task2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Task2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Task2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Task2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Task2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Task2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Task2] SET QUERY_STORE = OFF
GO
USE [Task2]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](20) NULL,
	[address] [varchar](255) NULL,
	[city] [varchar](100) NULL,
	[country] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[discount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_date] [date] NOT NULL,
	[total_amount] [decimal](10, 2) NOT NULL,
	[region] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](100) NOT NULL,
	[category_id] [int] NULL,
	[unit_price] [decimal](10, 2) NOT NULL,
	[cost_price] [decimal](10, 2) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([customer_id], [customer_name], [email], [phone], [address], [city], [country]) VALUES (1, N'AthulShaji', N'athulshaji474@gmail.com', N'8129151436', N'123 Elm Street', N'Springfield', N'USA')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([order_detail_id], [order_id], [product_id], [quantity], [unit_price], [discount]) VALUES (1, 1, 1, 1, CAST(299.99 AS Decimal(10, 2)), CAST(0.00 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [customer_id], [order_date], [total_amount], [region]) VALUES (1, 1, CAST(N'2024-08-01' AS Date), CAST(299.99 AS Decimal(10, 2)), N'North America')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 
GO
INSERT [dbo].[ProductCategories] ([category_id], [category_name]) VALUES (1, N'Electronics')
GO
INSERT [dbo].[ProductCategories] ([category_id], [category_name]) VALUES (2, N'Furniture')
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([product_id], [product_name], [category_id], [unit_price], [cost_price], [description]) VALUES (1, N'Smartphone', 1, CAST(299.99 AS Decimal(10, 2)), CAST(199.99 AS Decimal(10, 2)), N'Latest model smartphone')
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__AB6E6164ADE3C03A]    Script Date: 02-08-2024 09:44:08 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[ProductCategories] ([category_id])
GO
/****** Object:  StoredProcedure [dbo].[GetCustomersWithNoDiscounts]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomersWithNoDiscounts]
AS
BEGIN
    SELECT DISTINCT
        c.customer_id,
        c.customer_name,
        c.email,
        c.phone,
        c.address,
        c.city,
        c.country
    FROM
        Customers c
    JOIN
        Orders o ON c.customer_id = o.customer_id
    JOIN
        OrderDetails od ON o.order_id = od.order_id
    WHERE
        od.discount = 0 OR od.discount IS NULL;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductProfitMargin]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductProfitMargin]
AS
BEGIN
    SELECT
        p.product_name,
        SUM(od.quantity * od.unit_price) AS SalesAmount,
        SUM(od.quantity * p.cost_price) AS Cost,
        SUM((od.quantity * od.unit_price) - (od.quantity * p.cost_price)) AS Profit
    FROM
        Products p
    JOIN
        OrderDetails od ON p.product_id = od.product_id
    GROUP BY
        p.product_name;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductsWithNoSales]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductsWithNoSales]
AS
BEGIN
    SELECT
        p.product_id,
        p.product_name,
        p.category_id,
        p.unit_price,
        p.cost_price,
        p.description
    FROM
        Products p
    LEFT JOIN
        OrderDetails od ON p.product_id = od.product_id
    WHERE
        od.order_id IS NULL;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTopSellingItemByCategory]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTopSellingItemByCategory]
AS
BEGIN
    WITH RankedProducts AS (
        SELECT
            pc.category_name,
            p.product_name,
            SUM(od.quantity) AS TotalQuantity,
            ROW_NUMBER() OVER (PARTITION BY pc.category_name ORDER BY SUM(od.quantity) DESC) AS rn
        FROM
            ProductCategories pc
        JOIN
            Products p ON pc.category_id = p.category_id
        JOIN
            OrderDetails od ON p.product_id = od.product_id
        GROUP BY
            pc.category_name,
            p.product_name
    )
    SELECT
        category_name,
        product_name AS TopSellingItemByQty
    FROM
        RankedProducts
    WHERE
        rn = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetTotalSalesByCategory]    Script Date: 02-08-2024 09:44:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTotalSalesByCategory]
AS
BEGIN
    SELECT
        pc.category_name,
        SUM(od.quantity * od.unit_price) AS TotalSalesAmount
    FROM
        ProductCategories pc
    JOIN
        Products p ON pc.category_id = p.category_id
    JOIN
        OrderDetails od ON p.product_id = od.product_id
    JOIN
        Orders o ON od.order_id = o.order_id
    GROUP BY
        pc.category_name;
END;
GO
USE [master]
GO
ALTER DATABASE [Task2] SET  READ_WRITE 
GO
