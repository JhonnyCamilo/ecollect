USE [master]
GO
/****** Object:  Database [TarjetaCreditoDB]    Script Date: 5/02/2021 4:26:46 p. m. ******/
CREATE DATABASE [TarjetaCreditoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TarjetaCreditoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TarjetaCreditoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TarjetaCreditoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\TarjetaCreditoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TarjetaCreditoDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TarjetaCreditoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TarjetaCreditoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TarjetaCreditoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TarjetaCreditoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TarjetaCreditoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TarjetaCreditoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TarjetaCreditoDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TarjetaCreditoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TarjetaCreditoDB] SET  MULTI_USER 
GO
ALTER DATABASE [TarjetaCreditoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TarjetaCreditoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TarjetaCreditoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TarjetaCreditoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TarjetaCreditoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TarjetaCreditoDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TarjetaCreditoDB] SET QUERY_STORE = OFF
GO
USE [TarjetaCreditoDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/02/2021 4:26:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autores]    Script Date: 5/02/2021 4:26:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Fecha] [varchar](30) NOT NULL,
	[Ciudad] [varchar](30) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Autores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editoriales]    Script Date: 5/02/2021 4:26:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](15) NOT NULL,
	[Correo] [varchar](30) NOT NULL,
	[MaximoLibros] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Editoriales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 5/02/2021 4:26:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[Año] [varchar](4) NOT NULL,
	[Genero] [varchar](15) NOT NULL,
	[NumeroPaginas] [varchar](5) NOT NULL,
	[Editorial] [varchar](100) NOT NULL,
	[Autor] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TarjetaCredito]    Script Date: 5/02/2021 4:26:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TarjetaCredito](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[NumeroPaginas] [varchar](3) NOT NULL,
	[Autor] [varchar](100) NOT NULL,
	[Año] [varchar](4) NOT NULL,
	[Editorial] [varchar](100) NOT NULL,
	[Genero] [varchar](15) NOT NULL,
 CONSTRAINT [PK_TarjetaCredito] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TarjetaCredito] ADD  DEFAULT ('') FOR [Autor]
GO
ALTER TABLE [dbo].[TarjetaCredito] ADD  DEFAULT ('') FOR [Año]
GO
ALTER TABLE [dbo].[TarjetaCredito] ADD  DEFAULT ('') FOR [Editorial]
GO
ALTER TABLE [dbo].[TarjetaCredito] ADD  DEFAULT ('') FOR [Genero]
GO
USE [master]
GO
ALTER DATABASE [TarjetaCreditoDB] SET  READ_WRITE 
GO
