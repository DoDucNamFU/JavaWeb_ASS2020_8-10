USE [master]
GO
/****** Object:  Database [LibraryManagement]    Script Date: 8/17/2020 12:26:00 AM ******/
CREATE DATABASE [LibraryManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LibraryManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'LibraryManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\LibraryManagement_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [LibraryManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryManagement] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagement] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryManagement', N'ON'
GO
USE [LibraryManagement]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 8/17/2020 12:26:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[publisher] [nvarchar](50) NULL,
	[total] [int] NULL,
	[available] [int] NULL,
	[publishYear] [date] NULL,
	[status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 8/17/2020 12:26:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] NOT NULL,
	[userID] [nvarchar](50) NULL,
	[borrowDate] [date] NULL,
	[returnDate] [date] NULL,
	[returned] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/17/2020 12:26:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
	[quantity] [int] NULL,
	[note] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 8/17/2020 12:26:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK__Userr__3213E83F1FF78B87] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (1, N'Tokuda and friends', N'Mr.Duy', N'van hoa', 5, 5, CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (2, N'Conan', N'Coa', N'Kim Dong', 10, 10, CAST(N'2013-02-28' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (3, N'Sugoku', N'Ku', N'Van Hoa', 10, 10, CAST(N'2002-03-02' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (6, N'Story', N'So', N'Van Hoa', 10, 10, CAST(N'2020-07-08' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (7, N'Story', N'Fujira4', N'Kim Dong 2', 10, 10, CAST(N'2020-07-01' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (8, N'Story33', N'Fujira', N'Kim Dong 3', 10, 10, CAST(N'2020-07-04' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (9, N'Story33', N'Fujira4', N'Van Hoa', 10, 10, CAST(N'2020-06-30' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (10, N'Story', N'Fujira4', N'Van Hoa', 10, 10, CAST(N'2020-07-03' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (11, N'Stor', N'HU', N'Kim Dong 2', 10, 10, CAST(N'2020-07-07' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (12, N'123', N'123', N'123', 10, 10, CAST(N'2017-01-14' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (13, N'Toy', N'Fujira', N'Kim Dong 3', 10, 10, CAST(N'2020-07-06' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (14, N'Story33', N'HU', N'Kim Dong ', 10, 10, CAST(N'2020-07-13' AS Date), 1)
INSERT [dbo].[Book] ([id], [name], [author], [publisher], [total], [available], [publishYear], [status]) VALUES (15, N'###asufbjk@', N'asfdasd', N'asd', 10, 10, CAST(N'2020-07-06' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (86, N'user1', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (87, N'user1', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (88, N'user1', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (89, N'user', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (90, N'user', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (91, N'user', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (92, N'user', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (93, N'userC', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (94, N'hoa', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (95, N'hoa', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (96, N'nam', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (97, N'nam', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[Order] ([id], [userID], [borrowDate], [returnDate], [returned]) VALUES (98, N'user', CAST(N'2020-07-16' AS Date), CAST(N'2020-07-16' AS Date), 1)
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (86, 1, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (86, 2, 3, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (86, 3, 4, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (86, 6, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (86, 10, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (87, 8, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (87, 9, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (88, 9, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (89, 1, 8, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (90, 1, 2, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (91, 1, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (91, 6, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (91, 8, 2, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (91, 12, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (91, 13, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (92, 10, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (92, 12, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (92, 15, 6, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (93, 1, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (93, 2, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (93, 13, 1, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (93, 15, 2, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (94, 1, 5, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (94, 2, 7, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (95, 2, 3, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (95, 7, 2, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (95, 9, 3, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (96, 1, 5, N'Cho tui muon them 10 cuon nua')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (97, 1, 5, N'')
INSERT [dbo].[OrderDetail] ([orderID], [bookID], [quantity], [note]) VALUES (98, 1, 5, N'')
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin', N'1', N'AD', N'Đỗ Đức Nam', N'female', N'1234123424', N'HCM', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin10', N'1234', N'AD', N'Chu Thanh Phi', N'female', N'', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin11', N'1234', N'AD', N'Trình Hưng', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin12', N'1234', N'AD', N'Hưng Hiểu', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin13', N'1', N'AD', N'Vương Đạo', N'LGBT', N'3482562654', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin14', N'1234', N'AD', N'Chu Thanh Phi', N'male', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin15', N'1', N'AD', N'Chu Thanh Phi', N'male', N'', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin17', N'1234', N'AD', N'Ngọc Trinh', N'male', N'', N'Myhome', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin18', N'1', N'AD', N'Thánh Nữ', N'male', N'', N'Myhome', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin2', N'1', N'AD', N'Duong An', N'male', N'01874236', N'HCM', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin4', N'1234', N'AD', N'Bích Ngọc', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin5', N'1234', N'AD', N'Chu Thanh Phi', N'male', N'', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin6', N'1234', N'AD', N'Mậu Hiếu', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin7', N'1234', N'AD', N'Nguyễn Hiếu', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin8', N'1234', N'AD', N'Nguyễn Mậu', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'admin9', N'1234', N'AD', N'Bình Thanh', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'adminA', N'1', N'AD', N'Thánh Thiện', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'adminB', N'1', N'AD', N'Thánh Nữ', N'LGBT', N'', N'Myhome', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'adminC', N'1234', N'AD', N'Duy', N'female', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'adminD', N'1234', N'AD', N'Thánh Nữ', N'male', N'', N'Myhome', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'hoa', N'hoahoa', N'US', N'hoa', N'male', N'', N'198/77 đườn', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'nam', N'1234', N'US', N'Nguyễn Ke Nam', N'LGBT', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user', N'11', N'US', N'Đỗ Nam', N'male', N'123412341234', N'Gò Vấp nha', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user1', N'1', N'US', N'Le Duy Tran A', N'LGBT', N'0314581945', N'HCM', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user10', N'1234', N'US', N'1234', N'female', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user100', N'1234', N'US', N'Chu Thanh Phi', N'female', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user12', N'1234', N'US', N'Chu Thanh Phi', N'female', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user13', N'VippW4mDRXeHimD', N'US', N'Đỗ', N'LGBT', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user18', N'1234', N'US', N'Chu Thanh Phi', N'LGBT', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user19', N'1234', N'US', N'Đỗ nam19', N'LGBT', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user2', N'1', N'US', N'Dieu Hoa Luu', N'female', N'01234876', N'HCM', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user20', N'1234', N'US', N'Chu Thanh Phi', N'LGBT', N'01234876', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user3', N'1', N'US', N'Ke Nam', N'male', N'06787634', NULL, 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user5', N'1234', N'US', N'1234', N'LGBT', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user6', N'1234', N'US', N'Chu Thanh Phi', N'male', N'348256265', N'Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user7', N'1234', N'US', N'Đỗ nam7', N'female', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'user9', N'1234', N'US', N'Đỗ Nam9', N'male', N'348256265', N'198/77 đường số 3 p9 Gò Vấp', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'userA', N'1', N'US', N'Hoa', N'male', N'', N'', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'userB', N'1', N'US', N'Đỗ namB', N'LGBT', N'', N'Myhome', 1)
INSERT [dbo].[User] ([id], [password], [roleID], [fullName], [gender], [phone], [address], [status]) VALUES (N'userC', N'1', N'US', N'Đỗ namC', N'male', N'', N'Myhome', 1)
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book] FOREIGN KEY([bookID])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
USE [master]
GO
ALTER DATABASE [LibraryManagement] SET  READ_WRITE 
GO
