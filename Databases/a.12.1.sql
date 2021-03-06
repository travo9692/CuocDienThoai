USE [master]
GO
/****** Object:  Database [CUOC_DIENTHOAI]    Script Date: 12/1/2018 6:01:42 PM ******/
CREATE DATABASE [CUOC_DIENTHOAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CUOC_DIENTHOAI', FILENAME = N'D:\CUOC_DIENTHOAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CUOC_DIENTHOAI_log', FILENAME = N'D:\CUOC_DIENTHOAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [CUOC_DIENTHOAI] SET AUTO_CREATE_STATISTICS ON 
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
USE [CUOC_DIENTHOAI]
GO
/****** Object:  StoredProcedure [dbo].[SP_DanhSachHDTT]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoHDThanhToan]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TaoKH]    Script Date: 12/1/2018 6:01:42 PM ******/
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
	
	Insert into KhachHang values(@Ten,@NgheNghiep,@Cmnd,@DiaChi,@Status)

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKH]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKHByMa]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TimKiemKHByTen]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TimKiemMaSimMax]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_TimKiemMaSimMax]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT Max(MaSim) from Sim
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemSim]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_TimKiemSim]
@Cot varchar(50),
@Text varchar(50)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from Sim where @Cot like @Text

END
GO
/****** Object:  StoredProcedure [dbo].[SP_TimKiemSimSo]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_TimKiemSimSo]
@Text varchar(50)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from Sim where SoSim like @Text

END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateDHTT]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_UpdateDHTT]
@MaKH int, 
@MaSim int,
@CuocThueBao decimal, 
@TG_TaoHoaDon datetime, 
@ThanhToan bit, 
@ThanhTien decimal, 
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	update HoaDonThanhToan set MaKH=@MaKH,MaSim=@MaSim ,CuocThueBao=@CuocThueBao ,TG_TaoHoaDon=@TG_TaoHoaDon ,ThanhToan = @ThanhToan ,ThanhTien = @ThanhTien ,Status = @Status
	where MaKH = @MaKH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateKH]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_UpdateKH]
@Id int,
@Ten nvarchar(50),
@NgheNghiep nvarchar(50),
@Cmnd nvarchar(50),
@DiaChi nvarchar(50)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	update KhachHang set TenKH=@Ten,NgheNghiep=@NgheNghiep,CMND=@Cmnd, DiaChi=@DiaChi
	where MaKH = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateKHStatus]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_UpdateKHStatus]
@MaKH int, 
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	update KhachHang set Status=@Status
	where MaKH = @MaKH
END
GO
/****** Object:  Table [dbo].[CuocGoi]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  Table [dbo].[HoaDonDK]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  Table [dbo].[HoaDonThanhToan]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  Table [dbo].[LoaiCuoc]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  Table [dbo].[Sim]    Script Date: 12/1/2018 6:01:42 PM ******/
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
USE [master]
GO
ALTER DATABASE [CUOC_DIENTHOAI] SET  READ_WRITE 
GO
