USE [master]
GO
/****** Object:  Database [EXAMENPRUEBA]    Script Date: 18/12/2023 02:31:49 p.m. ******/
CREATE DATABASE [EXAMENPRUEBA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EXAMENPRUEBA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EXAMENPRUEBA.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EXAMENPRUEBA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\EXAMENPRUEBA_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EXAMENPRUEBA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EXAMENPRUEBA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EXAMENPRUEBA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET ARITHABORT OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EXAMENPRUEBA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EXAMENPRUEBA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EXAMENPRUEBA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EXAMENPRUEBA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EXAMENPRUEBA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EXAMENPRUEBA] SET  MULTI_USER 
GO
ALTER DATABASE [EXAMENPRUEBA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EXAMENPRUEBA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EXAMENPRUEBA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EXAMENPRUEBA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EXAMENPRUEBA] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EXAMENPRUEBA]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 18/12/2023 02:31:49 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Contraseña] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 18/12/2023 02:31:50 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[PedidoID] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [int] NULL,
	[Descripcion] [nvarchar](100) NULL,
	[FechaPedido] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Contraseña]) VALUES (1, N'JUAN', N'VASQUEZ', N'juan@gmail.com', N'juan123')
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Contraseña]) VALUES (2, N'JUAN', N'VASQUEZ', N'juan@gmail.com', N'polla123')
INSERT [dbo].[Clientes] ([ClienteID], [Nombre], [Apellido], [Email], [Contraseña]) VALUES (3, N'jose', N'rodriguez', N'jose@gmail.com', N'jose123')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
SET IDENTITY_INSERT [dbo].[Pedidos] ON 

INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [Descripcion], [FechaPedido]) VALUES (1, 1, N'pizza de jamon y queso', CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [Descripcion], [FechaPedido]) VALUES (2, 1, N'pizza de jamon y queso', CAST(N'2023-12-18' AS Date))
INSERT [dbo].[Pedidos] ([PedidoID], [ClienteID], [Descripcion], [FechaPedido]) VALUES (3, 1, N'pasta con camarones', CAST(N'2023-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[Pedidos] OFF
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Clientes] ([ClienteID])
GO
USE [master]
GO
ALTER DATABASE [EXAMENPRUEBA] SET  READ_WRITE 
GO
