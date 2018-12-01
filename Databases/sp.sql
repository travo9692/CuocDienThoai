GO
create PROCEDURE  [dbo].[SP_DanhSachHDTT]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from HoaDonThanhToan

END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetHDDangKi]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_GetHDTT]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SP_GetHDTT]
@MaKH int
	-- Add the parameters for the stored procedure here
AS
BEGIN
	Select * from HoaDonThanhToan where MaKH = @MaKH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertSim]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_InsertSim]
@SoSIm nvarchar(50), 
@Status bit
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	insert into Sim values (@SoSIm,@Status)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadAllHDTT]    Script Date: 12/1/2018 6:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[SP_LoadAllHDTT]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SELECT * from HoaDonThanhToan

END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoadAllKhachHang]    Script Date: 12/1/2018 6:01:42 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_TaoHDDangKi]    Script Date: 12/1/2018 6:01:42 PM ******/
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
