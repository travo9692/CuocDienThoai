USE [master]
GO
/****** Object:  Database [CUOC_DIENTHOAI]    Script Date: 12/1/2018 2:04:23 AM ******/
CREATE DATABASE [CUOC_DIENTHOAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CUOC_DIENTHOAI', FILENAME = N'C:\DevProgram\SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CUOC_DIENTHOAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CUOC_DIENTHOAI_log', FILENAME = N'C:\DevProgram\SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CUOC_DIENTHOAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CUOC_DIENTHOAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET RECOVERY FULL 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET  MULTI_USER 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CUOC_DIENTHOAI', N'ON'
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET QUERY_STORE = OFF
GO
USE [CUOC_DIENTHOAI]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CUOC_DIENTHOAI]
GO
/****** Object:  Table [dbo].[CuocGoi]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuocGoi](
	[MaCuocGoi] [int] IDENTITY(1,1) NOT NULL,
	[MaSim] [int] NOT NULL,
	[TG_BatDau] [datetime] NOT NULL,
	[TG_KetThuc] [datetime] NOT NULL,
	[SoPhutSD] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCuocGoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonDK]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonDK](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaSim] [int] NOT NULL,
	[TG_DangKy] [datetime] NOT NULL,
	[ChiPhi] [decimal](18, 0) NOT NULL,
	[MaKH] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonThanhToan]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonThanhToan](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSim] [int] NOT NULL,
	[CuocThueBao] [decimal](18, 0) NOT NULL,
	[TG_TaoHoaDon] [datetime] NOT NULL,
	[ThanhToan] [bit] NOT NULL,
	[ThanhTien] [decimal](18, 0) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NOT NULL,
	[CMND] [nvarchar](50) NOT NULL,
	[NgheNghiep] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiCuoc]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiCuoc](
	[TG_BatDau] [time](7) NOT NULL,
	[TG_KetThuc] [time](7) NOT NULL,
	[GiaCuoc] [decimal](18, 0) NOT NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sim]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sim](
	[MaSim] [int] IDENTITY(1,1) NOT NULL,
	[SoSim] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSim] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CuocGoi] ON 

INSERT [dbo].[CuocGoi] ([MaCuocGoi], [MaSim], [TG_BatDau], [TG_KetThuc], [SoPhutSD]) VALUES (0, 2, CAST(N'2017-04-01T11:59:48.000' AS DateTime), CAST(N'2017-04-01T12:59:48.000' AS DateTime), 60)
INSERT [dbo].[CuocGoi] ([MaCuocGoi], [MaSim], [TG_BatDau], [TG_KetThuc], [SoPhutSD]) VALUES (2, 2, CAST(N'2018-11-10T01:50:26.000' AS DateTime), CAST(N'2018-11-10T01:51:13.000' AS DateTime), 1)
INSERT [dbo].[CuocGoi] ([MaCuocGoi], [MaSim], [TG_BatDau], [TG_KetThuc], [SoPhutSD]) VALUES (3, 3, CAST(N'2018-11-10T08:55:43.000' AS DateTime), CAST(N'2018-11-10T10:15:36.000' AS DateTime), 80)
INSERT [dbo].[CuocGoi] ([MaCuocGoi], [MaSim], [TG_BatDau], [TG_KetThuc], [SoPhutSD]) VALUES (4, 3, CAST(N'2018-11-10T11:31:49.000' AS DateTime), CAST(N'2018-11-10T02:38:27.000' AS DateTime), 33)
INSERT [dbo].[CuocGoi] ([MaCuocGoi], [MaSim], [TG_BatDau], [TG_KetThuc], [SoPhutSD]) VALUES (6, 4, CAST(N'2018-03-10T01:58:02.000' AS DateTime), CAST(N'2018-03-10T02:15:34.000' AS DateTime), 20)
SET IDENTITY_INSERT [dbo].[CuocGoi] OFF
SET IDENTITY_INSERT [dbo].[HoaDonDK] ON 

INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (0, 2, CAST(N'2016-09-29T11:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 0)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (1, 3, CAST(N'2016-12-15T13:22:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (2, 4, CAST(N'2016-12-15T13:23:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 2)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (3, 5, CAST(N'2016-12-29T16:30:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 3)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (4, 6, CAST(N'2017-04-28T15:58:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 4)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (5, 7, CAST(N'2018-06-22T00:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 5)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (6, 8, CAST(N'2017-09-21T11:25:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 6)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (7, 9, CAST(N'2017-06-26T17:45:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 7)
INSERT [dbo].[HoaDonDK] ([MaHD], [MaSim], [TG_DangKy], [ChiPhi], [MaKH]) VALUES (8, 10, CAST(N'2016-10-21T18:00:00.000' AS DateTime), CAST(50000 AS Decimal(18, 0)), 7)
SET IDENTITY_INSERT [dbo].[HoaDonDK] OFF
SET IDENTITY_INSERT [dbo].[HoaDonThanhToan] ON 

INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (0, 0, 2, CAST(50000 AS Decimal(18, 0)), CAST(N'2016-11-03T02:27:04.000' AS DateTime), 1, CAST(150000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (2, 2, 3, CAST(50000 AS Decimal(18, 0)), CAST(N'2016-11-21T06:46:36.000' AS DateTime), 0, CAST(300000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (3, 2, 4, CAST(50000 AS Decimal(18, 0)), CAST(N'2016-12-04T13:21:46.000' AS DateTime), 1, CAST(190000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (4, 3, 5, CAST(50000 AS Decimal(18, 0)), CAST(N'2017-01-06T09:49:32.000' AS DateTime), 0, CAST(280000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (5, 4, 6, CAST(50000 AS Decimal(18, 0)), CAST(N'2017-07-05T07:57:09.000' AS DateTime), 1, CAST(185000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (6, 5, 7, CAST(50000 AS Decimal(18, 0)), CAST(N'2017-07-16T01:33:37.000' AS DateTime), 1, CAST(230500 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (7, 7, 9, CAST(50000 AS Decimal(18, 0)), CAST(N'2017-08-17T20:15:22.000' AS DateTime), 0, CAST(320000 AS Decimal(18, 0)), 1)
INSERT [dbo].[HoaDonThanhToan] ([MaHD], [MaKH], [MaSim], [CuocThueBao], [TG_TaoHoaDon], [ThanhToan], [ThanhTien], [Status]) VALUES (8, 7, 10, CAST(50000 AS Decimal(18, 0)), CAST(N'2017-09-15T01:44:56.000' AS DateTime), 1, CAST(880000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[HoaDonThanhToan] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (0, N'CTY TNHH THƯƠNG MẠI HOA LỢI', N'25400649', N'Kinh Doanh', N'284/6, NGUYỄN TRỌNG TUYỂN, P.10, PHÚ NHUẬN', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (2, N'NGUYỄN NGỌC HUỲNH NHƯ', N'25454976', N'Bán Hàng', N'30/32 - NGUYỄN BỈNH KHIÊM - P.1 - GÒ VẤP - TP HCM', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (3, N'ĐÀO VĂN PHÚC', N'25446098', N'Nội Trợ', N'58/647, NGUYỄN OANH, P.17, GÒ VẤP', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (4, N'CTY TNHH TM DV VẬN TẢI DƯƠNG THÀNH', N'25433339', N'Kinh Doanh', N'46/1, HÙNG VƯƠNG, P.1, Q.10', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (5, N'PHẠM THỊ VÂN KHÁNH', N'25488912', N'Giảng Viên', N'326, NGUYỄN CHÍ THANH, P.5, Q.10', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (6, N'TRỊNH THỊ HỒNG', N'25494671', N'Sinh Viên', N'161/3F, HÙNG VƯƠNG, P.6, Q.06', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (7, N'NGUYỄN THANH THẠCH', N'25450784', N'Văn Phòng', N'20, KHU 1, TÂN SƠN NHÌ, TÂN SƠN NHÌ, TÂN PHÚ', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (9, N'VÕ THANH BÌNH', N'25458659
', N'Bán Hàng', N'232/6, VÕ THỊ SÁU, P.7, Q.03', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (10, N'LÊ THỊ THU CÚC', N'25423812
', N'Sinh Viên', N'338A, NƠ TRANG LONG, P.13, BÌNH THẠNH', 1)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [CMND], [NgheNghiep], [DiaChi], [Status]) VALUES (11, N'asdsad', N'asdsd', N'asdasd', N'ssssssssssssss', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiCuoc] ([TG_BatDau], [TG_KetThuc], [GiaCuoc], [Status]) VALUES (CAST(N'07:00:00' AS Time), CAST(N'23:00:00' AS Time), CAST(200 AS Decimal(18, 0)), 1)
INSERT [dbo].[LoaiCuoc] ([TG_BatDau], [TG_KetThuc], [GiaCuoc], [Status]) VALUES (CAST(N'23:00:00' AS Time), CAST(N'07:00:00' AS Time), CAST(150 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[Sim] ON 

INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (2, N'84913805266', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (3, N'841236969334', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (4, N'84913919143', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (5, N'84918725997', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (6, N'84913905878', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (7, N'84918588499', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (8, N'84948021619', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (9, N'84918015588', 1)
INSERT [dbo].[Sim] ([MaSim], [SoSim], [Status]) VALUES (10, N'84913750047', 1)
SET IDENTITY_INSERT [dbo].[Sim] OFF
ALTER TABLE [dbo].[CuocGoi]  WITH CHECK ADD  CONSTRAINT [FK_CuocGoi_Sim] FOREIGN KEY([MaSim])
REFERENCES [dbo].[Sim] ([MaSim])
GO
ALTER TABLE [dbo].[CuocGoi] CHECK CONSTRAINT [FK_CuocGoi_Sim]
GO
ALTER TABLE [dbo].[HoaDonDK]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDK_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonDK] CHECK CONSTRAINT [FK_HoaDonDK_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonDK]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDK_Sim] FOREIGN KEY([MaSim])
REFERENCES [dbo].[Sim] ([MaSim])
GO
ALTER TABLE [dbo].[HoaDonDK] CHECK CONSTRAINT [FK_HoaDonDK_Sim]
GO
ALTER TABLE [dbo].[HoaDonThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonThanhToan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDonThanhToan] CHECK CONSTRAINT [FK_HoaDonThanhToan_KhachHang]
GO
ALTER TABLE [dbo].[HoaDonThanhToan]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonThanhToan_Sim] FOREIGN KEY([MaSim])
REFERENCES [dbo].[Sim] ([MaSim])
GO
ALTER TABLE [dbo].[HoaDonThanhToan] CHECK CONSTRAINT [FK_HoaDonThanhToan_Sim]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetHDDangKi]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE  [dbo].[SP_GetHDDangKi]
@MaKH int
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select * from HoaDonDK where MaKH = @MaKH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadAllKhachHang]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_LoadAllKhachHang]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from KhachHang

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoHDDangKi]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TaoHDDangKi]
@MaSim int,
@tgThanhToan date,
@ChiPhi money,
@MaKH int
	-- Add the parameters for the stored procedure here
AS
BEGIN
	insert into HoaDonDK(MaSim,TG_DangKy,ChiPhi,MaKH) values (@MaSim,@tgThanhToan,@ChiPhi,@MaKH) 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoHDThanhToan]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TaoHDThanhToan]
@MaKH int,
@MaSim int,
@CuocThueBao int,
@tgThanhToan date,
@ThanhToan bit,
@ThanhTien money,
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	insert into HoaDonThanhToan(MaKH,MaSim,CuocThueBao,TG_TaoHoaDon,ThanhToan,ThanhTien,Status) values (@MaKH,@MaSim,@CuocThueBao,@tgThanhToan,@ThanhToan,@ThanhTien,@Status) 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoKH]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TaoKH]
@Ten nvarchar(50),
@NgheNghiep nvarchar(50),
@Cmnd nvarchar(50),
@DiaChi nvarchar(50),
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	Insert into KhachHang (TenKH,NgheNghiep,CMND, DiaChi, Status )values(@Ten,@NgheNghiep,@Cmnd,@DiaChi,@Status)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKH]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TimKiemKH]
@Cot varchar(50),
@Text varchar(50)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from KhachHang where @Cot like @Text

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKHByMa]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TimKiemKHByMa]
@Text int
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from KhachHang where MaKH = @Text

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKHByTen]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_TimKiemKHByTen]
@Text nvarchar(50)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from KhachHang where TenKH like @Text

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateKH]    Script Date: 12/1/2018 2:04:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_UpdateKH]
@Id int,
@Ten nvarchar(50),
@NgheNghiep nvarchar(50),
@Cmnd nvarchar(50),
@DiaChi nvarchar(50),
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	update KhachHang set TenKH=@Ten,NgheNghiep=@NgheNghiep,CMND=@Cmnd, DiaChi=@DiaChi, Status=@Status
	where MaKH = @Id
END
GO
USE [master]
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET  READ_WRITE 
GO
