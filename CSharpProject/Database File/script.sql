USE [master]
GO
/****** Object:  Database [Fall2017]    Script Date: 04/11/2017 8:29:38 CH ******/
CREATE DATABASE [Fall2017]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fall2017', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Fall2017.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Fall2017_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Fall2017_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Fall2017] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fall2017].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fall2017] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fall2017] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fall2017] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fall2017] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fall2017] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fall2017] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Fall2017] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fall2017] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fall2017] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fall2017] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fall2017] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fall2017] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fall2017] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fall2017] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fall2017] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fall2017] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fall2017] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fall2017] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fall2017] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fall2017] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fall2017] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fall2017] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fall2017] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fall2017] SET  MULTI_USER 
GO
ALTER DATABASE [Fall2017] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fall2017] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fall2017] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fall2017] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Fall2017] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Fall2017]
GO
/****** Object:  Table [dbo].[Breed]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Breed](
	[BreedID] [int] IDENTITY(1,1) NOT NULL,
	[SpeciesID] [int] NOT NULL,
	[BreedName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Breed] PRIMARY KEY CLUSTERED 
(
	[BreedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Carer]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Carer](
	[CarerID] [varchar](5) NOT NULL,
	[CarerName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Carer] PRIMARY KEY CLUSTERED 
(
	[CarerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Owner]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Owner](
	[OwnerID] [nchar](5) NOT NULL,
	[OwnerName] [nvarchar](50) NOT NULL,
	[Phone] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet_Carer]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pet_Carer](
	[CarerID] [varchar](5) NOT NULL,
	[PetID] [varchar](5) NOT NULL,
 CONSTRAINT [PK_test] PRIMARY KEY CLUSTERED 
(
	[CarerID] ASC,
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PetDetail]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PetDetail](
	[PetID] [varchar](5) NOT NULL,
	[PetName] [nvarchar](50) NOT NULL,
	[Species] [int] NOT NULL,
	[Breed] [int] NOT NULL,
	[Gender] [bit] NOT NULL,
	[DayOfBirth] [date] NULL,
	[OwnerID] [nchar](5) NOT NULL,
	[InDate] [date] NOT NULL,
	[OutDate] [date] NULL,
	[MedicalRecord] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_PetDetail] PRIMARY KEY CLUSTERED 
(
	[PetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Species]    Script Date: 04/11/2017 8:29:38 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[SpeciesID] [int] IDENTITY(1,1) NOT NULL,
	[SpeciesName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[SpeciesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Breed] ON 

INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (1, 1, N'Bergie')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (2, 1, N'Chihuahua')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (3, 1, N'Alaska')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (4, 1, N'Samoyed')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (5, 1, N'Phốc sóc')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (6, 1, N'Pitbull')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (7, 1, N'Bắc Kinh')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (8, 1, N'Phú Quốc')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (9, 1, N'Nhật Bản')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (10, 1, N'Poodle')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (11, 1, N'Husky')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (12, 1, N'Pug')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (13, 2, N'Felis bengalensis')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (14, 2, N'Felis viverrina')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (15, 2, N'Pardofelis marmorata')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (16, 2, N'Felis chaus')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (17, 2, N'Felis domestica')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (18, 3, N'Bò Sữa')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (19, 3, N'Winter White')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (20, 3, N'Trà Sữa')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (21, 3, N'Robo')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (22, 3, N'Abino')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (23, 3, N'Panda')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (24, 4, N'New Zealand')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (25, 4, N'Flemish Giant')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (26, 4, N'California')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (27, 4, N'Angora')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (28, 2, N'Ba Tư lông ngắn')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (29, 2, N'Ba Tư lông dài')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (30, 2, N'Van Thổ')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (31, 2, N'Thổ Nhĩ Kỳ')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (32, 2, N'Anh lông ngắn')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (33, 2, N'Anh lông dài')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (34, 2, N'Nga mắt xanh')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (35, 2, N'Rừng Bengal')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (36, 3, N'Syrian')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (37, 3, N'Dwarf Hamster Campbell Nga')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (38, 3, N'Dwarf Hamster Winter White Nga')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (39, 3, N'Dwarf Hamster Roborovski')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (40, 3, N'Trung Quốc')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (41, 4, N'Chinchilla')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (42, 4, N'English Spot')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (43, 6, N'Đại bàng')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (44, 6, N'Cánh cụt')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (45, 5, N'Sơn ca')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (46, 5, N'Chích chòe')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (47, 5, N'Họa mi')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (48, 5, N'Yến phụng')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (49, 5, N'Vàng anh')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (51, 5, N'Khướu')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (52, 5, N'Chào mào')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (53, 5, N'Cú gáy')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (54, 5, N'Khuyên')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (55, 5, N'Vẹt')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (56, 6, N'Móng Cái')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (57, 6, N'Ỉ')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (58, 6, N'Mán')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (59, 6, N'Sóc')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (61, 6, N'Cỏ')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (62, 6, N'Đen Lũng Pù')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (63, 6, N'Vân Pa')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (64, 6, N'Khùa')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (65, 6, N'Mẹo')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (66, 6, N'Táp Ná')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (67, 7, N'Ri')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (68, 7, N'Hồ')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (69, 7, N'Tàu Vàng')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (70, 7, N'Đông Tảo')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (71, 7, N'Mía')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (72, 7, N'Nòi')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (73, 7, N'Ác')
INSERT [dbo].[Breed] ([BreedID], [SpeciesID], [BreedName]) VALUES (74, 7, N'Tre')
SET IDENTITY_INSERT [dbo].[Breed] OFF
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4001', N'Trung Nhàn', N'123456', 112233445, N'nhan@gmail.com', N'Q4, TP. HCM')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4002', N'Trường Hải', N'123456789', 223344556, N'hai@gmail.com', N'Go Vap, TPHCM')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4003', N'Hải Dương', N'123456', 334455667, N'duong@gmail.com', N'Hai Duong')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4004', N'Trung Đông', N'123456', 445566778, N'dong@gmail.com', N'Trung Đông')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4005', N'Đại Sơn', N'123456', 556677889, N'son@gmail.com', N'Thanh Hóa')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4006', N'Daxua', N'123456', 667788991, N'daxua@gmail.com', N'Thủ Đức')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4007', N'Soobin Hoàng Sơn', N'123456', 778899001, N'weed@gmail.com', N'WeedWorld')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4008', N'Sếp', N'123456', 889900112, N'sep@gmail.com', N'Japan')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4009', N'Sơn Tùng', N'123456', 990011223, N'sontung@gmail.com', N'Korea')
INSERT [dbo].[Carer] ([CarerID], [CarerName], [Password], [Phone], [Email], [Address]) VALUES (N'C4010', N'Xuân An', N'123456', 901122334, N'nxan@gmail.com', N'TP. HCM')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU001', N'Minh Quân', 564654645, N'quan@gmail.com', N'Biên Hòa')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU002', N'Ngô Minh', 335577991, N'nhim@gmail.com', N'Ngá Đáo City')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU003', N'Đặng Xanh', 557799113, N'xanh@gmail.com', N'HiSoft')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU004', N'Kim Thành', 779911335, N'thanh@gmail.com', N'Japan')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU005', N'Minh Quang', 991133557, N'sep@gmail.com', N'TP. HCM')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU006', N'Hiếu Nghĩa', 224466880, N'nghia@gmail.com', N'Jungle City')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU007', N'Huy Hoàng', 446688002, N'hoang@gmail.com', N'Rainbow City')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU008', N'Minh Dương', 668800224, N'duong@gmail.com', N'M4U City')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU009', N'Chí Bảo', 880022446, N'bao@gmail.com', N'Địa Trung Hải')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU010', N'Trung Hiếu', 111333555, N'vinh@gmail.com', N'Phnom Penh')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU11 ', N'Minh ANh', 12312312, N'anhanh@gmail.com', N'THĐ Street')
INSERT [dbo].[Owner] ([OwnerID], [OwnerName], [Phone], [Email], [Address]) VALUES (N'CU12 ', N'Ronaldo', 77777777, N'ronaldo@gmail.com', N'Portugal')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4001', N'P3001')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4001', N'P3002')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4001', N'P3003')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4002', N'P3002')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4002', N'P3010')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4003', N'P3003')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4003', N'P3010')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4004', N'P3004')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4004', N'P3011')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4005', N'P3005')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4006', N'P3006')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4007', N'P3006')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4007', N'P3007')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4008', N'P3006')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4008', N'P3008')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4009', N'P3009')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4010', N'P3003')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4010', N'P3005')
INSERT [dbo].[Pet_Carer] ([CarerID], [PetID]) VALUES (N'C4010', N'P3009')
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'C3018', N'Darius', 4, 42, 1, CAST(N'2017-11-01' AS Date), N'CU11 ', CAST(N'2017-11-02' AS Date), NULL, N'Toothache', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3001', N'Teemo', 4, 26, 0, CAST(N'2015-07-12' AS Date), N'CU001', CAST(N'2017-10-30' AS Date), CAST(N'2017-11-02' AS Date), N'Broken Leg', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3002', N'Tristana', 2, 13, 0, CAST(N'2012-02-02' AS Date), N'CU002', CAST(N'2017-03-03' AS Date), NULL, N'Undigesty', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3003', N'Le Blanc', 3, 23, 0, CAST(N'2013-03-03' AS Date), N'CU003', CAST(N'2017-04-04' AS Date), CAST(N'2017-11-04' AS Date), N'High fever', 0)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3004', N'Garen', 4, 42, 1, CAST(N'2014-04-04' AS Date), N'CU004', CAST(N'2017-11-02' AS Date), CAST(N'2017-11-02' AS Date), N'Hepatitis', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3005', N'Caitlyn', 5, 51, 0, CAST(N'2016-05-05' AS Date), N'CU005', CAST(N'2017-11-02' AS Date), CAST(N'2017-11-02' AS Date), N'Broken Wings', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3006', N'Yi', 3, 20, 1, CAST(N'2001-11-11' AS Date), N'CU006', CAST(N'2017-11-04' AS Date), CAST(N'2017-11-04' AS Date), N'Shedding Hair', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3007', N'Yasuo', 1, 4, 0, CAST(N'2012-12-22' AS Date), N'CU007', CAST(N'2017-11-04' AS Date), CAST(N'2017-11-02' AS Date), N'Eat but can not digest
', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3008', N'Nasus', 2, 17, 1, CAST(N'2013-02-02' AS Date), N'CU008', CAST(N'2017-04-04' AS Date), CAST(N'2017-05-05' AS Date), N'Broken Leg', 0)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3009', N'LeeSin', 4, 24, 0, CAST(N'2014-06-05' AS Date), N'CU009', CAST(N'2016-07-07' AS Date), CAST(N'2017-08-08' AS Date), N'Snivel', 0)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3010', N'Xin Zhao', 4, 26, 1, CAST(N'2015-05-05' AS Date), N'CU010', CAST(N'2017-11-02' AS Date), CAST(N'2017-11-02' AS Date), N'Diarrhea
', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3011', N'Karma', 1, 3, 0, CAST(N'2016-06-06' AS Date), N'CU001', CAST(N'2017-07-07' AS Date), CAST(N'2017-11-02' AS Date), N'High fever', 0)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3012', N'Ezreal', 3, 20, 0, CAST(N'2017-08-08' AS Date), N'CU003', CAST(N'2017-09-09' AS Date), NULL, N'Hepatitis', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3013', N'Jayce', 6, 62, 0, CAST(N'2017-09-09' AS Date), N'CU007', CAST(N'2017-10-10' AS Date), CAST(N'2017-11-02' AS Date), N'Foot-and-mouth disease', 0)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3014', N'Teemo', 7, 73, 0, CAST(N'2015-05-08' AS Date), N'CU006', CAST(N'2017-10-27' AS Date), CAST(N'2017-05-05' AS Date), N'H5N1', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3015', N'Jax', 5, 45, 0, CAST(N'2017-10-10' AS Date), N'CU006', CAST(N'2017-11-02' AS Date), CAST(N'2017-11-02' AS Date), N'H7N9', 1)
INSERT [dbo].[PetDetail] ([PetID], [PetName], [Species], [Breed], [Gender], [DayOfBirth], [OwnerID], [InDate], [OutDate], [MedicalRecord], [Status]) VALUES (N'P3108', N'Messi', 1, 11, 0, CAST(N'2015-08-18' AS Date), N'CU12 ', CAST(N'2017-11-02' AS Date), CAST(N'2017-11-04' AS Date), N'Missing Neymar', 0)
SET IDENTITY_INSERT [dbo].[Species] ON 

INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (1, N'Dog')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (2, N'Cat')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (3, N'Hamster')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (4, N'Rabbit')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (5, N'Bird')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (6, N'Pig')
INSERT [dbo].[Species] ([SpeciesID], [SpeciesName]) VALUES (7, N'Chicken')
SET IDENTITY_INSERT [dbo].[Species] OFF
ALTER TABLE [dbo].[Breed]  WITH CHECK ADD  CONSTRAINT [FK_Breed_Species] FOREIGN KEY([SpeciesID])
REFERENCES [dbo].[Species] ([SpeciesID])
GO
ALTER TABLE [dbo].[Breed] CHECK CONSTRAINT [FK_Breed_Species]
GO
ALTER TABLE [dbo].[Pet_Carer]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Carer_Carer1] FOREIGN KEY([CarerID])
REFERENCES [dbo].[Carer] ([CarerID])
GO
ALTER TABLE [dbo].[Pet_Carer] CHECK CONSTRAINT [FK_Pet_Carer_Carer1]
GO
ALTER TABLE [dbo].[Pet_Carer]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Carer_PetDetail1] FOREIGN KEY([PetID])
REFERENCES [dbo].[PetDetail] ([PetID])
GO
ALTER TABLE [dbo].[Pet_Carer] CHECK CONSTRAINT [FK_Pet_Carer_PetDetail1]
GO
ALTER TABLE [dbo].[PetDetail]  WITH CHECK ADD  CONSTRAINT [FK_PetDetail_Breed] FOREIGN KEY([Breed])
REFERENCES [dbo].[Breed] ([BreedID])
GO
ALTER TABLE [dbo].[PetDetail] CHECK CONSTRAINT [FK_PetDetail_Breed]
GO
ALTER TABLE [dbo].[PetDetail]  WITH CHECK ADD  CONSTRAINT [FK_PetDetail_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Owner] ([OwnerID])
GO
ALTER TABLE [dbo].[PetDetail] CHECK CONSTRAINT [FK_PetDetail_Owner]
GO
ALTER TABLE [dbo].[PetDetail]  WITH CHECK ADD  CONSTRAINT [FK_PetDetail_Species] FOREIGN KEY([Species])
REFERENCES [dbo].[Species] ([SpeciesID])
GO
ALTER TABLE [dbo].[PetDetail] CHECK CONSTRAINT [FK_PetDetail_Species]
GO
USE [master]
GO
ALTER DATABASE [Fall2017] SET  READ_WRITE 
GO
