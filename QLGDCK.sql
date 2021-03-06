USE [master]
GO
/****** Object:  Database [QLGDCK]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE DATABASE [QLGDCK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLGDCK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLGDCK.mdf' , SIZE = 63488KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLGDCK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLGDCK_log.ldf' , SIZE = 69760KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLGDCK] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLGDCK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLGDCK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLGDCK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLGDCK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLGDCK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLGDCK] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLGDCK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLGDCK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLGDCK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLGDCK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLGDCK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLGDCK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLGDCK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLGDCK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLGDCK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLGDCK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLGDCK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLGDCK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLGDCK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLGDCK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLGDCK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLGDCK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLGDCK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLGDCK] SET RECOVERY FULL 
GO
ALTER DATABASE [QLGDCK] SET  MULTI_USER 
GO
ALTER DATABASE [QLGDCK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLGDCK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLGDCK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLGDCK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLGDCK] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLGDCK', N'ON'
GO
USE [QLGDCK]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE ROLE [MSmerge_PAL_role]
GO
/****** Object:  DatabaseRole [MSmerge_BD6306F316A64321899374291CF6B149]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE ROLE [MSmerge_BD6306F316A64321899374291CF6B149]
GO
/****** Object:  DatabaseRole [MSmerge_A33E74A683F44E8E82071C29AF46C215]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE ROLE [MSmerge_A33E74A683F44E8E82071C29AF46C215]
GO
/****** Object:  DatabaseRole [MSmerge_32E8E3561F4243B49CAD74BA41C338B7]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE ROLE [MSmerge_32E8E3561F4243B49CAD74BA41C338B7]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_BD6306F316A64321899374291CF6B149]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_A33E74A683F44E8E82071C29AF46C215]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_32E8E3561F4243B49CAD74BA41C338B7]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  Table [dbo].[CONGTYCHUNGKHOAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGTYCHUNGKHOAN](
	[MaCTCK] [nchar](3) NOT NULL,
	[TenCTCK] [nvarchar](200) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_64BC909C08D14FBE858BA2E912913F66]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_CONGTYCHUNGKHOAN] PRIMARY KEY CLUSTERED 
(
	[MaCTCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[COPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COPHIEU](
	[MaCP] [int] NOT NULL,
	[TenCP] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[SoDT] [nvarchar](12) NOT NULL,
	[Fax] [nvarchar](12) NOT NULL,
	[DiaChiWebsite] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SoLuongCP] [int] NOT NULL,
	[MaSGD] [nchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_368CA9E34DF344AAA1E0F889F8113521]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_COPHIEU] PRIMARY KEY CLUSTERED 
(
	[MaCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHOPLENH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOPLENH](
	[MaKL] [int] NOT NULL,
	[NgayGio] [datetime] NOT NULL,
	[SoLuongKhop] [int] NOT NULL,
	[PhiGiaoDich] [float] NOT NULL,
	[GiaKhop] [float] NOT NULL,
	[MaLD] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_2D04E0F904D14165BB80FC6B226BC4E8]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_KHOPLENH] PRIMARY KEY CLUSTERED 
(
	[MaKL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LENHDAT]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENHDAT](
	[MaLD] [int] NOT NULL,
	[SoLuongDat] [int] NOT NULL,
	[GiaDat] [float] NOT NULL,
	[NgayGio] [datetime] NOT NULL,
	[MaLL] [nchar](2) NOT NULL,
	[MaTKNH] [nchar](20) NOT NULL,
	[MaLGD] [nchar](3) NOT NULL,
	[MaTT] [nchar](15) NOT NULL CONSTRAINT [DF_LENHDAT_MaTT]  DEFAULT (N'CK'),
	[MaCP] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_23636846526445E1A323A375C6ECFDDC]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_LENHDAT] PRIMARY KEY CLUSTERED 
(
	[MaLD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LICHSUGIA]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LICHSUGIA](
	[MaCP] [int] NOT NULL,
	[NgayGio] [datetime] NOT NULL,
	[GiaTran] [float] NOT NULL,
	[GiaSan] [float] NOT NULL,
	[GiaThamChieu] [float] NOT NULL,
	[GiaDongCua] [float] NULL CONSTRAINT [DF_LICHSUGIA_GiaDongCua]  DEFAULT ((0)),
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_685EF6EE70544601AF8E7844081BBCAA]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_LICHSUGIA] PRIMARY KEY CLUSTERED 
(
	[MaCP] ASC,
	[NgayGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAIGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIGIAODICH](
	[MaLGD] [nchar](3) NOT NULL,
	[TenLoaiGiaoDich] [nvarchar](20) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_7719927873214F349F3A4878068B67D9]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_LOAIGIAODICH] PRIMARY KEY CLUSTERED 
(
	[MaLGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOAILENH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAILENH](
	[MaLL] [nchar](2) NOT NULL,
	[TenLoaiLenh] [nvarchar](20) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_D842FC06C528454692935FF3D11B617C]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_LOAILENH] PRIMARY KEY CLUSTERED 
(
	[MaLL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGANHANG](
	[MaNH] [nchar](4) NOT NULL,
	[TenNH] [nvarchar](200) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_F79EDC114DB14E0AA570D70ADDF50DBE]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NGANHANG] PRIMARY KEY CLUSTERED 
(
	[MaNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHADAUTU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHADAUTU](
	[MaTK] [nchar](10) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[Phai] [bit] NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[SoDT] [nvarchar](12) NOT NULL,
	[CMND] [nvarchar](12) NOT NULL,
	[Passport] [nvarchar](12) NOT NULL,
	[NgayCap] [date] NOT NULL,
	[QuocGia] [nvarchar](50) NOT NULL,
	[MKGiaoDich] [nvarchar](20) NOT NULL,
	[MKDatLenh] [nvarchar](20) NOT NULL,
	[MaCTCK] [nchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_99C6D08E7AFD4115AD68B4B7AC4532A1]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NHADAUTU] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nchar](6) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoDT] [nvarchar](12) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[DaNghiViec] [bit] NOT NULL,
	[MaCTCK] [nchar](3) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_821822B491CD4736A3A4A50356A5C522]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIENSAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIENSAN](
	[MaNV] [nchar](5) NOT NULL,
	[Ho] [nvarchar](10) NOT NULL,
	[Ten] [nvarchar](10) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SoDT] [nvarchar](12) NOT NULL,
	[DiaChi] [nvarchar](200) NOT NULL,
	[DaNghiViec] [bit] NOT NULL,
	[MaSGD] [nchar](3) NOT NULL CONSTRAINT [DF_NHANVIENSAN_MaSGD]  DEFAULT (N'HNX'),
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_278255BA13D2471B9B7796B64CF061EB]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_NHANVIENSAN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QUYDINHCHUNG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYDINHCHUNG](
	[MaSGD] [nchar](3) NOT NULL,
	[Ngay] [date] NOT NULL CONSTRAINT [DF_QUYDICHCHUNG_Ngay]  DEFAULT (getdate()),
	[MoTaQuyDinh] [nvarchar](50) NOT NULL,
	[GiaQuyDinh] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_54EA64F6A2B0464EA0F6E1696C066D40]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_QUYDICHCHUNG] PRIMARY KEY CLUSTERED 
(
	[MaSGD] ASC,
	[Ngay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANGIAODICH](
	[MaSGD] [nchar](3) NOT NULL,
	[TenSanGiaoDich] [nvarchar](100) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_89C00E8AFD1447498C50854DBB68781A]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_SANGIAODICH] PRIMARY KEY CLUSTERED 
(
	[MaSGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SOHUU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SOHUU](
	[MaTK] [nchar](10) NOT NULL,
	[MaCP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_AF6F6EA428A547A48938A608CD19A0FE]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_SOHUU] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC,
	[MaCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TAIKHOANNGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOANNGANHANG](
	[MaTKNH] [nchar](20) NOT NULL,
	[SoDuTKNH] [float] NOT NULL,
	[MaTK] [nchar](10) NOT NULL,
	[MaNH] [nchar](4) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_5AC353A1620C474795F494E14CF28E98]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_TAIKHOANNGANHANG] PRIMARY KEY CLUSTERED 
(
	[MaTKNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THAYDOIGIA]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THAYDOIGIA](
	[MaLGD] [nchar](3) NOT NULL,
	[MaCTCK] [nchar](3) NOT NULL,
	[NgayGio] [datetime] NOT NULL CONSTRAINT [DF_THAYDOIGIA_Ngay]  DEFAULT (getdate()),
	[GiaPhi] [float] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_9D727FD0FACC4C0389F1A9D2F62F86E7]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[MaLGD] ASC,
	[MaCTCK] ASC,
	[NgayGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TRANGTHAI]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANGTHAI](
	[MaTT] [nchar](15) NOT NULL,
	[TenTrangThai] [nvarchar](20) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [MSmerge_df_rowguid_C0192D872851431DB89BCC95C0948485]  DEFAULT (newsequentialid()),
 CONSTRAINT [PK_TRANGTHAI] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[V_DS_PHANMANH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_DS_PHANMANH]
AS
SELECT  TENCN=PUBS.description, TENSERVER= subscriber_server
   FROM dbo.sysmergepublications PUBS,  dbo.sysmergesubscriptions SUBS
   WHERE PUBS.pubid= SUBS.PUBID  AND PUBS.publisher <> SUBS.subscriber_server

GO
INSERT [dbo].[CONGTYCHUNGKHOAN] ([MaCTCK], [TenCTCK], [DiaChi], [rowguid]) VALUES (N'010', N'Công Ty Chứng Khoán  Số 1', N'Hải Phòng', N'6d9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[CONGTYCHUNGKHOAN] ([MaCTCK], [TenCTCK], [DiaChi], [rowguid]) VALUES (N'020', N'Công Ty Chứng Khoán Số 2', N'Hà Nội', N'6e9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[COPHIEU] ([MaCP], [TenCP], [DiaChi], [SoDT], [Fax], [DiaChiWebsite], [Email], [SoLuongCP], [MaSGD], [rowguid]) VALUES (156010, N'Ngân Hàng Thương mại Cổ phần Á Châu', N'Hà Nội', N'5672371829', N'12367813123', N'nganhang.com.vn', N'nganhang@gmail.com', 1500, N'HNX', N'409f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[COPHIEU] ([MaCP], [TenCP], [DiaChi], [SoDT], [Fax], [DiaChiWebsite], [Email], [SoLuongCP], [MaSGD], [rowguid]) VALUES (432020, N'Công ty Cổ phần Xi măng Bỉm Sơn', N'Hà Nội', N'7893128375', N'63721638761', N'ximang.com.vn', N'ximang@gmail.com', 2000, N'HNX', N'3e9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[COPHIEU] ([MaCP], [TenCP], [DiaChi], [SoDT], [Fax], [DiaChiWebsite], [Email], [SoLuongCP], [MaSGD], [rowguid]) VALUES (789020, N'Ngân hàng Nông nghiệp Phát triển Nông thôn Việt Nam', N'TP. Hồ Chí Minh', N'0545213126', N'02131231344', N'nongthon.com', N'nongthon@gmail.com', 60000, N'HNX', N'3f9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (2010, CAST(N'2020-11-11 23:49:04.000' AS DateTime), 100, 500000, 100000, 1010, N'4199e39f-7539-eb11-a257-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (4010, CAST(N'2020-11-11 00:01:19.000' AS DateTime), 100, 500000, 100000, 3010, N'ca13821f-7739-eb11-a257-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (5010, CAST(N'2020-11-11 11:20:49.000' AS DateTime), 50, 250000, 100000, 3010, N'3d88f0f4-d539-eb11-a257-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (7010, CAST(N'2020-11-11 18:17:53.000' AS DateTime), 100, 750000, 150000, 6010, N'abfe0c3b-c73e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (9010, CAST(N'2020-11-11 18:45:44.000' AS DateTime), 100, 750000, 150000, 8010, N'caf54e2a-cb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (11010, CAST(N'2020-11-11 18:56:00.000' AS DateTime), 100, 750000, 150000, 10010, N'8c04c88e-cc3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (13010, CAST(N'2020-11-11 00:07:38.000' AS DateTime), 50, 25000, 10000, 12010, N'0659c718-f83e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[KHOPLENH] ([MaKL], [NgayGio], [SoLuongKhop], [PhiGiaoDich], [GiaKhop], [MaLD], [rowguid]) VALUES (15010, CAST(N'2020-11-11 00:30:29.000' AS DateTime), 50, 25000, 10000, 14010, N'f80b2b46-fb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (1010, 0, 100000, CAST(N'2020-11-11 23:49:04.000' AS DateTime), N'LO', N'023123123           ', N'GDM', N'KHOPHET        ', 156010, N'd2d3b155-7539-eb11-a257-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (2010, 0, 100000, CAST(N'2020-11-11 23:51:15.000' AS DateTime), N'LO', N'02313435            ', N'GDB', N'KHOPHET        ', 156010, N'4299e39f-7539-eb11-a257-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (3010, 0, 100000, CAST(N'2020-11-11 00:01:19.000' AS DateTime), N'LO', N'02313435            ', N'GDM', N'KHOPHET        ', 156010, N'b64ffe0e-7739-eb11-a257-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (4010, 0, 100000, CAST(N'2020-11-11 00:01:58.000' AS DateTime), N'LO', N'023123123           ', N'GDB', N'KHOPHET        ', 156010, N'cb13821f-7739-eb11-a257-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (5010, 0, 100000, CAST(N'2020-11-11 11:20:49.000' AS DateTime), N'LO', N'023123123           ', N'GDB', N'KHOPHET        ', 156010, N'3e88f0f4-d539-eb11-a257-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (6010, 0, 150000, CAST(N'2020-11-11 18:16:10.000' AS DateTime), N'LO', N'023123123           ', N'GDM', N'KHOPHET        ', 156010, N'f72d3f14-c73e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (7010, 0, 100000, CAST(N'2020-11-11 18:17:53.000' AS DateTime), N'LO', N'02313435            ', N'GDB', N'KHOPHET        ', 156010, N'adfe0c3b-c73e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (8010, 0, 150000, CAST(N'2020-11-11 18:45:01.000' AS DateTime), N'LO', N'023123123           ', N'GDM', N'KHOPHET        ', 156010, N'ba229708-cb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (9010, 0, 100000, CAST(N'2020-11-11 18:45:44.000' AS DateTime), N'LO', N'02313435            ', N'GDB', N'KHOPHET        ', 156010, N'cbf54e2a-cb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (10010, 0, 150000, CAST(N'2020-11-11 18:53:53.000' AS DateTime), N'LO', N'023123123           ', N'GDM', N'KHOPHET        ', 156010, N'f6255966-cc3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (11010, 0, 100000, CAST(N'2020-11-11 18:56:00.000' AS DateTime), N'LO', N'02313435            ', N'GDB', N'KHOPHET        ', 156010, N'8d04c88e-cc3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (12010, 0, 10000, CAST(N'2020-11-11 23:51:07.000' AS DateTime), N'LO', N'023123123           ', N'GDM', N'KHOPHET        ', 156010, N'c231b0e1-f53e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (13010, 0, 10000, CAST(N'2020-11-11 00:07:38.000' AS DateTime), N'LO', N'02313435            ', N'GDB', N'KHOPHET        ', 156010, N'0759c718-f83e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (14010, 0, 10000, CAST(N'2020-11-11 00:29:56.000' AS DateTime), N'LO', N'023123123           ', N'GDB', N'KHOPHET        ', 156010, N'0496d731-fb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LENHDAT] ([MaLD], [SoLuongDat], [GiaDat], [NgayGio], [MaLL], [MaTKNH], [MaLGD], [MaTT], [MaCP], [rowguid]) VALUES (15010, 0, 10000, CAST(N'2020-11-11 00:30:29.000' AS DateTime), N'LO', N'02313435            ', N'GDM', N'KHOPHET        ', 156010, N'f90b2b46-fb3e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[LICHSUGIA] ([MaCP], [NgayGio], [GiaTran], [GiaSan], [GiaThamChieu], [GiaDongCua], [rowguid]) VALUES (156010, CAST(N'2020-10-14 00:00:00.000' AS DateTime), 16.5, 13.5, 15, 0, N'a29cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[LICHSUGIA] ([MaCP], [NgayGio], [GiaTran], [GiaSan], [GiaThamChieu], [GiaDongCua], [rowguid]) VALUES (156010, CAST(N'2020-11-11 00:00:00.000' AS DateTime), 7, 6, 5, 0, N'a39cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[LICHSUGIA] ([MaCP], [NgayGio], [GiaTran], [GiaSan], [GiaThamChieu], [GiaDongCua], [rowguid]) VALUES (432020, CAST(N'2020-10-14 00:00:00.000' AS DateTime), 11, 9, 10, 0, N'a49cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[LICHSUGIA] ([MaCP], [NgayGio], [GiaTran], [GiaSan], [GiaThamChieu], [GiaDongCua], [rowguid]) VALUES (789020, CAST(N'2020-11-11 00:00:00.000' AS DateTime), 5, 3, 4, 0, N'a59cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[LICHSUGIA] ([MaCP], [NgayGio], [GiaTran], [GiaSan], [GiaThamChieu], [GiaDongCua], [rowguid]) VALUES (789020, CAST(N'2020-11-12 00:00:00.000' AS DateTime), 4, 8, 7, 0, N'a69cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[LOAIGIAODICH] ([MaLGD], [TenLoaiGiaoDich], [rowguid]) VALUES (N'GDB', N'Bán', N'3c9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[LOAIGIAODICH] ([MaLGD], [TenLoaiGiaoDich], [rowguid]) VALUES (N'GDM', N'Mua', N'3d9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[LOAILENH] ([MaLL], [TenLoaiLenh], [rowguid]) VALUES (N'LO', N'Lệnh đặt giới hạn', N'3a9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[LOAILENH] ([MaLL], [TenLoaiLenh], [rowguid]) VALUES (N'MP', N'Lệnh thị trường', N'3b9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'ABBK', N'Ngân hàng TMCP An Bình', N'7c9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'ANZB', N'Ngân hàng TNHH một thành viên ANZ Việt Nam', N'929cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'ASCB', N'Ngân hàng TMCP Á Châu', N'7b9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'BFTV', N'Ngân hàng TMCP Ngoại Thương Việt Nam', N'869cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'BIDV', N'Ngân hàng TMCP Đầu Tư Và Phát Triển Việt Nam', N'819cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'BVBV', N'Ngân hàng Bảo Việt', N'6f9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'CITI', N'Ngân hàng Citibank Việt Nam', N'709cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'EACB', N'Ngân hàng TMCP Đông Á', N'829cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'EBVI', N'Ngân hàng TMCP Xuất nhập khẩu Việt Nam', N'919cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'GBNK', N'Ngân hàng Dầu khí toàn cầu', N'719cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'GTBA', N'Ngân hàng thương mại TNHH MTV Xây dựng Việt Nam', N'799cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'HDBC', N'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', N'879cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'HSBC', N'Ngân hàng TNHH một thành viên HSBC (Việt Nam)', N'939cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'ICBV', N'Ngân hàng TMCP Công Thương Việt Nam', N'7f9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'KLBK', N'Ngân hàng Thương mại Cổ phần Kiên Long', N'759cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'LVBK', N'Ngân hàng TMCP Bưu Điện Liên Việt', N'7e9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'MCOB', N'Ngân hàng TMCP Hàng Hải Việt Nam', N'849cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'MHBB', N'Ngân hàng Phát triển nhà đồng bằng sông Cửu Long', N'739cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'MSCB', N'Ngân hàng thương mại cổ phần Quân Đội', N'779cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'NAMA', N'Ngân hàng Thương Mại cổ phần Nam Á', N'769cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'NASC', N'Ngân hàng TMCP Bắc Á', N'7d9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'OJBA', N'Ngân hàng TM TNHH 1 thành viên Đại Dương', N'7a9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'ORCO', N'Ngân hàng TMCP Phương Đông', N'889cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'PGBL', N'Ngân hàng TMCP Xăng dầu Petrolimex', N'909cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'PNBK', N'Ngân hàng TMCP Phương Nam', N'899cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SACL', N'Ngân hàng TMCP Sài Gòn', N'8b9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SBIT', N'Ngân Hàng TMCP Sài Gòn Công Thương', N'8c9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SEAV', N'Ngân hàng TMCP Đông Nam Á', N'839cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SGTT', N'Ngân hàng TMCP Sài Gòn Thương Tín', N'8d9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SHBA', N'Ngân Hàng Thương Mại cổ phần Sài Gòn – Hà Nội', N'789cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'SHBK', N'Ngân hàng Shinhan', N'749cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'TPBV', N'Ngân hàng TMCP Tiên Phong', N'8e9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VBAA', N'Ngân hàng Nông Nghiệp Và Phát Triển Việt Nam', N'729cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VNAC', N'Ngân hàng TMCP Việt Á', N'8f9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VNIB', N'Ngân hàng TMCP Quốc tế Việt Nam', N'8a9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VNTT', N'Ngân hàng Việt Nam Thương Tín', N'959cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VPBK', N'Ngân hàng Việt Nam Thịnh Vượng', N'949cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'VTCB', N'Ngân hàng TMCP Kỹ Thương Việt Nam', N'859cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NGANHANG] ([MaNH], [TenNH], [rowguid]) VALUES (N'WBVN', N'Ngân hàng TMCP Đại Chúng Việt Nam', N'809cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHADAUTU] ([MaTK], [Ho], [Ten], [NgaySinh], [Phai], [DiaChi], [Email], [SoDT], [CMND], [Passport], [NgayCap], [QuocGia], [MKGiaoDich], [MKDatLenh], [MaCTCK], [rowguid]) VALUES (N'0100000001', N'Nguyễn', N'Huy', CAST(N'1995-05-06' AS Date), 1, N'Phú Nhuận', N'huh@gmail.com', N'01237894563', N'12345678912', N'12378943513', CAST(N'2012-04-05' AS Date), N'Việt Nam', N'123', N'123', N'010', N'329f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NHADAUTU] ([MaTK], [Ho], [Ten], [NgaySinh], [Phai], [DiaChi], [Email], [SoDT], [CMND], [Passport], [NgayCap], [QuocGia], [MKGiaoDich], [MKDatLenh], [MaCTCK], [rowguid]) VALUES (N'0100000002', N'dsadas', N'adasd', CAST(N'2020-11-01' AS Date), 0, N'dasdasdas', N'sadd                                                                                                ', N'2313123', N'2134565', N'43243242', CAST(N'2020-11-01' AS Date), N'eqweq', N'123', N'123', N'010', N'339f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NHADAUTU] ([MaTK], [Ho], [Ten], [NgaySinh], [Phai], [DiaChi], [Email], [SoDT], [CMND], [Passport], [NgayCap], [QuocGia], [MKGiaoDich], [MKDatLenh], [MaCTCK], [rowguid]) VALUES (N'0100000004', N'sadasd', N'weqwe', CAST(N'2020-11-10' AS Date), 0, N'fdfgfhfgh', N'gtverve                                                                                             ', N'0435134423', N'0766741232', N'0343543554', CAST(N'2020-11-10' AS Date), N'frrtyh', N'123', N'123', N'010', N'319f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NHADAUTU] ([MaTK], [Ho], [Ten], [NgaySinh], [Phai], [DiaChi], [Email], [SoDT], [CMND], [Passport], [NgayCap], [QuocGia], [MKGiaoDich], [MKDatLenh], [MaCTCK], [rowguid]) VALUES (N'0200000001', N'Nguyễn', N'Thư', CAST(N'1996-08-14' AS Date), 0, N'Gò Vấp', N'thu@gmail.com', N'02343241234', N'45435987112', N'32157897234', CAST(N'2013-06-02' AS Date), N'Việt Nam', N'456', N'456', N'020', N'359f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NHADAUTU] ([MaTK], [Ho], [Ten], [NgaySinh], [Phai], [DiaChi], [Email], [SoDT], [CMND], [Passport], [NgayCap], [QuocGia], [MKGiaoDich], [MKDatLenh], [MaCTCK], [rowguid]) VALUES (N'0200000002', N'sdadd', N'dsad', CAST(N'2020-11-01' AS Date), 0, N'adsdsadasd', N'asdasd                                                                                              ', N'2131231231', N'435456u678', N'2134354356', CAST(N'2020-11-01' AS Date), N'dasdsad', N'123', N'123', N'020', N'349f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'010001', N'Nguyễn', N'Trinh', 1, CAST(N'1993-03-25' AS Date), N'0123456789', N'Hồ Chí Minh', 0, N'010', N'979cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'010002', N'Huỳnh', N'Tuyết', 0, CAST(N'1992-05-12' AS Date), N'0987654321', N'Bình Phước', 1, N'010', N'989cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'010003', N'Nguyễn', N'Hoàn', 0, CAST(N'1993-10-31' AS Date), N'0213123123', N'Quảng Nam', 0, N'010', N'999cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'010004', N'sajdsad', N'sadasd', 1, CAST(N'2020-11-03' AS Date), N'03242341223', N'asdasdad', 1, N'010', N'9a9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'020001', N'Đinh', N'Phúc', 1, CAST(N'1994-07-12' AS Date), N'0765617231', N'Vũng Tàu', 0, N'020', N'9b9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIEN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaCTCK], [rowguid]) VALUES (N'020002', N'Vũ', N'Hòa', 0, CAST(N'1995-07-31' AS Date), N'0432412378', N'Bắc Giang', 0, N'020', N'9c9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIENSAN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaSGD], [rowguid]) VALUES (N'NV001', N'Trần', N'Hoa', 0, CAST(N'1994-06-18' AS Date), N'0123487651', N'Hải Phòng', 0, N'HNX', N'9d9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIENSAN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaSGD], [rowguid]) VALUES (N'NV002', N'Võ', N'Nguyên', 1, CAST(N'1993-09-08' AS Date), N'0123432478', N'Hà Nội', 1, N'HNX', N'9e9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIENSAN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaSGD], [rowguid]) VALUES (N'NV003', N'asddas', N'sadsadr', 0, CAST(N'1994-11-05' AS Date), N'0231234234', N'sadasd', 0, N'HNX', N'9f9cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[NHANVIENSAN] ([MaNV], [Ho], [Ten], [Phai], [NgaySinh], [SoDT], [DiaChi], [DaNghiViec], [MaSGD], [rowguid]) VALUES (N'NV005', N'asdasd', N'asdasd', 0, CAST(N'1995-11-06' AS Date), N'021321321', N'asdft4rewe', 0, N'HNX', N'a09cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[QUYDINHCHUNG] ([MaSGD], [Ngay], [MoTaQuyDinh], [GiaQuyDinh], [rowguid]) VALUES (N'HNX', CAST(N'2020-11-08' AS Date), N'Biên độ giá', 9, N'a19cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[SANGIAODICH] ([MaSGD], [TenSanGiaoDich], [rowguid]) VALUES (N'HNX', N'Sàn Giao Dịch Hà Nội', N'969cc63b-b724-eb11-a246-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0100000001', 156010, 500, N'636b8eb7-e528-eb11-a247-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0100000001', 432020, 500, N'ab70d941-8c2a-eb11-a24e-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0100000001', 789020, 500, N'0098e2e0-273e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0100000002', 156010, 500, N'acfe0c3b-c73e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0200000001', 156010, 500, N'a504342a-a728-eb11-a247-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0200000001', 432020, 500, N'103c24f2-273e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[SOHUU] ([MaTK], [MaCP], [SoLuong], [rowguid]) VALUES (N'0200000001', 789020, 500, N'056fdff8-273e-eb11-a259-206a8a7b4b21')
INSERT [dbo].[TAIKHOANNGANHANG] ([MaTKNH], [SoDuTKNH], [MaTK], [MaNH], [rowguid]) VALUES (N'0123789             ', 79000000, N'0200000001', N'BIDV', N'369f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TAIKHOANNGANHANG] ([MaTKNH], [SoDuTKNH], [MaTK], [MaNH], [rowguid]) VALUES (N'023123123           ', 30000000, N'0100000001', N'MSCB', N'379f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TAIKHOANNGANHANG] ([MaTKNH], [SoDuTKNH], [MaTK], [MaNH], [rowguid]) VALUES (N'02313435            ', 65000000, N'0100000002', N'SGTT', N'389f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TAIKHOANNGANHANG] ([MaTKNH], [SoDuTKNH], [MaTK], [MaNH], [rowguid]) VALUES (N'0987654             ', 15000000, N'0100000001', N'SGTT', N'399f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDB', N'010', CAST(N'2020-11-09 00:00:00.000' AS DateTime), 5, N'bd1923a1-a024-eb11-a246-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDB', N'010', CAST(N'2020-11-11 00:00:00.000' AS DateTime), 5, N'a38f89a0-a524-eb11-a246-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDB', N'020', CAST(N'2020-11-11 00:00:00.000' AS DateTime), 5, N'b624d9c5-5326-eb11-a247-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDM', N'010', CAST(N'2020-11-10 00:00:00.000' AS DateTime), 5, N'be1923a1-a024-eb11-a246-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDM', N'010', CAST(N'2020-11-11 00:00:00.000' AS DateTime), 5, N'a28f89a0-a524-eb11-a246-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDM', N'010', CAST(N'2020-11-12 00:00:00.000' AS DateTime), 5, N'0c64cc51-a224-eb11-a246-206a8a7b4b21')
INSERT [dbo].[THAYDOIGIA] ([MaLGD], [MaCTCK], [NgayGio], [GiaPhi], [rowguid]) VALUES (N'GDM', N'020', CAST(N'2020-11-11 00:00:00.000' AS DateTime), 5, N'd1bafcbc-5326-eb11-a247-206a8a7b4b21')
INSERT [dbo].[TRANGTHAI] ([MaTT], [TenTrangThai], [rowguid]) VALUES (N'CHOKHOP        ', N'Chờ khớp', N'2c9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TRANGTHAI] ([MaTT], [TenTrangThai], [rowguid]) VALUES (N'CHUAKHOP       ', N'Chưa khớp', N'2f9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TRANGTHAI] ([MaTT], [TenTrangThai], [rowguid]) VALUES (N'DAHUY          ', N'Đã hủy', N'2d9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TRANGTHAI] ([MaTT], [TenTrangThai], [rowguid]) VALUES (N'KHOPHET        ', N'Khớp hết', N'2e9f49f0-4124-eb11-a245-206a8a7b4b21')
INSERT [dbo].[TRANGTHAI] ([MaTT], [TenTrangThai], [rowguid]) VALUES (N'KHOPMOTPHAN    ', N'Khớp một phần', N'309f49f0-4124-eb11-a245-206a8a7b4b21')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_CONGTYCHUNGKHOAN]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[CONGTYCHUNGKHOAN] ADD  CONSTRAINT [UK_CONGTYCHUNGKHOAN] UNIQUE NONCLUSTERED 
(
	[TenCTCK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_245575913]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_245575913] ON [dbo].[CONGTYCHUNGKHOAN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_COPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[COPHIEU] ADD  CONSTRAINT [UK_COPHIEU] UNIQUE NONCLUSTERED 
(
	[TenCP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_277576027]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_277576027] ON [dbo].[COPHIEU]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_309576141]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_309576141] ON [dbo].[KHOPLENH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_341576255]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_341576255] ON [dbo].[LENHDAT]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_373576369]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_373576369] ON [dbo].[LICHSUGIA]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_LOAIGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[LOAIGIAODICH] ADD  CONSTRAINT [UK_LOAIGIAODICH] UNIQUE NONCLUSTERED 
(
	[TenLoaiGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_405576483]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_405576483] ON [dbo].[LOAIGIAODICH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_LOAILENH]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[LOAILENH] ADD  CONSTRAINT [UK_LOAILENH] UNIQUE NONCLUSTERED 
(
	[TenLoaiLenh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_437576597]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_437576597] ON [dbo].[LOAILENH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_NGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[NGANHANG] ADD  CONSTRAINT [UK_NGANHANG] UNIQUE NONCLUSTERED 
(
	[TenNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_469576711]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_469576711] ON [dbo].[NGANHANG]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_NHADAUTU]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[NHADAUTU] ADD  CONSTRAINT [UK_NHADAUTU] UNIQUE NONCLUSTERED 
(
	[CMND] ASC,
	[Passport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_501576825]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_501576825] ON [dbo].[NHADAUTU]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_764021953]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_764021953] ON [dbo].[NHANVIEN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_524021098]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_524021098] ON [dbo].[NHANVIENSAN]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_565577053]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_565577053] ON [dbo].[QUYDINHCHUNG]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SANGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
ALTER TABLE [dbo].[SANGIAODICH] ADD  CONSTRAINT [UK_SANGIAODICH] UNIQUE NONCLUSTERED 
(
	[TenSanGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_597577167]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_597577167] ON [dbo].[SANGIAODICH]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_629577281]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_629577281] ON [dbo].[SOHUU]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_661577395]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_661577395] ON [dbo].[TAIKHOANNGANHANG]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_693577509]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_693577509] ON [dbo].[THAYDOIGIA]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [MSmerge_index_725577623]    Script Date: 12/16/2020 12:39:59 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [MSmerge_index_725577623] ON [dbo].[TRANGTHAI]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COPHIEU]  WITH NOCHECK ADD  CONSTRAINT [FK_COPHIEU_SANGIAODICH1] FOREIGN KEY([MaSGD])
REFERENCES [dbo].[SANGIAODICH] ([MaSGD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[COPHIEU] CHECK CONSTRAINT [FK_COPHIEU_SANGIAODICH1]
GO
ALTER TABLE [dbo].[KHOPLENH]  WITH NOCHECK ADD  CONSTRAINT [FK_KHOPLENH_LENHDAT] FOREIGN KEY([MaLD])
REFERENCES [dbo].[LENHDAT] ([MaLD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[KHOPLENH] CHECK CONSTRAINT [FK_KHOPLENH_LENHDAT]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH NOCHECK ADD  CONSTRAINT [FK_LENHDAT_COPHIEU] FOREIGN KEY([MaCP])
REFERENCES [dbo].[COPHIEU] ([MaCP])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [FK_LENHDAT_COPHIEU]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH NOCHECK ADD  CONSTRAINT [FK_LENHDAT_LOAIGIAODICH] FOREIGN KEY([MaLGD])
REFERENCES [dbo].[LOAIGIAODICH] ([MaLGD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [FK_LENHDAT_LOAIGIAODICH]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH NOCHECK ADD  CONSTRAINT [FK_LENHDAT_LOAILENH] FOREIGN KEY([MaLL])
REFERENCES [dbo].[LOAILENH] ([MaLL])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [FK_LENHDAT_LOAILENH]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH NOCHECK ADD  CONSTRAINT [FK_LENHDAT_TAIKHOANNGANHANG] FOREIGN KEY([MaTKNH])
REFERENCES [dbo].[TAIKHOANNGANHANG] ([MaTKNH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [FK_LENHDAT_TAIKHOANNGANHANG]
GO
ALTER TABLE [dbo].[LENHDAT]  WITH NOCHECK ADD  CONSTRAINT [FK_LENHDAT_TRANGTHAI] FOREIGN KEY([MaTT])
REFERENCES [dbo].[TRANGTHAI] ([MaTT])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LENHDAT] CHECK CONSTRAINT [FK_LENHDAT_TRANGTHAI]
GO
ALTER TABLE [dbo].[LICHSUGIA]  WITH NOCHECK ADD  CONSTRAINT [FK_LICHSUGIA_COPHIEU] FOREIGN KEY([MaCP])
REFERENCES [dbo].[COPHIEU] ([MaCP])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[LICHSUGIA] CHECK CONSTRAINT [FK_LICHSUGIA_COPHIEU]
GO
ALTER TABLE [dbo].[NHADAUTU]  WITH NOCHECK ADD  CONSTRAINT [FK_NHADAUTU_CONGTYCHUNGKHOAN] FOREIGN KEY([MaCTCK])
REFERENCES [dbo].[CONGTYCHUNGKHOAN] ([MaCTCK])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[NHADAUTU] CHECK CONSTRAINT [FK_NHADAUTU_CONGTYCHUNGKHOAN]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH NOCHECK ADD  CONSTRAINT [FK_NHANVIEN_CONGTYCHUNGKHOAN] FOREIGN KEY([MaCTCK])
REFERENCES [dbo].[CONGTYCHUNGKHOAN] ([MaCTCK])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_CONGTYCHUNGKHOAN]
GO
ALTER TABLE [dbo].[NHANVIENSAN]  WITH NOCHECK ADD  CONSTRAINT [FK_NHANVIENSAN_SANGIAODICH] FOREIGN KEY([MaSGD])
REFERENCES [dbo].[SANGIAODICH] ([MaSGD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[NHANVIENSAN] CHECK CONSTRAINT [FK_NHANVIENSAN_SANGIAODICH]
GO
ALTER TABLE [dbo].[QUYDINHCHUNG]  WITH NOCHECK ADD  CONSTRAINT [FK_QUYDINHCHUNG_SANGIAODICH] FOREIGN KEY([MaSGD])
REFERENCES [dbo].[SANGIAODICH] ([MaSGD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[QUYDINHCHUNG] CHECK CONSTRAINT [FK_QUYDINHCHUNG_SANGIAODICH]
GO
ALTER TABLE [dbo].[SOHUU]  WITH NOCHECK ADD  CONSTRAINT [FK_SOHUU_COPHIEU] FOREIGN KEY([MaCP])
REFERENCES [dbo].[COPHIEU] ([MaCP])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SOHUU] CHECK CONSTRAINT [FK_SOHUU_COPHIEU]
GO
ALTER TABLE [dbo].[SOHUU]  WITH NOCHECK ADD  CONSTRAINT [FK_SOHUU_NHADAUTU] FOREIGN KEY([MaTK])
REFERENCES [dbo].[NHADAUTU] ([MaTK])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[SOHUU] CHECK CONSTRAINT [FK_SOHUU_NHADAUTU]
GO
ALTER TABLE [dbo].[TAIKHOANNGANHANG]  WITH NOCHECK ADD  CONSTRAINT [FK_TAIKHOANNGANHANG_NGANHANG] FOREIGN KEY([MaNH])
REFERENCES [dbo].[NGANHANG] ([MaNH])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TAIKHOANNGANHANG] CHECK CONSTRAINT [FK_TAIKHOANNGANHANG_NGANHANG]
GO
ALTER TABLE [dbo].[TAIKHOANNGANHANG]  WITH NOCHECK ADD  CONSTRAINT [FK_TAIKHOANNGANHANG_NHADAUTU] FOREIGN KEY([MaTK])
REFERENCES [dbo].[NHADAUTU] ([MaTK])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TAIKHOANNGANHANG] CHECK CONSTRAINT [FK_TAIKHOANNGANHANG_NHADAUTU]
GO
ALTER TABLE [dbo].[THAYDOIGIA]  WITH NOCHECK ADD  CONSTRAINT [FK_THAYDOIGIA_CONGTYCHUNGKHOAN] FOREIGN KEY([MaCTCK])
REFERENCES [dbo].[CONGTYCHUNGKHOAN] ([MaCTCK])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[THAYDOIGIA] CHECK CONSTRAINT [FK_THAYDOIGIA_CONGTYCHUNGKHOAN]
GO
ALTER TABLE [dbo].[THAYDOIGIA]  WITH NOCHECK ADD  CONSTRAINT [FK_THAYDOIGIA_LOAIGIAODICH] FOREIGN KEY([MaLGD])
REFERENCES [dbo].[LOAIGIAODICH] ([MaLGD])
ON UPDATE CASCADE
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[THAYDOIGIA] CHECK CONSTRAINT [FK_THAYDOIGIA_LOAIGIAODICH]
GO
/****** Object:  StoredProcedure [dbo].[CHITIETKHOPLENH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CHITIETKHOPLENH]
@MaCP int,
@MaTK nchar(20)
AS
BEGIN
	SELECT KL.NgayGio, SoLuongKhop, GiaKhop 
	FROM KHOPLENH AS KL, LENHDAT AS LD, TAIKHOANNGANHANG AS TKNH
	WHERE (KL.MaLD=LD.MaLD AND LD.MaCP=@MaCP AND LD.MaTKNH=TKNH.MaTKNH AND TKNH.MaTK =@MaTK)
	OR (KL.MaKL=LD.MaLD AND LD.MaCP=@MaCP AND LD.MaTKNH=TKNH.MaTKNH AND TKNH.MaTK =@MaTK)
END
GO
/****** Object:  StoredProcedure [dbo].[LIETKECPNDT]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LIETKECPNDT]
(
	@MATK nchar(20)
)
AS
BEGIN
  
  --declare @matknh nchar(20)	
  --set @matknh =( select MATKNH from TAIKHOANNGANHANG where MATK = @MATK)
  --select cp.MACP,lenhdat.SOLUONGKHOP,lenhdat.GIAKHOP,(lenhdat.SOLUONGKHOP * lenhdat.GIAKHOP) as TRIGIA
  --from (select ld.MACP,lk.SOLUONGKHOP,lk.GIAKHOP,MATKNH = @matknh from LENHDAT as ld,KHOPLENH as lk where ld.MALD = lk.MALD) as lenhdat,COPHIEU as cp 
  --where lenhdat.MACP = cp.MACP
  declare @GiaKhop float
  set @GiaKhop = (select Max(GiaKhop) from KHOPLENH as kl,LENHDAT as ld,COPHIEU as cp where kl.MaLD=ld.MaLD and ld.MaCP=cp.MaCP)
  select cp.MaCP,SoLuong,GiaKhop=@GiaKhop,TRIGIA = (SoLuong*@GiaKhop)
  from COPHIEU as cp, SOHUU as sh
  where cp.MaCP=sh.MaCP and sh.MaTK=@MATK
END
GO
/****** Object:  StoredProcedure [dbo].[SAOKEKHOPLENH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SAOKEKHOPLENH]
@MaTK NCHAR(20),
@TUNGAY DATETIME,
@DENNGAY DATETIME
AS
SET DATEFORMAT MDY
BEGIN
SELECT KL.NgayGio, MaCP, MaLGD, MaLL, SoLuongKhop, GiaKhop 
FROM LENHDAT AS LD ,KHOPLENH AS KL, TAIKHOANNGANHANG AS TKNH 
WHERE (LD.MaLD=KL.MaLD AND @TUNGAY <= KL.NgayGio AND KL.NgayGio <= @DENNGAY AND LD.MaTKNH=TKNH.MaTKNH AND TKNH.MaTK=@MaTK) 
OR (LD.MaLD=KL.MaKL AND @TUNGAY <= KL.NgayGio AND KL.NgayGio <= @DENNGAY AND LD.MaTKNH=TKNH.MaTKNH AND TKNH.MaTK=@MaTK)
ORDER BY KL.NgayGio
END
GO
/****** Object:  StoredProcedure [dbo].[SoHuuCPNDT]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SoHuuCPNDT]
(
	@MACP INT,
	@MATK NCHAR(20),
	@SOLUONG INT
)
AS
BEGIN


if(EXISTS (SELECT * from SOHUU Where MaCP = @MACP and MaTK = @MATK))
	begin
		update SOHUU set SoLuong = SoLuong + @SOLUONG  where MaCP = @MACP  and MaTK = @MATK
	end
else 
	begin
		insert into SOHUU(MaCP,MaTK,SoLuong) values (@MACP , @MATK,@SOLUONG)
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CursorLoaiGD]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CursorLoaiGD] @OutCrsr CURSOR VARYING OUTPUT,
@Macp INT, @Ngay NVARCHAR(50), @LoaiGD NCHAR(3)
AS
begin
SET DATEFORMAT MDY
IF (@LoaiGD = 'GDM')
	SET @OutCrsr = CURSOR FOR
	SELECT MALD, NGAYGIO, SOLUONGDAT, GIADAT,MaTT 
	FROM LENHDAT
	WHERE MACP = @Macp 
		AND DAY(NGAYGIO) = DAY(@Ngay) AND MONTH(NGAYGIO) = MONTH(@Ngay) AND YEAR(NGAYGIO) = YEAR(@Ngay)
		AND MaLGD  = @LoaiGD AND SOLUONGDAT > 0  
    ORDER BY GIADAT DESC, NGAYGIO 
ELSE
  SET @OutCrsr = CURSOR FOR 
  SELECT MALD, NGAYGIO, SOLUONGDAT, GIADAT,MaTT FROM LENHDAT
  WHERE MACP = @macp 
    AND DAY(NGAYGIO) = DAY(@Ngay) AND MONTH(NGAYGIO) = MONTH(@Ngay) AND YEAR(NGAYGIO) = YEAR(@Ngay)  
    AND MaLGD  = @LoaiGD AND SOLUONGDAT > 0  
    ORDER BY GIADAT, NGAYGIO 
OPEN @OutCrsr
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAP]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DANGNHAP]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT Ho+ ' '+ Ten FROM NHANVIEN  WHERE MaNV = @TENUSER ),
   TENNHOM= NAME
   FROM sys.sysusers 
   WHERE UID = (SELECT GROUPUID 
                 FROM SYS.SYSMEMBERS 
                   WHERE MEMBERUID= (SELECT UID FROM sys.sysusers 
                                      WHERE NAME=@TENUSER))
GO
/****** Object:  StoredProcedure [dbo].[SP_DANGNHAPSAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DANGNHAPSAN]
@TENLOGIN NVARCHAR (50)
AS
DECLARE @TENUSER NVARCHAR(50)
SELECT @TENUSER=NAME FROM sys.sysusers WHERE sid = SUSER_SID(@TENLOGIN)
 
 SELECT USERNAME = @TENUSER, 
  HOTEN = (SELECT Ho+ ' '+ Ten FROM NHANVIENSAN  WHERE MaNV = @TENUSER ),
   TENNHOM= NAME
   FROM sys.sysusers 
   WHERE UID = (SELECT GROUPUID 
                 FROM SYS.SYSMEMBERS 
                   WHERE MEMBERUID= (SELECT UID FROM sys.sysusers 
                                      WHERE NAME=@TENUSER))
GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHCOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHCOPHIEU]
  
@MaCP int,
@TenCP nvarchar(250),
@DiaChi nvarchar(250),
@Fax nvarchar(12),
@SDT nvarchar(12),
@Website nvarchar(100),
@Email nvarchar(200),
@SoLuongCP int
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.COPHIEU
    SET 
	-- ordering=@ordering, title=@title, content=@content
TenCP=@TenCP, 
DiaChi=@DiaChi, 
Fax=@Fax, 
DiaChiWebsite=@Website, 
SoDT=@SDT,
Email=@Email,
SoLuongCP=@SoLuongCP
    WHERE MaCP=@MaCP
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHGIACOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_HIEUCHINHGIACOPHIEU]
      @MaCP int,
      @NgayGio datetime,
	  @GiaTran float,
	  @GiaThamChieu float,
	  @GiaSan float,
	  @GiaDongCua float
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.LICHSUGIA
    SET 
	GiaTran=@GiaTran,
	GiaThamChieu=@GiaThamChieu,
	GiaSan=@GiaSan,
	GiaDongCua=@GiaDongCua
    WHERE MaCP=@MaCP AND NgayGio=@NgayGio
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHNHADAUTU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHNHADAUTU]
   @MaTK nchar(10),
    @Ho nvarchar(50),
    @Ten nvarchar(50),
    @NgaySinh datetime,
    @Phai bit,
    @DiaChi nvarchar(250),
    @Email nchar(100),
    @SoDT nvarchar(12),
    @CMND nvarchar(12),
    @Passport nvarchar(12),
    @NgayCap datetime,
    @QuocGia nvarchar(50),
    @MKGiaoDich nvarchar(20),
    @MKDatLenh nvarchar(20)
   AS
   

BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.NHADAUTU
    SET 
    Ho=@Ho,
    Ten=@Ten,
    NgaySinh=@NgaySinh,
    Phai=@Phai,
    DiaChi=@DiaChi,
    Email=@Email,
    SoDT=@SoDT,
    CMND=@CMND,
    Passport=@Passport,
    NgayCap=@NgayCap,
    QuocGia=@QuocGia,
    MKGiaoDich=@MKGiaoDich,
    MKDatLenh=@MKDatLenh
    WHERE MaTK=@MaTK
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHNHANVIEN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHNHANVIEN]
  
@MaNV nchar(10),
@Ho nvarchar(50),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@NgaySinh datetime,
@Phai bit,
@SoDT nvarchar(12),
@DaNghiViec bit
   AS
   

BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.NHANVIEN
    SET 
	-- ordering=@ordering, title=@title, content=@content
Ho=@Ho, 
Ten=@Ten, 
DiaChi=@DiaChi, 
NgaySinh=@NgaySinh, 
Phai=@Phai, 
SoDT=@SoDT,
DaNghiViec=@DaNghiViec
    WHERE MaNV=@MaNV
END

GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHNHANVIENSAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHNHANVIENSAN]
  
@MaNV nchar(10),
@Ho nvarchar(50),
@Ten nvarchar(50),
@DiaChi nvarchar(50),
@NgaySinh datetime,
@Phai bit,
@SoDT nvarchar(12),
@DaNghiViec bit
   AS
   

BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.NHANVIENSAN
    SET 
	-- ordering=@ordering, title=@title, content=@content
Ho=@Ho, 
Ten=@Ten, 
DiaChi=@DiaChi, 
NgaySinh=@NgaySinh, 
Phai=@Phai, 
SoDT=@SoDT,
DaNghiViec=@DaNghiViec
    WHERE MaNV=@MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHPHIGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHPHIGIAODICH]
	  @MaLGD nchar(3),
      @MaCTCK nchar(3),
	  @NgayGio datetime,
	  @GiaPhi float
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.THAYDOIGIA
    SET 
	GiaPhi=@GiaPhi
    WHERE MaLGD=@MaLGD AND MaCTCK=@MaCTCK AND NgayGio=@NgayGio
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHQUYDINHCHUNG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHQUYDINHCHUNG]
	  @Ngay datetime,
      @MaSGD nchar(5),
	  @MoTaQuyDinh nvarchar(200),
	  @GiaQuyDinh float
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.QUYDINHCHUNG
    SET 
	GiaQuyDinh=@GiaQuyDinh
    WHERE MaSGD=@MaSGD AND Ngay=@Ngay
END
GO
/****** Object:  StoredProcedure [dbo].[SP_HIEUCHINHTAIKHOANNGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_HIEUCHINHTAIKHOANNGANHANG]
  
   @MaTKNH nchar(10),
   @MaNH nchar(4),
   @SoDuTKNH float
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dbo.TAIKHOANNGANHANG
    SET 
	MaNH=@MaNH,
	SoDuTKNH=@SoDuTKNH
    WHERE MaTKNH=@MaTKNH
END

GO
/****** Object:  StoredProcedure [dbo].[SP_KHOPLENH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_KHOPLENH]@MaLD int, @MaCP int,  @Ngay datetime,   @LoaiGD NCHAR(3),  @SoluongMB INT,  @GiaDatMB FLOAT ,@loailenh nchar(20),@MATKNH nchar(20),@MACTCK nchar(3)
AS
SET DATEFORMAT MDY
BEGIN

declare @giaphi float
set @giaphi = ( select GiaPhi from THAYDOIGIA where MaCTCK = @MACTCK and DAY(NGAYGIO) = DAY(@Ngay) AND MONTH(NGAYGIO) = MONTH(@Ngay) AND YEAR(NGAYGIO) = YEAR(@Ngay) and MaLGD = @LoaiGD)--lấy giá phí
declare @LENHKHOPMAX int
set @LENHKHOPMAX = @SoluongMB
DECLARE @CrsrVar CURSOR,@NgayKhop datetime,@SoLuongKhop INT, @Giakhop FLOAT,@IDLenhDat int,@MaTT nchar(20)
	IF(@LoaiGD = 'GDB')
	BEGIN 
	
		EXEC SP_CursorLoaiGD @CrsrVar OUTPUT, @MaCP, @Ngay, 'GDM' -- Lấy danh sách các "người" mua đã được sắp xếp theo giá
		FETCH NEXT FROM @CrsrVar INTO @IDLenhDat, @NgayKhop, @SoLuongKhop, @Giakhop,@MaTT
		WHILE @@FETCH_STATUS = 0 AND @SoLuongMB > 0 -- kiểm tra coi có còn "sản phẩm" trong "Kho" và đã bán hết chưa
		BEGIN
			IF @GiaKhop >= @GiaDatMB --Giá mua(của người mua) >= giá bán(giá bạn muốn bán) thì mới tiến hành bán
			BEGIN
				IF @SoLuongKhop < @SoLuongMB 
				BEGIN
					
					SET @SoLuongMB = @SoLuongMB - @SoLuongKhop
					UPDATE LENHDAT SET SOLUONGDAT = 0 WHERE CURRENT OF @CrsrVar --update số lượng sau khi bán, vì "Kho" (người mua hàng của bạn đã đủ nhu cầu) có ít hơn, nên cập nhật lại trong "Kho" = 0
					UPDATE LENHDAT SET MaTT = 'KHOPHET' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH(MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoLuongKhop, @GiaKhop, @IDLenhDat,@Giakhop * @SoLuongKhop * @giaphi/100)


					declare @matknhmb nchar(20)
					declare @mandt nchar(20)
					declare @soluong int
					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG + @SoLuongKhop  where MaTK = @mandt and MaCP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop *@GiaKhop + @Giakhop * @SoLuongKhop * @giaphi/100) where MaTK = @mandt

					declare @ma nchar(20)
					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop *@GiaDatMB + @GiaDatMB * @SoLuongKhop * @giaphi/100) where MaTK = @ma

					DECLARE @SoLuongSoHuu int

					set @SoLuongSoHuu = - @SoLuongKhop
					
					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;
	
				END
				ELSE IF @SoLuongKhop = @SoLuongMB 
				BEGIN 
					
					 
					SET @SoLuongMB = @SoLuongMB - @SoLuongKhop
					UPDATE LENHDAT SET SOLUONGDAT = 0 WHERE CURRENT OF @CrsrVar --update số lượng sau khi bán, vì "Kho" (người mua hàng của bạn đã đủ nhu cầu) có ít hơn, nên cập nhật lại trong "Kho" = 0
					UPDATE LENHDAT SET MaTT = 'KHOPHET' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH(MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoLuongKhop, @GiaKhop, @IDLenhDat,@Giakhop * @SoLuongKhop * @giaphi/100)

					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG + @SoLuongKhop  where MaTK = @mandt and MaCP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop *@GiaKhop + @Giakhop * @SoLuongKhop * @giaphi/100) where MaTK = @mandt


					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop *@GiaDatMB + @GiaDatMB * @SoLuongKhop * @giaphi/100) where MaTK = @ma


					set @SoLuongSoHuu = - @SoLuongKhop
					
					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;
					INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
					VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPHET')
	
				END
				ELSE --Bán hết rồi thì dừng
				BEGIN
					UPDATE LENHDAT SET SOLUONGDAT = SOLUONGDAT - @SoLuongMB WHERE CURRENT OF @CrsrVar 
					UPDATE LENHDAT SET MaTT = 'KHOPMOTPHAN' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH (MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoluongMB, @GiaKhop, @IDLenhDat,@Giakhop * @SoluongMB * @giaphi/100 )

					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG + @SoLuongMB  where MaTK = @mandt and MACP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop *@GiaKhop + @Giakhop * @SoLuongKhop * @giaphi/100) where MaTK = @mandt

					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop *@GiaDatMB + @GiaDatMB * @SoLuongKhop * @giaphi/100) where MaTK = @ma -- sau khi bán cộng vào tài khoản dư của ndt

					set @SoLuongSoHuu = - @SoLuongKhop

					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;
					SET @SoLuongMB = 0 	-- Hoặc Set @SoLuongMB = 0 , để dừng
					
					INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
					VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPHET')
					BREAK Set @SoLuongMB = 0
				END 
			END
			FETCH NEXT FROM @CrsrVar INTO @IDLenhDat, @NgayKhop, @SoLuongKhop, @Giakhop,@MaTT
		END
		IF @SoluongMB > 0
		BEGIN
		if(@SoluongMB < @LENHKHOPMAX)
		begin
			INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
			VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPMOTPHAN')
		end
		else 
		begin
			INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
			VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'CHOKHOP')
		end 
		END
		CLOSE @CrsrVar
		DEALLOCATE @CrsrVar
	END
	ELSE IF(@LoaiGD = 'GDM') 
	BEGIN 
	
		EXEC SP_CursorLoaiGD @CrsrVar OUTPUT, @MaCP, @Ngay, 'GDB' -- Lấy danh sách các "người" bán đã được sắp xếp theo giá để chuẩn bị mua
		FETCH NEXT FROM @CrsrVar INTO @IDLenhDat, @NgayKhop, @SoLuongKhop, @Giakhop,@MaTT
		WHILE @@FETCH_STATUS = 0 AND @SoLuongMB > 0 
		BEGIN
			IF @GiaKhop <= @GiaDatMB --Giá bán <= giá mua thì mới tiến hành mua
			BEGIN
				IF @SoLuongKhop < @SoLuongMB --Nếu mua chưa đủ thì mua tiếp
				BEGIN
					SET @SoLuongMB = @SoLuongMB - @SoLuongKhop
					UPDATE LENHDAT SET SOLUONGDAT = 0 WHERE CURRENT OF @CrsrVar --update số lượng sau khi mua, vì "Kho" có ít hơn, nên cập nhật lại trong "Kho" = 0
					UPDATE LENHDAT SET MaTT = 'KHOPHET' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH(MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoLuongKhop, @GiaKhop, @IDLenhDat,@Giakhop * @SoLuongKhop * @giaphi/100)


					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG - @SoLuongKhop  where MaTK = @mandt and MACP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop * @GiaKhop + @SoLuongKhop * @Giakhop * @giaphi/100) where MaTK = @mandt

					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop * @GiaDatMB + @SoLuongKhop * @GiaDatMB * @giaphi/100) where MaTK = @ma

					set @SoLuongSoHuu =  @SoLuongKhop

					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;

				END
				ELSE IF @SoLuongKhop = @SoLuongMB --Nếu mua chưa đủ thì mua tiếp
				BEGIN
					SET @SoLuongMB = @SoLuongMB - @SoLuongKhop
					UPDATE LENHDAT SET SOLUONGDAT = 0 WHERE CURRENT OF @CrsrVar --update số lượng sau khi mua, vì "Kho" có ít hơn, nên cập nhật lại trong "Kho" = 0
					UPDATE LENHDAT SET MaTT = 'KHOPHET' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH(MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoLuongKhop, @GiaKhop, @IDLenhDat,@Giakhop * @SoLuongKhop * @giaphi/100)


					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG - @SoLuongKhop  where MaTK = @mandt and MACP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop * @GiaKhop + @SoLuongKhop * @Giakhop * @giaphi/100) where MaTK = @mandt

					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop * @GiaDatMB + @SoLuongKhop * @GiaDatMB * @giaphi/100) where MaTK = @ma

					set @SoLuongSoHuu =  @SoLuongKhop

					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;

					INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
					VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPHET')

				END
				ELSE --Mua đủ rồi thì dừng
				BEGIN
					UPDATE LENHDAT SET SOLUONGDAT = SOLUONGDAT - @SoLuongMB WHERE CURRENT OF @CrsrVar
					UPDATE LENHDAT SET MaTT = 'KHOPMOTPHAN' WHERE CURRENT OF @CrsrVar
					INSERT INTO KHOPLENH(MaKL,NGAYGIO, SOLUONGKHOP, GIAKHOP, MALD,PHIGIAODICH)
					VALUES (@MaLD,@Ngay, @SoluongMB, @GiaKhop, @IDLenhDat,@Giakhop * @SoluongMB * @giaphi/100 )

					
					set @matknhmb = ( select MATKNH from LENHDAT WHERE MALD = @IDLenhDat)
					set @mandt = ( select MaTK from TAIKHOANNGANHANG where MATKNH = @matknhmb)

					update SOHUU set SOLUONG = SOLUONG - @SoLuongMB  where MaTK = @mandt and MACP = @MaCP

					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH + (@SoLuongKhop * @GiaKhop + @SoLuongKhop * @Giakhop * @giaphi/100) where MaTK = @mandt

					set @ma = (select MaTK from TAIKHOANNGANHANG where MATKNH = @MATKNH)
					update TAIKHOANNGANHANG set SoDuTKNH = SoDuTKNH - (@SoLuongKhop * @GiaDatMB + @SoLuongKhop * @GiaDatMB * @giaphi/100) where MaTK = @ma

					set @SoLuongSoHuu =  @SoLuongKhop

					EXEC SoHuuCPNDT @MaCP,@ma,@SoLuongSoHuu;
					SET @SoLuongMB = 0

					INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
					VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPHET')
					BREAK Set @SoLuongMB = 0
				END
			END
			FETCH NEXT FROM @CrsrVar INTO @IDLenhDat, @NgayKhop, @SoLuongKhop, @Giakhop,@MaTT
		END
		IF @SoluongMB > 0
		BEGIN
		if(@SoluongMB < @LENHKHOPMAX)
		begin
			INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
			VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'KHOPMOTPHAN')
		end
		else
		begin
			INSERT INTO LENHDAT (MaLD, MACP, NGAYGIO, MaLGD, MALL, SOLUONGDAT, GIADAT,MATKNH,MaTT)
			VALUES (@MaLD, @MaCP, @Ngay, @LoaiGD, @loailenh, @SoluongMB, @GiaDatMB,@MATKNH,'CHOKHOP')
		end 
		END
	CLOSE @CrsrVar
		DEALLOCATE @CrsrVar
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_TAOTAIKHOAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TAOTAIKHOAN]
	@LGNAME VARCHAR(50),
	@PASS VARCHAR(50),
	@USERNAME VARCHAR(50),
	@ROLE VARCHAR(50)
AS
BEGIN
  DECLARE @RET INT
  EXEC @RET= SP_ADDLOGIN @LGNAME, @PASS,'QLGDCK'                     

  IF (@RET =1)  -- LOGIN NAME BI TRUNG
     RETURN 1

  EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
  IF (@RET =1)  -- USER  NAME BI TRUNG
  BEGIN
       EXEC SP_DROPLOGIN @LGNAME
       RETURN 2
  END
  EXEC sp_addrolemember @ROLE, @USERNAME


   IF @ROLE= 'SANGIAODICH'
	BEGIN  
		EXEC sp_addsrvrolemember @LGNAME, 'sysadmin'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END
  IF @ROLE= 'CONGTY'
	BEGIN 
		EXEC sp_addsrvrolemember @LGNAME, 'sysadmin'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END
  IF @ROLE= 'NHADAUTU'
	BEGIN  
		EXEC sp_addsrvrolemember @LGNAME, 'sysadmin'
		EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
		EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMCOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMCOPHIEU]
@MaCP int,
@TenCP nvarchar(200),
@DiaChi nvarchar(200),
@Fax nvarchar(12),
@SDT nvarchar(12),
@Website nvarchar(100),
@Email nvarchar(100),
@SoLuongCP int,
@MaSGD nchar(3)
AS
INSERT INTO COPHIEU
(
MaCP,
TenCP,
DiaChi,
Fax,
SoDT,
DiaChiWebsite,
Email,
SoLuongCP, 
MaSGD 
)
VALUES
(   
@MaCP,
@TenCP,
@DiaChi,
@Fax,
@SDT,
@Website,
@Email,
@SoLuongCP,
@MaSGD 
    )

GO
/****** Object:  StoredProcedure [dbo].[SP_THEMGIACOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMGIACOPHIEU]
      @MaCP int,
      @NgayGio datetime,
	  @GiaTran float,
	  @GiaThamChieu float,
	  @GiaSan float,
	  @GiaDongCua float
AS
INSERT INTO dbo.LICHSUGIA
(
      MaCP,
      NgayGio,
      GiaTran,
	  GiaThamChieu,
	  GiaSan,
	  GiaDongCua
)
VALUES
(   
      @MaCP,
      FORMAT(@NgayGio , 'yyyy-MM-dd'),
      @GiaTran,
	  @GiaThamChieu,
	  @GiaSan,
	  @GiaDongCua
    )
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMNHADAUTU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMNHADAUTU]
      @MaTK nchar(10),
	  @Ho nvarchar(50),
      @Ten nvarchar(50),
      @NgaySinh datetime,
      @Phai bit,
      @DiaChi nvarchar(250),
      @Email nchar(100),
      @SoDT nvarchar(12),
      @CMND nvarchar(12),
      @Passport nvarchar(12),
      @NgayCap datetime,
      @QuocGia nvarchar(50),
      @MKGiaoDich nvarchar(20),
      @MKDatLenh nvarchar(20),
      @MaCTCK nchar(3)
	  
AS
INSERT INTO dbo.NHADAUTU
(
      MaTK,
	  Ho,
      Ten,
      NgaySinh,
      Phai,
      DiaChi,
      Email,
      SoDT,
      CMND,
      Passport,
      NgayCap,
      QuocGia,
      MKGiaoDich,
      MKDatLenh,
      MaCTCK
)
VALUES
(   
      @MaTK,
	  @Ho,
      @Ten,
      @NgaySinh,
      @Phai,
      @DiaChi,
      @Email,
      @SoDT,
      @CMND,
      @Passport,
      @NgayCap,
      @QuocGia,
      @MKGiaoDich,
      @MKDatLenh,
      @MaCTCK
    )
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMNHANVIEN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMNHANVIEN]
@MaNV nchar(10),
@Ho nvarchar(50),
@Ten nvarchar(50),
@DiaChi nvarchar(200),
@NgaySinh datetime,
@Phai bit,
@SoDT nvarchar(12),
@MaCTCK nchar(3),
@DaNghiViec bit
AS
INSERT INTO dbo.NHANVIEN
(
MaNV, 
Ho,
Ten,
DiaChi,
NgaySinh, 
Phai, 
SoDT,  
MaCTCK, 
DaNghiViec
)
VALUES
(   
@MaNV, 
@Ho, 
@Ten, 
@DiaChi, 
@NgaySinh, 
@Phai, 
@SoDT,  
@MaCTCK,
@DaNghiViec
)

GO
/****** Object:  StoredProcedure [dbo].[SP_THEMNHANVIENSAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMNHANVIENSAN]
@MaNV nchar(10),
@Ho nvarchar(50),
@Ten nvarchar(50),
@DiaChi nvarchar(200),
@NgaySinh datetime,
@Phai bit,
@SoDT nvarchar(12),
@DaNghiViec bit
AS
INSERT INTO dbo.NHANVIENSAN
(
MaNV, 
Ho,
Ten,
DiaChi,
NgaySinh, 
Phai, 
SoDT,  
DaNghiViec
)
VALUES
(   
@MaNV, 
@Ho, 
@Ten, 
@DiaChi, 
@NgaySinh, 
@Phai, 
@SoDT,  
@DaNghiViec
)
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMPHIGIAODICH]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMPHIGIAODICH]
      @MaLGD nchar(3),
      @MaCTCK nchar(3),
	  @NgayGio datetime,
	  @GiaPhi float
AS
INSERT INTO dbo.THAYDOIGIA
(
      MaLGD,
      MaCTCK,
      NgayGio,
	  GiaPhi
)
VALUES
(   
      @MaLGD,
      @MaCTCK,
      FORMAT(@NgayGio , 'yyyy-MM-dd'),
	  @GiaPhi
    )
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMQUYDINHCHUNG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMQUYDINHCHUNG]
      @MaSGD nchar(3),
      @Ngay datetime,
	  @MoTaQuyDinh nvarchar(200),
	  @GiaQuyDinh float
AS
INSERT INTO dbo.QUYDINHCHUNG
(
      Ngay,
      MaSGD,
      MoTaQuyDinh,
	  GiaQuyDinh
)
VALUES
(   
      @Ngay,
      @MaSGD,
      @MoTaQuyDinh,
	  @GiaQuyDinh
    )

GO
/****** Object:  StoredProcedure [dbo].[SP_THEMTAIKHOANNGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_THEMTAIKHOANNGANHANG]
   @MaTKNH nchar(20),
   @MaNH nchar(4),
   @SoDuTKNH float,
   @MaTK nchar(10)
as
insert into dbo.TAIKHOANNGANHANG
(
   MaTKNH ,
   MaNH ,
   SoDuTKNH, 
   MaTK 
)
values
(
   @MaTKNH ,
   @MaNH ,
   @SoDuTKNH, 
   @MaTK 
)

GO
/****** Object:  StoredProcedure [dbo].[SP_XEMSODUCOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XEMSODUCOPHIEU]
@MaTK nchar(10)
AS
Select LD.MaLD, LD.NgayGio, LD.MaTKNH, TenLoaiGiaoDich= (select TenLoaiGiaoDich from LOAIGIAODICH as LGD 
where ld.MaLGD=LGD.MaLGD) +' - '+ MaLL, 
MaCP, SoLuongDat, GiaDat, SoLuongKhop, GiaKhop, TenTT=(select TenTrangThai from TRANGTHAI as tt where ld.MaTT= tt.MaTT)  
from (select MaTKNH FROM TAIKHOANNGANHANG WHERE MaTK = @MaTK) AS TKNH
INNER JOIN LENHDAT as LD
on LD.MaTKNH = TKNH.MaTKNH
LEFT JOIN KHOPLENH as KL
ON LD.MaLD = KL.MaLD OR LD.MaLD = KL.MaKL

GO
/****** Object:  StoredProcedure [dbo].[SP_XOACOPHIEU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOACOPHIEU]
@MaCP int
AS
IF  exists(select MaCP from dbo.COPHIEU  where MaCP =@MaCP)
 BEGIN
   	DELETE FROM dbo.COPHIEU
   	 WHERE MaCP=@MaCP
 END
 ELSE
  IF  exists(select MaCP from  LINK2.QLGDCK.dbo.COPHIEU  where MaCP =@MaCP)
  BEGIN
    DELETE FROM LINK2.QLGDCK.dbo.COPHIEU
   	 WHERE MaCP=@MaCP
   	                  
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_XOALOGIN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOALOGIN]
  @LGNAME VARCHAR(50),
  @USRNAME VARCHAR(50)
  
AS
EXEC SP_DROPUSER @USRNAME
  EXEC SP_DROPLOGIN @LGNAME

GO
/****** Object:  StoredProcedure [dbo].[SP_XOANHADAUTU]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOANHADAUTU]
@MaTK NCHAR(10)
AS
IF  exists(select MaTK from dbo.NHADAUTU  where MaTK =@MaTK)
 BEGIN
   	DELETE FROM dbo.NHADAUTU
   	 WHERE MaTK=@MaTK
 END
 ELSE
  IF  exists(select MaTK from  LINK2.QLGDCK.dbo.NHADAUTU  where MaTK =@MaTK)
  BEGIN
    DELETE FROM LINK2.QLGDCK.dbo.NHADAUTU
   	 WHERE MaTK=@MaTK
   	                  
  END
  

GO
/****** Object:  StoredProcedure [dbo].[SP_XOANHANVIEN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOANHANVIEN]
@MaNV NCHAR(10)
AS
IF  exists(select MaNV from dbo.NHANVIEN  where MaNV =@MaNV)
 BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.NHANVIEN
	SET DaNghiViec = 'true'
   	 WHERE MaNV=@MaNV
 END
 ELSE
  IF  exists(select MaNV from  LINK2.QLGDCK.dbo.NHANVIEN  where MaNV =@MaNV)
  BEGIN
    SET NOCOUNT ON;
	UPDATE dbo.NHANVIEN
	SET DaNghiViec = 'true'
   	WHERE MaNV=@MaNV         
  END

GO
/****** Object:  StoredProcedure [dbo].[SP_XOANHANVIENSAN]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOANHANVIENSAN]
@MaNV NCHAR(10)
AS
IF  exists(select MaNV from dbo.NHANVIENSAN  where MaNV =@MaNV)
 BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.NHANVIENSAN
	SET DaNghiViec = 'true'
   	 WHERE MaNV=@MaNV
 END
 ELSE
  IF  exists(select MaNV from  LINK2.QLGDCK.dbo.NHANVIENSAN  where MaNV =@MaNV)
  BEGIN
    SET NOCOUNT ON;
	UPDATE dbo.NHANVIENSAN
	SET DaNghiViec = 'true'
   	WHERE MaNV=@MaNV         
  END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOATAIKHOANNGANHANG]    Script Date: 12/16/2020 12:39:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOATAIKHOANNGANHANG]
@MaTKNH NCHAR(20)
AS
IF  exists(select MaTKNH from dbo.TAIKHOANNGANHANG  where MaTKNH =@MaTKNH)
 BEGIN
   	DELETE FROM dbo.TAIKHOANNGANHANG
   	 WHERE MaTKNH=@MaTKNH
 END
 ELSE
  IF  exists(select MaTKNH from  LINK2.QLGDCK.dbo.TAIKHOANNGANHANG  where MaTKNH =@MaTKNH)
  BEGIN
    DELETE FROM LINK2.QLGDCK.dbo.TAIKHOANNGANHANG
   	 WHERE MaTKNH=@MaTKNH
   	                  
  END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'YYYY-MM-DD HH:MM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LICHSUGIA', @level2type=N'COLUMN',@level2name=N'NgayGio'
GO
USE [master]
GO
ALTER DATABASE [QLGDCK] SET  READ_WRITE 
GO
