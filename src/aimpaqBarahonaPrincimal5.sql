/*
 * --------------------------------------------------------------------------------
 * Sección | Nombres  | Apellidos | Matrícula
 * --------------------------------------------------------------------------------
 * 0541    | Zulianny | Ruíz      | 17-eiit-1-010
 */
USE [master]
GO
/****** Object:  Database [aimpaqBarahonaPrincimal5]    Script Date: 14/4/2018 9:50:39 a. m. ******/
DROP DATABASE IF EXISTS [aimpaqBarahonaPrincimal5];
GO
CREATE DATABASE [aimpaqBarahonaPrincimal5];
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aimpaqBarahonaPrincimal5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ARITHABORT OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET  MULTI_USER 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET DELAYED_DURABILITY = DISABLED 
GO
USE [aimpaqBarahonaPrincimal5]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cliente](
	[cod_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[cedula] [varchar](13) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NULL,
	[sexo] [nchar](1) NOT NULL,
	[fecha] [date] NOT NULL,
	[cod_oficina] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[cod_factura] [int] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[libra] [numeric](18, 2) NOT NULL,
	[precio] [numeric](18, 2) NOT NULL,
	[subtotal] [numeric](18, 2) NOT NULL,
	[estado] [varchar](10) NULL,
	[descripcion] [varchar](50) NULL,
	[cod_en_paquete] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleado](
	[cod_empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[cedula] [varchar](13) NOT NULL,
	[area] [varchar](20) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entrada_de_paquete]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entrada_de_paquete](
	[cod_en_paquete] [int] IDENTITY(1,1) NOT NULL,
	[direccion] [varchar](60) NOT NULL,
	[fecha_paquete] [date] NOT NULL,
	[hora_paquete] [varchar](15) NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_empleado] [int] NULL,
	[descripcion] [varchar](50) NOT NULL,
	[libra] [decimal](18, 2) NOT NULL,
	[precio] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_en_paquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[envio_de_paquete]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[envio_de_paquete](
	[cod_envio] [int] IDENTITY(1,1) NOT NULL,
	[cod_paquete] [int] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_oficina] [int] NOT NULL,
	[cod_tipo] [int] NOT NULL,
	[num_traking] [nvarchar](50) NOT NULL,
	[fecha_ent] [date] NOT NULL,
	[fecha_llegada] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[estado]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado](
	[cod_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_del_estado] [varchar](10) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[factura]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[cod_factura] [int] IDENTITY(1,1) NOT NULL,
	[titular] [nvarchar](50) NOT NULL,
	[fecha] [date] NOT NULL,
	[cod_oficina] [int] NOT NULL,
	[cod_cliente] [int] NOT NULL,
	[cod_empleado] [int] NOT NULL,
	[total] [decimal](18, 2) NULL,
	[impuesto] [decimal](18, 2) NULL,
	[Descuento] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[oficina]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[oficina](
	[cod_oficina] [int] IDENTITY(1,1) NOT NULL,
	[nombre_de_oficina] [varchar](30) NOT NULL,
	[ubicacion_de_oficina] [nvarchar](50) NOT NULL,
	[telefono] [varchar](13) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paquete]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[paquete](
	[cod_paquete] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_paquete] [varchar](70) NOT NULL,
	[libra] [numeric](18, 2) NOT NULL,
	[Precio] [numeric](18, 2) NOT NULL,
	[fecha] [date] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_de_envio]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_de_envio](
	[cod_tipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cod_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vEntradaPaquete]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vEntradaPaquete]
AS
SELECT        dbo.entrada_de_paquete.cod_en_paquete, dbo.entrada_de_paquete.descripcion, dbo.entrada_de_paquete.libra, dbo.entrada_de_paquete.precio, dbo.entrada_de_paquete.cod_cliente, dbo.cliente.nombre AS Nombre_Cliente, 
                         dbo.cliente.apellido AS Apellido_Cliente, dbo.entrada_de_paquete.cod_empleado, dbo.empleado.nombre AS Nombre_Empleado, dbo.empleado.apellido AS Apellido_Empleado, dbo.entrada_de_paquete.fecha_paquete, 
                         dbo.entrada_de_paquete.hora_paquete
FROM            dbo.entrada_de_paquete INNER JOIN
                         dbo.cliente ON dbo.entrada_de_paquete.cod_cliente = dbo.cliente.cod_cliente INNER JOIN
                         dbo.empleado ON dbo.entrada_de_paquete.cod_empleado = dbo.empleado.cod_empleado INNER JOIN
                         dbo.oficina ON dbo.cliente.cod_oficina = dbo.oficina.cod_oficina

GO
/****** Object:  View [dbo].[vFactura]    Script Date: 14/4/2018 9:50:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vFactura]
AS
SELECT        dbo.factura.cod_factura, dbo.factura.cod_cliente, dbo.factura.titular, dbo.factura.fecha, dbo.factura.cod_oficina, dbo.factura.cod_empleado, dbo.empleado.nombre, dbo.empleado.nombre AS Expr1, dbo.factura.Descuento, 
                         dbo.factura.impuesto, dbo.factura.total
FROM            dbo.factura INNER JOIN
                         dbo.oficina ON dbo.factura.cod_oficina = dbo.oficina.cod_oficina INNER JOIN
                         dbo.cliente ON dbo.factura.cod_cliente = dbo.cliente.cod_cliente AND dbo.oficina.cod_oficina = dbo.cliente.cod_oficina INNER JOIN
                         dbo.empleado ON dbo.factura.cod_empleado = dbo.empleado.cod_empleado INNER JOIN
                         dbo.detalle_factura ON dbo.factura.cod_factura = dbo.detalle_factura.cod_factura

GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([cod_oficina])
REFERENCES [dbo].[oficina] ([cod_oficina])
GO
ALTER TABLE [dbo].[entrada_de_paquete]  WITH CHECK ADD FOREIGN KEY([cod_empleado])
REFERENCES [dbo].[empleado] ([cod_empleado])
GO
ALTER TABLE [dbo].[envio_de_paquete]  WITH CHECK ADD FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[cliente] ([cod_cliente])
GO
ALTER TABLE [dbo].[envio_de_paquete]  WITH CHECK ADD FOREIGN KEY([cod_oficina])
REFERENCES [dbo].[oficina] ([cod_oficina])
GO
ALTER TABLE [dbo].[envio_de_paquete]  WITH CHECK ADD FOREIGN KEY([cod_tipo])
REFERENCES [dbo].[tipo_de_envio] ([cod_tipo])
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD FOREIGN KEY([cod_cliente])
REFERENCES [dbo].[cliente] ([cod_cliente])
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD FOREIGN KEY([cod_empleado])
REFERENCES [dbo].[empleado] ([cod_empleado])
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD FOREIGN KEY([cod_oficina])
REFERENCES [dbo].[oficina] ([cod_oficina])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "entrada_de_paquete"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 224
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cliente"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 245
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "empleado"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 216
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oficina"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 157
               Right = 988
            End
            DisplayFlags = 280
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
         Column = 3690
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
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntradaPaquete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntradaPaquete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vEntradaPaquete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
               Bottom = 238
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oficina"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 142
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cliente"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 250
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "empleado"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 206
               Right = 934
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "detalle_factura"
            Begin Extent = 
               Top = 11
               Left = 933
               Bottom = 220
               Right = 1142
            End
            DisplayFlags = 280
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
         Column = 3285
         Alias = 900
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vFactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Table = 1170
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
USE [master]
GO
ALTER DATABASE [aimpaqBarahonaPrincimal5] SET  READ_WRITE 
GO
