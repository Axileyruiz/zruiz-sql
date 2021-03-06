/*
 * --------------------------------------------------------------------------------
 * Sección | Nombres  | Apellidos | Matrícula
 * --------------------------------------------------------------------------------
 * 0541    | Zulianny | Ruíz      | 17-eiit-1-010
 */
USE [master]
GO
/****** Object:  Database [EYJ]    Script Date: 28/07/2017 19:02:50 ******/
DROP DATABASE IF EXISTS [EYJ];
GO
CREATE DATABASE [EYJ];
GO
ALTER DATABASE [EYJ] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EYJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EYJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EYJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EYJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EYJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EYJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [EYJ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EYJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EYJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EYJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EYJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EYJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EYJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EYJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EYJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EYJ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EYJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EYJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EYJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EYJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EYJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EYJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EYJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EYJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EYJ] SET  MULTI_USER 
GO
ALTER DATABASE [EYJ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EYJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EYJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EYJ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EYJ] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EYJ]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categoria](
	[cod_categoria] [int] NOT NULL,
	[Descricion] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[apellido] [nvarchar](30) NOT NULL,
	[cedula] [nvarchar](13) NOT NULL,
	[telefono] [nvarchar](13) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[sexo] [nchar](1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[cod_oficina] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[codigobarra]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[codigobarra](
	[Cod_barra] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[cod_factura] [int] NOT NULL,
	[cod_envio] [int] NOT NULL,
	[no_guia] [int] NOT NULL,
	[peso_paquete] [decimal](18, 2) NOT NULL,
	[precio_libra] [decimal](18, 2) NOT NULL,
	[total] [decimal](18, 2) NULL,
	[estatus] [nvarchar](35) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empleado]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[cod_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[apellido] [nvarchar](30) NOT NULL,
	[cedula] [nvarchar](13) NOT NULL,
	[Puesto] [nvarchar](20) NOT NULL,
	[telefono] [nvarchar](13) NOT NULL,
	[Correo_Electronico] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[fecha_de_nac] [date] NULL,
	[fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[envio]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[envio](
	[cod_envio] [int] IDENTITY(1,1) NOT NULL,
	[estatus_envio] [nvarchar](25) NOT NULL,
	[no_guia] [int] NOT NULL,
	[cod_oficina] [int] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[precio_libra] [decimal](18, 2) NOT NULL,
	[fecha_ent] [datetime] NOT NULL,
	[fecha_llegada] [datetime] NOT NULL,
	[via] [nvarchar](25) NULL,
	[codempleado] [int] NULL,
	[categoria] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Estado_del_paquete]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado_del_paquete](
	[cod_Estado] [int] NOT NULL,
	[descricion] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstatusEnvio]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstatusEnvio](
	[codEstatus] [int] IDENTITY(1,1) NOT NULL,
	[estatus] [nvarchar](35) NULL,
	[codenvio] [int] NULL,
	[fecha] [date] NULL,
	[hora] [nvarchar](12) NULL,
	[codempleado] [int] NULL,
 CONSTRAINT [PK_EstatusEnvio] PRIMARY KEY CLUSTERED 
(
	[codEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[factura]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[factura](
	[cod_factura] [int] IDENTITY(1,1) NOT NULL,
	[cod_envio] [int] NOT NULL,
	[cod_empleado] [int] NOT NULL,
	[descuento] [decimal](18, 2) NULL,
	[impuesto] [decimal](18, 2) NULL,
	[total] [decimal](18, 2) NULL,
	[RNC] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[membresia]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[membresia](
	[cod_membresia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[tipodoc] [varchar](15) NOT NULL,
	[documento] [varchar](13) NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
	[codprovincia] [int] NULL,
	[codoficina] [int] NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[referidopor] [nvarchar](35) NULL,
	[fecharegistro] [datetime] NULL,
	[codnacionalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_membresia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oficina]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oficina](
	[cod_oficina] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](35) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](13) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[idpais] [int] NULL,
	[idprovincia] [int] NULL,
	[estatus] [nvarchar](10) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pais]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[idpais] [int] IDENTITY(1,1) NOT NULL,
	[pais] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Paquetes]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paquetes](
	[No_Guia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[cod_oficina] [int] NOT NULL,
	[cod_empleado] [int] NOT NULL,
	[no_traking] [nvarchar](25) NOT NULL,
	[NCorreoLocal] [nvarchar](35) NOT NULL,
	[cod_membresia] [int] NOT NULL,
	[peso_paquete] [decimal](18, 2) NOT NULL,
	[fecha_de_registro] [datetime] NULL,
	[pesoen] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[No_Guia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idprovincia] [int] IDENTITY(1,1) NOT NULL,
	[provincia] [nvarchar](35) NOT NULL,
	[idpais] [int] NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[idprovincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario] [nvarchar](25) NOT NULL,
	[clave] [nvarchar](100) NULL,
	[TipoUsuario] [nvarchar](25) NULL,
	[codempleado] [int] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vFactura]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vFactura]
AS
SELECT        dbo.factura.cod_factura, dbo.factura.cod_envio, dbo.detalle_factura.no_guia, dbo.Paquetes.descripcion, dbo.detalle_factura.peso_paquete, dbo.detalle_factura.precio_libra, dbo.detalle_factura.total, dbo.detalle_factura.estatus, 
                         dbo.factura.descuento, dbo.factura.impuesto, dbo.factura.total AS TotalGeneral, dbo.Paquetes.cod_membresia, dbo.membresia.nombre + ' ' + dbo.membresia.apellido AS Miembro, dbo.Paquetes.cod_oficina, 
                         dbo.oficina.nombre AS oficina, dbo.factura.cod_empleado, dbo.empleado.nombre + ' ' + dbo.empleado.apellido AS Empleado
FROM            dbo.factura INNER JOIN
                         dbo.detalle_factura ON dbo.factura.cod_factura = dbo.detalle_factura.cod_factura INNER JOIN
                         dbo.Paquetes ON dbo.detalle_factura.no_guia = dbo.Paquetes.No_Guia INNER JOIN
                         dbo.envio ON dbo.factura.cod_envio = dbo.envio.cod_envio INNER JOIN
                         dbo.empleado ON dbo.factura.cod_empleado = dbo.empleado.cod_empleado INNER JOIN
                         dbo.membresia ON dbo.Paquetes.cod_membresia = dbo.membresia.cod_membresia INNER JOIN
                         dbo.oficina ON dbo.membresia.codoficina = dbo.oficina.cod_oficina

GO
ALTER TABLE [dbo].[membresia]  WITH CHECK ADD  CONSTRAINT [FK_membresia_oficina] FOREIGN KEY([codoficina])
REFERENCES [dbo].[oficina] ([cod_oficina])
GO
ALTER TABLE [dbo].[membresia] CHECK CONSTRAINT [FK_membresia_oficina]
GO
ALTER TABLE [dbo].[membresia]  WITH CHECK ADD  CONSTRAINT [FK_membresia_Pais] FOREIGN KEY([codnacionalidad])
REFERENCES [dbo].[Pais] ([idpais])
GO
ALTER TABLE [dbo].[membresia] CHECK CONSTRAINT [FK_membresia_Pais]
GO
ALTER TABLE [dbo].[membresia]  WITH CHECK ADD  CONSTRAINT [FK_membresia_Pais1] FOREIGN KEY([codnacionalidad])
REFERENCES [dbo].[Pais] ([idpais])
GO
ALTER TABLE [dbo].[membresia] CHECK CONSTRAINT [FK_membresia_Pais1]
GO
ALTER TABLE [dbo].[membresia]  WITH CHECK ADD  CONSTRAINT [FK_membresia_Provincia] FOREIGN KEY([codprovincia])
REFERENCES [dbo].[Provincia] ([idprovincia])
GO
ALTER TABLE [dbo].[membresia] CHECK CONSTRAINT [FK_membresia_Provincia]
GO
ALTER TABLE [dbo].[membresia]  WITH CHECK ADD  CONSTRAINT [FK_membresia_Provincia1] FOREIGN KEY([codprovincia])
REFERENCES [dbo].[Provincia] ([idprovincia])
GO
ALTER TABLE [dbo].[membresia] CHECK CONSTRAINT [FK_membresia_Provincia1]
GO
ALTER TABLE [dbo].[oficina]  WITH CHECK ADD  CONSTRAINT [FK_oficina_Pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[Pais] ([idpais])
GO
ALTER TABLE [dbo].[oficina] CHECK CONSTRAINT [FK_oficina_Pais]
GO
ALTER TABLE [dbo].[oficina]  WITH CHECK ADD  CONSTRAINT [FK_oficina_Pais1] FOREIGN KEY([idpais])
REFERENCES [dbo].[Pais] ([idpais])
GO
ALTER TABLE [dbo].[oficina] CHECK CONSTRAINT [FK_oficina_Pais1]
GO
ALTER TABLE [dbo].[oficina]  WITH CHECK ADD  CONSTRAINT [FK_oficina_Provincia] FOREIGN KEY([idprovincia])
REFERENCES [dbo].[Provincia] ([idprovincia])
GO
ALTER TABLE [dbo].[oficina] CHECK CONSTRAINT [FK_oficina_Provincia]
GO
ALTER TABLE [dbo].[oficina]  WITH CHECK ADD  CONSTRAINT [FK_oficina_Provincia1] FOREIGN KEY([idprovincia])
REFERENCES [dbo].[Provincia] ([idprovincia])
GO
ALTER TABLE [dbo].[oficina] CHECK CONSTRAINT [FK_oficina_Provincia1]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([idpais])
REFERENCES [dbo].[Pais] ([idpais])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_empleado] FOREIGN KEY([codempleado])
REFERENCES [dbo].[empleado] ([cod_empleado])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_empleado]
GO
/****** Object:  StoredProcedure [dbo].[Empleados]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Empleados]
AS
	SET NOCOUNT ON;
SELECT        empleado.*
FROM            empleado
GO
/****** Object:  StoredProcedure [dbo].[Membresia2]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Membresia2]
AS
	SET NOCOUNT ON;
SELECT        membresia.cod_membresia, membresia.nombre, membresia.apellido, membresia.tipodoc, membresia.documento, membresia.codprovincia, Provincia.provincia, Provincia.idpais, Pais.pais, membresia.codoficina, 
                         oficina.nombre AS Expr1, oficina.direccion, oficina.telefono, membresia.correo, membresia.referidopor, membresia.fecharegistro
FROM            membresia INNER JOIN
                         oficina ON membresia.codoficina = oficina.cod_oficina INNER JOIN
                         Pais ON membresia.codnacionalidad = Pais.idpais AND membresia.codnacionalidad = Pais.idpais AND oficina.idpais = Pais.idpais AND oficina.idpais = Pais.idpais INNER JOIN
                         Provincia ON membresia.codprovincia = Provincia.idprovincia AND membresia.codprovincia = Provincia.idprovincia AND oficina.idprovincia = Provincia.idprovincia AND oficina.idprovincia = Provincia.idprovincia AND 
                         Pais.idpais = Provincia.idpais
GO
/****** Object:  StoredProcedure [dbo].[NewDeleteCommand]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewDeleteCommand]
(
	@Original_cod_empleado int,
	@Original_nombre nvarchar(30),
	@Original_apellido nvarchar(30),
	@Original_cedula nvarchar(13),
	@Original_Puesto nvarchar(20),
	@Original_telefono nvarchar(13),
	@Original_Correo_Electronico nvarchar(50),
	@Original_direccion nvarchar(50),
	@IsNull_fecha_de_nac Int,
	@Original_fecha_de_nac date,
	@IsNull_fecha Int,
	@Original_fecha datetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [empleado] WHERE (([cod_empleado] = @Original_cod_empleado) AND ([nombre] = @Original_nombre) AND ([apellido] = @Original_apellido) AND ([cedula] = @Original_cedula) AND ([Puesto] = @Original_Puesto) AND ([telefono] = @Original_telefono) AND ([Correo_Electronico] = @Original_Correo_Electronico) AND ([direccion] = @Original_direccion) AND ((@IsNull_fecha_de_nac = 1 AND [fecha_de_nac] IS NULL) OR ([fecha_de_nac] = @Original_fecha_de_nac)) AND ((@IsNull_fecha = 1 AND [fecha] IS NULL) OR ([fecha] = @Original_fecha)))
GO
/****** Object:  StoredProcedure [dbo].[NewInsertCommand]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewInsertCommand]
(
	@nombre nvarchar(30),
	@apellido nvarchar(30),
	@cedula nvarchar(13),
	@Puesto nvarchar(20),
	@telefono nvarchar(13),
	@Correo_Electronico nvarchar(50),
	@direccion nvarchar(50),
	@fecha_de_nac date,
	@fecha datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [empleado] ([nombre], [apellido], [cedula], [Puesto], [telefono], [Correo_Electronico], [direccion], [fecha_de_nac], [fecha]) VALUES (@nombre, @apellido, @cedula, @Puesto, @telefono, @Correo_Electronico, @direccion, @fecha_de_nac, @fecha);
	
SELECT cod_empleado, nombre, apellido, cedula, Puesto, telefono, Correo_Electronico, direccion, fecha_de_nac, fecha FROM empleado WHERE (cod_empleado = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[NewSelectCommand]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewSelectCommand]
AS
	SET NOCOUNT ON;
SELECT        envio.cod_envio, envio.no_guia, Paquetes.descripcion, Paquetes.no_traking, Paquetes.NCorreoLocal, Paquetes.peso_paquete, envio.precio_libra, Paquetes.cod_membresia, membresia.nombre, membresia.apellido, 
                         envio.cod_oficina, oficina.nombre AS Expr1, envio.fecha_ent, envio.fecha_llegada
FROM            envio INNER JOIN
                         oficina ON envio.cod_oficina = oficina.cod_oficina INNER JOIN
                         Paquetes ON envio.no_guia = Paquetes.No_Guia INNER JOIN
                         Provincia ON oficina.idprovincia = Provincia.idprovincia AND oficina.idprovincia = Provincia.idprovincia INNER JOIN
                         membresia ON oficina.cod_oficina = membresia.codoficina AND Provincia.idprovincia = membresia.codprovincia AND Provincia.idprovincia = membresia.codprovincia INNER JOIN
                         Pais ON oficina.idpais = Pais.idpais AND oficina.idpais = Pais.idpais AND Provincia.idpais = Pais.idpais AND membresia.codnacionalidad = Pais.idpais AND membresia.codnacionalidad = Pais.idpais INNER JOIN
                         empleado ON Paquetes.cod_empleado = empleado.cod_empleado
GO
/****** Object:  StoredProcedure [dbo].[NewUpdateCommand]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewUpdateCommand]
(
	@nombre nvarchar(30),
	@apellido nvarchar(30),
	@cedula nvarchar(13),
	@Puesto nvarchar(20),
	@telefono nvarchar(13),
	@Correo_Electronico nvarchar(50),
	@direccion nvarchar(50),
	@fecha_de_nac date,
	@fecha datetime,
	@Original_cod_empleado int,
	@Original_nombre nvarchar(30),
	@Original_apellido nvarchar(30),
	@Original_cedula nvarchar(13),
	@Original_Puesto nvarchar(20),
	@Original_telefono nvarchar(13),
	@Original_Correo_Electronico nvarchar(50),
	@Original_direccion nvarchar(50),
	@IsNull_fecha_de_nac Int,
	@Original_fecha_de_nac date,
	@IsNull_fecha Int,
	@Original_fecha datetime,
	@cod_empleado int
)
AS
	SET NOCOUNT OFF;
UPDATE [empleado] SET [nombre] = @nombre, [apellido] = @apellido, [cedula] = @cedula, [Puesto] = @Puesto, [telefono] = @telefono, [Correo_Electronico] = @Correo_Electronico, [direccion] = @direccion, [fecha_de_nac] = @fecha_de_nac, [fecha] = @fecha WHERE (([cod_empleado] = @Original_cod_empleado) AND ([nombre] = @Original_nombre) AND ([apellido] = @Original_apellido) AND ([cedula] = @Original_cedula) AND ([Puesto] = @Original_Puesto) AND ([telefono] = @Original_telefono) AND ([Correo_Electronico] = @Original_Correo_Electronico) AND ([direccion] = @Original_direccion) AND ((@IsNull_fecha_de_nac = 1 AND [fecha_de_nac] IS NULL) OR ([fecha_de_nac] = @Original_fecha_de_nac)) AND ((@IsNull_fecha = 1 AND [fecha] IS NULL) OR ([fecha] = @Original_fecha)));
	
SELECT cod_empleado, nombre, apellido, cedula, Puesto, telefono, Correo_Electronico, direccion, fecha_de_nac, fecha FROM empleado WHERE (cod_empleado = @cod_empleado)
GO
/****** Object:  StoredProcedure [dbo].[Paquete2]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Paquete2]
AS
	SET NOCOUNT ON;
SELECT        Paquetes.No_Guia, Paquetes.descripcion, Paquetes.cod_oficina, Paquetes.cod_membresia, Paquetes.fecha_de_registro, Paquetes.peso_paquete, Paquetes.NCorreoLocal, Paquetes.no_traking, Paquetes.cod_empleado, 
                         oficina.nombre, oficina.cod_oficina AS Expr1, empleado.nombre AS Expr2, empleado.cod_empleado AS Expr3, membresia.nombre AS Expr4, membresia.cod_membresia AS Expr5, membresia.apellido
FROM            Paquetes INNER JOIN
                         oficina ON Paquetes.cod_oficina = oficina.cod_oficina INNER JOIN
                         empleado ON Paquetes.cod_empleado = empleado.cod_empleado INNER JOIN
                         membresia ON oficina.cod_oficina = membresia.codoficina
GO
/****** Object:  StoredProcedure [dbo].[rfactura]    Script Date: 8/11/2018 2:18:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[rfactura]
@codigo int
as
select cod_factura, cod_envio, no_guia, descripcion, peso_paquete, precio_libra, total, estatus, descuento, impuesto, TotalGeneral, cod_membresia, Miembro, cod_oficina, oficina, cod_empleado, Empleado from vFactura where  cod_factura=@codigo 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[47] 4[14] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "factura"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "detalle_factura"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Paquetes"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 136
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "envio"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 136
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "empleado"
            Begin Extent = 
               Top = 6
               Left = 1026
               Bottom = 136
               Right = 1235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "membresia"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oficina"
            Begin Extent = 
               Top = 138
               Left = 285
               Bottom = 268
               Right = 494
            End
            DisplayFlags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFactura'
GO
