USE [master]
GO
/****** Object:  Database [Locker]    Script Date: 2/09/2019 2:39:06 a.m. ******/
CREATE DATABASE [Locker]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Locker', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Locker.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Locker_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Locker_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Locker] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Locker].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Locker] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Locker] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Locker] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Locker] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Locker] SET ARITHABORT OFF 
GO
ALTER DATABASE [Locker] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Locker] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Locker] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Locker] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Locker] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Locker] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Locker] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Locker] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Locker] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Locker] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Locker] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Locker] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Locker] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Locker] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Locker] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Locker] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Locker] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Locker] SET RECOVERY FULL 
GO
ALTER DATABASE [Locker] SET  MULTI_USER 
GO
ALTER DATABASE [Locker] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Locker] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Locker] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Locker] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Locker] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Locker', N'ON'
GO
ALTER DATABASE [Locker] SET QUERY_STORE = OFF
GO
USE [Locker]
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[IdAnime] [int] NOT NULL,
	[NombreAnime] [varchar](50) NOT NULL,
	[Autor] [varchar](50) NOT NULL,
	[EstdioEncargado] [varchar](50) NOT NULL,
	[Descripcion] [varbinary](50) NULL,
	[Genero] [varchar](50) NULL,
	[FechaDePublicacion] [datetime] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_Anime] PRIMARY KEY CLUSTERED 
(
	[IdAnime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimeXUsuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeXUsuario](
	[IdAnime] [int] NULL,
	[IdUsuario] [int] NULL,
	[CapituloActual] [int] NULL,
	[CapitulosVistos] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[IdEstado] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[NombreGenro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[IdLibro] [int] NOT NULL,
	[NombreLibro] [varchar](50) NULL,
	[Autor] [varbinary](50) NULL,
	[Introduccion] [varchar](50) NULL,
	[Genero] [varchar](50) NULL,
	[FechaPublicacion] [datetime] NULL,
	[Editorial] [varchar](50) NULL,
 CONSTRAINT [PK_Libros] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LibrosXUsuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosXUsuario](
	[IdLibro] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[CapituloActual] [int] NULL,
	[CapitulosLeidos] [int] NULL,
 CONSTRAINT [PK_LibrosXUsuario] PRIMARY KEY CLUSTERED 
(
	[IdLibro] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NovelaLigera]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NovelaLigera](
	[IdNovelaLigera] [int] NOT NULL,
	[NombreNovelaLigera] [varchar](50) NOT NULL,
	[Autor] [varchar](50) NULL,
	[Descripcion] [varchar](50) NULL,
	[Genero] [varchar](50) NULL,
	[FechaDePublicacion] [varchar](50) NULL,
	[Estado] [varchar](50) NULL,
 CONSTRAINT [PK_NovelaLigera] PRIMARY KEY CLUSTERED 
(
	[IdNovelaLigera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NovelasXUsuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NovelasXUsuario](
	[IdNovelaLigera] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[CapituloActual] [int] NULL,
	[CapitulosLeidos] [int] NULL,
 CONSTRAINT [PK_NovelasXUsuario] PRIMARY KEY CLUSTERED 
(
	[IdNovelaLigera] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[IdSerie] [int] IDENTITY(1,1) NOT NULL,
	[NombreSerie] [varchar](50) NULL,
	[Autor] [varchar](50) NULL,
	[Introduccion] [varchar](50) NULL,
	[Genero] [varchar](50) NULL,
	[FechaDePublivcacion] [datetime] NULL,
	[Distribuidora] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeriesXUsuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeriesXUsuario](
	[IdSeries] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[CapituloActual] [int] NULL,
	[CapitulosVistos] [int] NULL,
 CONSTRAINT [PK_SeriesXUsuario] PRIMARY KEY CLUSTERED 
(
	[IdSeries] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoUsuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[IdTipoUsuario] [int] NOT NULL,
	[TipoUsuario] [varchar](50) NULL,
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/09/2019 2:39:06 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](50) NOT NULL,
	[Edad] [int] NULL,
	[FechaDeNacimiento] [datetime] NULL,
	[Genero] [varchar](50) NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[TipoUsuario] [varchar](50) NULL,
	[ArbolesSembrados] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Locker] SET  READ_WRITE 
GO
