/*
 * --------------------------------------------------------------------------------
 * Sección | Nombres  | Apellidos | Matrícula
 * --------------------------------------------------------------------------------
 * 0541    | Zulianny | Ruíz      | 17-eiit-1-010
 */
USE [master]
GO
/****** Object:  Database [hotel3]    Script Date: 28/07/2017 19:02:50 ******/
DROP DATABASE IF EXISTS [hotel3];
GO
CREATE DATABASE [hotel3];
GO
ALTER DATABASE [hotel3] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hotel3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hotel3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hotel3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hotel3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hotel3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hotel3] SET ARITHABORT OFF 
GO
ALTER DATABASE [hotel3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [hotel3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hotel3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hotel3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hotel3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hotel3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hotel3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hotel3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hotel3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hotel3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [hotel3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hotel3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hotel3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hotel3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hotel3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hotel3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hotel3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hotel3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hotel3] SET  MULTI_USER 
GO
ALTER DATABASE [hotel3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hotel3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hotel3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hotel3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [hotel3] SET DELAYED_DURABILITY = DISABLED 
GO
USE [hotel3]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 28/07/2017 19:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[Identificacion] [char](12) NOT NULL,
	[Pais] [char](20) NOT NULL,
	[Nombre] [char](12) NOT NULL,
	[Apellido1] [char](12) NOT NULL,
	[Apellido2] [char](12) NULL,
	[Direccion] [char](30) NOT NULL,
	[Telefono] [char](12) NOT NULL,
	[Observaciones] [char](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[habitaciones]    Script Date: 28/07/2017 19:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[habitaciones](
	[NumHABITACION] [int] NOT NULL,
	[TIPO_HABITACION] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NumHABITACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[paises]    Script Date: 28/07/2017 19:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paises](
	[pais] [char](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reserva_habitac]    Script Date: 28/07/2017 19:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reserva_habitac](
	[idRESERVA] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[FechaENTRADA] [date] NOT NULL,
	[FechaSALIDA] [date] NOT NULL,
	[IVA] [numeric](5, 2) NOT NULL,
	[NumHABITACION] [int] NOT NULL,
	[CLIENTE] [char](12) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRESERVA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_habitacion]    Script Date: 28/07/2017 19:02:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_habitacion](
	[Categoria] [int] NOT NULL,
	[Camas] [int] NOT NULL,
	[Exterior] [char](2) NOT NULL,
	[Salon] [char](2) NOT NULL,
	[Terraza] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[clientes] ([Identificacion], [Pais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (N'12345', N'ESPAÑA', N'Felipe', N'Iglesias', N'López', N'Avda Los Castros, 44', N'942344444', N'Buen cliente')
INSERT [dbo].[clientes] ([Identificacion], [Pais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (N'44444', N'ESPAÑA', N'Luis', N'García', N'García', N'Calle Mayor, 67', N'942456444', NULL)
INSERT [dbo].[clientes] ([Identificacion], [Pais], [Nombre], [Apellido1], [Apellido2], [Direccion], [Telefono], [Observaciones]) VALUES (N'456789', N'FRANCIA', N'Ludovic', N'Giuly', N'Bourquin', N'18 avenue Alsacen Cour', N'37890194', NULL)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (101, 1)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (102, 1)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (103, 1)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (104, 2)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (105, 2)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (106, 3)
INSERT [dbo].[habitaciones] ([NumHABITACION], [TIPO_HABITACION]) VALUES (107, 4)
INSERT [dbo].[paises] ([pais]) VALUES (N'ALEMANIA')
INSERT [dbo].[paises] ([pais]) VALUES (N'ESPAÑA')
INSERT [dbo].[paises] ([pais]) VALUES (N'FRANCIA')
INSERT [dbo].[paises] ([pais]) VALUES (N'PORTUGAL')
SET IDENTITY_INSERT [dbo].[reserva_habitac] ON 

INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(N'2009-03-15' AS Date), CAST(N'2009-03-25' AS Date), CAST(0.07 AS Numeric(5, 2)), 101, N'12345')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(N'2009-03-15' AS Date), CAST(N'2009-03-25' AS Date), CAST(0.07 AS Numeric(5, 2)), 102, N'12345')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(N'2009-02-16' AS Date), CAST(N'2009-02-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 103, N'12345')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(N'2009-03-16' AS Date), CAST(N'2009-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 104, N'44444')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(N'2009-03-16' AS Date), CAST(N'2009-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 105, N'44444')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(N'2009-03-16' AS Date), CAST(N'2009-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 106, N'44444')
INSERT [dbo].[reserva_habitac] ([idRESERVA], [FechaENTRADA], [FechaSALIDA], [IVA], [NumHABITACION], [CLIENTE]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(N'2009-03-16' AS Date), CAST(N'2009-03-21' AS Date), CAST(0.07 AS Numeric(5, 2)), 107, N'44444')
SET IDENTITY_INSERT [dbo].[reserva_habitac] OFF
INSERT [dbo].[tipo_habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (1, 1, N'SI', N'NO', N'NO')
INSERT [dbo].[tipo_habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (2, 2, N'SI', N'NO', N'NO')
INSERT [dbo].[tipo_habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (3, 3, N'SI', N'NO', N'NO')
INSERT [dbo].[tipo_habitacion] ([Categoria], [Camas], [Exterior], [Salon], [Terraza]) VALUES (4, 1, N'SI', N'SI', N'NO')
ALTER TABLE [dbo].[clientes]  WITH CHECK ADD FOREIGN KEY([Pais])
REFERENCES [dbo].[paises] ([pais])
GO
ALTER TABLE [dbo].[habitaciones]  WITH CHECK ADD FOREIGN KEY([TIPO_HABITACION])
REFERENCES [dbo].[tipo_habitacion] ([Categoria])
GO
ALTER TABLE [dbo].[reserva_habitac]  WITH CHECK ADD FOREIGN KEY([CLIENTE])
REFERENCES [dbo].[clientes] ([Identificacion])
GO
ALTER TABLE [dbo].[reserva_habitac]  WITH CHECK ADD FOREIGN KEY([NumHABITACION])
REFERENCES [dbo].[habitaciones] ([NumHABITACION])
GO
ALTER TABLE [dbo].[tipo_habitacion]  WITH CHECK ADD CHECK  (([Exterior]='NO' OR [Exterior]='SI'))
GO
ALTER TABLE [dbo].[tipo_habitacion]  WITH CHECK ADD CHECK  (([Salon]='NO' OR [Salon]='SI'))
GO
ALTER TABLE [dbo].[tipo_habitacion]  WITH CHECK ADD CHECK  (([Terraza]='NO' OR [Terraza]='SI'))
GO
USE [master]
GO
ALTER DATABASE [hotel3] SET  READ_WRITE 
GO
