USE [dbCredirapi]
GO
/****** Object:  Schema [Acce]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Cred]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Cred]
GO
/****** Object:  Schema [Credi]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Credi]
GO
/****** Object:  Schema [Gral]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Nadaim_SQLLogin_1]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Nadaim_SQLLogin_1]
GO
/****** Object:  Schema [Vent]    Script Date: 5/6/2024 08:57:45 ******/
CREATE SCHEMA [Vent]
GO
/****** Object:  Table [Acce].[tbPantallas]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallas](
	[Pant_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pant_Descripcion] [varchar](100) NULL,
	[Pant_Usua_Creacion] [int] NULL,
	[Pant_Fecha_Creacion] [datetime] NULL,
	[Pant_Usua_Modifica] [int] NULL,
	[Pant_Fecha_Modifica] [datetime] NULL,
	[Pant_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pant_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbPantallasPorRoles]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbPantallasPorRoles](
	[Paro_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Id] [int] NULL,
	[Pant_Id] [int] NULL,
	[Paro_Usua_Creacion] [int] NULL,
	[Paro_Fecha_Creacion] [datetime] NULL,
	[Paro_Usua_Modifica] [int] NULL,
	[Paro_Fecha_Modifica] [datetime] NULL,
	[Paro_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Paro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbRoles]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbRoles](
	[Rol_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rol_Descripcion] [varchar](100) NULL,
	[Rol_Usua_Creacion] [int] NULL,
	[Rol_Fecha_Creacion] [datetime] NULL,
	[Rol_Usua_Modifica] [int] NULL,
	[Rol_Fecha_Modifica] [datetime] NULL,
	[Rol_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Rol_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Acce].[tbUsuarios](
	[Usua_Id] [int] IDENTITY(1,1) NOT NULL,
	[Usua_Usuario] [varchar](100) NULL,
	[Usua_Contra] [varchar](max) NULL,
	[Usua_Admin] [bit] NULL,
	[Empl_Id] [int] NULL,
	[Rol_Id] [int] NULL,
	[Usua_Usua_Creacion] [int] NULL,
	[Usua_Fecha_Creacion] [datetime] NULL,
	[Usua_Usua_Modifica] [int] NULL,
	[Usua_Fecha_Modifica] [datetime] NULL,
	[Usua_Estado] [bit] NULL,
	[Usua_Color] [varchar](50) NULL,
	[Usua_VerificarCorreo] [varchar](max) NULL,
 CONSTRAINT [PK__tbUsuari__E863C8EEB5EBA728] PRIMARY KEY CLUSTERED 
(
	[Usua_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbImagenesPorClientes]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbImagenesPorClientes](
	[Imcl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Imcl_Imagen] [varchar](max) NULL,
	[Vecl_Id] [int] NULL,
	[Imcl_Usua_Creacion] [int] NULL,
	[Imcl_Fecha_Creacion] [datetime] NULL,
	[Imcl_Usua_Modifica] [int] NULL,
	[Imcl_Fecha_Modifica] [datetime] NULL,
	[Imcl_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Imcl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbIntereses]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbIntereses](
	[Inte_id] [int] IDENTITY(1,1) NOT NULL,
	[Inte_porcentaje] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Inte_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbModelos]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbModelos](
	[Mode_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mode_Descripcion] [varchar](100) NULL,
	[Marc_Id] [int] NULL,
	[Mode_Usua_Creacion] [int] NULL,
	[Mode_Fecha_Creacion] [datetime] NULL,
	[Mode_Usua_Modifica] [int] NULL,
	[Mode_Fecha_Modifica] [datetime] NULL,
	[Mode_Estado] [bit] NULL,
 CONSTRAINT [PK__tbModelo__E81E8BE7F07CE1A2] PRIMARY KEY CLUSTERED 
(
	[Mode_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbMora]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbMora](
	[Mora_id] [int] IDENTITY(1,1) NOT NULL,
	[Mora_porcentaje] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mora_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbPlanesPagos]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbPlanesPagos](
	[Papa_Id] [int] IDENTITY(1,1) NOT NULL,
	[Papa_Financiamiento] [money] NULL,
	[Papa_Precio_Mercado] [money] NULL,
	[Vecl_Id] [int] NULL,
	[Ticu_Id] [int] NULL,
	[Papa_Intereses_Porcentaje] [int] NULL,
	[Papa_Intereses_Monto] [money] NULL,
	[Papa_Numero_Cuota] [int] NULL,
	[Papa_Mora] [int] NULL,
	[Papa_Estado_PlanesPagos] [bit] NULL,
	[Papa_Fecha_Emision] [datetime] NULL,
	[Papa_Fecha_Finalizacion] [datetime] NULL,
	[Papa_Usua_Creacion] [int] NULL,
	[Papa_Fecha_Creacion] [datetime] NULL,
	[Papa_Usua_Modi] [int] NULL,
	[Papa_Fecha_Modi] [datetime] NULL,
	[Papa_Estado] [bit] NULL,
	[Papa_Saldo_Sumado] [money] NULL,
	[Empl_Id] [int] NULL,
	[Papa_Mora_Monto] [money] NULL,
	[Papa_Total_Intereses] [money] NULL,
	[Papa_Total_Capital] [money] NULL,
	[Papa_Intereses_Restar] [money] NULL,
	[Papa_Capital_Restar] [money] NULL,
	[Papa_Total_Pago] [money] NULL,
	[Papa_Total_Intereses_Restados] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Papa_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbPlanesPagosClientes]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbPlanesPagosClientes](
	[Pacl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Papa_Id] [int] NULL,
	[Pacl_Monto_Pago] [money] NULL,
	[Pacl_Pago_Capital] [money] NULL,
	[Pacl_Pago_Intereses] [money] NULL,
	[Pacl_Pago_Mora] [money] NULL,
	[Pacl_Fecha_Emision] [varchar](max) NULL,
	[Sucu_Id] [int] NULL,
	[Pacl_Usua_Creacion] [int] NULL,
	[Pacl_Fecha_Creacion] [datetime] NULL,
	[Pacl_Usua_Modi] [int] NULL,
	[Pacl_Fecha_Modi] [datetime] NULL,
	[Pacl_Estado] [bit] NULL,
	[Pacl_Fecha_Pago] [varchar](max) NULL,
	[Pacl_Financiamiento] [money] NULL,
	[Pacl_Saldo_Inicial] [money] NULL,
	[Pacl_Saldo_Sumado] [money] NULL,
	[Pacl_Fecha_PreviaPago] [varchar](max) NULL,
	[Pacl_Estado_Pago] [int] NULL,
	[Pacl_Mora_Saber] [bit] NULL,
	[Pacl_SaberFechaPrevia] [bit] NULL,
	[Pacl_NumeroCuota] [int] NULL,
	[Pacl_Total_Intereses] [money] NULL,
	[Pacl_Total_Capital] [money] NULL,
	[Pacl_Intereses_Restar] [money] NULL,
	[Pacl_Capital_Restar] [money] NULL,
	[Pacl_Total_Pago] [money] NULL,
	[Pacl_Saldo] [money] NULL,
 CONSTRAINT [PK__tbPlanes__7E350E31A2686F3C] PRIMARY KEY CLUSTERED 
(
	[Pacl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbTipoCuotas]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbTipoCuotas](
	[Ticu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ticu_Descripcion] [varchar](100) NULL,
	[Ticu_Usua_Creacion] [int] NULL,
	[Ticu_Fecha_Creacion] [datetime] NULL,
	[Ticu_Usua_Modi] [int] NULL,
	[Ticu_Fecha_Modi] [datetime] NULL,
	[Ticu_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ticu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbVehiculos]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbVehiculos](
	[Vehi_Id] [int] IDENTITY(1,1) NOT NULL,
	[Vehi_Placa] [varchar](20) NULL,
	[Vehi_Descripcion] [varchar](max) NULL,
	[Vehi_Color] [varchar](100) NULL,
	[Vehi_Anio] [int] NULL,
	[Mode_Id] [int] NULL,
	[Vehi_Usua_Creacion] [int] NULL,
	[Vehi_Fecha_Creacion] [datetime] NULL,
	[Vehi_Usua_Modifica] [int] NULL,
	[Vehi_Fecha_Modifica] [datetime] NULL,
	[Vehi_Estado] [bit] NULL,
 CONSTRAINT [PK__tbVehicu__31BC31313E03F2D5] PRIMARY KEY CLUSTERED 
(
	[Vehi_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbVehiculosPorClientes]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Cred].[tbVehiculosPorClientes](
	[Vecl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Vehi_Id] [int] NULL,
	[Clie_Id] [int] NULL,
	[Vecl_Usua_Creacion] [int] NULL,
	[Vecl_Fecha_Creacion] [datetime] NULL,
	[Vecl_Usua_Modifica] [int] NULL,
	[Vecl_Fecha_Modifica] [datetime] NULL,
	[Vecl_Estado] [bit] NULL,
	[Vecl_Imagen] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Vecl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCargos]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbCargos](
	[Carg_Id] [int] IDENTITY(1,1) NOT NULL,
	[Carg_Descripcion] [varchar](100) NULL,
	[Carg_Usua_Creacion] [int] NULL,
	[Carg_Fecha_Creacion] [datetime] NULL,
	[Carg_Usua_Modifica] [int] NULL,
	[Carg_Fecha_Modifica] [datetime] NULL,
	[Carg_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Carg_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbClientes]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbClientes](
	[Clie_Id] [int] IDENTITY(1,1) NOT NULL,
	[Clie_DNI] [varchar](13) NULL,
	[Clie_Nombre] [varchar](100) NULL,
	[Clie_Apellido] [varchar](100) NULL,
	[Clie_Sexo] [char](1) NULL,
	[Clie_Telefono] [int] NULL,
	[Esta_Id] [int] NULL,
	[Muni_Id] [varchar](4) NULL,
	[Clie_Usua_Creacion] [int] NULL,
	[Clie_Fecha_Creacion] [datetime] NULL,
	[Clie_Usua_Modifica] [int] NULL,
	[Clie_Fecha_Modifica] [datetime] NULL,
	[Clie_Estado] [bit] NULL,
 CONSTRAINT [PK__tbClient__5BB95503980C9EEE] PRIMARY KEY CLUSTERED 
(
	[Clie_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbDepartamentos]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbDepartamentos](
	[Dept_Id] [varchar](2) NOT NULL,
	[Dept_Descripcion] [varchar](100) NULL,
	[Dept_Usua_Creacion] [int] NULL,
	[Dept_Fecha_Creacion] [datetime] NULL,
	[Dept_Usua_Modifica] [int] NULL,
	[Dept_Fecha_Modifica] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEmpleados]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEmpleados](
	[Empl_Id] [int] IDENTITY(1,1) NOT NULL,
	[Empl_DNI] [varchar](13) NULL,
	[Empl_Nombre] [varchar](100) NULL,
	[Empl_Apellido] [varchar](100) NULL,
	[Empl_Sexo] [char](1) NULL,
	[Esta_Id] [int] NULL,
	[Muni_Id] [varchar](4) NULL,
	[Carg_Id] [int] NULL,
	[Empl_Usua_Creacion] [int] NULL,
	[Empl_Fecha_Creacion] [datetime] NULL,
	[Empl_Usua_Modifica] [int] NULL,
	[Empl_Fecha_Modifica] [datetime] NULL,
	[Empl_Estado] [bit] NULL,
	[Sucu_Id] [int] NULL,
	[Empl_Correo] [varchar](100) NULL,
 CONSTRAINT [PK__tbEmplea__2EB12E8610D447FA] PRIMARY KEY CLUSTERED 
(
	[Empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEstadosCiviles]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbEstadosCiviles](
	[Esta_Id] [int] IDENTITY(1,1) NOT NULL,
	[Esta_Descripcion] [varchar](100) NULL,
	[Esta_Usua_Creacion] [int] NULL,
	[Esta_Fecha_Creacion] [datetime] NULL,
	[Esta_Usua_Modifica] [int] NULL,
	[Esta_Fecha_Modifica] [datetime] NULL,
	[Esta_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Esta_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMarcas]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMarcas](
	[Marc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Marc_Descripcion] [varchar](100) NULL,
	[Marc_Usua_Creacion] [int] NULL,
	[Marc_Fecha_Creacion] [datetime] NULL,
	[Marc_Usuario_Modificiacion] [int] NULL,
	[Marc_Fecha_Modificacion] [datetime] NULL,
	[Marc_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Marc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbMunicipios]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbMunicipios](
	[Muni_Id] [varchar](4) NOT NULL,
	[Muni_Descripcion] [varchar](100) NULL,
	[Dept_Id] [varchar](2) NULL,
	[Muni_Usua_Creacion] [int] NULL,
	[Muni_Fecha_Creacion] [datetime] NULL,
	[Muni_Usua_Modifica] [int] NULL,
	[Muni_Fecha_Modifica] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Muni_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbSucursales]    Script Date: 5/6/2024 08:57:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Gral].[tbSucursales](
	[Sucu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sucu_Calle] [varchar](max) NULL,
	[Sucu_Direccion] [varchar](max) NULL,
	[Muni_Id] [varchar](4) NULL,
	[Sucu_Usua_Creacion] [int] NULL,
	[Sucu_Fecha_Creacion] [datetime] NULL,
	[Sucu_Usua_Modi] [int] NULL,
	[Sucu_Fecha_Modi] [datetime] NULL,
	[Sucu_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sucu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [Acce].[tbPantallas] ON 

INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (1, N'Usuarios', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (2, N'Roles', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (3, N'Cargos', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (4, N'Cliente', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (5, N'Departamento', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (6, N'Empleado', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (7, N'EstadoCivil', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (8, N'Marca', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (9, N'Municipio', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (10, N'Sucursal', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (11, N'Tipo de Cuota', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (12, N'Modelo', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (13, N'Vehiculo', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (14, N'PlanPago', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (15, N'Graficos', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (16, N'Prestamos Aprobados', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (17, N'Ventas Hechas por Empleados', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (18, N'Clientes en Mora', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (19, N'PlanPagoCliente', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (20, N'Inicio', NULL, NULL, NULL, NULL, 1)
INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (25, N'Imagenes Clientes', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [Acce].[tbPantallasPorRoles] ON 

INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (13, 15, 1, 1, CAST(N'2024-05-06T23:58:59.360' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (14, 15, 2, 1, CAST(N'2024-05-06T23:59:06.370' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (15, 20, 2, 1, CAST(N'2024-05-07T00:22:06.743' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (17, 22, 1, 1, CAST(N'2024-05-07T00:31:30.353' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (19, 25, 2, 1, CAST(N'2024-05-07T07:53:14.270' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (20, 25, 1, 1, CAST(N'2024-05-07T07:53:39.380' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (21, 32, 2, 1, CAST(N'2024-05-07T12:56:08.823' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (22, 35, 2, 1, CAST(N'2024-05-07T15:51:09.880' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (23, 37, 2, 1, CAST(N'2024-05-09T07:47:06.933' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (29, 38, 1, 1, CAST(N'2024-05-09T08:52:43.917' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (30, 38, 2, 1, CAST(N'2024-05-09T08:52:44.610' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (31, 38, 3, 1, CAST(N'2024-05-09T08:52:45.420' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (34, 40, 2, 1, CAST(N'2024-05-09T12:30:59.840' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (35, 41, 3, 1, CAST(N'2024-05-12T13:39:16.240' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (36, 41, 2, 1, CAST(N'2024-05-12T13:40:15.367' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (37, 41, 3, 1, CAST(N'2024-05-12T13:40:16.413' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (38, 41, 1, 1, CAST(N'2024-05-12T13:40:17.927' AS DateTime), NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (40, 43, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (41, 44, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (42, 21, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (43, 21, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (44, 10, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (45, 10, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (46, 10, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (47, 10, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (48, 10, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (49, 10, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (50, 10, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (51, 10, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (52, 10, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (53, 10, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (54, 10, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (55, 10, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (56, 10, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (57, 10, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (58, 5, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (59, 5, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (60, 5, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (61, 5, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (62, 3, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (63, 3, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (64, 3, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (65, 3, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (66, 3, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (67, 3, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (68, 3, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (69, 3, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (70, 2, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (71, 2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (72, 2, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (73, 2, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (74, 2, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (75, 2, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (76, 2, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (77, 2, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (78, 2, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (79, 2, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (80, 2, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (81, 2, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (82, 2, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (83, 2, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (98, 47, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (99, 47, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (100, 47, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (101, 48, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (102, 48, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (103, 48, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (104, 48, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (105, 48, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (106, 48, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (107, 48, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (108, 48, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (109, 48, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (110, 48, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (111, 48, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (112, 48, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (113, 48, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (114, 48, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (115, 49, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (116, 49, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (117, 49, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (118, 49, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (119, 49, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (120, 49, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (121, 49, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (122, 49, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (123, 49, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (124, 49, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (125, 49, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (126, 49, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (127, 49, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (128, 49, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (129, 50, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (130, 50, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (332, 4, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (333, 4, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (334, 4, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (335, 4, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (336, 4, 7, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (337, 4, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (338, 4, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (339, 4, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (340, 4, 15, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (341, 4, 16, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (342, 4, 17, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (343, 4, 18, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (344, 4, 19, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (345, 4, 20, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (347, 4, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (348, 4, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (449, 51, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (450, 51, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (451, 51, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (452, 51, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (453, 51, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (454, 51, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (542, 1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (543, 1, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (544, 1, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (545, 1, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (546, 1, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (547, 1, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (548, 1, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (549, 1, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (550, 1, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (551, 1, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (552, 1, 15, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (553, 1, 16, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (554, 1, 17, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (555, 1, 18, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (556, 1, 19, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (557, 1, 20, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (559, 1, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (560, 1, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (561, 1, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (562, 1, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (563, 1, 25, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (832, 46, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (833, 46, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (834, 46, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (835, 46, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (836, 46, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (837, 46, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (838, 46, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (839, 46, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (840, 46, 25, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (841, 46, 15, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (842, 46, 16, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (843, 46, 17, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (844, 46, 18, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (845, 46, 19, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (846, 46, 20, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (848, 46, 11, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (849, 46, 14, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (850, 46, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (851, 52, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (852, 52, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (853, 52, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (854, 52, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (855, 52, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (856, 52, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (857, 52, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (858, 52, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (859, 52, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (885, 53, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (886, 53, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (887, 53, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (888, 53, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (889, 53, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (890, 53, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (891, 53, 15, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (892, 53, 16, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (893, 53, 17, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (894, 53, 18, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (895, 53, 19, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (896, 53, 20, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (898, 53, 12, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (899, 53, 13, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbPantallasPorRoles] ([Paro_Id], [Rol_Id], [Pant_Id], [Paro_Usua_Creacion], [Paro_Fecha_Creacion], [Paro_Usua_Modifica], [Paro_Fecha_Modifica], [Paro_Estado]) VALUES (900, 53, 7, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Acce].[tbPantallasPorRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (1, N'Admin', 1, CAST(N'2024-04-29T21:49:09.957' AS DateTime), 1, CAST(N'2024-04-29T21:53:46.163' AS DateTime), 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (2, N'Gerente', 1, CAST(N'2024-04-29T22:02:36.357' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (3, N'KEFDS', NULL, CAST(N'2024-05-06T23:01:03.240' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (4, N'kefe', 1, CAST(N'2024-05-06T23:02:46.557' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (5, N'Puure', 1, CAST(N'2024-05-06T23:07:05.607' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (6, N'fsd', 1, CAST(N'2024-05-06T23:14:57.447' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (7, N'gfgf', 1, CAST(N'2024-05-06T23:16:01.683' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (8, N'try', 1, CAST(N'2024-05-06T23:16:58.700' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (9, N'tryff', 1, CAST(N'2024-05-06T23:17:19.037' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (10, N'gd', 1, CAST(N'2024-05-06T23:17:52.930' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (11, N'fdg', 1, CAST(N'2024-05-06T23:18:20.870' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (12, N'kkkl', 1, CAST(N'2024-05-06T23:26:15.307' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (13, N'ads', 1, CAST(N'2024-05-06T23:57:03.960' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (14, N'dasdsa', 1, CAST(N'2024-05-06T23:58:25.983' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (15, N'dasdsads', 1, CAST(N'2024-05-06T23:58:43.573' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (16, N'hfhgfhg', 1, CAST(N'2024-05-07T00:06:19.410' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (17, N'hfhgf', 1, CAST(N'2024-05-07T00:09:48.523' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (18, N'gf', 1, CAST(N'2024-05-07T00:12:28.220' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (19, N'dsa', 1, CAST(N'2024-05-07T00:17:20.540' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (20, N'kl', 1, CAST(N'2024-05-07T00:21:12.587' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (21, N'as', 1, CAST(N'2024-05-07T00:28:37.667' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (22, N'gfd', 1, CAST(N'2024-05-07T00:31:20.970' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (23, N'dsfds', 1, CAST(N'2024-05-07T00:34:38.600' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (24, N'mm', 1, CAST(N'2024-05-07T07:52:05.273' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (25, N'cvx', 1, CAST(N'2024-05-07T07:52:46.257' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (26, N'sasd', 1, CAST(N'2024-05-07T08:14:10.607' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (27, N'fds', 1, CAST(N'2024-05-07T08:14:35.000' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (28, N'Jus', 1, CAST(N'2024-05-07T08:15:40.903' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (29, N'fvc', 1, CAST(N'2024-05-07T09:46:54.360' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (30, N'ghg', 1, CAST(N'2024-05-07T10:55:04.760' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (31, N'BVCBV', 1, CAST(N'2024-05-07T12:12:33.620' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (32, N'gdfg', 1, CAST(N'2024-05-07T12:56:06.867' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (33, N'vc', 1, CAST(N'2024-05-07T14:12:41.383' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (34, N',mn', 1, CAST(N'2024-05-07T14:13:31.090' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (35, N'Hola', 1, CAST(N'2024-05-07T15:51:07.360' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (36, N'mj', 1, CAST(N'2024-05-07T16:01:38.717' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (37, N'messi', 1, CAST(N'2024-05-09T07:47:01.430' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (38, N'jhj', 1, CAST(N'2024-05-09T08:52:27.037' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (39, N'fs', 1, CAST(N'2024-05-09T12:30:11.523' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (40, N'b  cnc', 1, CAST(N'2024-05-09T12:30:25.110' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (41, N'aaaa', 1, CAST(N'2024-05-12T13:39:07.193' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (43, N'eeeeeee', 1, CAST(N'2024-05-12T16:45:36.807' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (44, N'ssss', 1, CAST(N'2024-05-12T18:20:22.610' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (45, N'lll', 1, CAST(N'2024-05-13T09:58:17.200' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (46, N'Messi', 1, CAST(N'2024-05-13T10:13:30.990' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (47, N'Ronaldo', 1, CAST(N'2024-05-13T10:31:42.330' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (48, N'ooooooooooo', 1, CAST(N'2024-05-13T10:35:41.140' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (49, N'hhhhh', 1, CAST(N'2024-05-13T12:34:21.353' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (50, N'ooooo', 1, CAST(N'2024-05-13T15:56:02.030' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (51, N'cocacola', 1, CAST(N'2024-05-20T09:25:11.337' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (52, N'Pruebaaa', 1, CAST(N'2024-05-22T16:29:13.440' AS DateTime), NULL, NULL, 1)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (53, N'Pruebaaa', 1, CAST(N'2024-05-22T16:29:22.387' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado], [Usua_Color], [Usua_VerificarCorreo]) VALUES (1, N'Admin', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 1, 1, 1, 1, NULL, NULL, CAST(N'2024-05-22T02:49:04.407' AS DateTime), 1, N'039503', N'942111')
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado], [Usua_Color], [Usua_VerificarCorreo]) VALUES (12, N'Esdra', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 0, 2, 46, 1, CAST(N'2024-05-15T08:34:19.250' AS DateTime), NULL, CAST(N'2024-05-19T19:02:17.943' AS DateTime), 1, N'#a31766', N'423885')
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado], [Usua_Color], [Usua_VerificarCorreo]) VALUES (13, N'Messi', N'A4B628AD40225009238B3B08A2A85A064ACA7F914871E955B79087E7E16431031190149547A3E41C8B98093373EA427A77FB335958F0A4946DAB431F18CE02DE', 1, 9, 1, 1, CAST(N'2024-05-15T08:52:05.180' AS DateTime), 1, CAST(N'2024-06-05T09:42:56.150' AS DateTime), 1, N'#10a6cc', N'206505')
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado], [Usua_Color], [Usua_VerificarCorreo]) VALUES (14, N'fast', N'FB131BC57A477C8C9D068F1EE5622AC304195A77164CCC2D75D82DFE1A727BA8D674ED87F96143B2B416AACEFB555E3045C356FAA23E6D21DE72B85822E39FDD', 1, 9, 53, 1, CAST(N'2024-05-22T16:29:48.437' AS DateTime), NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
SET IDENTITY_INSERT [Cred].[tbImagenesPorClientes] ON 

INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (2, N'avatar_usuario.png', 2, 1, NULL, NULL, NULL, 0)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (3, N'avatar_usuario.png', 3, 1, CAST(N'2024-05-20T10:43:45.857' AS DateTime), NULL, NULL, 0)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (6, N'avatar_usuario.png', 2, 1, CAST(N'2024-05-20T12:06:50.523' AS DateTime), NULL, NULL, 0)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (7, N'1716240067641-198984832-15anos.jpg', 21, 1, CAST(N'2024-05-20T16:21:09.113' AS DateTime), NULL, NULL, 0)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (8, N'1716240302897-15374898-15anos.jpg', 20, 1, CAST(N'2024-05-20T15:26:37.520' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (9, N'1716312001798-900996267-logo.png', 19, 1, CAST(N'2024-05-21T11:20:07.507' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (10, N'1716312163332-676292200-Captura de pantalla 2024-04-30 100943.png', 5, 1, CAST(N'2024-05-21T11:22:48.810' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (11, N'1716313972893-278494875-Captura de pantalla 2024-04-30 100943.png', 5, 1, CAST(N'2024-05-21T11:52:54.050' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (12, N'1716392438706-155020683-Captura de pantalla 2024-03-12 133935.png', 22, 1, CAST(N'2024-05-22T00:51:13.340' AS DateTime), 1, CAST(N'2024-05-22T09:40:39.840' AS DateTime), 0)
INSERT [Cred].[tbImagenesPorClientes] ([Imcl_Id], [Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion], [Imcl_Usua_Modifica], [Imcl_Fecha_Modifica], [Imcl_Estado]) VALUES (13, N'1716413670854-348472682-volcan-de-la-cordillera-de-cumbre-vieja-en-la-isla-de-la-palma_c7dc1d22_800x800.jpeg', 9, 1, CAST(N'2024-05-22T16:34:38.087' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Cred].[tbImagenesPorClientes] OFF
GO
SET IDENTITY_INSERT [Cred].[tbIntereses] ON 

INSERT [Cred].[tbIntereses] ([Inte_id], [Inte_porcentaje]) VALUES (1, 3)
SET IDENTITY_INSERT [Cred].[tbIntereses] OFF
GO
SET IDENTITY_INSERT [Cred].[tbModelos] ON 

INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (4, N'Papaaaaa', 2, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-30T00:09:00.717' AS DateTime), 0)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (5, N'Prueba', 2, 1, CAST(N'2024-04-30T00:08:00.873' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (6, N'Gtr -4', 1, NULL, CAST(N'2024-05-02T16:16:09.427' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (7, N'Prado-Lexus', 1, NULL, CAST(N'2024-05-02T22:09:05.747' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (8, N'NissanMax', 2, NULL, CAST(N'2024-05-02T22:17:48.813' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (9, N'Corolla', 1, NULL, CAST(N'2024-05-03T07:58:33.023' AS DateTime), NULL, CAST(N'2024-05-07T13:16:01.950' AS DateTime), 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (10, N'Aveo2024', 2, NULL, CAST(N'2024-05-03T09:11:42.870' AS DateTime), NULL, CAST(N'2024-05-07T13:16:05.557' AS DateTime), 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (11, N'Nissan232222', 2, NULL, CAST(N'2024-05-05T23:52:31.803' AS DateTime), NULL, CAST(N'2024-05-06T00:09:23.750' AS DateTime), 0)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (12, N'Land Cruiser', 1, 1, CAST(N'2024-05-10T12:30:43.970' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (13, N'Elantra 2019', 7, 1, CAST(N'2024-05-12T18:13:36.377' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (14, N'Subaru TRX', 4, 1, CAST(N'2024-05-13T13:15:00.837' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (15, N'Aveo 75', 1, 1, CAST(N'2024-05-13T14:21:03.790' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (16, N'Crv 2019', 7, 1, CAST(N'2024-05-13T15:46:15.913' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Cred].[tbModelos] OFF
GO
SET IDENTITY_INSERT [Cred].[tbMora] ON 

INSERT [Cred].[tbMora] ([Mora_id], [Mora_porcentaje]) VALUES (1, 3)
SET IDENTITY_INSERT [Cred].[tbMora] OFF
GO
SET IDENTITY_INSERT [Cred].[tbPlanesPagos] ON 

INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (102, 650000.0000, 750000.0000, 10, NULL, 3, 19500.0000, 3, 3, 0, CAST(N'2024-05-12T19:12:37.873' AS DateTime), NULL, 1, CAST(N'2024-05-12T19:12:37.873' AS DateTime), NULL, NULL, 1, 0.0000, 1, 19500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (103, 950000.0000, 120000.0000, 2, NULL, 3, 28500.0000, 7, 3, 0, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, 0.0000, 1, 28500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (104, 250000.0000, 350000.0000, 3, NULL, 3, 7500.0000, 10, 3, 0, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, 0.0000, 2, 7500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (105, 150000.0000, 2000000.0000, 5, NULL, 3, 4500.0000, 15, 3, 0, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, 0.0000, 2, 4500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (106, 560000.0000, 780000.0000, 9, NULL, 3, 16800.0000, 9, 3, 0, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, 0.0000, 1, 16800.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (107, 450000.0000, 55000.0000, 5, NULL, 3, 13500.0000, 5, 3, 0, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, 0.0000, 1, 13500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (112, 750000.0000, 950000.0000, 11, NULL, 3, 22500.0000, 7, 3, 0, CAST(N'2024-05-13T13:40:57.877' AS DateTime), NULL, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), NULL, NULL, 0, 0.0000, 2, 22500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (113, 500000.0000, 650000.0000, 12, NULL, 3, 15000.0000, 3, 3, 0, CAST(N'2024-05-13T14:22:21.463' AS DateTime), NULL, 1, CAST(N'2024-05-13T14:22:21.463' AS DateTime), NULL, NULL, 0, 0.0000, 9, 15000.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (114, 150000.0000, 250000.0000, 13, NULL, 3, 4500.0000, 2, 3, 0, CAST(N'2024-05-13T14:51:03.700' AS DateTime), NULL, 1, CAST(N'2024-05-13T14:51:03.700' AS DateTime), NULL, NULL, 1, 0.0000, 9, 4500.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (115, 100000.0000, 260000.0000, 14, NULL, 3, 3000.0000, 12, 3, 0, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, 0.0000, 11, 3000.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (116, 100000.0000, 260000.0000, 15, NULL, 3, 3000.0000, 18, 3, 0, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, 0.0000, 11, 3000.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (140, 500000.0000, 650000.0000, 20, NULL, 3, 15000.0000, 10, 3, 0, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, 0.0000, NULL, 15000.0000, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 150000.0000)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (141, 500000.0000, 650000.0000, 22, NULL, 3, 15000.0000, 10, 3, 0, CAST(N'2024-05-22T10:35:14.257' AS DateTime), NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, 0.0000, 2, 15000.0000, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 150000.0000)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (142, 100000.0000, 2000000.0000, 21, NULL, 3, 3000.0000, 10, 3, 0, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, 0.0000, 2, 3000.0000, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 30000.0000)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (143, 150000.0000, 250000.0000, 17, NULL, 3, 4500.0000, 10, 3, 0, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, 0.0000, 2, 4500.0000, 45000.0000, 150000.0000, 4500.0000, 15000.0000, 19500.0000, 0.0000)
INSERT [Cred].[tbPlanesPagos] ([Papa_Id], [Papa_Financiamiento], [Papa_Precio_Mercado], [Vecl_Id], [Ticu_Id], [Papa_Intereses_Porcentaje], [Papa_Intereses_Monto], [Papa_Numero_Cuota], [Papa_Mora], [Papa_Estado_PlanesPagos], [Papa_Fecha_Emision], [Papa_Fecha_Finalizacion], [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Usua_Modi], [Papa_Fecha_Modi], [Papa_Estado], [Papa_Saldo_Sumado], [Empl_Id], [Papa_Mora_Monto], [Papa_Total_Intereses], [Papa_Total_Capital], [Papa_Intereses_Restar], [Papa_Capital_Restar], [Papa_Total_Pago], [Papa_Total_Intereses_Restados]) VALUES (144, 150000.0000, 300000.0000, 19, NULL, 3, 4500.0000, 15, 3, 0, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, 0.0000, 2, 4500.0000, 67500.0000, 150000.0000, 4500.0000, 10000.0000, 14500.0000, 0.0000)
SET IDENTITY_INSERT [Cred].[tbPlanesPagos] OFF
GO
SET IDENTITY_INSERT [Cred].[tbPlanesPagosClientes] ON 

INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (644, 102, 50000.0000, 11000.0000, 19500.0000, 19500.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T19:12:37.873' AS DateTime), 1, CAST(N'2024-05-13T01:47:51.337' AS DateTime), 1, N'12/04/2024 0:00:00', 650000.0000, 650000.0000, 701000.0000, N'12/03/2024 0:00:00', 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (645, 102, 45000.0000, 25500.0000, 19500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T19:12:37.873' AS DateTime), 1, CAST(N'2024-05-13T13:12:39.157' AS DateTime), 1, N'12/06/2024 0:00:00', 650000.0000, -25500.0000, 701000.0000, N'05/05/2024 0:00:00', 2, 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (646, 102, 633000.0000, 613500.0000, 19500.0000, 80.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T19:12:37.873' AS DateTime), 1, CAST(N'2024-05-13T04:45:09.023' AS DateTime), 1, N'12/07/2024 0:00:00', 650000.0000, 613500.0000, 701000.0000, N'08/05/2024 0:00:00', 3, 0, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (647, 103, 35000.0000, 6500.0000, 28500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), 1, CAST(N'2024-05-13T14:46:39.690' AS DateTime), 1, N'12/08/2024 0:00:00', 950000.0000, 950000.0000, 6500.0000, N'12/05/2024 0:00:00', 4, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (648, 103, 0.0000, 0.0000, 0.0000, 64.0000, N'2024-03-12', 4, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/07/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/06/2024 0:00:00', 2, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (649, 103, 0.0000, 0.0000, 0.0000, 70.0000, N'2024-03-12', 4, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/08/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/07/2024 0:00:00', 2, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (650, 103, 0.0000, 0.0000, 0.0000, 80.0000, N'2024-03-12', 3, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/09/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/08/2024 0:00:00', 2, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (651, 103, 0.0000, 0.0000, 0.0000, 45.0000, N'2024-03-12', 1, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/10/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/09/2024 0:00:00', 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (652, 103, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-03-12', 1, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/11/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/10/2024 0:00:00', 2, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (653, 103, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-03-12', 1, 1, CAST(N'2024-05-12T20:05:07.867' AS DateTime), NULL, NULL, 1, N'12/12/2024 0:00:00', 950000.0000, 0.0000, 6500.0000, N'12/11/2024 0:00:00', 2, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (654, 104, 525.0000, NULL, NULL, 0.0000, N'2024-05-20', 1, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), 1, CAST(N'2024-05-20T08:12:01.583' AS DateTime), 1, N'12/06/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/05/2024 0:00:00', 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (655, 104, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-01-12', 1, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/07/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/06/2024 0:00:00', 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (656, 104, 0.0000, 0.0000, 0.0000, 60.0000, N'2024-01-12', 3, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/08/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/07/2024 0:00:00', 1, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (657, 104, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-01-12', 4, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/09/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/08/2024 0:00:00', 1, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (658, 104, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-01-12', 4, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/10/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/09/2024 0:00:00', 1, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (659, 104, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-01-12', 4, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/11/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/10/2024 0:00:00', 1, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (660, 104, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-01-12', 4, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/12/2024 0:00:00', 250000.0000, 0.0000, NULL, N'12/11/2024 0:00:00', 1, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (661, 104, 0.0000, 0.0000, 0.0000, 100.0000, N'2024-01-12', 3, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/01/2025 0:00:00', 250000.0000, 0.0000, NULL, N'12/12/2024 0:00:00', 1, 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (662, 104, 0.0000, 0.0000, 0.0000, 70.0000, N'2024-01-12', 3, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/02/2025 0:00:00', 250000.0000, 0.0000, NULL, N'12/01/2025 0:00:00', 1, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (663, 104, 0.0000, 0.0000, 0.0000, 92.0000, N'2024-01-12', 4, 1, CAST(N'2024-05-12T20:05:24.317' AS DateTime), NULL, NULL, 1, N'12/03/2025 0:00:00', 250000.0000, 0.0000, NULL, N'12/02/2025 0:00:00', 1, 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (664, 105, 0.0000, 0.0000, 0.0000, 60.0000, N'2024-09-12', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/06/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/05/2024 0:00:00', 4, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (665, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-12', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/07/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/06/2024 0:00:00', 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (666, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-15', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/08/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/07/2024 0:00:00', 1, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (667, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-11', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/09/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/08/2024 0:00:00', 1, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (668, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-26', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/10/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/09/2024 0:00:00', 1, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (669, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-17', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/11/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/10/2024 0:00:00', 1, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (670, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-18', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/12/2024 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/11/2024 0:00:00', 1, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (671, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-21', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/01/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/12/2024 0:00:00', 1, 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (672, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-01', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/02/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/01/2025 0:00:00', 1, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (673, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-09', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/03/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/02/2025 0:00:00', 1, 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (674, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-29', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/04/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/03/2025 0:00:00', 1, 0, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (675, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-09-05', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/05/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/04/2025 0:00:00', 1, 0, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (676, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-10-12', 3, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/06/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/05/2025 0:00:00', 1, 0, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (677, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-10-19', 1, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/07/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/06/2025 0:00:00', 1, 0, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (678, 105, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-10-18', 4, 1, CAST(N'2024-05-12T20:05:43.660' AS DateTime), NULL, NULL, 1, N'12/08/2025 0:00:00', 150000.0000, 0.0000, 0.0000, N'12/07/2025 0:00:00', 1, 0, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (679, 106, 25000.0000, 8200.0000, 16800.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), 1, CAST(N'2024-05-13T14:43:39.923' AS DateTime), 1, N'12/06/2024 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/05/2024 0:00:00', 1, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (680, 106, 30000.0000, 13200.0000, 16800.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), 1, CAST(N'2024-05-13T14:44:15.110' AS DateTime), 1, N'12/07/2024 0:00:00', 560000.0000, 551800.0000, 92800.0000, N'12/06/2024 0:00:00', 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (681, 106, 50000.0000, 33200.0000, 16800.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), 1, CAST(N'2024-05-13T14:45:03.620' AS DateTime), 1, N'12/08/2024 0:00:00', 560000.0000, 538600.0000, 92800.0000, N'12/07/2024 0:00:00', 1, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (682, 106, 55000.0000, 38200.0000, 16800.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), 1, CAST(N'2024-05-13T14:46:20.403' AS DateTime), 1, N'12/09/2024 0:00:00', 560000.0000, 505400.0000, 92800.0000, N'12/08/2024 0:00:00', 1, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (683, 106, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-12-05', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, N'12/10/2024 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/09/2024 0:00:00', 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (684, 106, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-12-11', 3, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, N'12/11/2024 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/10/2024 0:00:00', 2, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (685, 106, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-12-15', 4, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, N'12/12/2024 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/11/2024 0:00:00', 2, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (686, 106, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-12-20', 3, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, N'12/01/2025 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/12/2024 0:00:00', 2, 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (687, 106, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-12-25', 1, 1, CAST(N'2024-05-12T20:05:59.290' AS DateTime), NULL, NULL, 1, N'12/02/2025 0:00:00', 560000.0000, 560000.0000, 92800.0000, N'12/01/2025 0:00:00', 2, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (689, 107, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, N'12/06/2024 0:00:00', 450000.0000, 0.0000, 0.0000, N'12/05/2024 0:00:00', 2, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (690, 107, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, N'12/07/2024 0:00:00', 450000.0000, 0.0000, 0.0000, N'12/06/2024 0:00:00', 2, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (691, 107, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, N'12/08/2024 0:00:00', 450000.0000, 0.0000, 0.0000, N'12/07/2024 0:00:00', 2, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (692, 107, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, N'12/09/2024 0:00:00', 450000.0000, 0.0000, 0.0000, N'12/08/2024 0:00:00', 2, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (693, 107, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-12T22:04:35.173' AS DateTime), NULL, NULL, 1, N'12/10/2024 0:00:00', 450000.0000, 0.0000, 0.0000, N'12/09/2024 0:00:00', 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (720, 112, 30000.0000, 7500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:10:53.103' AS DateTime), 1, N'13/6/2024 00:00:00', 750000.0000, 750000.0000, 750000.1000, N'13/5/2024 00:00:00', 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (721, 112, 30000.0000, 7500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:11:12.967' AS DateTime), 1, N'13/7/2024 00:00:00', 750000.0000, 750000.0000, 750000.1000, N'13/6/2024 00:00:00', 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (722, 112, 35000.0000, 12500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:12:10.520' AS DateTime), 1, N'13/8/2024 00:00:00', 750000.0000, 742500.0000, 750000.1000, N'13/7/2024 00:00:00', 1, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (723, 112, 40000.0000, 17500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:12:37.350' AS DateTime), 1, N'13/9/2024 00:00:00', 750000.0000, 730000.0000, 750000.1000, N'13/8/2024 00:00:00', 1, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (724, 112, 50000.0000, 27500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:13:00.537' AS DateTime), 1, N'13/10/2024 00:00:00', 750000.0000, 712500.0000, 750000.1000, N'13/9/2024 00:00:00', 1, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (725, 112, 55000.0000, 32500.0000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:19:00.640' AS DateTime), 1, N'13/11/2024 00:00:00', 750000.0000, 685000.0000, 750000.1000, N'13/10/2024 00:00:00', 1, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (726, 112, 675000.1000, 652500.1000, 22500.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T13:40:57.877' AS DateTime), 1, CAST(N'2024-05-13T14:19:30.583' AS DateTime), 1, N'13/12/2024 00:00:00', 750000.0000, 652500.0000, 750000.1000, N'13/11/2024 00:00:00', 1, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (727, 113, 20000.0000, 5000.0000, 15000.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T14:22:21.463' AS DateTime), 1, CAST(N'2024-05-13T14:40:19.490' AS DateTime), 1, N'13/6/2024 00:00:00', 500000.0000, 500000.0000, 500000.1000, N'13/5/2024 00:00:00', 1, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (728, 113, 30000.0000, 15000.0000, 15000.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T14:22:21.463' AS DateTime), 1, CAST(N'2024-05-13T14:41:06.817' AS DateTime), 1, N'13/7/2024 00:00:00', 500000.0000, 495000.0000, 500000.1000, N'13/6/2024 00:00:00', 1, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (729, 113, 495000.1000, 480000.1000, 15000.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T14:22:21.463' AS DateTime), 1, CAST(N'2024-05-13T14:42:05.710' AS DateTime), 1, N'13/8/2024 00:00:00', 500000.0000, 480000.0000, 500000.1000, N'13/7/2024 00:00:00', 1, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (730, 114, 0.0000, 0.0000, 0.0000, 0.0000, N'2024-05-13', 1, 1, CAST(N'2024-05-13T14:51:03.700' AS DateTime), NULL, NULL, 1, N'13/6/2024 00:00:00', 150000.0000, 0.0000, 0.0000, N'13/5/2024 00:00:00', 2, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (731, 114, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T14:51:03.700' AS DateTime), NULL, NULL, 1, N'13/7/2024 00:00:00', 150000.0000, 0.0000, 0.0000, N'13/6/2024 00:00:00', 2, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (732, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/6/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/5/2024 00:00:00', 4, 0, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (733, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/7/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/6/2024 00:00:00', 2, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (734, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/8/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/7/2024 00:00:00', 2, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (735, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/9/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/8/2024 00:00:00', 2, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (736, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/10/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/9/2024 00:00:00', 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (737, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/11/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/10/2024 00:00:00', 2, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (738, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/12/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/11/2024 00:00:00', 2, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (739, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/1/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/12/2024 00:00:00', 2, 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (740, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/2/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/1/2025 00:00:00', 2, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (741, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/3/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/2/2025 00:00:00', 2, 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (742, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/4/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/3/2025 00:00:00', 2, 0, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (743, 115, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:47:25.587' AS DateTime), NULL, NULL, 1, N'13/5/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/4/2025 00:00:00', 2, 0, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (744, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/6/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/5/2024 00:00:00', 4, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (745, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/7/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/6/2024 00:00:00', 2, 0, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (746, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/8/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/7/2024 00:00:00', 2, 0, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (747, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/9/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/8/2024 00:00:00', 2, 0, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (748, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/10/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/9/2024 00:00:00', 2, 0, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (749, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/11/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/10/2024 00:00:00', 2, 0, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (750, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/12/2024 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/11/2024 00:00:00', 2, 0, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (751, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/1/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/12/2024 00:00:00', 2, 0, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (752, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/2/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/1/2025 00:00:00', 2, 0, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (753, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/3/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/2/2025 00:00:00', 2, 0, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (754, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/4/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/3/2025 00:00:00', 2, 0, NULL, 11, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (755, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/5/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/4/2025 00:00:00', 2, 0, NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (756, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/6/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/5/2025 00:00:00', 2, 0, NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (757, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/7/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/6/2025 00:00:00', 2, 0, NULL, 14, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (758, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/8/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/7/2025 00:00:00', 2, 0, NULL, 15, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (759, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/9/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/8/2025 00:00:00', 2, 0, NULL, 16, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (760, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/10/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/9/2025 00:00:00', 2, 0, NULL, 17, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (761, 116, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-13T15:49:49.480' AS DateTime), NULL, NULL, 1, N'13/11/2025 00:00:00', 100000.0000, 0.0000, 0.0000, N'13/10/2025 00:00:00', 2, 0, NULL, 18, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1034, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-03-22', 500000.0000, 500000.0000, 500000.0000, N'2024-02-22', 4, 0, NULL, 1, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 450000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1035, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-05-22', 500000.0000, 450000.0000, 500000.0000, N'2024-04-22', 2, 0, NULL, 2, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 400000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1036, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-08-22', 500000.0000, 400000.0000, 500000.0000, N'2024-07-22', 2, 0, NULL, 3, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 350000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1037, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-09-22', 500000.0000, 350000.0000, 500000.0000, N'2024-08-22', 2, 0, NULL, 4, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 300000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1038, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-10-22', 500000.0000, 300000.0000, 500000.0000, N'2024-09-22', 2, 0, NULL, 5, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 250000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1039, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-11-22', 500000.0000, 250000.0000, 500000.0000, N'2024-10-22', 2, 0, NULL, 6, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 200000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1040, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2024-12-22', 500000.0000, 200000.0000, 500000.0000, N'2024-11-22', 2, 0, NULL, 7, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 150000.0000)
GO
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1041, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2025-01-22', 500000.0000, 150000.0000, 500000.0000, N'2024-12-22', 2, 0, NULL, 8, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 100000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1042, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2025-02-22', 500000.0000, 100000.0000, 500000.0000, N'2025-01-22', 2, 0, NULL, 9, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 50000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1043, 140, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:58:16.817' AS DateTime), NULL, NULL, 1, N'2025-03-22', 500000.0000, 50000.0000, 500000.0000, N'2025-02-22', 2, 0, NULL, 10, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 0.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1044, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 500000.0000, 500000.0000, NULL, 2, 0, NULL, 1, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 450000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1045, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 450000.0000, 500000.0000, NULL, 2, 0, NULL, 2, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 400000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1046, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 400000.0000, 500000.0000, NULL, 2, 0, NULL, 3, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 350000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1047, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 350000.0000, 500000.0000, NULL, 2, 0, NULL, 4, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 300000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1048, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 300000.0000, 500000.0000, NULL, 2, 0, NULL, 5, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 250000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1049, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 250000.0000, 500000.0000, NULL, 2, 0, NULL, 6, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 200000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1050, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 200000.0000, 500000.0000, NULL, 2, 0, NULL, 7, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 150000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1051, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 150000.0000, 500000.0000, NULL, 2, 0, NULL, 8, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 100000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1052, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 100000.0000, 500000.0000, NULL, 2, 0, NULL, 9, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 50000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1053, 141, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:35:14.563' AS DateTime), NULL, NULL, 1, NULL, 500000.0000, 50000.0000, 500000.0000, NULL, 2, 0, NULL, 10, 150000.0000, 500000.0000, 15000.0000, 50000.0000, 65000.0000, 0.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1054, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 100000.0000, 100000.0000, NULL, 2, 0, NULL, 1, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 90000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1055, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 90000.0000, 100000.0000, NULL, 2, 0, NULL, 2, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 80000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1056, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 80000.0000, 100000.0000, NULL, 2, 0, NULL, 3, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 70000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1057, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 70000.0000, 100000.0000, NULL, 2, 0, NULL, 4, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 60000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1058, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 60000.0000, 100000.0000, NULL, 2, 0, NULL, 5, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 50000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1059, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 50000.0000, 100000.0000, NULL, 2, 0, NULL, 6, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 40000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1060, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 40000.0000, 100000.0000, NULL, 2, 0, NULL, 7, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 30000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1061, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 30000.0000, 100000.0000, NULL, 2, 0, NULL, 8, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 20000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1062, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 20000.0000, 100000.0000, NULL, 2, 0, NULL, 9, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 10000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1063, 142, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:40:19.427' AS DateTime), NULL, NULL, 1, NULL, 100000.0000, 10000.0000, 100000.0000, NULL, 2, 0, NULL, 10, 30000.0000, 100000.0000, 3000.0000, 10000.0000, 13000.0000, 0.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1064, 143, 25000.0000, 15000.0000, 5500.0000, 4500.0000, N'May 22 2024 11:16AM', 1, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), 1, CAST(N'2024-05-22T11:16:24.387' AS DateTime), 1, N'22/2/2024 00:00:00', 150000.0000, 150000.0000, 211000.0000, N'22/1/2024 00:00:00', 1, 1, 1, 1, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 135000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1065, 143, 25000.0000, 15000.0000, 5500.0000, 4500.0000, N'May 22 2024 11:22AM', 1, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), 1, CAST(N'2024-05-22T11:22:14.533' AS DateTime), 1, N'22/4/2024 00:00:00', 150000.0000, 135000.0000, 211000.0000, N'22/3/2024 00:00:00', 1, 1, 1, 2, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 120000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1066, 143, 25000.0000, 15000.0000, 10000.0000, 0.0000, N'May 22 2024 11:22AM', 1, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), 1, CAST(N'2024-05-22T11:22:29.830' AS DateTime), 1, N'22/6/2024 00:00:00', 150000.0000, 120000.0000, 211000.0000, N'22/5/2024 00:00:00', 4, 0, 1, 3, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 105000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1067, 143, 50000.0000, 15000.0000, 35000.0000, 0.0000, N'May 22 2024 11:30AM', 1, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), 1, CAST(N'2024-05-22T11:30:04.103' AS DateTime), 1, N'22/8/2024 00:00:00', 150000.0000, 105000.0000, 211000.0000, N'22/7/2024 00:00:00', 1, 0, NULL, 4, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 90000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1068, 143, 20000.0000, 15000.0000, 5000.0000, 0.0000, N'May 22 2024 11:56AM', 1, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), 1, CAST(N'2024-05-22T11:56:07.833' AS DateTime), 1, N'22/10/2024 00:00:00', 150000.0000, 90000.0000, 211000.0000, N'22/9/2024 00:00:00', 1, 0, NULL, 5, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 75000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1069, 143, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, N'22/11/2024 00:00:00', 150000.0000, 75000.0000, 211000.0000, N'22/10/2024 00:00:00', 2, 0, NULL, 6, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 60000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1070, 143, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, N'22/12/2024 00:00:00', 150000.0000, 60000.0000, 211000.0000, N'22/11/2024 00:00:00', 2, 0, NULL, 7, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 45000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1071, 143, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, N'22/1/2025 00:00:00', 150000.0000, 45000.0000, 211000.0000, N'22/12/2024 00:00:00', 2, 0, NULL, 8, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 30000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1072, 143, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, N'22/2/2025 00:00:00', 150000.0000, 30000.0000, 211000.0000, N'22/1/2025 00:00:00', 2, 0, NULL, 9, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 15000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1073, 143, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, 1, CAST(N'2024-05-22T10:42:28.477' AS DateTime), NULL, NULL, 1, N'22/3/2025 00:00:00', 150000.0000, 15000.0000, 211000.0000, N'22/2/2025 00:00:00', 2, 0, NULL, 10, 45000.0000, 150000.0000, 0.0000, 15000.0000, 15000.0000, 0.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1074, 144, 200000.0000, 10000.0000, 190000.0000, 0.0000, N'May 22 2024  2:18PM', 1, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), 1, CAST(N'2024-05-22T14:18:02.753' AS DateTime), 1, N'6/22/2024 12:00:00 AM', 150000.0000, 150000.0000, 350001.0000, N'5/22/2024 12:00:00 AM', 4, 0, 1, 1, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 140000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1075, 144, 15000.0000, 10000.0000, 5000.0000, 0.0000, N'May 22 2024  2:18PM', 1, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), 1, CAST(N'2024-05-22T14:18:38.717' AS DateTime), 1, N'7/22/2024 12:00:00 AM', 150000.0000, 140000.0000, 350001.0000, N'6/22/2024 12:00:00 AM', 1, 0, NULL, 2, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 130000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1076, 144, 15000.0000, 10000.0000, 0.0000, 0.0000, N'May 22 2024  2:25PM', 1, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), 1, CAST(N'2024-05-22T14:25:26.700' AS DateTime), 1, N'8/22/2024 12:00:00 AM', 150000.0000, 130000.0000, 350001.0000, N'7/22/2024 12:00:00 AM', 1, 0, NULL, 3, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 120000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1077, 144, 10001.0000, 10000.0000, 0.0000, 0.0000, N'May 22 2024  4:25PM', 1, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), 1, CAST(N'2024-05-22T16:25:40.980' AS DateTime), 1, N'9/22/2024 12:00:00 AM', 150000.0000, 120000.0000, 350001.0000, N'8/22/2024 12:00:00 AM', 1, 0, NULL, 4, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 110000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1078, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'10/22/2024 12:00:00 AM', 150000.0000, 110000.0000, 350001.0000, N'9/22/2024 12:00:00 AM', 2, 0, NULL, 5, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 100000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1079, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'11/22/2024 12:00:00 AM', 150000.0000, 100000.0000, 350001.0000, N'10/22/2024 12:00:00 AM', 2, 0, NULL, 6, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 90000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1080, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'12/22/2024 12:00:00 AM', 150000.0000, 90000.0000, 350001.0000, N'11/22/2024 12:00:00 AM', 2, 0, NULL, 7, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 80000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1081, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'1/22/2025 12:00:00 AM', 150000.0000, 80000.0000, 350001.0000, N'12/22/2024 12:00:00 AM', 2, 0, NULL, 8, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 70000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1082, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'2/22/2025 12:00:00 AM', 150000.0000, 70000.0000, 350001.0000, N'1/22/2025 12:00:00 AM', 2, 0, NULL, 9, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 60000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1083, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'3/22/2025 12:00:00 AM', 150000.0000, 60000.0000, 350001.0000, N'2/22/2025 12:00:00 AM', 2, 0, NULL, 10, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 50000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1084, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'4/22/2025 12:00:00 AM', 150000.0000, 50000.0000, 350001.0000, N'3/22/2025 12:00:00 AM', 2, 0, NULL, 11, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 40000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1085, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'5/22/2025 12:00:00 AM', 150000.0000, 40000.0000, 350001.0000, N'4/22/2025 12:00:00 AM', 2, 0, NULL, 12, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 30000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1086, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'6/22/2025 12:00:00 AM', 150000.0000, 30000.0000, 350001.0000, N'5/22/2025 12:00:00 AM', 2, 0, NULL, 13, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 20000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1087, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'7/22/2025 12:00:00 AM', 150000.0000, 20000.0000, 350001.0000, N'6/22/2025 12:00:00 AM', 2, 0, NULL, 14, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 10000.0000)
INSERT [Cred].[tbPlanesPagosClientes] ([Pacl_Id], [Papa_Id], [Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora], [Pacl_Fecha_Emision], [Sucu_Id], [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Usua_Modi], [Pacl_Fecha_Modi], [Pacl_Estado], [Pacl_Fecha_Pago], [Pacl_Financiamiento], [Pacl_Saldo_Inicial], [Pacl_Saldo_Sumado], [Pacl_Fecha_PreviaPago], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_SaberFechaPrevia], [Pacl_NumeroCuota], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar], [Pacl_Capital_Restar], [Pacl_Total_Pago], [Pacl_Saldo]) VALUES (1088, 144, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 3, 1, CAST(N'2024-05-22T14:16:32.630' AS DateTime), NULL, NULL, 1, N'8/22/2025 12:00:00 AM', 150000.0000, 10000.0000, 350001.0000, N'7/22/2025 12:00:00 AM', 2, 0, NULL, 15, 67500.0000, 150000.0000, 0.0000, 10000.0000, 10000.0000, 0.0000)
SET IDENTITY_INSERT [Cred].[tbPlanesPagosClientes] OFF
GO
SET IDENTITY_INSERT [Cred].[tbTipoCuotas] ON 

INSERT [Cred].[tbTipoCuotas] ([Ticu_Id], [Ticu_Descripcion], [Ticu_Usua_Creacion], [Ticu_Fecha_Creacion], [Ticu_Usua_Modi], [Ticu_Fecha_Modi], [Ticu_Estado]) VALUES (1, N'Holaa', 1, CAST(N'2024-05-01T14:19:11.137' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbTipoCuotas] ([Ticu_Id], [Ticu_Descripcion], [Ticu_Usua_Creacion], [Ticu_Fecha_Creacion], [Ticu_Usua_Modi], [Ticu_Fecha_Modi], [Ticu_Estado]) VALUES (2, N'mensual', NULL, CAST(N'2024-05-03T09:11:26.430' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbTipoCuotas] ([Ticu_Id], [Ticu_Descripcion], [Ticu_Usua_Creacion], [Ticu_Fecha_Creacion], [Ticu_Usua_Modi], [Ticu_Fecha_Modi], [Ticu_Estado]) VALUES (3, N'Memeaaaa', NULL, CAST(N'2024-05-05T23:52:18.593' AS DateTime), NULL, NULL, 0)
INSERT [Cred].[tbTipoCuotas] ([Ticu_Id], [Ticu_Descripcion], [Ticu_Usua_Creacion], [Ticu_Fecha_Creacion], [Ticu_Usua_Modi], [Ticu_Fecha_Modi], [Ticu_Estado]) VALUES (4, N'ahuevoaa', NULL, CAST(N'2024-05-06T00:09:45.963' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [Cred].[tbTipoCuotas] OFF
GO
SET IDENTITY_INSERT [Cred].[tbVehiculos] ON 

INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (1, N'HFDS843', N'Sin capo', N'Verde', 2020, 5, 1, CAST(N'2024-04-30T00:10:26.383' AS DateTime), 1, CAST(N'2024-04-30T00:16:12.287' AS DateTime), 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (2, N'5', NULL, N'5', NULL, 5, NULL, CAST(N'2024-05-03T03:05:42.600' AS DateTime), NULL, NULL, 0)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (3, N'5444', N'roto el bomber', N'azul', 2024, 6, NULL, CAST(N'2024-05-03T03:13:56.327' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (4, N'2343', N'Roto en frente', N'verde', 2011, 8, NULL, CAST(N'2024-05-03T03:16:11.750' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (5, N'211222', N'foco trasero quebrado ', N'verde fusia', 2025, 5, NULL, CAST(N'2024-05-05T19:23:51.477' AS DateTime), NULL, CAST(N'2024-05-07T13:38:17.120' AS DateTime), 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (6, N'Enderson', N'bomber roto ', N'naranja', 2024, 8, NULL, CAST(N'2024-05-05T20:50:01.097' AS DateTime), NULL, CAST(N'2024-05-07T13:37:48.670' AS DateTime), 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (7, N'87As4', N'Bomber roto', N'naranja', 2018, 12, NULL, CAST(N'2024-05-10T13:23:11.127' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (8, N'jh87l', N'foco roto', N'fusia', 2019, 12, NULL, CAST(N'2024-05-10T13:31:40.820' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (9, N'06fd422', N'Nuevo de paquete', N'Negro ', 2019, 13, NULL, CAST(N'2024-05-12T18:14:12.333' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (10, N'04DFQ', N'Nuevo de paquete ', N'Rojo vino ', 2018, 14, NULL, CAST(N'2024-05-13T13:15:36.297' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (11, N'144ass', N'Nuevo de fabrica', N'Rojo vino ', 2019, 15, NULL, CAST(N'2024-05-13T14:21:54.393' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (12, N'8785dss', N'Nuevoi ', N'negro ', 2019, 13, NULL, CAST(N'2024-05-13T14:50:46.493' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (13, N'8844aa', N'Nuevo ', N'negro ', 2019, 16, NULL, CAST(N'2024-05-13T15:46:41.847' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (14, N'456742aa', N'nuevo ', N'negro', 2020, 16, NULL, CAST(N'2024-05-13T15:49:29.840' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (15, N'0144qaa', N'Nuevo de fabrica', N'Negro mate ', 2019, 7, NULL, CAST(N'2024-05-14T14:27:48.327' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (16, N'011kk7', N'Nuevo de paquete ', N'negro ', 2019, 14, NULL, CAST(N'2024-05-16T13:43:22.717' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (17, N'87gs1', N'Negro', N'Rojo brillante', 2022, 16, NULL, CAST(N'2024-05-19T16:59:51.760' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (18, N'87yff', N'Nuevo fabrica', N'Azul cielo', 2022, 15, NULL, CAST(N'2024-05-19T20:00:48.593' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (19, N'07fr1', N'Golpeadito', N'negro mate', 2019, 13, NULL, CAST(N'2024-05-19T20:21:20.157' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (20, N'146060gg', N'Modelito', N'cafe', 2020, 13, NULL, CAST(N'2024-05-19T20:34:01.213' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (21, N'kuy7', N'hola mundo ', N'negro', 2019, 12, NULL, CAST(N'2024-05-21T13:11:08.003' AS DateTime), NULL, NULL, 1)
INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (22, N'HB22001', N'Deportivo', N'amarillo', 2024, 6, NULL, CAST(N'2024-05-22T16:35:33.243' AS DateTime), NULL, CAST(N'2024-05-22T16:35:43.340' AS DateTime), 0)
SET IDENTITY_INSERT [Cred].[tbVehiculos] OFF
GO
SET IDENTITY_INSERT [Cred].[tbVehiculosPorClientes] ON 

INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (2, 1, 1, 1, CAST(N'2024-05-01T14:35:28.737' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (3, 3, 2, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (5, 3, 4, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (9, 8, 6, 1, CAST(N'2024-05-10T13:32:07.847' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (10, 9, 7, 1, CAST(N'2024-05-12T18:14:12.433' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (11, 10, 8, 1, CAST(N'2024-05-13T13:16:11.290' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (12, 11, 9, 1, CAST(N'2024-05-13T14:21:58.483' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (13, 12, 10, 1, CAST(N'2024-05-13T14:50:46.553' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (14, 13, 11, 1, CAST(N'2024-05-13T15:46:41.913' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (15, 14, 12, 1, CAST(N'2024-05-13T15:49:29.900' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (16, 15, 13, 1, CAST(N'2024-05-14T14:27:48.403' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (17, 16, 14, 1, CAST(N'2024-05-16T13:43:22.793' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (18, 17, 15, 1, CAST(N'2024-05-19T16:59:51.857' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (19, 18, 16, 1, CAST(N'2024-05-19T20:00:48.693' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (20, 19, 17, 1, CAST(N'2024-05-19T20:21:20.250' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (21, 20, 18, 1, CAST(N'2024-05-19T20:34:01.303' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (22, 21, 19, 1, CAST(N'2024-05-21T13:11:08.017' AS DateTime), NULL, NULL, 1, NULL)
INSERT [Cred].[tbVehiculosPorClientes] ([Vecl_Id], [Vehi_Id], [Clie_Id], [Vecl_Usua_Creacion], [Vecl_Fecha_Creacion], [Vecl_Usua_Modifica], [Vecl_Fecha_Modifica], [Vecl_Estado], [Vecl_Imagen]) VALUES (23, 22, 20, 1, CAST(N'2024-05-22T16:35:33.260' AS DateTime), NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [Cred].[tbVehiculosPorClientes] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCargos] ON 

INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (1, N'Mode', 1, CAST(N'2024-04-29T21:35:00.847' AS DateTime), NULL, CAST(N'2024-05-07T13:09:27.897' AS DateTime), 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (2, N'Gerente', 1, CAST(N'2024-04-29T21:35:54.110' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (5, N'Jefe de area', 1, CAST(N'2024-05-03T08:20:12.203' AS DateTime), NULL, CAST(N'2024-05-05T14:26:15.673' AS DateTime), 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (6, N'Holas', 1, CAST(N'2024-05-03T08:27:15.313' AS DateTime), NULL, CAST(N'2024-05-03T10:05:04.527' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (7, N'Guardia', 1, CAST(N'2024-05-03T09:08:03.620' AS DateTime), NULL, CAST(N'2024-05-05T14:25:36.427' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (8, N'Manolo', 1, CAST(N'2024-05-05T14:26:35.640' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (9, N'Dompidompiaaa', 1, CAST(N'2024-05-06T00:10:10.903' AS DateTime), NULL, CAST(N'2024-05-06T00:10:14.110' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (10, N'dondimadosaaaa', 1, CAST(N'2024-05-06T00:11:00.990' AS DateTime), NULL, CAST(N'2024-05-06T00:11:04.480' AS DateTime), 0)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (11, N'hgfhf', 1, CAST(N'2024-05-07T13:22:18.150' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbCargos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbClientes] ON 

INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (1, N'123456789101', N'Pavel', N'Sanchez', N'M', 509865, 1, N'1222', 1, CAST(N'2024-04-29T21:28:25.080' AS DateTime), NULL, CAST(N'2024-05-07T14:16:58.740' AS DateTime), 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (2, N'123456789101', N'Koo', N'Mona', N'F', 6756765, 2, N'0501', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (4, N'5654643543543', N'fdsfds', N'GDGF', N'M', 434543, 4, N'0501', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (5, N'0512', N'Esdra', N'Hernande', N'F', 8872112, 5, N'1222', NULL, CAST(N'2024-05-07T06:51:11.957' AS DateTime), NULL, CAST(N'2024-05-07T14:15:33.620' AS DateTime), 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (6, N'0512120058444', N'Hector', N'Orellanada', N'M', 88745566, 4, N'1222', NULL, CAST(N'2024-05-10T11:48:51.183' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (7, N'05123456786', N'Margarita', N'Velasquez', N'F', 98118783, 1, N'0512', NULL, CAST(N'2024-05-12T18:12:41.163' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (8, N'85444', N'Manuelito', N'Sagaz', N'M', 88754124, 1, N'0512', NULL, CAST(N'2024-05-13T13:14:39.753' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (9, N'744854', N'Ale ', N'Susana', N'F', 221444, 4, N'1222', NULL, CAST(N'2024-05-13T14:20:45.893' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (10, N'774455', N'Diana', N'Flores', N'F', 2250000, 1, N'1222', NULL, CAST(N'2024-05-13T14:50:12.720' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (11, N'77aa', N'Esdra', N'Cerna', N'F', 8842222, 1, N'1222', NULL, CAST(N'2024-05-13T15:45:58.490' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (12, N'44qaee', N'Jaefth', N'Jose', N'M', 88744, 4, N'0512', NULL, CAST(N'2024-05-13T15:48:57.880' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (13, N'251122474', N'Leyla', N'Reyes', N'F', 221522, 5, N'0512', NULL, CAST(N'2024-05-14T14:27:20.393' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (14, N'0512200058844', N'Esdraa', N'Ramirez', N'F', 88745521, 1, N'0512', NULL, CAST(N'2024-05-16T13:42:53.730' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (15, N'562122', N'Margarita', N'Velasquez', N'F', 88734512, 4, N'0512', NULL, CAST(N'2024-05-19T16:59:29.373' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (16, N'051220060054', N'Daniel', N'Aguila', N'M', 88761122, 1, N'0512', NULL, CAST(N'2024-05-19T20:00:13.370' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (17, N'0731211', N'Nohelia Iveth', N'Sanchez', N'F', 98211212, 4, N'0512', NULL, CAST(N'2024-05-19T20:19:03.737' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (18, N'0721122', N'Albertano', N'Juarez', N'M', 88776221, 5, N'0501', NULL, CAST(N'2024-05-19T20:31:34.173' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (19, N'050845744', N'Enderson', N'Avila', N'M', 8874555, 1, N'1222', NULL, CAST(N'2024-05-21T13:10:39.943' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (20, N'666', N'Hector', N'perez', N' ', 333, 1, N'0512', NULL, CAST(N'2024-05-22T11:35:19.097' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbClientes] OFF
GO
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'05', N'Atlantida', 1, CAST(N'2024-04-29T20:36:36.347' AS DateTime), NULL, CAST(N'2024-05-07T16:01:46.030' AS DateTime))
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'44', N'Cortes', NULL, CAST(N'2024-05-02T13:37:03.337' AS DateTime), NULL, CAST(N'2024-05-02T21:09:08.610' AS DateTime))
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'45', N'Choluteca', NULL, CAST(N'2024-05-07T13:49:12.717' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'46', N'Valle', NULL, CAST(N'2024-05-07T15:48:07.800' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'47', N'hola', 1, CAST(N'2024-05-10T15:14:56.573' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'55', N'Jue', NULL, CAST(N'2024-05-02T10:32:42.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'61', N'ojojona', 1, CAST(N'2024-05-10T01:53:00.070' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'65', N'rio helado', 1, CAST(N'2024-05-10T01:02:19.190' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'66', N'GSFD', NULL, CAST(N'2024-05-02T11:31:48.490' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'78', N'rioblanco', 1, CAST(N'2024-05-10T01:57:25.717' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'88', N'Miiooo', 1, CAST(N'2024-05-02T20:42:24.837' AS DateTime), NULL, CAST(N'2024-05-05T14:24:40.427' AS DateTime))
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'89', N'Biby', NULL, CAST(N'2024-05-02T10:22:30.000' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'91', N'amapala', 1, CAST(N'2024-05-10T00:57:25.960' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'92', N'jjj', 1, CAST(N'2024-05-10T01:49:25.097' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'93', N'PruebaDepaa', 1, CAST(N'2024-05-22T16:32:59.370' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'97', N'pana', 1, CAST(N'2024-05-10T00:59:31.117' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'99', N'hol', 1, CAST(N'2024-05-10T15:15:58.327' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'fm', N'PruebaDepaa', 1, CAST(N'2024-05-22T16:33:31.177' AS DateTime), NULL, NULL)
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'J', N'ES', NULL, CAST(N'2024-05-02T16:23:04.423' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [Gral].[tbEmpleados] ON 

INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Sucu_Id], [Empl_Correo]) VALUES (1, N'000000000', N'DSF', N'FDS', N'F', 1, N'0501', 1, 1, CAST(N'2024-04-29T21:47:08.023' AS DateTime), 1, CAST(N'2024-04-29T21:48:05.353' AS DateTime), 0, 1, N'enriquebarahonayt14@gmail.com')
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Sucu_Id], [Empl_Correo]) VALUES (2, N'0000000000000', N'Prueba', N'Prueba', N'M', 1, N'0501', 1, 1, CAST(N'2024-04-29T22:01:43.870' AS DateTime), NULL, NULL, 1, 3, N'madian.reyes212006@gmail.com')
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Sucu_Id], [Empl_Correo]) VALUES (9, N'0512200600377', N'Madian', N'Velasquez', N'M', 1, N'0512', 1, 1, CAST(N'2025-04-05T00:00:00.000' AS DateTime), NULL, NULL, 1, 1, N'enriquebarahonayt14@gmail.com')
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Sucu_Id], [Empl_Correo]) VALUES (10, N'0512200500211', N'Margarita', N'Velasquez', N'M', 1, N'1222', 5, 1, CAST(N'2024-05-07T06:02:54.390' AS DateTime), NULL, NULL, 1, 1, N'enriquebarahonayt14@gmail.com')
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado], [Sucu_Id], [Empl_Correo]) VALUES (11, N'05112', N'Juaninto Alimañan', N'Con mucha maña', N'M', 4, N'0501', 5, 1, CAST(N'2024-05-07T06:11:14.570' AS DateTime), NULL, CAST(N'2024-05-07T14:37:23.703' AS DateTime), 1, 3, N'enriquebarahonayt14@gmail.com')
SET IDENTITY_INSERT [Gral].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] ON 

INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (1, N'Soltero(a)', 1, CAST(N'2024-04-29T21:13:20.103' AS DateTime), 1, CAST(N'2024-04-29T21:18:13.080' AS DateTime), 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (2, N'Casado(a)', 1, CAST(N'2024-04-29T21:18:35.693' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (4, N'Divorciado(a)', NULL, CAST(N'2024-05-03T09:07:54.677' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (5, N'Union Libre', NULL, CAST(N'2024-05-03T09:31:16.260' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (6, N'Viudo(a)', NULL, CAST(N'2024-05-03T09:41:51.490' AS DateTime), NULL, CAST(N'2024-05-05T21:58:23.727' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (7, N'laguna', NULL, CAST(N'2024-05-03T09:45:06.667' AS DateTime), NULL, CAST(N'2024-05-06T00:10:31.837' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (8, N'peraaaaa', NULL, CAST(N'2024-05-06T00:13:13.677' AS DateTime), NULL, CAST(N'2024-05-06T00:14:51.897' AS DateTime), 0)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (9, N'fff', NULL, CAST(N'2024-05-22T14:33:39.350' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (10, N'NewEstadoCivil1', NULL, CAST(N'2024-05-22T16:33:46.293' AS DateTime), NULL, CAST(N'2024-05-22T16:33:53.103' AS DateTime), 0)
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMarcas] ON 

INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (1, N'Toyotaaa', 1, CAST(N'2024-04-29T23:40:51.300' AS DateTime), 1, CAST(N'2024-04-29T23:47:17.060' AS DateTime), 1)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (2, N'Nissan', 1, CAST(N'2024-04-30T00:02:40.217' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (4, N'bebeto', NULL, CAST(N'2024-05-03T08:54:00.667' AS DateTime), NULL, CAST(N'2024-05-05T23:44:25.307' AS DateTime), 1)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (5, N'bb', NULL, CAST(N'2024-05-03T09:08:09.583' AS DateTime), NULL, NULL, 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (6, N'a4eeeeeeeee', NULL, CAST(N'2024-05-06T00:16:28.143' AS DateTime), NULL, CAST(N'2024-05-06T00:17:48.317' AS DateTime), 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (7, N'Hyundai', NULL, CAST(N'2024-05-12T18:13:15.400' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbMarcas] OFF
GO
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usua_Creacion], [Muni_Fecha_Creacion], [Muni_Usua_Modifica], [Muni_Fecha_Modifica]) VALUES (N'0501', N'San Pedro Sula', N'44', 1, CAST(N'2024-04-29T20:59:58.007' AS DateTime), NULL, CAST(N'2024-05-07T13:09:37.690' AS DateTime))
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usua_Creacion], [Muni_Fecha_Creacion], [Muni_Usua_Modifica], [Muni_Fecha_Modifica]) VALUES (N'0512', N'La Lima', N'05', NULL, CAST(N'2024-05-03T10:02:23.747' AS DateTime), NULL, NULL)
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usua_Creacion], [Muni_Fecha_Creacion], [Muni_Usua_Modifica], [Muni_Fecha_Modifica]) VALUES (N'1222', N'Villanueva', N'05', NULL, CAST(N'2024-05-05T19:02:06.860' AS DateTime), NULL, CAST(N'2024-05-06T11:04:00.423' AS DateTime))
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usua_Creacion], [Muni_Fecha_Creacion], [Muni_Usua_Modifica], [Muni_Fecha_Modifica]) VALUES (N'2311', N'Puerto Cortes', N'55', NULL, CAST(N'2024-05-05T19:01:52.477' AS DateTime), NULL, CAST(N'2024-05-06T00:45:09.737' AS DateTime))
GO
SET IDENTITY_INSERT [Gral].[tbSucursales] ON 

INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Calle], [Sucu_Direccion], [Muni_Id], [Sucu_Usua_Creacion], [Sucu_Fecha_Creacion], [Sucu_Usua_Modi], [Sucu_Fecha_Modi], [Sucu_Estado]) VALUES (1, N'10', N'parque peruano', N'0501', 1, CAST(N'2024-05-01T14:19:59.310' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Calle], [Sucu_Direccion], [Muni_Id], [Sucu_Usua_Creacion], [Sucu_Fecha_Creacion], [Sucu_Usua_Modi], [Sucu_Fecha_Modi], [Sucu_Estado]) VALUES (3, N'87', N'pablo pascal', N'0501', NULL, CAST(N'2024-05-07T04:00:47.833' AS DateTime), NULL, NULL, 1)
INSERT [Gral].[tbSucursales] ([Sucu_Id], [Sucu_Calle], [Sucu_Direccion], [Muni_Id], [Sucu_Usua_Creacion], [Sucu_Fecha_Creacion], [Sucu_Usua_Modi], [Sucu_Fecha_Modi], [Sucu_Estado]) VALUES (4, N'33', N'fafa', N'1222', NULL, CAST(N'2024-05-07T04:01:05.193' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbSucursales] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbMarcas__2E48416819C7C283]    Script Date: 5/6/2024 08:57:52 ******/
ALTER TABLE [Gral].[tbMarcas] ADD UNIQUE NONCLUSTERED 
(
	[Marc_Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [Acce].[tbRoles] ADD  CONSTRAINT [DF_tbRoles_Rol_Estado]  DEFAULT ((1)) FOR [Rol_Estado]
GO
ALTER TABLE [Acce].[tbUsuarios] ADD  CONSTRAINT [DF_tbUsuarios_Usua_Estado]  DEFAULT ((1)) FOR [Usua_Estado]
GO
ALTER TABLE [Cred].[tbImagenesPorClientes] ADD  DEFAULT ((1)) FOR [Imcl_Estado]
GO
ALTER TABLE [Cred].[tbModelos] ADD  CONSTRAINT [DF__tbModelos__Mode___2A164134]  DEFAULT ((1)) FOR [Mode_Estado]
GO
ALTER TABLE [Cred].[tbPlanesPagos] ADD  DEFAULT ((1)) FOR [Papa_Estado]
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes] ADD  CONSTRAINT [DF__tbPlanesP__Pacl___4277DAAA]  DEFAULT ((1)) FOR [Pacl_Estado]
GO
ALTER TABLE [Cred].[tbTipoCuotas] ADD  DEFAULT ((1)) FOR [Ticu_Estado]
GO
ALTER TABLE [Cred].[tbVehiculos] ADD  CONSTRAINT [DF__tbVehicul__Vehi___2FCF1A8A]  DEFAULT ((1)) FOR [Vehi_Estado]
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes] ADD  DEFAULT ((1)) FOR [Vecl_Estado]
GO
ALTER TABLE [Gral].[tbCargos] ADD  CONSTRAINT [DF_tbCargos_Carg_Estado]  DEFAULT ((1)) FOR [Carg_Estado]
GO
ALTER TABLE [Gral].[tbClientes] ADD  CONSTRAINT [DF_tbClientes_Clie_Estado]  DEFAULT ((1)) FOR [Clie_Estado]
GO
ALTER TABLE [Gral].[tbEmpleados] ADD  CONSTRAINT [DF_tbEmpleados_Empl_Estado]  DEFAULT ((1)) FOR [Empl_Estado]
GO
ALTER TABLE [Gral].[tbEstadosCiviles] ADD  CONSTRAINT [DF_tbEstadosCiviles_Esta_Estado]  DEFAULT ((1)) FOR [Esta_Estado]
GO
ALTER TABLE [Gral].[tbMarcas] ADD  DEFAULT ((1)) FOR [Marc_Estado]
GO
ALTER TABLE [Gral].[tbSucursales] ADD  DEFAULT ((1)) FOR [Sucu_Estado]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallas_tbUsuarios_Pant_Usua_Creacion] FOREIGN KEY([Pant_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [FK_tbPantallas_tbUsuarios_Pant_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbPantallas]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallas_tbUsuarios_Pant_Usua_Modifica] FOREIGN KEY([Pant_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallas] CHECK CONSTRAINT [FK_tbPantallas_tbUsuarios_Pant_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbPantallas_Pant_Id] FOREIGN KEY([Pant_Id])
REFERENCES [Acce].[tbPantallas] ([Pant_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbPantallas_Pant_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbRoles_Rol_Id] FOREIGN KEY([Rol_Id])
REFERENCES [Acce].[tbRoles] ([Rol_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbRoles_Rol_Id]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Paro_Usua_Creacion] FOREIGN KEY([Paro_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Paro_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbPantallasPorRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Paro_Usua_Modifica] FOREIGN KEY([Paro_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbPantallasPorRoles] CHECK CONSTRAINT [FK_tbPantallasPorRoles_tbUsuarios_Paro_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbRoles_tbUsuarios_Rol_Usua_Creacion] FOREIGN KEY([Rol_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_tbRoles_tbUsuarios_Rol_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbRoles]  WITH CHECK ADD  CONSTRAINT [FK_tbRoles_tbUsuarios_Rol_Usua_Modifica] FOREIGN KEY([Rol_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbRoles] CHECK CONSTRAINT [FK_tbRoles_tbUsuarios_Rol_Usua_Modifica]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbEmpleados_Empl_Id] FOREIGN KEY([Empl_Id])
REFERENCES [Gral].[tbEmpleados] ([Empl_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbEmpleados_Empl_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbRoles_Rol_Id] FOREIGN KEY([Rol_Id])
REFERENCES [Acce].[tbRoles] ([Rol_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbRoles_Rol_Id]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usua_Usua_Creacion] FOREIGN KEY([Usua_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usua_Usua_Creacion]
GO
ALTER TABLE [Acce].[tbUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usua_Usua_Modifica] FOREIGN KEY([Usua_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Acce].[tbUsuarios] CHECK CONSTRAINT [FK_tbUsuarios_tbUsuarios_Usua_Usua_Modifica]
GO
ALTER TABLE [Cred].[tbImagenesPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Id] FOREIGN KEY([Vecl_Id])
REFERENCES [Cred].[tbVehiculosPorClientes] ([Vecl_Id])
GO
ALTER TABLE [Cred].[tbImagenesPorClientes] CHECK CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Id]
GO
ALTER TABLE [Cred].[tbImagenesPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Usua_Creacionn] FOREIGN KEY([Imcl_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbImagenesPorClientes] CHECK CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Usua_Creacionn]
GO
ALTER TABLE [Cred].[tbImagenesPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Usua_Modifican] FOREIGN KEY([Imcl_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbImagenesPorClientes] CHECK CONSTRAINT [FK_tbImagenesPorClientes_Vecl_Usua_Modifican]
GO
ALTER TABLE [Cred].[tbModelos]  WITH CHECK ADD  CONSTRAINT [FK_tbModelos_Marve_Id] FOREIGN KEY([Marc_Id])
REFERENCES [Gral].[tbMarcas] ([Marc_Id])
GO
ALTER TABLE [Cred].[tbModelos] CHECK CONSTRAINT [FK_tbModelos_Marve_Id]
GO
ALTER TABLE [Cred].[tbModelos]  WITH CHECK ADD  CONSTRAINT [FK_tbModelos_Mode_Usu_Creacion] FOREIGN KEY([Mode_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbModelos] CHECK CONSTRAINT [FK_tbModelos_Mode_Usu_Creacion]
GO
ALTER TABLE [Cred].[tbModelos]  WITH CHECK ADD  CONSTRAINT [FK_tbModelos_Mode_Usua_Modificacion] FOREIGN KEY([Mode_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbModelos] CHECK CONSTRAINT [FK_tbModelos_Mode_Usua_Modificacion]
GO
ALTER TABLE [Cred].[tbPlanesPagos]  WITH CHECK ADD  CONSTRAINT [FK_Empl_Id_tbEmpleados_Empl_Id] FOREIGN KEY([Empl_Id])
REFERENCES [Gral].[tbEmpleados] ([Empl_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagos] CHECK CONSTRAINT [FK_Empl_Id_tbEmpleados_Empl_Id]
GO
ALTER TABLE [Cred].[tbPlanesPagos]  WITH CHECK ADD  CONSTRAINT [FK_tbPagoCuotas_Pacu_Usua_Creacion] FOREIGN KEY([Papa_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagos] CHECK CONSTRAINT [FK_tbPagoCuotas_Pacu_Usua_Creacion]
GO
ALTER TABLE [Cred].[tbPlanesPagos]  WITH CHECK ADD  CONSTRAINT [FK_tbPagoCuotas_Pacu_Usua_Modi] FOREIGN KEY([Papa_Usua_Modi])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagos] CHECK CONSTRAINT [FK_tbPagoCuotas_Pacu_Usua_Modi]
GO
ALTER TABLE [Cred].[tbPlanesPagos]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagos_Ticu_Id] FOREIGN KEY([Ticu_Id])
REFERENCES [Cred].[tbTipoCuotas] ([Ticu_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagos] CHECK CONSTRAINT [FK_tbPlanesPagos_Ticu_Id]
GO
ALTER TABLE [Cred].[tbPlanesPagos]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagos_Vecl_Id] FOREIGN KEY([Vecl_Id])
REFERENCES [Cred].[tbVehiculosPorClientes] ([Vecl_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagos] CHECK CONSTRAINT [FK_tbPlanesPagos_Vecl_Id]
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagosClientes_Pacl_Usua_Creacion] FOREIGN KEY([Pacl_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes] CHECK CONSTRAINT [FK_tbPlanesPagosClientes_Pacl_Usua_Creacion]
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagosClientes_Pacl_Usua_Modi] FOREIGN KEY([Pacl_Usua_Modi])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes] CHECK CONSTRAINT [FK_tbPlanesPagosClientes_Pacl_Usua_Modi]
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagosClientes_Papa_Id] FOREIGN KEY([Papa_Id])
REFERENCES [Cred].[tbPlanesPagos] ([Papa_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes] CHECK CONSTRAINT [FK_tbPlanesPagosClientes_Papa_Id]
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbPlanesPagosClientes_Sucu_Id] FOREIGN KEY([Sucu_Id])
REFERENCES [Gral].[tbSucursales] ([Sucu_Id])
GO
ALTER TABLE [Cred].[tbPlanesPagosClientes] CHECK CONSTRAINT [FK_tbPlanesPagosClientes_Sucu_Id]
GO
ALTER TABLE [Cred].[tbTipoCuotas]  WITH CHECK ADD  CONSTRAINT [FK_tbTipoCuotas_Ticu_Usua_Creacion] FOREIGN KEY([Ticu_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbTipoCuotas] CHECK CONSTRAINT [FK_tbTipoCuotas_Ticu_Usua_Creacion]
GO
ALTER TABLE [Cred].[tbTipoCuotas]  WITH CHECK ADD  CONSTRAINT [FK_tbTipoCuotas_Ticu_Usua_Modi] FOREIGN KEY([Ticu_Usua_Modi])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbTipoCuotas] CHECK CONSTRAINT [FK_tbTipoCuotas_Ticu_Usua_Modi]
GO
ALTER TABLE [Cred].[tbVehiculos]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculos_Mode_Id] FOREIGN KEY([Mode_Id])
REFERENCES [Cred].[tbModelos] ([Mode_Id])
GO
ALTER TABLE [Cred].[tbVehiculos] CHECK CONSTRAINT [FK_tbVehiculos_Mode_Id]
GO
ALTER TABLE [Cred].[tbVehiculos]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculos_Vehi_Usua_Creacion] FOREIGN KEY([Vehi_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbVehiculos] CHECK CONSTRAINT [FK_tbVehiculos_Vehi_Usua_Creacion]
GO
ALTER TABLE [Cred].[tbVehiculos]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculos_Vehi_Usua_Modificacion] FOREIGN KEY([Vehi_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbVehiculos] CHECK CONSTRAINT [FK_tbVehiculos_Vehi_Usua_Modificacion]
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculosPorClientes_Clie_Id] FOREIGN KEY([Clie_Id])
REFERENCES [Gral].[tbClientes] ([Clie_Id])
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes] CHECK CONSTRAINT [FK_tbVehiculosPorClientes_Clie_Id]
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculosPorClientes_Vecl_Usua_Creacionn] FOREIGN KEY([Vecl_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes] CHECK CONSTRAINT [FK_tbVehiculosPorClientes_Vecl_Usua_Creacionn]
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculosPorClientes_Vehi_Id] FOREIGN KEY([Vehi_Id])
REFERENCES [Cred].[tbVehiculos] ([Vehi_Id])
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes] CHECK CONSTRAINT [FK_tbVehiculosPorClientes_Vehi_Id]
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbVehiculosPorClientess_Vecl_Usua_Modifican] FOREIGN KEY([Vecl_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Cred].[tbVehiculosPorClientes] CHECK CONSTRAINT [FK_tbVehiculosPorClientess_Vecl_Usua_Modifican]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [FK_tbCargos_tbUsuarios_Carg_Usua_Creacion] FOREIGN KEY([Carg_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [FK_tbCargos_tbUsuarios_Carg_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbCargos]  WITH CHECK ADD  CONSTRAINT [FK_tbCargos_tbUsuarios_Carg_Usua_Modifica] FOREIGN KEY([Carg_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbCargos] CHECK CONSTRAINT [FK_tbCargos_tbUsuarios_Carg_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbEstadosCiviles_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbEstadosCiviles_Esta_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbMunicipios_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbMunicipios_Muni_Id]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbUsuarios_Clie_Usua_Creacion] FOREIGN KEY([Clie_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbUsuarios_Clie_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbClientes]  WITH CHECK ADD  CONSTRAINT [FK_tbClientes_tbUsuarios_Clie_Usua_Modifica] FOREIGN KEY([Clie_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbClientes] CHECK CONSTRAINT [FK_tbClientes_tbUsuarios_Clie_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Dept_Usua_Creacion] FOREIGN KEY([Dept_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Dept_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbDepartamentos]  WITH CHECK ADD  CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Dept_Usua_Modifica] FOREIGN KEY([Dept_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbDepartamentos] CHECK CONSTRAINT [FK_tbDepartamentos_tbUsuarios_Dept_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbCargos_Carg_Id] FOREIGN KEY([Carg_Id])
REFERENCES [Gral].[tbCargos] ([Carg_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbCargos_Carg_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbEstadosCiviles_Esta_Id] FOREIGN KEY([Esta_Id])
REFERENCES [Gral].[tbEstadosCiviles] ([Esta_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbEstadosCiviles_Esta_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbMunicipios_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbMunicipios_Muni_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbSucursales_Sucu_Id] FOREIGN KEY([Sucu_Id])
REFERENCES [Gral].[tbSucursales] ([Sucu_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbSucursales_Sucu_Id]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Usua_Creacion] FOREIGN KEY([Empl_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbEmpleados]  WITH CHECK ADD  CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Usua_Modifica] FOREIGN KEY([Empl_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEmpleados] CHECK CONSTRAINT [FK_tbEmpleados_tbUsuarios_Empl_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Esta_Usua_Creacion] FOREIGN KEY([Esta_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Esta_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbEstadosCiviles]  WITH CHECK ADD  CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Esta_Usua_Modifica] FOREIGN KEY([Esta_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbEstadosCiviles] CHECK CONSTRAINT [FK_tbEstadosCiviles_tbUsuarios_Esta_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbMarcas]  WITH CHECK ADD  CONSTRAINT [FK_tbMarcasVehiculo_Marve_Usua_Creacion] FOREIGN KEY([Marc_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMarcas] CHECK CONSTRAINT [FK_tbMarcasVehiculo_Marve_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbMarcas]  WITH CHECK ADD  CONSTRAINT [FK_tbMarcasVehiculo_Marve_Usuario_Modificiacion] FOREIGN KEY([Marc_Usuario_Modificiacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMarcas] CHECK CONSTRAINT [FK_tbMarcasVehiculo_Marve_Usuario_Modificiacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbDepartamentos_Dept_Id] FOREIGN KEY([Dept_Id])
REFERENCES [Gral].[tbDepartamentos] ([Dept_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbDepartamentos_Dept_Id]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbUsuarios_Muni_Usua_Creacion] FOREIGN KEY([Muni_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbUsuarios_Muni_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbMunicipios]  WITH CHECK ADD  CONSTRAINT [FK_tbMunicipios_tbUsuarios_Muni_Usua_Modifica] FOREIGN KEY([Muni_Usua_Modifica])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbMunicipios] CHECK CONSTRAINT [FK_tbMunicipios_tbUsuarios_Muni_Usua_Modifica]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_Muni_Id] FOREIGN KEY([Muni_Id])
REFERENCES [Gral].[tbMunicipios] ([Muni_Id])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_Muni_Id]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_Sucu_Usua_Creacion] FOREIGN KEY([Sucu_Usua_Creacion])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_Sucu_Usua_Creacion]
GO
ALTER TABLE [Gral].[tbSucursales]  WITH CHECK ADD  CONSTRAINT [FK_tbSucursales_Sucu_Usua_Modi] FOREIGN KEY([Sucu_Usua_Modi])
REFERENCES [Acce].[tbUsuarios] ([Usua_Id])
GO
ALTER TABLE [Gral].[tbSucursales] CHECK CONSTRAINT [FK_tbSucursales_Sucu_Usua_Modi]
GO
/****** Object:  StoredProcedure [Acce].[SP_Pantallas_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Pantallas_Mostrar] 
    @RoleId INT
AS
BEGIN
    SELECT Pan.Pant_Id, Pan.Pant_Descripcion
    FROM Acce.tbPantallas AS Pan
    WHERE Pan.Pant_Estado = 1
      AND NOT EXISTS (
          SELECT 1
          FROM Acce.tbPantallasPorRoles AS PxR
          WHERE PxR.Rol_Id = @RoleId AND PxR.pant_id = Pan.Pant_Id
      )
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Pantallas_Mostrar2]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Pantallas_Mostrar2]
AS
BEGIN
	SELECT *
	FROM Acce.tbPantallas
END
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRol_Pantallas]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_PantallasPorRol_Pantallas]
@Rol_Id INT
AS 
BEGIN
SELECT P.Pant_Descripcion FROM Acce.tbPantallasPorRoles PR
INNER JOIN Acce.tbRoles R ON R.Rol_Id = PR.Rol_Id
INNER JOIN Acce.tbPantallas P ON P.Pant_Id = Pr.Pant_Id
WHERE R.Rol_Id =  @Rol_Id
END
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRol2_buscar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[sp_PantallasPorRol2_buscar] 
    @Rol_Id INT
AS
BEGIN
    SELECT 
        Paro_Id,
        Pant_Id,
        paro.[Rol_Id],
        Rol_Descripcion,
		'SI' AS Agregado 
    FROM 
        [Acce].[tbPantallasPorRoles] AS paro
        JOIN Acce.tbRoles AS r on paro.Rol_Id = r.Rol_Id
    WHERE
        paro.[Rol_Id] = @Rol_Id ;
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Acce].[sp_PantallasPorRoles_actualizar]
    @Paro_Id INT,
    @Rol_Id INT,
    @Pant_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE [Acce].[tbPantallasPorRoles]
        SET
            Rol_Id = @Rol_Id,
            Pant_Id = @Pant_Id
        WHERE
            Paro_Id = @Paro_Id;

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Eliminar] 
    @Rol_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Acce].[tbPantallasPorRoles]
        WHERE Rol_Id = @Rol_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Insertar]
    @Rol_Id INT,
    @Pant_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Acce].[tbPantallasPorRoles] 
        (
            Rol_Id, 
            Pant_Id
        )
        VALUES 
        (
            @Rol_Id, 
            @Pant_Id
        );

        SELECT 1;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0; 
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[sp_PantallasPorRoles_llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [Acce].[sp_PantallasPorRoles_llenar]
    @Paro_Id INT
AS
BEGIN
    SELECT 
        Paro_Id,
        Rol_Id,
        Pant_Id
    FROM 
        [Acce].[tbPantallasPorRoles]
    WHERE
        Paro_Id = @Paro_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Mostrar] 
as
begin
SELECT PR.[Pant_Id], P.[Pant_Descripcion] AS Pantalla, R.Rol_Descripcion
FROM [Acce].[tbPantallasPorRoles] PR 
INNER JOIN Acce.tbPantallas P ON PR.Pant_Id=P.Pant_Id 
INNER JOIN[Acce].[tbRoles] R ON PR.Rol_Id= R.Rol_Id
end
GO
/****** Object:  StoredProcedure [Acce].[SP_PerfilUsuario_Mostar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [Acce].[SP_PerfilUsuario_Mostar]
@Usua_Usuario VARCHAR(50)
AS
BEGIN
	SELECT	
	Usua_Id,
    Usua_Usuario,
    Usua_Color		
	FROM [Acce].[tbUsuarios]
	WHERE Usua_Usuario = @Usua_Usuario;
END
GO
/****** Object:  StoredProcedure [Acce].[SP_PerfilUsuarios_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [Acce].[SP_PerfilUsuarios_Actualizar]
    @Usuario VARCHAR(50),
    @Usua_Usuario VARCHAR(50),
    @Usua_Color VARCHAR(50)
AS
BEGIN
    BEGIN TRY
   
        UPDATE [Acce].[tbUsuarios]
        SET
            Usua_Usuario = @Usua_Usuario,
            Usua_Color = @Usua_Color
        WHERE
            Usua_Usuario = @Usuario;
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;

GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_Actualizar](
	@Rol_Id INT, 
	@Rol_Descripcion VARCHAR (50),
	@Rol_Usua_Modifica INT,
	@Rol_Fecha_Modifica DATETIME

)
AS
BEGIN
BEGIN TRY 
	UPDATE [Acce].[tbRoles]
	SET
	Rol_Descripcion = @Rol_Descripcion, 
	Rol_Usua_Modifica = @Rol_Usua_Modifica,
	Rol_Fecha_Modifica = @Rol_Fecha_Modifica
	WHERE Rol_Id = @Rol_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_Eliminar]
    @Rol_Id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM [Acce].[tbRoles]
        WHERE Rol_Id = @Rol_Id;

        SELECT 1 AS Resultado;

        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Resultado;
        ROLLBACK;
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_Insertar]
	
    @Rol_Descripcion NVARCHAR(60),
    @Role_UsuarioCreacion INT,
    @Role_FechaCreacion DATETIME,
    @ID INT OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO [Acce].[tbRoles] (Rol_Descripcion, Rol_Usua_Creacion,  Rol_Fecha_Creacion)
        VALUES (@Rol_Descripcion, @Role_UsuarioCreacion, @Role_FechaCreacion);

        SET @ID = SCOPE_IDENTITY();
        COMMIT;
    END TRY
    BEGIN CATCH
        SELECT @ID = 0;
        ROLLBACK;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_LLenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_Roles_LLenar]
    @Rol_Id INT
AS
BEGIN
    SELECT 
        c.Rol_Id,
        Rol_Descripcion,
        Rol_Usua_Creacion,
        Rol_Usua_Modifica,
		FORMAT(Rol_Fecha_Creacion, 'yyyy-MM-dd') AS FechaCreacion,
		FORMAT(Rol_Fecha_Modifica, 'yyyy-MM-dd') AS FechaModificacion,
		uCreacion.Usua_Usuario AS UsuarioCreacion, uModificador.Usua_Usuario AS UsuarioModificacion ,
        [Rol_Estado]
    FROM 
        [Acce].[tbRoles] c LEFT JOIN Acce.tbUsuarios uCreacion ON uCreacion.Usua_Id = c.Rol_Usua_Creacion
		LEFT JOIN Acce.tbUsuarios uModificador ON uModificador.Usua_Id = c.Rol_Usua_Modifica
    WHERE
        c.Rol_Id = @Rol_Id;
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_Roles_Mostrar]
AS
BEGIN
SELECT * FROM Acce.tbRoles
WHERE Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_MostrarVistaMaster]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_MostrarVistaMaster]
AS
BEGIN
	SELECT	
	Rol.*,(SELECT STRING_AGG(panta.Pant_Descripcion, ' | ')
FROM Acce.tbPantallasPorRoles AS pan INNER JOIN Acce.tbPantallas
AS panta ON pan.Pant_Id = panta.Pant_Id
WHERE Rol.Rol_Id = pan.Rol_Id) AS Pantallas
	FROM Acce.tbRoles AS Rol
	WHERE Rol.Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Actualizar]
    (
        @Usua_Id INT,
        @Usua_Usuario VARCHAR(30),
        @Usua_Admin BIT,
        @Empl_Id INT,
        @Rol_Id INT,
        @Usua_Usua_Modifica INT,
        @Usua_Fecha_Modifica DATETIME
    )
AS
BEGIN
    BEGIN TRY
        UPDATE Acce.tbUsuarios
        SET
            Usua_Usuario = @Usua_Usuario,
            Usua_Admin = @Usua_Admin,
            Empl_Id = @Empl_Id,
            Rol_Id = @Rol_Id,
            Usua_Usua_Modifica = @Usua_Usua_Modifica,
            Usua_Fecha_Modifica = @Usua_Fecha_Modifica
        WHERE
            Usua_Id = @Usua_Id;
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Eliminar](
	@Usua_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Acce].[tbUsuarios]
	SET Usua_Estado = 0
	WHERE Usua_Id = @Usua_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_EnviarCorreo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [Acce].[SP_Usuarios_EnviarCorreo]
@UsuarioCorreo varchar(70)
as
begin
	select 
	[Usua_Id],
	[Usua_Usuario],
	E.[Empl_Correo] correo
	from [Acce].[tbUsuarios] U left join [Gral].[tbEmpleados] E
	on U.Empl_Id = E.Empl_Id
	where [Usua_Usuario] = @UsuarioCorreo OR E.Empl_Correo = @UsuarioCorreo
end
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_IngresarCodigo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [Acce].[SP_Usuarios_IngresarCodigo]
@Usua_Id INT,
@Usua_VerificarCorreo varchar(max)
as
begin
	update [Acce].[tbUsuarios]
	set
	Usua_VerificarCorreo = @Usua_VerificarCorreo
	where Usua_Id = @Usua_Id
end
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_InicioSesion]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_InicioSesion]
	@Usuario VARCHAR (100),
	@Contra	VARCHAR (MAX)
AS
BEGIN
    BEGIN TRY

	SELECT usu.Usua_Id AS Usua_Id,
			usu.Usua_Usuario ,
			usu.Usua_Contra ,
			emp.Empl_Nombre + ' ' + emp.Empl_Apellido AS Empl_Empleado,
			emp.Empl_Id,
			r.Rol_Id,
			p.pant_descripcion,
			usu.Usua_Admin
	FROM Acce.tbUsuarios AS usu LEFT JOIN Gral.tbEmpleados AS emp
	ON usu.empl_id = emp.empl_id LEFT JOIN Acce.tbPantallasPorRoles AS R ON r.Rol_Id = usu.Rol_Id LEFT JOIN Acce.tbPantallas AS p ON p.pant_id = R.pant_id
	WHERE usu.usua_Usuario = @Usuario 
	AND usu.usua_Contra = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Contra), 2);

    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Insertar]
    (
        @Usua_Usuario VARCHAR(30),
        @Usua_Contra VARCHAR(MAX),
        @Usua_Admin BIT,
        @Empl_Id INT,
        @Rol_Id INT,
        @Usua_Usua_Creacion INT,
        @Usua_Fecha_Creacion DATETIME
    )
AS
BEGIN
     DECLARE @estadoActual INT;

    SELECT @estadoActual = Usua_Estado FROM [Acce].[tbUsuarios] WHERE Usua_Usuario = @Usua_Usuario;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
                -- El estado es 0, actualiza el estado a 1
                UPDATE [Acce].[tbUsuarios] SET Usua_Estado = 1 WHERE Usua_Usuario = @Usua_Usuario;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
        INSERT INTO Acce.tbUsuarios (
            Usua_Usuario,
            Usua_Contra,
            Usua_Admin,
            Empl_Id,
            Rol_Id,
            Usua_Usua_Creacion,
            Usua_Fecha_Creacion
        )
        VALUES (
            @Usua_Usuario,
		CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Usua_Contra), 2),
            @Usua_Admin,
            @Empl_Id,
            @Rol_Id,
            @Usua_Usua_Creacion,
            @Usua_Fecha_Creacion
        );
		END
        SELECT 1;
    END TRY
    BEGIN CATCH
        SELECT 0;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Llenar] 
    @Usua_Id INT
AS
BEGIN
    SELECT
        Usu.Usua_Usuario,
        Usu.Usua_Admin,
        Usu.Usua_Contra,
        Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado,
		Rol.Rol_Id,
		Empl.Empl_Id,
        Rol.Rol_Descripcion,
        Usu.Usua_Fecha_Creacion,
        Creacion.Usua_Usuario AS Usua_Creacion,
        Usu.Usua_Fecha_Modifica,
        Modificacion.Usua_Usuario AS Usua_Modifica 

    FROM Acce.tbUsuarios AS Usu 
    LEFT JOIN Gral.tbEmpleados AS Empl ON Usu.Empl_Id = Empl.Empl_Id 
    LEFT JOIN Acce.tbRoles AS Rol ON Usu.Rol_Id = Rol.Rol_Id 
    FULL JOIN Acce.tbUsuarios AS Creacion ON Usu.Usua_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Usu.Usua_Usua_Modifica = Modificacion.Usua_Id
    WHERE Usu.Usua_Id = @Usua_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Mostrar]
AS
BEGIN
	SELECT
	    Usu.Usua_Id,
		Usu.Usua_Usuario,
		Usu.Usua_Admin,
		Empl.Empl_Id ,
		Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado,
		Rol.Rol_Descripcion ,
		Rol.Rol_Id

	FROM Acce.tbUsuarios AS Usu LEFT JOIN Gral.tbEmpleados AS Empl
	ON Usu.Empl_Id = Empl.Empl_Id LEFT JOIN Acce.tbRoles AS Rol
	ON Usu.Rol_Id = Rol.Rol_Id 
	WHERE Usu.Usua_Estado = 1 AND  Rol.Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Reestablecer]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Reestablecer]
(
    @Usua_Id INT,
    @Usua_Contra VARCHAR(MAX),
    @Usua_Usua_Modifica INT, 
    @Usua_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY
	UPDATE Acce.tbUsuarios
			SET Usua_Contra = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Usua_Contra), 2),
			
				Usua_Usua_Modifica = @Usua_Usua_Modifica,
				Usua_Fecha_Modifica = @Usua_Fecha_Modifica
			WHERE Usua_Id = @Usua_Id
			SELECT 1
			END TRY
			BEGIN CATCH

			SELECT 0
			END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Reestablecer2]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_Reestablecer2]
(
    @Usua_VerificarCorreo VARCHAR(MAX),
    @Usua_Contra VARCHAR(MAX),
    @Usua_Usua_Modifica INT, 
    @Usua_Fecha_Modifica DATETIME
)
AS
BEGIN
    BEGIN TRY
        UPDATE Acce.tbUsuarios
        SET Usua_Contra = CONVERT(VARCHAR(MAX), HASHBYTES('SHA2_512', @Usua_Contra), 2),
            Usua_Usua_Modifica = @Usua_Usua_Modifica,
            Usua_Fecha_Modifica = @Usua_Fecha_Modifica
        WHERE Usua_VerificarCorreo = @Usua_VerificarCorreo;

        SELECT 1 AS Success;
    END TRY
    BEGIN CATCH
        SELECT 0 AS Success;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_ValidarCodigo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     procedure [Acce].[SP_Usuarios_ValidarCodigo]
@Usua_VerificarCorreo varchar(max)
as
begin
begin try
	update [Acce].[tbUsuarios]
	set
		[Usua_VerificarCorreo] = null
	where [Usua_Estado]  = 1 and [Usua_VerificarCorreo] = @Usua_VerificarCorreo
	select 1;
	
	end try
	begin catch
	select 0
	end catch
end
GO
/****** Object:  StoredProcedure [Cred].[sp_BuscarInteresRestado]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Cred].[sp_BuscarInteresRestado]
@Papa_Id INT
AS
BEGIN
	SELECT [Papa_Total_Intereses_Restados] FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_ImagenesPorClientes_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_ImagenesPorClientes_Insertar]
(@Imcl_Imagen VARCHAR(MAX), 
@Vecl_Id INT, 
@Imcl_Usua_Creacion INT, 
@Imcl_Fecha_Creacion DATETIME)
AS
BEGIN
  BEGIN TRY 
	BEGIN TRANSACTION;
		INSERT INTO [Cred].[tbImagenesPorClientes] ([Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion])
		VALUES (@Imcl_Imagen, @Vecl_Id, @Imcl_Usua_Creacion, @Imcl_Fecha_Creacion)
		SELECT 1 AS Resultado
	COMMIT;
  END TRY 
  BEGIN CATCH 
		SELECT -1 AS Resultado
		ROLLBACK;
  END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_ImagenesPorVehiculo_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_ImagenesPorVehiculo_Llenar] 
@Imcl_Id INT
AS
BEGIN
	SELECT 
	 im.Imcl_Id, 
	 im.Imcl_Imagen, 
	 v.Vehi_Placa, 
	 m.Mode_Descripcion, 
	 mar.Marc_Descripcion, 
	 im.Imcl_Fecha_Creacion, 
	 usua1.[Usua_Usuario] AS Usua_Creacion, 
	 im.Imcl_Fecha_Modifica, 
	 usua2.Usua_Usuario AS Usua_Modifica
	 
	FROM Cred.tbVehiculos v inner join [Cred].[tbVehiculosPorClientes] as vcc
	on vcc.Vehi_Id = v.Vehi_Id inner join Cred.tbImagenesPorClientes im
	on im.Vecl_Id = vcc.Vecl_Id INNER JOIN Cred.tbModelos m 
	ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas mar 
	ON mar.Marc_Id = m.Marc_Id FULL JOIN Acce.tbUsuarios usua1
	ON im.Imcl_Usua_Creacion = usua1.Usua_Id FULL JOIN Acce.tbUsuarios usua2
	ON im.Imcl_Usua_Modifica = usua2.Usua_Id
	WHERE Imcl_Id = @Imcl_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_ImagenesPorVehiculos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_ImagenesPorVehiculos_Actualizar] 
@Imcl_Id INT , 
@Imcl_Imagen VARCHAR(MAX), 
@Vecl_Id INT ,
@Imcl_Usua_Modifica INT , 
@Imcl_Fecha_Modifica DATETIME
AS
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;

			UPDATE [Cred].[tbImagenesPorClientes]
			SET [Imcl_Imagen] =  @Imcl_Imagen, [Vecl_Id] = @Vecl_Id, 
				[Imcl_Usua_Modifica] = @Imcl_Usua_Modifica, [Imcl_Fecha_Modifica] = @Imcl_Fecha_Modifica
			WHERE Imcl_Id = @Imcl_Id

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[sp_ImagenesPorVehiculos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[sp_ImagenesPorVehiculos_Eliminar]
@Imcl_Id INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

			UPDATE [Cred].[tbImagenesPorClientes]
			SET [Imcl_Estado] = 0 
			WHERE [Imcl_Id] = @Imcl_Id

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[sp_ImagenesPorVehiculos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[sp_ImagenesPorVehiculos_Insertar] 
(@Imcl_Imagen VARCHAR (MAX), 
@Vecl_Id INT, 
@Imcl_Usua_Creacion INT, 
@Imcl_Fecha_Creacion DATETIME)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;

			INSERT INTO [Cred].[tbImagenesPorClientes] ([Imcl_Imagen], [Vecl_Id], [Imcl_Usua_Creacion], [Imcl_Fecha_Creacion])
			VALUES (@Imcl_Imagen, @Vecl_Id, @Imcl_Usua_Creacion, @Imcl_Fecha_Creacion)

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[sp_ImagenesPorVehiculos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROC [Cred].[sp_ImagenesPorVehiculos_Mostrar] 
AS
BEGIN 
	SELECT Imcl_Id,
		   Imcl_Imagen, 
		   vcc.Vecl_Id, 
		   v.Vehi_Id, 
		   v.Vehi_Placa, 
		   m.Mode_Descripcion, 
		   mar.Marc_Descripcion
		   
	FROM Cred.tbVehiculos v inner join [Cred].[tbVehiculosPorClientes] as vcc
	on vcc.Vehi_Id = v.Vehi_Id inner join Cred.tbImagenesPorClientes im
	on im.Vecl_Id = vcc.Vecl_Id INNER JOIN Cred.tbModelos m 
	ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas mar 
	ON mar.Marc_Id = m.Marc_Id
	WHERE im.Imcl_Estado = 1 AND v.Vehi_Estado = 1

END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Modelos_Actualizar](
	@Mode_Id INT,
	@Mode_Descripcion VARCHAR (50),
	@Marc_Id INT,
	@Mode_Usua_Modifica INT,
	@Mode_Fecha_Modifica DATETIME

)
AS
BEGIN
BEGIN TRY 
	UPDATE [Cred].[tbModelos]
	SET
	Mode_Descripcion = @Mode_Descripcion, 
	Marc_Id = @Marc_Id,
	Mode_Usua_Modifica = @Mode_Usua_Modifica,
	Mode_Fecha_Modifica = @Mode_Fecha_Modifica
	WHERE Mode_Id = @Mode_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cred].[SP_Modelos_Eliminar](
	@Mode_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Cred].[tbModelos]
	SET Mode_Estado = 0
	WHERE Mode_Id = @Mode_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Modelos_Insertar](
    @Mode_Descripcion VARCHAR (50),
	@Marc_Id INT,
    @Mode_Usua_Creacion INT,
    @Mode_Fecha_Creacion DATETIME
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Mode_Estado FROM [Cred].[tbModelos] WHERE Mode_Descripcion = @Mode_Descripcion;

    BEGIN TRY
        IF @estadoActual IS NOT NULL
        BEGIN
           
            IF @estadoActual = 0
            BEGIN
                
                UPDATE [Cred].[tbModelos] SET Mode_Estado = 1 WHERE Mode_Descripcion = @Mode_Descripcion;
                SELECT 1;
            END
            ELSE
            BEGIN
              
                SELECT 0;
            END
        END
        ELSE
        BEGIN

            INSERT INTO [Cred].[tbModelos] (Mode_Descripcion,Marc_Id, Mode_Usua_Creacion, Mode_Fecha_Creacion)
            VALUES (@Mode_Descripcion,@Marc_Id, @Mode_Usua_Creacion, @Mode_Fecha_Creacion);
        SELECT 1
        END
    END TRY
    BEGIN CATCH
       
        SELECT 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Modelos_Llenar] 
@Mode_Id INT
AS
BEGIN
	SELECT	Mode.Mode_Id,
			Mode.Mode_Descripcion,
			Mode.Mode_Usua_Creacion,
			Marc.Marc_Id,
			Marc.Marc_Descripcion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Mode.Mode_Fecha_Creacion,
			Mode.Mode_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Mode.Mode_Fecha_Modifica
	FROM Cred.tbModelos AS Mode LEFT JOIN Gral.tbMarcas AS Marc
	ON Mode.Marc_Id = Marc.Marc_Id FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Mode.Mode_Usua_Creacion = UsuaCrea.Usua_Id Full JOIN Acce.tbUsuarios AS UsuaModi
	ON Mode.Mode_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Mode.Mode_Id = @Mode_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Modelos_Mostrar]
AS
BEGIN
	SELECT	Mode.Mode_Id,
			Mode.Mode_Descripcion,
			Marc.Marc_Descripcion,
			Marc.Marc_Id
	FROM Cred.tbModelos AS Mode LEFT JOIN Gral.tbMarcas AS Marc
	ON Mode.Marc_Id = Marc.Marc_Id  
	WHERE  Mode.Mode_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagos_Actualizar]
(@Papa_Id INT ,@Papa_Financiamiento MONEY, @Papa_Precio_Mercado MONEY, @Vecl_Id INT, @Ticu_Id INT, @Pap_Intereses_Porcentaje INT ,@Papa_Numero_Cuota INT, 
@Papa_Estado_PlanesPagos BIT, @Papa_Fecha_Emision DATETIME ,@Papa_Fecha_Finalizacion DATETIME, @Papa_Usua_Modi INT,
@Papa_Fecha_Modi DATETIME
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @InteresMonto MONEY

		UPDATE Cred.tbPlanesPagos 
		SET Papa_Financiamiento = @Papa_Financiamiento, Papa_Precio_Mercado = @Papa_Precio_Mercado, Vecl_Id = @Vecl_Id, Ticu_Id = @Ticu_Id, 
			Papa_Intereses_Porcentaje = @Pap_Intereses_Porcentaje,Papa_Numero_Cuota = @Papa_Numero_Cuota, Papa_Estado_PlanesPagos = @Papa_Estado_PlanesPagos, 
			Papa_Fecha_Emision = @Papa_Fecha_Emision, Papa_Fecha_Finalizacion = @Papa_Fecha_Finalizacion, [Papa_Usua_Creacion] = @Papa_Usua_Modi, Papa_Fecha_Modi = @Papa_Fecha_Modi

		WHERE Papa_Id = @Papa_Id
		SELECT @InteresMonto = @Papa_Financiamiento * @Pap_Intereses_Porcentaje / 100

		UPDATE Cred.tbPlanesPagos
		SET Papa_Intereses_Monto = @InteresMonto
		WHERE Papa_Id = @Papa_Id

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagos_Eliminar]
(@Papa_Id INT
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @InteresMonto MONEY

		UPDATE Cred.tbPlanesPagos 
		SET Papa_Estado = 0
		WHERE Papa_Id = @Papa_Id

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*150000, 260000, 11, 15, '05-15-2024', 1, '05-15-2024' */
CREATE PROC [Cred].[SP_PlanesPagos_Insertar]  
(@Papa_Financiamiento MONEY,  
 @Papa_Precio_Mercado MONEY, 
 @Vecl_Id INT, 
 @Usuario VARCHAR(MAX), 
 @Papa_Numero_Cuota INT, 
 @Papa_Fecha_Emision DATETIME , 
 @Papa_Usua_Creacion INT, 
 @Papa_Fecha_Creacion DATETIME,
 @UltimoId INT OUTPUT,
 @Fecha DATE OUTPUT 
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @Empl_Id INT
		DECLARE @Sucu_Id INT
		DECLARE @InteresMonto MONEY
		DECLARE @InteresMora MONEY
		DECLARE @CuotaCounter INT
		DECLARE @Papa_Mora INT
		DECLARE @TotalIntereses MONEY
		DECLARE @InteresRestar MONEY 
		DECLARE @CapitalRestar MONEY
		DECLARE @TotalPago MONEY
		DECLARE @Pap_Intereses_Porcentaje INT
		DECLARE @SaldoInicial MONEY 
		DECLARE @Saldo MONEY 
		DECLARE @CapitalSumado MONEY
		DECLARE @UltimoIDCliente INT
		DECLARE @PagoSumado MONEY

		DECLARE @EsAdmin BIT;


		SELECT @Empl_Id = u.Empl_Id, @EsAdmin = u.Usua_Admin
		FROM [dbCredirapi].[Acce].[tbUsuarios] u
		WHERE u.Usua_Usuario = @Usuario;

 
		IF @EsAdmin = 0
		BEGIN
			SELECT @Sucu_Id = e.Sucu_Id
			FROM [dbCredirapi].[Gral].[tbEmpleados] e
			WHERE e.Empl_Id = @Empl_Id;
		END

		SET @CuotaCounter = 1 
		
		
		SELECT @Pap_Intereses_Porcentaje = [Inte_porcentaje] FROM [Cred].[tbIntereses] WHERE [Inte_id] = 1
		SELECT @Papa_Mora = [Mora_porcentaje] FROM [Cred].[tbMora] WHERE [Mora_id] = 1

		INSERT INTO Cred.tbPlanesPagos (Empl_Id ,Papa_Financiamiento, Papa_Precio_Mercado, Papa_Mora , Vecl_Id, Papa_Intereses_Porcentaje ,Papa_Numero_Cuota, Papa_Estado_PlanesPagos, Papa_Fecha_Emision, [Papa_Usua_Creacion], [Papa_Fecha_Creacion], [Papa_Saldo_Sumado], [Papa_Total_Capital])
		VALUES(@Empl_Id, @Papa_Financiamiento, @Papa_Precio_Mercado, @Papa_Mora ,@Vecl_Id, @Pap_Intereses_Porcentaje ,@Papa_Numero_Cuota, 0, @Papa_Fecha_Emision, @Papa_Usua_Creacion, @Papa_Fecha_Creacion, 0.00, @Papa_Financiamiento)
		SET @UltimoId = SCOPE_IDENTITY() 
		SET @Fecha = GETDATE()

		SELECT @InteresMonto = @Papa_Financiamiento * @Pap_Intereses_Porcentaje / 100
		SELECT @InteresMora = @Papa_Financiamiento * @Papa_Mora / 100 

		SELECT @TotalIntereses = @InteresMonto * @Papa_Numero_Cuota

		SELECT @InteresRestar = @TotalIntereses / @Papa_Numero_Cuota
		SELECT @CapitalRestar = @Papa_Financiamiento / @Papa_Numero_Cuota
		SELECT @TotalPago = @InteresRestar + @CapitalRestar
		SET @PagoSumado = @CapitalRestar
		SELECT @CapitalSumado = @CapitalRestar

		UPDATE Cred.tbPlanesPagos
		SET Papa_Intereses_Monto = @InteresMonto,  [Papa_Mora_Monto] = @InteresMora, [Papa_Total_Intereses] = @TotalIntereses,
			[Papa_Intereses_Restar] = @InteresRestar,  [Papa_Capital_Restar] = @CapitalRestar, [Papa_Total_Pago] = @TotalPago, 
			[Papa_Total_Intereses_Restados] = @TotalIntereses
		WHERE Papa_Id = @UltimoId

        WHILE @CuotaCounter <= @Papa_Numero_Cuota
        BEGIN
			
		/**/IF (@CuotaCounter = 1)
			BEGIN
					SELECT @Saldo = @Papa_Financiamiento - @CapitalSumado
					INSERT INTO [Cred].[tbPlanesPagosClientes] (Sucu_Id ,[Pacl_Saldo_Inicial], [Pacl_Saldo], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar],[Pacl_Capital_Restar],[Pacl_Total_Pago], [Papa_Id], [Pacl_Financiamiento] , [Pacl_Saldo_Sumado] ,[Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora],  [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_NumeroCuota])
					VALUES                                     (@Sucu_Id, @Papa_Financiamiento, @Saldo, @TotalIntereses, @Papa_Financiamiento, @InteresRestar, @CapitalRestar, @TotalPago, @UltimoId,  @Papa_Financiamiento  ,          0.00   ,     0.00       , 0.00,                  0.00,          0.00,              @Papa_Usua_Creacion, @Papa_Fecha_Creacion, 2, 0.00, @CuotaCounter)
					SELECT @UltimoIDCliente = SCOPE_IDENTITY()

					UPDATE [Cred].[tbPlanesPagosClientes] 
					SET    [Pacl_Saldo_Sumado] = @CapitalSumado
					WHERE  Papa_Id = @UltimoId 
			END/**/

		/**/ELSE 
			BEGIN
				DECLARE @SaldoInicialCl MONEY 
				DECLARE @SaldoCl MONEY 
				DECLARE @Sumado MONEY
				DECLARE @PagoInicial MONEY 
				DECLARE @PagoSaldo MONEY

				SELECT @SaldoInicialCl = [Pacl_Saldo_Inicial], @SaldoCl = [Pacl_Saldo], @Sumado = [Pacl_Saldo_Sumado] FROM Cred.tbPlanesPagosClientes WHERE Pacl_Id = @UltimoIDCliente

				SET @PagoInicial = @SaldoInicialCl - @Sumado
				SET @PagoSaldo = @SaldoCl - @Sumado

				INSERT INTO [Cred].[tbPlanesPagosClientes] (Sucu_Id, [Pacl_Saldo_Inicial], [Pacl_Saldo], [Pacl_Total_Intereses], [Pacl_Total_Capital], [Pacl_Intereses_Restar],[Pacl_Capital_Restar],[Pacl_Total_Pago], [Papa_Id], [Pacl_Financiamiento] , [Pacl_Saldo_Sumado] ,[Pacl_Monto_Pago], [Pacl_Pago_Capital], [Pacl_Pago_Intereses], [Pacl_Pago_Mora],  [Pacl_Usua_Creacion], [Pacl_Fecha_Creacion], [Pacl_Estado_Pago], [Pacl_Mora_Saber], [Pacl_NumeroCuota])
				VALUES                                     (@Sucu_Id, @PagoInicial, @PagoSaldo, @TotalIntereses, @Papa_Financiamiento, @InteresRestar, @CapitalRestar, @TotalPago, @UltimoId,  @Papa_Financiamiento  ,          0.00   ,     0.00       , 0.00,                  0.00,          0.00,              @Papa_Usua_Creacion, @Papa_Fecha_Creacion, 2, 0.00, @CuotaCounter)

				SET @Sumado = @Sumado + @PagoSumado

				UPDATE [Cred].[tbPlanesPagosClientes]
				SET [Pacl_Saldo_Sumado] = @Sumado
				WHERE Papa_Id = @UltimoId

			END/**/
		   SET @CuotaCounter = @CuotaCounter + 1 
        END

		COMMIT;
				SELECT @UltimoId AS Resultado
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [Cred].[SP_PlanesPagos_Llenar]
@Papa_Id INT
AS
BEGIN
	SELECT [Papa_Id], 
		   [Papa_Financiamiento], 
		   [Papa_Precio_Mercado], 
		   ma.Marc_Descripcion,
		   m.Mode_Descripcion,
		   CONCAT(c.Clie_Nombre ,' ', c.Clie_Apellido) AS Cliente,
		   [Papa_Intereses_Porcentaje], 
		   [Papa_Intereses_Monto], 
		   [Papa_Numero_Cuota], 
		   [Papa_Mora], 
		   [Papa_Estado_PlanesPagos], 
		   [Papa_Fecha_Emision], 
		   [Papa_Fecha_Finalizacion],
		   [Papa_Usua_Creacion],
		   usua1.Usua_Usuario  AS Usua_Creacion, 
		   [Papa_Fecha_Creacion],
		   [Papa_Usua_Modi],
		   usua2.Usua_Usuario  AS Usua_Modi,
		   [Papa_Fecha_Modi]
		   FROM [Cred].[tbPlanesPagos] pp FULL JOIN [Cred].[tbVehiculosPorClientes] vc
		   ON vc.Vecl_Id = pp.Vecl_Id FULL JOIN Cred.tbVehiculos v 
		   ON v.Vehi_Id = vc.Vehi_Id FULL JOIN Gral.tbClientes c
		   ON c.Clie_Id = vc.Clie_Id FULL JOIN Cred.tbModelos m 
		   ON m.Mode_Id = v.Mode_Id FULL JOIN Gral.tbMarcas ma
		   ON ma.Marc_Id = m.Marc_Id FULL JOIN Acce.tbUsuarios usua1 
		   ON usua1.Usua_Id = pp.Papa_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
		   ON usua2.Usua_Id = pp.Papa_Usua_Modi
		   WHERE pp.Papa_Estado = 1 AND  pp.Papa_Id = @Papa_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagos_Mostrar]
AS
BEGIN
	SELECT [Papa_Id], 
		   [Papa_Financiamiento], 
		   [Papa_Precio_Mercado], 
		   ma.Marc_Id,
		   ma.Marc_Descripcion,
		   m.Mode_Id,
		   m.Mode_Descripcion,
		   CONCAT(c.Clie_Nombre ,' ', c.Clie_Apellido) AS Cliente,
		   c.Clie_Id,
		   v.Vehi_Id,
		   [Papa_Intereses_Porcentaje], 
		   [Papa_Intereses_Monto], 
		   [Papa_Numero_Cuota], 
		   [Papa_Mora], 
		   [Papa_Estado_PlanesPagos], 
		   [Papa_Fecha_Emision], 
		   [Papa_Fecha_Finalizacion]
		   FROM [Cred].[tbPlanesPagos] pp INNER JOIN [Cred].[tbVehiculosPorClientes] vc
		   ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
		   ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c
		   ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
		   ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
		   ON ma.Marc_Id = m.Marc_Id
		   WHERE pp.Papa_Estado = 1 AND vc.Vecl_Estado = 1 AND v.Vehi_Estado = 1 AND c.Clie_Estado = 1 AND
				 c.Clie_Estado = 1 AND m.Mode_Estado = 1 AND ma.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_MostrarFiltrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [Cred].[SP_PlanesPagos_MostrarFiltrar]
    @Usua_Usuario VARCHAR(50)
AS
BEGIN
 
    DECLARE @Empl_Id INT;
    DECLARE @Sucu_Id INT;
    DECLARE @EsAdmin BIT;


    SELECT @Empl_Id = u.Empl_Id, @EsAdmin = u.Usua_Admin
    FROM [dbCredirapi].[Acce].[tbUsuarios] u
    WHERE u.Usua_Usuario = @Usua_Usuario;

 
    IF @EsAdmin = 0
    BEGIN
        SELECT @Sucu_Id = e.Sucu_Id
        FROM [dbCredirapi].[Gral].[tbEmpleados] e
        WHERE e.Empl_Id = @Empl_Id;
    END


    SELECT 
        [Papa_Id], 
        [Papa_Financiamiento], 
        [Papa_Precio_Mercado], 
        ma.Marc_Id,
        ma.Marc_Descripcion,
        m.Mode_Id,
        m.Mode_Descripcion,
        CONCAT(c.Clie_Nombre ,' ', c.Clie_Apellido) AS Cliente,
        c.Clie_Id,
        v.Vehi_Id,
        [Papa_Intereses_Porcentaje], 
        [Papa_Intereses_Monto], 
        [Papa_Numero_Cuota], 
        [Papa_Mora], 
        [Papa_Estado_PlanesPagos], 
        [Papa_Fecha_Emision], 
        [Papa_Fecha_Finalizacion]
    FROM 
        [Cred].[tbPlanesPagos] pp 
        INNER JOIN [Cred].[tbVehiculosPorClientes] vc ON vc.Vecl_Id = pp.Vecl_Id 
        INNER JOIN [Cred].[tbVehiculos] v ON v.Vehi_Id = vc.Vehi_Id 
        INNER JOIN [Gral].[tbClientes] c ON c.Clie_Id = vc.Clie_Id 
        INNER JOIN [Cred].[tbModelos] m ON m.Mode_Id = v.Mode_Id 
        INNER JOIN [Gral].[tbMarcas] ma ON ma.Marc_Id = m.Marc_Id
		inner join [Gral].[tbEmpleados] e on e.Empl_Id = pp.Empl_Id
		inner join [Gral].[tbSucursales] sucu on sucu.Sucu_Id = e.Sucu_Id
    WHERE 
        pp.Papa_Estado = 1 
        AND vc.Vecl_Estado = 1 
        AND v.Vehi_Estado = 1 
        AND c.Clie_Estado = 1 
        AND m.Mode_Estado = 1 
        AND ma.Marc_Estado = 1
   
        AND (@EsAdmin = 1 OR sucu.Sucu_Id = @Sucu_Id);
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Actualizar]  
(@InteresRestados INT ,@Pacl_Id INT ,@Papa_Id INT, @Pacl_Monto_Pago MONEY, @Pacl_NumeroCuota INT, @Pacl_Fecha_Emision DATETIME, @Sucu_Id INT, @Pacl_Usua_Modi INT, @Pacl_Fecha_Modi DATETIME)
AS
BEGIN
	BEGIN TRY 
		BEGIN TRANSACTION;
		DECLARE @MontoInteres MONEY
		DECLARE @MontoCapitalPrevio MONEY
		DECLARE @MontoCapital MONEY
		DECLARE @MontoCapitalFinal MONEY
		DECLARE @FinanciamientoActual MONEY
		DECLARE @Financiamiento MONEY
		DECLARE @SaldoSumadoTotal MONEY
		DECLARE @SaldoActual MONEY
		DECLARE @SaldoSumado MONEY
		DECLARE @SaldoInicial MONEY
		DECLARE @PorcentajeMora INT
		DECLARE @Mora MONEY
		DECLARE @MontoMora MONEY
		DECLARE @Pacl_Mora_Saber BIT
		DECLARE @EstadoPago INT = 1
		DECLARE @InteresesT MONEY
		DECLARE @NumeroCuota INT
		DECLARE @SacarInteres MONEY 
		DECLARE @Capital MONEY
		DECLARE @NCuotas INT
		DECLARE @TotalInteres INT 
		DECLARE @OperacionInteres MONEY 
		DECLARE @RestarIntereses INT
		DECLARE @PagoTotal MONEY

		--Saco el saldo inicial de la cuota
		SELECT @SaldoActual = Pacl_Saldo_Inicial FROM Cred.tbPlanesPagosClientes WHERE Pacl_Id = @Pacl_Id

		--Obtengo cuanto es el total que se ha pagado al capital del plan de pago
		SELECT @SaldoSumado = Pacl_Saldo_Sumado FROM Cred.tbPlanesPagosClientes WHERE  Papa_Id = @Papa_Id

		SELECT @Financiamiento = Papa_Financiamiento FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id

		--Saco cuanto es de intereses--
		SELECT @MontoInteres = Pacl_Capital_Restar FROM Cred.tbPlanesPagosClientes WHERE Pacl_Id = @Pacl_Id

		--Obtengo si esa cuota tiene recargo de mora
		SELECT @Pacl_Mora_Saber = Pacl_Mora_Saber FROM Cred.tbPlanesPagosClientes  WHERE Pacl_Id = @Pacl_Id
		   
		--Si la cuota tiene recargo de mora, se le restara los interes mas la mora al Monto de pago
		IF (@Pacl_Mora_Saber = 1)
		BEGIN

			IF(@SaldoSumado < 0 )
			BEGIN
				SET @SaldoSumado = 0
			END
			
			--La primera cuota tendra como saldo inicial el monto del finaciamiento
			IF (@Pacl_NumeroCuota = 1)
			BEGIN
				--Saco el monto de la mora a pagar si la cuota tiene recargo
				SELECT @Mora = [Papa_Mora_Monto] FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id

				--Resto los interes por el monto pagado de la cuota
				SELECT @MontoCapitalPrevio = @Pacl_Monto_Pago - @MontoInteres

				--Resto la mora de la cantidad total que obtuve a restar previamente los intereses por el monto de pago  
				-- y saco cuando dinero se ira para el monto del capital 
				IF (@MontoCapitalPrevio > @Mora) 
				BEGIN 
					SELECT @MontoCapital = @MontoCapitalPrevio - @Mora
				END

				ELSE 
				BEGIN 
					SELECT @MontoCapital = @Mora - @MontoCapitalPrevio   
				END

				--Hago una suma de cuanto es el total que se ha pagado de dinero de la cuota sumando, el saldo sumado que tengo almacenado  
				--en las cuotas y le sumo el monto del capital a pagar que obtengo previamente, para asi saber cuanto dinero se ha pagado  
				--en total solo del capital
				SELECT @SaldoSumadoTotal = @MontoCapital + @SaldoSumado

				--Obtengo cuanto es el saldo Inicial para esa cuota, restando el total de dinero que se ha pagado menos el financiamiento 
				--de ese plan de pago
				DECLARE @SaldoInicial1 MONEY 
				DECLARE @SaldoSumado1 MONEY 

				SELECT @Capital = Pacl_Capital_Restar FROM Cred.tbPlanesPagosClientes  WHERE Pacl_Id = @Pacl_Id

				SET @SacarInteres = @Pacl_Monto_Pago - @Capital - @Mora
				
				IF(@InteresRestados <= 0)
				BEGIN
					SET @SacarInteres = 0
				END

				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Pago_Mora = @Mora,
					Pacl_Estado_Pago = @EstadoPago, Papa_Id = @Papa_Id, Pacl_Monto_Pago = @Pacl_Monto_Pago, 
					Pacl_Fecha_Emision = @Pacl_Fecha_Emision, Sucu_Id = @Sucu_Id, Pacl_Usua_Modi = @Pacl_Usua_Modi, 
					Pacl_Fecha_Modi= @Pacl_Fecha_Modi, Pacl_Pago_Intereses = @SacarInteres, Pacl_Pago_Capital = @MontoInteres
				WHERE Pacl_Id = @Pacl_Id

				SELECT @NCuotas = COUNT(Pacl_Id) FROM Cred.tbPlanesPagosClientes WHERE Papa_Id = @Papa_Id AND Pacl_Estado_Pago > 1

				SET @TotalInteres = @InteresRestados - @SacarInteres
								
				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Saldo_Sumado = @SaldoSumadoTotal
				WHERE Papa_Id = @Papa_Id

					--AQUI MANEJO EN CASO DE QUE EL CLIENTE INGRESE APORTE A LOS INTERESES MAS DINERO DE LO QUE DEBE
					--PARA QUE NO TIRE NUMERO NEGATIVOS
					IF(@TotalInteres <= 0)
					BEGIN
						SET @TotalInteres = 0
						SET @RestarIntereses = 0
						SET @PagoTotal = @Capital
					END

					ELSE
					BEGIN 
						SET @RestarIntereses = @TotalInteres / @NCuotas
						SET @PagoTotal = @RestarIntereses + @Capital
					END

				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Total_Pago = @PagoTotal, Pacl_Intereses_Restar = @RestarIntereses
				WHERE Papa_Id = @Papa_Id

					UPDATE Cred.tbPlanesPagos
					SET [Papa_Total_Intereses_Restados] = @TotalInteres
					WHERE Papa_Id = @Papa_Id

				IF (@Pacl_NumeroCuota = @NumeroCuota)
				BEGIN
					UPDATE [Cred].[tbPlanesPagos]
					SET [Papa_Estado] =  0
					WHERE Papa_Id = @Papa_Id
				END

			END
			
			ELSE 
			BEGIN

				IF(@SaldoSumado < 0 )
				BEGIN
					SET @SaldoSumado = 0
				END
			
				--Saco el monto de la mora a pagar si la cuota tiene recargo
				SELECT @Mora = Papa_Mora_Monto FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id

				--Resto los interes por el monto pagado de la cuota
				SELECT @MontoCapitalPrevio = @Pacl_Monto_Pago - @MontoInteres

				--Resto la mora de la cantidad total que obtuve a restar previamente los intereses por el monto de pago  
				-- y saco cuando dinero se ira para el monto del capital 
				IF (@MontoCapitalPrevio > @Mora)
				BEGIN 
					SELECT @MontoCapital = @MontoCapitalPrevio - @Mora
				END

				ELSE
				BEGIN
					SELECT @MontoCapital = @Mora - @MontoCapitalPrevio 
				END
				

				--Hago una suma de cuanto es el total que se ha pagado de dinero de la cuota sumando, el saldo sumado que tengo almacenado  
				--en las cuotas y le sumo el monto del capital a pagar que obtengo previamente, para asi saber cuanto dinero se ha pagado  
				--en total solo del capital
				SELECT @SaldoSumadoTotal = @MontoCapital + @SaldoSumado

				--Obtengo cuanto es el saldo Inicial para esa cuota, restando el total de dinero que se ha pagado menos el financiamiento 
				--de ese plan de pago
				SELECT @SaldoInicial = @Financiamiento - @SaldoSumado

				SELECT @Capital = Pacl_Capital_Restar FROM Cred.tbPlanesPagosClientes  WHERE Pacl_Id = @Pacl_Id

				SET @SacarInteres = @Pacl_Monto_Pago - @Capital - @Mora

				IF(@InteresRestados <= 0)
				BEGIN
					SET @SacarInteres = 0
				END

				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Saldo_Sumado = @SaldoSumadoTotal, Pacl_Pago_Mora = @Mora, 
					Pacl_Estado_Pago = @EstadoPago , Papa_Id = @Papa_Id, Pacl_Monto_Pago = @Pacl_Monto_Pago, 
					Pacl_Fecha_Emision = @Pacl_Fecha_Emision, Sucu_Id = @Sucu_Id, Pacl_Usua_Modi = @Pacl_Usua_Modi, 
					Pacl_Fecha_Modi= @Pacl_Fecha_Modi, Pacl_Pago_Intereses = @SacarInteres, Pacl_Pago_Capital = @MontoInteres
				WHERE Pacl_Id = @Pacl_Id

				SELECT @NCuotas = COUNT(Pacl_Id) FROM Cred.tbPlanesPagosClientes WHERE Papa_Id = @Papa_Id AND Pacl_Estado_Pago > 1
				SET @TotalInteres = @InteresRestados - @SacarInteres

				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Saldo_Sumado = @SaldoSumadoTotal
				WHERE Papa_Id = @Papa_Id

					--AQUI MANEJO EN CASO DE QUE EL CLIENTE INGRESE APORTE A LOS INTERESES MAS DINERO DE LO QUE DEBE
					--PARA QUE NO TIRE NUMERO NEGATIVOS
					IF(@TotalInteres <= 0)
					BEGIN
						SET @TotalInteres = 0
						SET @RestarIntereses = 0
						SET @PagoTotal = @Capital
					END

					ELSE
					BEGIN 
						SET @RestarIntereses = @TotalInteres / @NCuotas
						SET @PagoTotal = @RestarIntereses + @Capital
					END

				UPDATE Cred.tbPlanesPagosClientes
				SET Pacl_Total_Pago = @PagoTotal, Pacl_Intereses_Restar = @RestarIntereses
				WHERE Papa_Id = @Papa_Id

					UPDATE Cred.tbPlanesPagos
					SET [Papa_Total_Intereses_Restados] = @TotalInteres
					WHERE Papa_Id = @Papa_Id

				IF (@Pacl_NumeroCuota = @NumeroCuota)
				BEGIN
					UPDATE [Cred].[tbPlanesPagos]
					SET [Papa_Estado] =  0
					WHERE Papa_Id = @Papa_Id
				END

			END
		END

		-- Si no tiene recargo de mora se le restaran solo los intereses
		ELSE 
		BEGIN
			IF (@Pacl_NumeroCuota = 1)
			BEGIN 
					--Resto los interes por el monto pagado de la cuota y obtengo cuanto dinero se ira para el monto del capital 
					if (@MontoInteres > @Pacl_Monto_Pago)
					BEGIN 
						SELECT @MontoCapital = @MontoInteres - @Pacl_Monto_Pago
					END

					ELSE 
					BEGIN
						SELECT @MontoCapital =  @Pacl_Monto_Pago - @MontoInteres
					END

					--Hago una suma de cuanto es el total de dinero que se ha pagado de la cuota sumando, el saldo sumado que tengo almacenado  
					--en las cuotas y le sumo el monto del capital a pagar que obtengo previamente, para asi saber cuanto dinero se ha pagado 
					--en total solo del capital
					SELECT @SaldoSumadoTotal =  @SaldoSumado + @MontoCapital 

					SELECT @Capital = Pacl_Capital_Restar FROM Cred.tbPlanesPagosClientes  WHERE Pacl_Id = @Pacl_Id

					SET @SacarInteres = @Pacl_Monto_Pago - @Capital

					IF(@InteresRestados <= 0)
					BEGIN
						SET @SacarInteres = 0
					END

					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Pago_Intereses = @SacarInteres, Pacl_Pago_Capital = @MontoInteres, Pacl_Pago_Mora = 0.00, 
						Pacl_Estado_Pago = @EstadoPago
						,Papa_Id = @Papa_Id, Pacl_Monto_Pago = @Pacl_Monto_Pago, 
						Pacl_Fecha_Emision = @Pacl_Fecha_Emision, Sucu_Id = @Sucu_Id, Pacl_Usua_Modi = @Pacl_Usua_Modi, 
						Pacl_Fecha_Modi= @Pacl_Fecha_Modi
					WHERE Pacl_Id = @Pacl_Id

					SELECT @NCuotas = COUNT(Pacl_Id) FROM Cred.tbPlanesPagosClientes WHERE Papa_Id = @Papa_Id AND Pacl_Estado_Pago > 1

					SET @TotalInteres = @InteresRestados - @SacarInteres

					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Saldo_Sumado = @SaldoSumadoTotal
					WHERE Papa_Id = @Papa_Id


					--AQUI MANEJO EN CASO DE QUE EL CLIENTE INGRESE APORTE A LOS INTERESES MAS DINERO DE LO QUE DEBE
					--PARA QUE NO TIRE NUMERO NEGATIVOS
					IF(@TotalInteres <= 0)
					BEGIN
						SET @TotalInteres = 0
						SET @RestarIntereses = 0
						SET @PagoTotal = @Capital
					END

					ELSE
					BEGIN 
						SET @RestarIntereses = @TotalInteres / @NCuotas
						SET @PagoTotal = @RestarIntereses + @Capital
					END

					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Total_Pago = @PagoTotal, Pacl_Intereses_Restar = @RestarIntereses
					WHERE Papa_Id = @Papa_Id

					UPDATE Cred.tbPlanesPagos
					SET [Papa_Total_Intereses_Restados] = @TotalInteres
					WHERE Papa_Id = @Papa_Id

					IF (@Pacl_NumeroCuota = @NumeroCuota)
					BEGIN
						UPDATE [Cred].[tbPlanesPagos]
						SET [Papa_Estado] =  0
						WHERE Papa_Id = @Papa_Id
					END

			END

			ELSE 
			BEGIN 
					--Resto los interes por el monto pagado de la cuota y obtengo cuanto dinero se ira para el monto del capital 
					IF (@Pacl_Monto_Pago > @MontoInteres)
					BEGIN 
						SELECT @MontoCapital = @Pacl_Monto_Pago - @MontoInteres
					END

					ELSE 
					BEGIN 
						SELECT @MontoCapital = @MontoInteres - @Pacl_Monto_Pago 
					END

					--Hago una suma de cuanto es el total de dinero que se ha pagado de la cuota sumando, el saldo sumado que tengo almacenado  
					--en las cuotas y le sumo el monto del capital a pagar que obtengo previamente, para asi saber cuanto dinero se ha pagado 
					--en total solo del capital
					SELECT @SaldoSumadoTotal = @MontoCapital +  @SaldoSumado 

					--Obtengo cuanto es el saldo Inicial para esa cuota, sumando el total de dinero que se ha pagado menos el financiamiento 
					--de ese plan de pago
					SELECT @SaldoInicial = @Financiamiento - @SaldoSumado

					SELECT @Capital = Pacl_Capital_Restar FROM Cred.tbPlanesPagosClientes  WHERE Pacl_Id = @Pacl_Id

					SET @SacarInteres = @Pacl_Monto_Pago - @Capital

					IF(@InteresRestados <= 0)
					BEGIN
						SET @SacarInteres = 0
					END

					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Pago_Intereses = @SacarInteres, Pacl_Pago_Capital = @MontoInteres, Pacl_Pago_Mora = 0.00, 
						Pacl_Estado_Pago = @EstadoPago
						,Papa_Id = @Papa_Id, Pacl_Monto_Pago = @Pacl_Monto_Pago, 
						Pacl_Fecha_Emision = @Pacl_Fecha_Emision, Sucu_Id = @Sucu_Id, Pacl_Usua_Modi = @Pacl_Usua_Modi, 
						Pacl_Fecha_Modi= @Pacl_Fecha_Modi
					WHERE Pacl_Id = @Pacl_Id

					SELECT @NCuotas = COUNT(Pacl_Id) FROM Cred.tbPlanesPagosClientes WHERE Papa_Id = @Papa_Id AND Pacl_Estado_Pago > 1
					SET @TotalInteres = @InteresRestados - @SacarInteres

					--AQUI MANEJO EN CASO DE QUE EL CLIENTE INGRESE APORTE A LOS INTERESES MAS DINERO DE LO QUE DEBE
					--PARA QUE NO TIRE NUMERO NEGATIVOS
					IF(@TotalInteres <= 0)
					BEGIN
						SET @TotalInteres = 0
						SET @RestarIntereses = 0
						SET @PagoTotal = @Capital
					END

					ELSE
					BEGIN 
						SET @RestarIntereses = @TotalInteres / @NCuotas
						SET @PagoTotal = @RestarIntereses + @Capital
					END
					
					
					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Total_Pago = @PagoTotal
					WHERE Papa_Id = @Papa_Id


					UPDATE Cred.tbPlanesPagosClientes
					SET Pacl_Saldo_Sumado = @SaldoSumadoTotal, Pacl_Intereses_Restar = @RestarIntereses
					WHERE Papa_Id = @Papa_Id

					UPDATE Cred.tbPlanesPagos
					SET [Papa_Total_Intereses_Restados] = @TotalInteres
					WHERE Papa_Id = @Papa_Id

					IF (@Pacl_NumeroCuota = @NumeroCuota)
					BEGIN
						UPDATE [Cred].[tbPlanesPagos]
						SET [Papa_Estado] =  0
						WHERE Papa_Id = @Papa_Id
					END
			END
		END

		SELECT 1 AS Resultado
		COMMIT;
	END TRY 
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH 
END

GO
/****** Object:  StoredProcedure [Cred].[SP_PLanesPagosClientes_ActualizarEstadoPago]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PLanesPagosClientes_ActualizarEstadoPago] 
@Pacl_Id INT 
AS
BEGIN
	BEGIN TRY
		UPDATE [Cred].[tbPlanesPagosClientes]
		SET [Pacl_Estado_Pago] = 1
		WHERE Pacl_Id = @Pacl_Id
		SELECT 1 AS RESULTADO
	END TRY 
	BEGIN CATCH 
		SELECT 1 AS RESULTADO
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Buscar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Buscar] 
@Clie_DNI VARCHAR(MAX)
AS
BEGIN
	DECLARE @NumeroCuota INT
	DECLARE @SaldoSumado MONEY
	DECLARE @Financiamiento MONEY
	DECLARE @SaldoRestante MONEY
	DECLARE @Codigo INT 
	DECLARE @Saber INT

	SELECT @SaldoSumado = ppc.Pacl_Saldo_Sumado, @Financiamiento = ppc.Pacl_Financiamiento 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @NumeroCuota = COUNT(ppc.Pacl_NumeroCuota) 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @SaldoRestante = @Financiamiento - @SaldoSumado

	IF (@Codigo = @NumeroCuota)
	BEGIN 
		SELECT @Saber = 1
	END
	ELSE 
	BEGIN
		SELECT @Saber = 0
	END

	SELECT cl.Clie_DNI,
		   pp.Papa_Id, 
		   pp.Papa_Estado_PlanesPagos, 
		   pp.Papa_Financiamiento,
		   ppc.Pacl_Id,
		   ppc.Pacl_Fecha_Pago, 
		   ppc.Pacl_Fecha_PreviaPago, 
		   ppc.Pacl_Monto_Pago,
		   ppc.Pacl_Pago_Capital, 
		   ppc.Pacl_Pago_Intereses AS Pacl_Pago_Intereses,
		   ppc.Pacl_Intereses_Restar AS Pacl_Intereses_Restar,
		   pp.Papa_Total_Intereses_Restados AS Pacl_Total_Intereses,
		   ppc.Pacl_Capital_Restar ,
		   ppc.Pacl_Pago_Mora, 
		   ppc.Pacl_Saldo_Inicial, 
		   ppc.Pacl_Fecha_Emision,
		   ppc.Pacl_Saldo_Sumado, 
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN 'Si' WHEN 0 THEN 'No' END AS Pacl_Mora_Saber, 
		   ppc.[Pacl_NumeroCuota], 
		   CASE ppc.[Pacl_Estado_Pago] WHEN 1 THEN 'Pagada' WHEN 4 THEN 'Cuota Actual' WHEN 2 THEN 'Pendiente' WHEN 3 THEN 'No pagada' END AS  Pacl_Estado_Pago,		   pp.Papa_Intereses_Monto, 
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END AS Monto_Mora,
		   ([Pacl_Total_Pago] + (CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END) ) AS MinimoPagar
		   
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1
END 
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_BuscarFechaPrevia]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_BuscarFechaPrevia] 
@Clie_DNI VARCHAR(MAX)
AS
BEGIN

	DECLARE @NumeroCuota INT
	DECLARE @SaldoSumado MONEY
	DECLARE @Financiamiento MONEY
	DECLARE @SaldoRestante MONEY
	DECLARE @Codigo INT 
	DECLARE @Saber INT

	SELECT @SaldoSumado = ppc.Pacl_Saldo_Sumado, @Financiamiento = ppc.Pacl_Financiamiento 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @NumeroCuota = COUNT(ppc.Pacl_NumeroCuota) 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @SaldoRestante = @Financiamiento - @SaldoSumado

	IF (@Codigo = @NumeroCuota)
	BEGIN 
		SELECT @Saber = 1
	END
	ELSE 
	BEGIN
		SELECT @Saber = 0
	END

	SELECT cl.Clie_DNI,
		   pp.Papa_Id, 
		   pp.Papa_Estado_PlanesPagos, 
		   pp.Papa_Financiamiento,
		   ppc.Pacl_Id,
		   ppc.Pacl_Fecha_Pago, 
		   ppc.Pacl_Fecha_PreviaPago, 
		   ppc.Pacl_Monto_Pago,
		   ppc.Pacl_Pago_Capital, 
		   ppc.Pacl_Pago_Intereses AS Pacl_Pago_Intereses, 
		   ppc.Pacl_Intereses_Restar AS Pacl_Intereses_Restar,
		   pp.Papa_Total_Intereses_Restados AS Pacl_Total_Intereses,
		   ppc.Pacl_Capital_Restar ,
		   ppc.Pacl_Pago_Mora, 
		   ppc.Pacl_Fecha_Emision,
		   ppc.Pacl_Saldo_Inicial,
		   ppc.Pacl_Saldo_Sumado, 
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN 'Si' WHEN 0 THEN 'No' END AS Pacl_Mora_Saber, 
		   ppc.[Pacl_NumeroCuota], 
		   CASE ppc.[Pacl_Estado_Pago] WHEN 1 THEN 'Pagada' WHEN 4 THEN 'Cuota Actual' WHEN 2 THEN 'Pendiente' WHEN 3 THEN 'No pagada' END AS  Pacl_Estado_Pago,		   pp.Papa_Intereses_Monto, 
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END AS Monto_Mora,
		   ([Pacl_Total_Pago] + (CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END) ) AS MinimoPagar
		   
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Pacl_SaberFechaPrevia] = 1 AND [Papa_Estado] = 1
END 
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_BuscarPapaID]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_BuscarPapaID] 
@Clie_DNI VARCHAR(MAX)
AS
BEGIN
	DECLARE @NumeroCuota INT
	DECLARE @SaldoSumado MONEY
	DECLARE @Financiamiento MONEY
	DECLARE @SaldoRestante MONEY
	DECLARE @Codigo INT 
	DECLARE @Saber INT

	SELECT @SaldoSumado = ppc.Pacl_Saldo_Sumado, @Financiamiento = ppc.Pacl_Financiamiento 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @NumeroCuota = COUNT(ppc.Pacl_NumeroCuota) 
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI AND [Papa_Estado] = 1

	SELECT @SaldoRestante = @Financiamiento - @SaldoSumado

	IF (@Codigo = @NumeroCuota)
	BEGIN 
		SELECT @Saber = 1
	END
	ELSE 
	BEGIN
		SELECT @Saber = 0
	END

	DECLARE @SaberPago INT

	SELECT cl.Clie_DNI,  
		   pp.Papa_Id, 
		   pp.Papa_Estado_PlanesPagos, 
		   pp.Papa_Financiamiento,
		   ppc.Pacl_Id,
		   ppc.Pacl_Fecha_Pago, 
		   ppc.Pacl_Fecha_PreviaPago, 
		   ppc.Pacl_Monto_Pago,
		   ppc.Pacl_Pago_Capital, 
		   ppc.Pacl_Pago_Intereses AS Pacl_Pago_Intereses, 
		   ppc.Pacl_Intereses_Restar AS Pacl_Intereses_Restar,
		   pp.Papa_Total_Intereses_Restados AS Pacl_Total_Intereses,
		   ppc.Pacl_Capital_Restar , 
		   ppc.Pacl_Pago_Mora, 
		   ppc.Pacl_Saldo_Inicial, 
		   ppc.Pacl_Saldo_Sumado, 
		   ppc.Pacl_Fecha_Emision ,
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN 'Si' WHEN 0 THEN 'No' END AS Pacl_Mora_Saber, 
		   ppc.[Pacl_NumeroCuota], 
		   CASE ppc.[Pacl_Estado_Pago] WHEN 1 THEN 'Pagada' WHEN 4 THEN 'Cuota Actual' WHEN 2 THEN 'Pendiente' WHEN 3 THEN 'No pagada' END AS  Pacl_Estado_Pago,		   pp.Papa_Intereses_Monto, 
		   CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END AS Monto_Mora,
		   ([Pacl_Total_Pago] + (CASE ppc.[Pacl_Mora_Saber] WHEN 1 THEN pp.Papa_Mora_Monto WHEN 0 THEN 0.00 END) ) AS MinimoPagar
		   
	FROM Cred.tbPlanesPagosClientes ppc FULL JOIN Cred.tbPlanesPagos  pp
	ON ppc.Papa_Id = pp.Papa_Id  FULL JOIN Cred.tbVehiculosPorClientes  vc
	ON pp.Vecl_Id = vc.Vecl_Id FULL JOIN Gral.tbClientes  cl
	ON cl.Clie_Id = vc.Clie_Id
	WHERE cl.Clie_DNI = @Clie_DNI
END 
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Eliminar]
@Pacl_Id INT
AS
BEGIN
	 BEGIN TRY
		BEGIN TRANSACTION
		DELETE FROM Cred.tbPlanesPagosClientes
		WHERE Pacl_Id = @Pacl_Id
		SELECT 1 AS Resultado
		COMMIT;
	 END TRY 
	 BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK;
	 END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_FiltrasPorFecha]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_FiltrasPorFecha] 
@Papa_Id INT,
@FechaActual DATETime
AS
BEGIN
    SELECT Pacl_Id, Pacl_Fecha_Pago, Pacl_Fecha_PreviaPago  
    FROM Cred.tbPlanesPagosClientes 
    WHERE Papa_Id = @Papa_Id
	AND Pacl_Fecha_PreviaPago <= @FechaActual
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Insertar]
(@Papa_Id INT, @Pacl_Monto_Pago MONEY, @Pacl_Fecha_Emision DATETIME, @Sucu_Id INT, @Pacl_Usua_Creacion INT, @Pacl_Fecha_Creacion DATETIME)
AS
BEGIN
	BEGIN TRY 
		BEGIN TRANSACTION;
		DECLARE @MontoInteres MONEY
		DECLARE @MontoCapital MONEY
		DECLARE @UltimoId INT

		SELECT @MontoInteres = Papa_Intereses_Monto FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id

		INSERT INTO Cred.tbPlanesPagosClientes (Papa_Id, Pacl_Monto_Pago, Pacl_Fecha_Emision, Sucu_Id, Pacl_Usua_Creacion, Pacl_Fecha_Creacion)
		VALUES (@Papa_Id, @Pacl_Monto_Pago, @Pacl_Fecha_Emision, @Sucu_Id, @Pacl_Usua_Creacion, @Pacl_Fecha_Creacion)

		SELECT @UltimoId = SCOPE_IDENTITY()
		
		SELECT @MontoCapital = @MontoInteres - @Pacl_Monto_Pago

		UPDATE Cred.tbPlanesPagosClientes
		SET Pacl_Pago_Intereses = @MontoInteres, Pacl_Pago_Capital = @MontoCapital
		WHERE Pacl_Id = @UltimoId

		SELECT 1 AS Resultado
		COMMIT;
	END TRY 
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_InsertarCuotaActual]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_InsertarCuotaActual]
@Pacl_Id INT
AS
BEGIN
	BEGIN TRY 
		UPDATE [Cred].[tbPlanesPagosClientes]
		SET [Pacl_Estado_Pago] = 4
		WHERE Pacl_Id = @Pacl_Id

		SELECT 1 AS Resultado
	END TRY 
	BEGIN CATCH 
		SELECT -1 AS Resultado
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_InsertarFechas]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_InsertarFechas] 
@Pacl_Id INT, 
@Pacl_Fecha_Pago VARCHAR(MAX), 
@Pacl_Fecha_PreviaPago VARCHAR(MAX)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		UPDATE [Cred].[tbPlanesPagosClientes] 
		SET [Pacl_Fecha_Pago] = @Pacl_Fecha_Pago, [Pacl_Fecha_PreviaPago] = @Pacl_Fecha_PreviaPago
		WHERE [Pacl_Id] = @Pacl_Id 
		COMMIT;
		SELECT 1 AS Resultado
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK
	END CATCH
END


DELETE FROM [Cred].[tbPlanesPagosClientes] 
WHERE Papa_Id = 100
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_InsertarMora]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_InsertarMora] 
@Pacl_Id INT
AS
BEGIN
	BEGIN TRY 
		BEGIN TRANSACTION;
			
			DECLARE @Estado INT
			SELECT @Estado = Pacl_Estado_Pago FROM Cred.tbPlanesPagosClientes WHERE Pacl_Id = @Pacl_Id 

			IF (@Estado = 1)
			BEGIN
				UPDATE [Cred].[tbPlanesPagosClientes]
				SET [Pacl_Mora_Saber] = 1, [Pacl_Estado_Pago] = 1
				WHERE [Pacl_Id] = @Pacl_Id
			END

			ELSE 
			BEGIN
				UPDATE [Cred].[tbPlanesPagosClientes]
				SET [Pacl_Mora_Saber] = 1, [Pacl_Estado_Pago] = 3
				WHERE [Pacl_Id] = @Pacl_Id
			END
		COMMIT;
		SELECT 1 AS Resultado 
	END TRY 
	BEGIN CATCH
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_InsertarValorFechaPrevia]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_InsertarValorFechaPrevia]
@Pacl_Id INT
AS
BEGIN
	BEGIN TRY 
		BEGIN TRANSACTION;
			UPDATE [Cred].[tbPlanesPagosClientes]
			SET [Pacl_SaberFechaPrevia] = 1
			WHERE [Pacl_Id] = @Pacl_Id
		COMMIT;
		SELECT 1 AS Resultado 
	END TRY 
	BEGIN CATCH
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Llenar]
@Pacl_Id INT
AS
BEGIN
	SELECT [Pacl_Id], 
		   [Pacl_Monto_Pago], 
		   [Pacl_Pago_Capital], 
		   [Pacl_Pago_Intereses], 
		   [Pacl_Pago_Mora], 
		   [Pacl_Fecha_Emision],
		   pp.Papa_Financiamiento,
		   CONCAT(c.Clie_Nombre , ' ', c.Clie_Apellido) AS Cliente, 
		   ma.Marc_Descripcion, 
		   m.Mode_Descripcion,
		   CONCAT(s.Sucu_Direccion, ' ', mun.Muni_Descripcion, ' ', d.Dept_Descripcion) AS Sucursal,
		   [Pacl_Usua_Creacion],
		   usua1.Usua_Usuario AS Usua_Creacion,
		   [Pacl_Fecha_Creacion],
		   [Pacl_Usua_Modi],
		   usua2.Usua_Usuario AS Usua_Modi,
		   [Pacl_Fecha_Modi]

	FROM Cred.tbPlanesPagosClientes pc INNER JOIN Cred.tbPlanesPagos pp
	ON pc.Papa_Id = pp.Papa_Id INNER JOIN Gral.tbSucursales s 
	ON pc.Sucu_Id = s.Sucu_Id INNER JOIN Cred.tbVehiculosPorClientes vc
	ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
	ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c 
	ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
	ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
	ON ma.Marc_Id = m.Marc_Id INNER JOIN Gral.tbMunicipios mun
	ON s.Muni_Id = mun.Muni_Id INNER JOIN Gral.tbDepartamentos d
	ON mun.Dept_Id = d.Dept_Id INNER JOIN Acce.tbUsuarios usua1
	ON usua1.Usua_Id = PC.Pacl_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
	ON usua2.Usua_Id = pc.Pacl_Usua_Modi
	WHERE pc.Pacl_Estado = 1 AND pp.Papa_Estado = 1 AND vc.Vecl_Estado = 1 AND pc.Pacl_Id = @Pacl_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_LlenarPlanPago]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_LlenarPlanPago] 
@Papa_Id INT
AS
BEGIN
SELECT Pacl_Id, 
	   Papa_Id,
	   Pacl_Monto_Pago, 
	   Pacl_Pago_Capital, 
	   Pacl_Pago_Intereses, 
	   Pacl_Pago_Mora, 
	   Pacl_Fecha_Emision,
	   [Pacl_NumeroCuota], 
	   [Pacl_Fecha_Pago] ,
	   Pacl_Fecha_PreviaPago,
	   Pacl_Saldo_Inicial,
	   Pacl_Total_Pago, 
	   Pacl_Capital_Restar,
	   [Pacl_Intereses_Restar], 
	   [Pacl_Saldo],
	   [Pacl_Estado_Pago],
	   CASE [Pacl_Estado_Pago] WHEN 1 THEN '#72fc26' WHEN 2 THEN '#aaaa91' WHEN 3 THEN '#b9030f' WHEN 4 THEN '#CC5B1C' END AS Color
FROM [Cred].[tbPlanesPagosClientes] WHERE Papa_Id = @Papa_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Mostrar]
AS
BEGIN
	SELECT [Pacl_Id], 
		   [Pacl_Monto_Pago], 
		   [Pacl_Pago_Capital], 
		   [Pacl_Pago_Intereses], 
		   [Pacl_Pago_Mora], 
		   [Pacl_Fecha_Emision],
		   pp.Papa_Financiamiento,
		   CONCAT(c.Clie_Nombre , ' ', c.Clie_Apellido) AS Cliente, 
		   ma.Marc_Descripcion, 
		   m.Mode_Descripcion,
		   CONCAT(s.Sucu_Direccion, ' ', mun.Muni_Descripcion, ' ', d.Dept_Descripcion) AS Sucursal

	FROM Cred.tbPlanesPagosClientes pc INNER JOIN Cred.tbPlanesPagos pp
	ON pc.Papa_Id = pp.Papa_Id INNER JOIN Gral.tbSucursales s 
	ON pc.Sucu_Id = s.Sucu_Id INNER JOIN Cred.tbVehiculosPorClientes vc
	ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
	ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c 
	ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
	ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
	ON ma.Marc_Id = m.Marc_Id INNER JOIN Gral.tbMunicipios mun
	ON s.Muni_Id = mun.Muni_Id INNER JOIN Gral.tbDepartamentos d
	ON mun.Dept_Id = d.Dept_Id
	WHERE pc.Pacl_Estado = 1 AND pp.Papa_Estado = 1 AND vc.Vecl_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivil]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivil]
AS
BEGIN
        SELECT
            YEAR(Pacl.Papa_Fecha_Emision) AS Anio,
            MONTH(Pacl.Papa_Fecha_Emision) AS Mes,
            Estado.Esta_Descripcion,
            COUNT(*) AS CantidadPrestamos

        FROM
            [Cred].tbPlanesPagos AS Pacl
            LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id
            LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id
            LEFT JOIN Gral.tbClientes AS Clie ON Vecl.Clie_Id = Clie.Clie_Id
            LEFT JOIN Gral.tbEstadosCiviles AS Estado ON Clie.Esta_Id = Estado.Esta_Id
        GROUP BY
            YEAR(Pacl.Papa_Fecha_Emision),
            MONTH(Pacl.Papa_Fecha_Emision),
            Estado.Esta_Descripcion

 
    ORDER BY      YEAR(Pacl.Papa_Fecha_Emision),
            MONTH(Pacl.Papa_Fecha_Emision)
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivilFiltro]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivilFiltro]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
    SELECT 
	Estado.Esta_Descripcion, COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes] AS Pacl
        LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id
        LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id
        LEFT JOIN Gral.tbClientes AS Clie ON Vecl.Clie_Id = Clie.Clie_Id
        LEFT JOIN Gral.tbEstadosCiviles AS Estado ON Clie.Esta_Id = Estado.Esta_Id
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
        AND
        (@SucursalId = 100 OR Pacl.Sucu_Id = @SucursalId)
        
    GROUP BY
        Estado.Esta_Descripcion;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorMes]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorMes]
AS
BEGIN
    SELECT
        YEAR(Papa_Fecha_Emision) AS Anio,
        MONTH(Papa_Fecha_Emision) AS Mes,
	
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].tbPlanesPagos
		where Papa_Estado=1
    GROUP BY
        YEAR(Papa_Fecha_Emision),
        MONTH(Papa_Fecha_Emision)
		
    ORDER BY
        YEAR(Papa_Fecha_Emision) DESC,
        MONTH(Papa_Fecha_Emision) DESC
		
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorMesFiltro]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorMesFiltro]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
    SELECT
        YEAR(Pacl_Fecha_Emision) AS Anio,
        MONTH(Pacl_Fecha_Emision) AS Mes,
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes]
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
        AND
        (@SucursalId = 100 OR Sucu_Id = @SucursalId)
    GROUP BY
        YEAR(Pacl_Fecha_Emision),
        MONTH(Pacl_Fecha_Emision)
    ORDER BY
        YEAR(Pacl_Fecha_Emision) DESC,
        MONTH(Pacl_Fecha_Emision) DESC;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorModelo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorModelo]
AS
BEGIN
    SELECT
		TOP 5
        YEAR(Pacl.Papa_Fecha_Emision) AS Anio,
        MONTH(Pacl.Papa_Fecha_Emision) AS Mes,
			Mode.Mode_Descripcion,
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].tbPlanesPagos AS Pacl LEFT JOIN Cred.tbPlanesPagos AS PlanPago
		ON Pacl.Papa_Id = PlanPago.Papa_Id LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl 
		ON PlanPago.Vecl_Id = Vecl.Vecl_Id LEFT JOIN Cred.tbVehiculos AS Vehi
		ON Vecl.Vehi_Id = Vehi.Vehi_Id LEFT JOIN Cred.tbModelos AS Mode 
		ON Vehi.Mode_Id = Mode.Mode_Id
    GROUP BY
        YEAR(Pacl.Papa_Fecha_Emision),
        MONTH(Pacl.Papa_Fecha_Emision),
			Mode.Mode_Descripcion
    ORDER BY
	CantidadPrestamos DESC,
        YEAR(Pacl.Papa_Fecha_Emision) DESC,
        MONTH(Pacl.Papa_Fecha_Emision) DESC
		
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorModeloFiltro]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorModeloFiltro] 
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
SELECT TOP 5
        YEAR(Pacl_Fecha_Emision) AS Anio,
        MONTH(Pacl_Fecha_Emision) AS Mes,
        Mode.Mode_Descripcion,
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes] AS Pacl 
        LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id 
        LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id 
        LEFT JOIN Cred.tbVehiculos AS Vehi ON Vecl.Vehi_Id = Vehi.Vehi_Id 
        LEFT JOIN Cred.tbModelos AS Mode ON Vehi.Mode_Id = Mode.Mode_Id
				Left join [Gral].[tbSucursales] as sucu on sucu.Sucu_Id = Pacl.Sucu_Id
    WHERE
       Pacl_Fecha_Emision >= @FechaInicio AND 
        Pacl_Fecha_Emision <= @FechaFin AND
        (@SucursalId = 100 OR sucu.Sucu_Id = @SucursalId)
    GROUP BY
        YEAR(Pacl_Fecha_Emision),
        MONTH(Pacl_Fecha_Emision),
        Mode.Mode_Descripcion
    ORDER BY
        CantidadPrestamos DESC,
        YEAR(Pacl_Fecha_Emision) DESC,
        MONTH(Pacl_Fecha_Emision) DESC;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorSexo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorSexo]
AS
BEGIN
    SELECT
        YEAR(Pacl.Papa_Fecha_Emision) AS Anio,
        MONTH(Pacl.Papa_Fecha_Emision) AS Mes,
		CASE Clie.Clie_Sexo WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END AS Clie_Sexo,
        COUNT(*) AS CantidadPrestamos
    FROM 
        [Cred].tbPlanesPagos AS Pacl LEFT JOIN Cred.tbPlanesPagos AS PlanPago
		ON Pacl.Papa_Id = PlanPago.Papa_Id LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl 
		ON PlanPago.Vecl_Id = Vecl.Vecl_Id LEFT JOIN Gral.tbClientes AS Clie
		ON Vecl.Clie_Id = Clie.Clie_Id
    GROUP BY
        YEAR(Pacl.Papa_Fecha_Emision),
        MONTH(Pacl.Papa_Fecha_Emision),
			Clie.Clie_Sexo
    ORDER BY
        YEAR(Pacl.Papa_Fecha_Emision) DESC,
        MONTH(Pacl.Papa_Fecha_Emision) DESC
		
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_PrestamoPorSexoFiltro]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cred].[SP_PlanesPagosClientes_PrestamoPorSexoFiltro]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
    SELECT
        CASE Clie.Clie_Sexo WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END AS Clie_Sexo,
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes] AS Pacl 
        LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id 
        LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id 
        LEFT JOIN Gral.tbClientes AS Clie ON Vecl.Clie_Id = Clie.Clie_Id 
		Left join [Gral].[tbSucursales] as sucu on sucu.Sucu_Id = Pacl.Sucu_Id

    WHERE
       Pacl_Fecha_Emision >= @FechaInicio AND 
        Pacl_Fecha_Emision <= @FechaFin AND
        (@SucursalId = 100 OR sucu.Sucu_Id = @SucursalId)
    GROUP BY
        Clie.Clie_Sexo
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_ValidarClienteRepetido]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_ValidarClienteRepetido]
@Vecl_Id INT
AS
BEGIN
	SELECT * FROM Cred.tbPlanesPagos  pp INNER JOIN Cred.tbVehiculosPorClientes vh 
	ON pp.Vecl_Id = vh.Vecl_Id
	WHERE pp.Papa_Estado = 1 AND Vh.Vecl_Id =@Vecl_Id  
END 
GO
/****** Object:  StoredProcedure [Cred].[SP_Reportes_ClientesMora]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Reportes_ClientesMora]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT 
AS
BEGIN
    SELECT
        pc.[Pacl_Id],
        YEAR(Pacl_Fecha_Emision) AS Anio,    
        MONTH(Pacl_Fecha_Emision) AS Mes,
        [Pacl_Pago_Mora], 
        CONCAT(c.Clie_Nombre , ' ', c.Clie_Apellido) AS Cliente, 
        ma.Marc_Descripcion, 
        m.Mode_Descripcion,
        CONCAT(s.Sucu_Direccion, ', ', mun.Muni_Descripcion, ', ', d.Dept_Descripcion) AS Sucursal

    FROM Cred.tbPlanesPagosClientes pc 
    INNER JOIN Cred.tbPlanesPagos pp ON pc.Papa_Id = pp.Papa_Id 
    INNER JOIN Gral.tbSucursales s ON pc.Sucu_Id = s.Sucu_Id 
    INNER JOIN Cred.tbVehiculosPorClientes vc ON vc.Vecl_Id = pp.Vecl_Id 
    INNER JOIN Cred.tbVehiculos v ON v.Vehi_Id = vc.Vehi_Id 
    INNER JOIN Gral.tbClientes c ON c.Clie_Id = vc.Clie_Id 
    INNER JOIN Cred.tbModelos m ON m.Mode_Id = v.Mode_Id 
    INNER JOIN Gral.tbMarcas ma ON ma.Marc_Id = m.Marc_Id 
    INNER JOIN Gral.tbMunicipios mun ON s.Muni_Id = mun.Muni_Id 
    INNER JOIN Gral.tbDepartamentos d ON mun.Dept_Id = d.Dept_Id 
    INNER JOIN Gral.tbEmpleados emp ON emp.Empl_Id = pp.Empl_Id
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND 
        Pacl_Fecha_Emision <= @FechaFin AND
        (@SucursalId = 100 OR s.Sucu_Id = @SucursalId) AND 
        pc.Pacl_Estado = 1 AND 
        pp.Papa_Estado = 1 AND 
        vc.Vecl_Estado = 1 AND
        pc.Pacl_Pago_Mora > 0 

    ORDER BY
        YEAR(Pacl_Fecha_Emision) DESC,
        MONTH(Pacl_Fecha_Emision) DESC;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_Reportes_PrestamoPorEstadoCivil]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cred].[SP_Reportes_PrestamoPorEstadoCivil]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
    SELECT 
	Estado.Esta_Descripcion, COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes] AS Pacl
        LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id
        LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id
        LEFT JOIN Gral.tbClientes AS Clie ON Vecl.Clie_Id = Clie.Clie_Id
        LEFT JOIN Gral.tbEstadosCiviles AS Estado ON Clie.Esta_Id = Estado.Esta_Id
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
        AND Pacl.Sucu_Id = @SucursalId
    GROUP BY
        Estado.Esta_Descripcion;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_Reportes_PrestamoPorMes]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Reportes_PrestamoPorMes]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT = NULL 
AS

BEGIN
    SELECT
        Pacl_Id,
        YEAR(Pacl_Fecha_Emision) AS Anio,
        MONTH(Pacl_Fecha_Emision) AS Mes,
        [Pacl_Monto_Pago], 
        [Pacl_Pago_Capital], 
        [Pacl_Pago_Intereses], 
        [Pacl_Pago_Mora], 
        pp.Papa_Financiamiento,
        CONCAT(c.Clie_Nombre, ' ', c.Clie_Apellido) AS Cliente, 
        ma.Marc_Descripcion, 
        m.Mode_Descripcion,
        CONCAT(s.Sucu_Direccion, ', ', mun.Muni_Descripcion, ', ', d.Dept_Descripcion) AS Sucursal
    FROM Cred.tbPlanesPagosClientes pc 
    INNER JOIN Cred.tbPlanesPagos pp ON pc.Papa_Id = pp.Papa_Id
    INNER JOIN Gral.tbSucursales s ON pc.Sucu_Id = s.Sucu_Id
    INNER JOIN Cred.tbVehiculosPorClientes vc ON vc.Vecl_Id = pp.Vecl_Id
    INNER JOIN Cred.tbVehiculos v ON v.Vehi_Id = vc.Vehi_Id
    INNER JOIN Gral.tbClientes c ON c.Clie_Id = vc.Clie_Id
    INNER JOIN Cred.tbModelos m ON m.Mode_Id = v.Mode_Id
    INNER JOIN Gral.tbMarcas ma ON ma.Marc_Id = m.Marc_Id
    INNER JOIN Gral.tbMunicipios mun ON s.Muni_Id = mun.Muni_Id
    INNER JOIN Gral.tbDepartamentos d ON mun.Dept_Id = d.Dept_Id
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
        AND (@SucursalId = 100 OR s.Sucu_Id = @SucursalId)
        AND pc.Pacl_Estado = 1 AND pp.Papa_Estado = 1 AND vc.Vecl_Estado = 1
    ORDER BY
        YEAR(Pacl_Fecha_Emision) DESC,
        MONTH(Pacl_Fecha_Emision) DESC;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_Reportes_PrestamoPorModelo]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Cred].[SP_Reportes_PrestamoPorModelo] 
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT
AS
BEGIN
SELECT
        YEAR(Pacl_Fecha_Emision) AS Anio,
        MONTH(Pacl_Fecha_Emision) AS Mes,
        Mode.Mode_Descripcion,
        COUNT(*) AS CantidadPrestamos
    FROM
        [Cred].[tbPlanesPagosClientes] AS Pacl 
        LEFT JOIN Cred.tbPlanesPagos AS PlanPago ON Pacl.Papa_Id = PlanPago.Papa_Id 
        LEFT JOIN Cred.tbVehiculosPorClientes AS Vecl ON PlanPago.Vecl_Id = Vecl.Vecl_Id 
        LEFT JOIN Cred.tbVehiculos AS Vehi ON Vecl.Vehi_Id = Vehi.Vehi_Id 
        LEFT JOIN Cred.tbModelos AS Mode ON Vehi.Mode_Id = Mode.Mode_Id
    WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
        AND Pacl.Sucu_Id = @SucursalId
    GROUP BY
        YEAR(Pacl_Fecha_Emision),
        MONTH(Pacl_Fecha_Emision),
        Mode.Mode_Descripcion
    ORDER BY       
        YEAR(Pacl_Fecha_Emision) DESC,
        MONTH(Pacl_Fecha_Emision) DESC;
END;
GO
/****** Object:  StoredProcedure [Cred].[SP_Reportes_VentasEmpleado]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [Cred].[SP_Reportes_VentasEmpleado]
    @FechaInicio VARCHAR (10),
    @FechaFin VARCHAR (10),
    @SucursalId INT 
AS
BEGIN
    SELECT
        YEAR(Pacl_Fecha_Emision) AS Anio,	
        MONTH(Pacl_Fecha_Emision) AS Mes,
		CONCAT(emp.Empl_Nombre ,' ', emp.Empl_Apellido) AS Empleado,
	       [Pacl_Id], 
		   [Pacl_Monto_Pago], 
		   [Pacl_Pago_Capital], 
		   [Pacl_Pago_Intereses], 
		   [Pacl_Pago_Mora], 
		   pp.Papa_Financiamiento,
		   CONCAT(c.Clie_Nombre , ' ', c.Clie_Apellido) AS Cliente, 
		   ma.Marc_Descripcion, 
		   m.Mode_Descripcion,
		   CONCAT(s.Sucu_Direccion, ', ', mun.Muni_Descripcion) AS Sucursal

	FROM Cred.tbPlanesPagosClientes pc INNER JOIN Cred.tbPlanesPagos pp
	ON pc.Papa_Id = pp.Papa_Id INNER JOIN Gral.tbSucursales s 
	ON pc.Sucu_Id = s.Sucu_Id INNER JOIN Cred.tbVehiculosPorClientes vc
	ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
	ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c 
	ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
	ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
	ON ma.Marc_Id = m.Marc_Id INNER JOIN Gral.tbMunicipios mun
	ON s.Muni_Id = mun.Muni_Id INNER JOIN Gral.tbDepartamentos d
	ON mun.Dept_Id = d.Dept_Id inner join [Gral].[tbEmpleados] emp
	on emp.Empl_Id = pp.Empl_Id
		WHERE
        Pacl_Fecha_Emision >= @FechaInicio AND Pacl_Fecha_Emision <= @FechaFin
             AND (@SucursalId = 100 OR s.Sucu_Id = @SucursalId) and  pc.Pacl_Estado = 1 AND pp.Papa_Estado = 1 AND vc.Vecl_Estado = 1
   
    ORDER BY
        YEAR(Pacl_Fecha_Emision) DESC,
       MONTH(Pacl_Fecha_Emision) DESC;

END;
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_TipoCuotas_Actualizar]
(@Ticu_Id INT, @Ticu_Descripcion VARCHAR(MAX), @Ticu_Usua_Modi INT, @Ticu_Fecha_Modi DATETIME)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE [Cred].[tbTipoCuotas] 
		SET [Ticu_Descripcion] = @Ticu_Descripcion, [Ticu_Usua_Creacion] = @Ticu_Usua_Modi, 
			[Ticu_Fecha_Creacion] = @Ticu_Fecha_Modi
		WHERE Ticu_Id = @Ticu_Id
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_TipoCuotas_Eliminar]
(@Ticu_Id INT)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		UPDATE [Cred].[tbTipoCuotas] 
		SET Ticu_Estado = 0
		WHERE Ticu_Id = @Ticu_Id
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_TipoCuotas_Insertar]
(@Ticu_Descripcion VARCHAR(MAX), @Ticu_Usua_Creacion INT, @Ticu_Fecha_Creacion DATETIME)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		INSERT INTO [Cred].[tbTipoCuotas] ([Ticu_Descripcion], [Ticu_Usua_Creacion], [Ticu_Fecha_Creacion])
		VALUES (@Ticu_Descripcion, @Ticu_Usua_Creacion, @Ticu_Fecha_Creacion)
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_TipoCuotas_Llenar]
(@Ticu_Id INT)
AS
BEGIN
SELECT [Ticu_Id], 
	   [Ticu_Descripcion], 
	   [Ticu_Usua_Creacion], 
	   usua1.Usua_Usuario as Usua_Creacion,
	   [Ticu_Fecha_Creacion], 
	   [Ticu_Usua_Modi], 
	   usua1.Usua_Usuario as Usua_Modifica,
	   [Ticu_Fecha_Modi] 
	   FROM Cred.tbTipoCuotas tp FULL JOIN Acce.tbUsuarios usua1
	   ON usua1.Usua_Id = tp.Ticu_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
	   ON usua2.Usua_Id = tp.Ticu_Usua_Modi
	   WHERE Ticu_Estado = 1 AND Ticu_Id = @Ticu_Id

END
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_TipoCuotas_Mostrar]
AS
BEGIN
SELECT [Ticu_Id], [Ticu_Descripcion] FROM Cred.tbTipoCuotas WHERE Ticu_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[sp_Vehiculo_ImagenPorCliente]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[sp_Vehiculo_ImagenPorCliente] 
AS 
BEGIN
	SELECT v.Vehi_Id ,m.Mode_Descripcion, mar.Marc_Descripcion, c.Clie_Nombre FROM Cred.tbVehiculos v INNER JOIN Cred.tbModelos m 
	ON v.Mode_Id = m.Mode_Id INNER JOIN Cred.tbVehiculosPorClientes vc
	ON vc.Vehi_Id = v.Vehi_Id INNER JOIN Gral.tbClientes c 
	ON c.Clie_Id = vc.Clie_Id  INNER JOIN Gral.tbMarcas mar
	ON mar.Marc_Id = m.Marc_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Vehiculos_Actualizar](
	@Vehi_Id INT,
	@Vehi_Placa VARCHAR (20),
	@Vehi_Descripcion VARCHAR (MAX),
	@Vehi_Color VARCHAR (100),
	@Vehi_Anio INT,
	@Mode_Id INT,
	@Vehi_Usua_Modifica INT,
	@Vehi_Fecha_Modifica DATETIME

)
AS
BEGIN
BEGIN TRY 
	UPDATE [Cred].[tbVehiculos]
	SET
	Vehi_Placa = @Vehi_Placa,
	Vehi_Descripcion = @Vehi_Descripcion,
	Vehi_Color = @Vehi_Color,
	Vehi_Anio = @Vehi_Anio,
	Mode_Id = @Mode_Id,
	Vehi_Usua_Modifica = @Vehi_Usua_Modifica,
	Vehi_Fecha_Modifica = @Vehi_Fecha_Modifica
	WHERE Vehi_Id = @Vehi_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Vehiculos_Eliminar](
	@Vehi_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Cred].[tbVehiculos]
	SET Vehi_Estado = 0
	WHERE Vehi_Id = @Vehi_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_IngresarPlaca]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Vehiculos_IngresarPlaca] 
@Vehi_Placa VARCHAR (20)
AS
BEGIN
	SELECT 
		Vehi.Vehi_Id,
		Vehi.Vehi_Placa,
		Vehi.Vehi_Color,
		Vehi.Vehi_Anio,
		Mode.Mode_Descripcion,
		Marc.Marc_Descripcion
	FROM Cred.tbVehiculos AS Vehi LEFT JOIN Cred.tbModelos AS Mode
	ON Vehi.Mode_Id = Mode.Mode_Id LEFT JOIN Gral.tbMarcas AS Marc
	ON Mode.Marc_Id = Marc.Marc_Id
	WHERE  Vehi.Vehi_Placa = @Vehi_Placa
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Vehiculos_Insertar](
	@Vehi_Placa VARCHAR (MAX),
	@Vehi_Descripcion VARCHAR (MAX),
	@Vehi_Color VARCHAR (MAX),
    @Vehi_Anio VARCHAR (MAX),
	@Mode_Id INT,
    @Vehi_Usua_Creacion INT,
    @Vehi_Fecha_Creacion DATETIME, 
	@UltimoID INT OUTPUT
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Vehi_Estado FROM [Cred].[tbVehiculos] WHERE Vehi_Placa = @Vehi_Placa;

    BEGIN TRY
        IF @estadoActual IS NOT NULL
        BEGIN
           
            IF @estadoActual = 0
            BEGIN
                
                UPDATE [Cred].[tbVehiculos] SET Vehi_Estado = 1 WHERE Vehi_Placa = @Vehi_Placa;
                SELECT 1;
            END
            ELSE
            BEGIN
              
                SELECT 0;
            END
        END
        ELSE
        BEGIN

            INSERT INTO [Cred].[tbVehiculos] (Vehi_Descripcion,Vehi_Placa,Vehi_Color,Vehi_Anio,Mode_Id, Vehi_Usua_Creacion, Vehi_Fecha_Creacion)
            VALUES (@Vehi_Descripcion,@Vehi_Placa,@Vehi_Color,@Vehi_Anio,@Mode_Id, @Vehi_Usua_Creacion, @Vehi_Fecha_Creacion);
			SET @UltimoID = SCOPE_IDENTITY()
        SELECT 1
        END
    END TRY
    BEGIN CATCH
       
        SELECT 0;
    END CATCH
END

GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Vehiculos_Llenar]
@Vehi_Id INT
AS
BEGIN
	SELECT	Vehi.Vehi_Id,
			Vehi.Vehi_Placa,
			Vehi.Vehi_Descripcion,
			Vehi.Vehi_Color,
			Vehi.Vehi_Anio,
			Vehi.Vehi_Usua_Creacion,
			Mode.Mode_Id,
			Mode.Mode_Descripcion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Vehi.Vehi_Fecha_Creacion,
			Vehi.Vehi_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Vehi.Vehi_Fecha_Modifica
	FROM Cred.tbVehiculos AS Vehi LEFT JOIN Cred.tbModelos AS Mode
	ON Vehi.Mode_Id = Mode.Mode_Id FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Mode.Mode_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Mode.Mode_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Vehi.Vehi_Id = @Vehi_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Cred].[SP_Vehiculos_Mostrar]
AS
BEGIN
	SELECT	Vehi.Vehi_Id,
			Vehi.Vehi_Placa,
			Vehi.Vehi_Color,
			Vehi.Vehi_Anio,
			Vehi.Vehi_Descripcion,
			Mode.Mode_Descripcion,
			Marc.Marc_Descripcion,
			Mode.Mode_Id, 
			Marc.Marc_Id
	FROM Cred.tbVehiculos AS Vehi LEFT JOIN Cred.tbModelos AS Mode
	ON Vehi.Mode_Id = Mode.Mode_Id  LEFT JOIN Gral.tbMarcas AS Marc
	ON Mode.Marc_Id = Marc.Marc_Id
	WHERE  Vehi.Vehi_Estado = 1 AND Mode.Mode_Estado = 1 AND Marc.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_VehiculosPorClientes_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_VehiculosPorClientes_Eliminar] 
(
	@Vecl_Id INT
)
AS
BEGIN
BEGIN TRY
	DELETE FROM [Cred].[tbVehiculosPorClientes]
	WHERE  Vecl_Id = @Vecl_Id 
	SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_VehiculosPorClientes_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_VehiculosPorClientes_Insertar]
	@Vehi_Id INT,
	@Clie_Id INT,
	@Vecl_Usua_Creacion INT,
	@Vecl_Fecha_Creacion DATETIME
AS
BEGIN
	BEGIN TRY
		INSERT INTO Cred.tbVehiculosPorClientes (Vehi_Id,Clie_Id,Vecl_Usua_Creacion,Vecl_Fecha_Creacion)
		VALUES (@Vehi_Id,@Clie_Id,@Vecl_Usua_Creacion,@Vecl_Fecha_Creacion)
		SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_VehiculosPorClientes_Listar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Cred].[SP_VehiculosPorClientes_Listar] 
AS
BEGIN
	SELECT	
	Vecl_Id, 
	VehiClie.Clie_Id,
	CONCAT(c.Clie_Nombre, ' ', c.Clie_Apellido) AS Cliente, 
	Vehi.Vehi_Id,
	Vehi.Vehi_Color,
	Vehi.Vehi_Anio,
	Mode.Mode_Descripcion,
	Marc.Marc_Descripcion
	FROM Cred.tbVehiculosPorClientes AS VehiClie 
	LEFT JOIN Cred.tbVehiculos AS Vehi ON Vehi.Vehi_Id = VehiClie.Vehi_Id
	LEFT JOIN Cred.tbModelos AS Mode ON Vehi.Mode_Id = Mode.Mode_Id
	LEFT JOIN Gral.tbMarcas AS Marc ON Mode.Marc_Id = Marc.Marc_Id
	LEFT JOIN Gral.tbClientes c ON VehiClie.Clie_Id = c.Clie_Id
	WHERE VehiClie.Vecl_Estado = 1 AND Vehi.Vehi_Estado = 1 AND Mode.Mode_Estado = 1 AND Marc.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_VehiculosPorClientes_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Cred].[SP_VehiculosPorClientes_Mostrar] 
@Clie_Id INT
AS
BEGIN
	SELECT	VehiClie.Clie_Id,
	Vehi.Vehi_Id,
	Vehi.Vehi_Color,
	Vehi.Vehi_Anio,
	Mode.Mode_Descripcion,
	Marc.Marc_Descripcion
	FROM Cred.tbVehiculosPorClientes AS VehiClie 
	LEFT JOIN Cred.tbVehiculos AS Vehi ON Vehi.Vehi_Id = VehiClie.Vehi_Id
	LEFT JOIN Cred.tbModelos AS Mode ON Vehi.Mode_Id = Mode.Mode_Id
	LEFT JOIN Gral.tbMarcas AS Marc ON Mode.Marc_Id = Marc.Marc_Id
	WHERE  Vehi.Vehi_Estado = 1 AND VehiClie.Clie_Id = @Clie_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Cargos_Actualizar](
	@Carg_Id INT, 
	@Carg_Descripcion VARCHAR (50),
	@Carg_Usua_Modifica INT,
	@Carg_Fecha_Modifica DATETIME

)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbCargos]
	SET
	Carg_Descripcion = @Carg_Descripcion, 
	Carg_Usua_Modifica = @Carg_Usua_Modifica,
	Carg_Fecha_Modifica = @Carg_Fecha_Modifica
	WHERE Carg_Id = @Carg_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Cargos_Eliminar](
	@Carg_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbCargos]
	SET Carg_Estado = 0
	WHERE Carg_Id = @Carg_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[SP_Cargos_Insertar](
    @Carg_Descripcion VARCHAR (50),
    @Carg_Usua_Creacion INT,
    @Carg_Fecha_Creacion DATETIME
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Carg_Estado FROM [Gral].[tbCargos] WHERE Carg_Descripcion = @Carg_Descripcion;

    BEGIN TRY
        IF @estadoActual IS NOT NULL
        BEGIN
           
            IF @estadoActual = 0
            BEGIN
                
                UPDATE [Gral].[tbCargos] SET Carg_Estado = 1 WHERE Carg_Descripcion = @Carg_Descripcion;
                SELECT 1;
            END
            ELSE
            BEGIN
              
                SELECT 0;
            END
        END
        ELSE
        BEGIN

            INSERT INTO [Gral].[tbCargos] (Carg_Descripcion, Carg_Usua_Creacion, Carg_Fecha_Creacion)
            VALUES (@Carg_Descripcion, @Carg_Usua_Creacion, @Carg_Fecha_Creacion);
        SELECT 1
        END
    END TRY
    BEGIN CATCH
       
        SELECT 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Cargos_Llenar]
@Carg_Id INT
AS
BEGIN
	SELECT	Carg.Carg_Id,
			Carg.Carg_Descripcion,
			Carg.Carg_Usua_Creacion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Carg.Carg_Fecha_Creacion,
			Carg.Carg_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Carg.Carg_Fecha_Modifica
	FROM Gral.tbCargos AS Carg FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Carg.Carg_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Carg.Carg_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Carg.Carg_Id = @Carg_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[SP_Cargos_Mostrar]
AS
BEGIN
	SELECT	Carg.Carg_Id,
			Carg.Carg_Descripcion
	FROM Gral.tbCargos AS Carg
	WHERE Carg.Carg_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Gral].[SP_Clientes_Actualizar](
	@Clie_Id INT, 
	@Clie_DNI VARCHAR (50),
	@Clie_Nombre VARCHAR (50), 
	@Clie_Apellido VARCHAR (50), 
	@Clie_Sexo CHAR (1),
	@Clie_Telefono INT,
	@Esta_Id INT, 
	@Muni_Id VARCHAR(4),
	@Clie_Usua_Modifica INT, 
	@Clie_Fecha_Modifica DATETIME 

)
AS
BEGIN
BEGIN TRY
	UPDATE [Gral].[tbClientes]
	SET Clie_DNI = @Clie_DNI,
	Clie_Nombre = @Clie_Nombre, 
	Clie_Apellido = @Clie_Apellido, 
	Clie_Sexo = @Clie_Sexo,  
	Clie_Telefono = @Clie_Telefono,
	Esta_Id = @Esta_Id, 
	Muni_Id = @Muni_Id, 
	Clie_Usua_Modifica = @Clie_Usua_Modifica, 
	Clie_Fecha_Modifica = @Clie_Fecha_Modifica 
	
	WHERE Clie_Id = @Clie_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[SP_Clientes_Eliminar](
	@Clie_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbClientes]
	SET Clie_Estado = 0
	WHERE Clie_Id = @Clie_Id

		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_IngresarDNI]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Clientes_IngresarDNI] 
@Clie_DNI VARCHAR (40)
AS
BEGIN
	SELECT 
		Clie.Clie_Id,
		Clie.Clie_DNI,
		Clie.Clie_Nombre + ' ' + Clie.Clie_Apellido AS Cliente
	FROM Gral.tbClientes AS Clie 
	WHERE  Clie.Clie_DNI = @Clie_DNI
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[SP_Clientes_Insertar] (
	@Clie_DNI VARCHAR (50),
	@Clie_Nombre VARCHAR (50), 
	@Clie_Apellido VARCHAR (50), 
	@Clie_Sexo CHAR (1),
	@Clie_Telefono INT,
	@Esta_Id INT, 
	@Muni_Id VARCHAR(4), 
	@Clie_Usua_Creacion INT, 
	@Clie_Fecha_Creacion DATETIME,
	@Clie_Id INT OUTPUT
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Clie_Estado FROM [Gral].[tbClientes] WHERE Clie_DNI = @Clie_DNI;
	BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
             
                UPDATE [Gral].[tbClientes] SET Clie_Estado = 1 WHERE Clie_DNI = @Clie_DNI;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
	INSERT INTO [Gral].[tbClientes] (Clie_DNI, Clie_Nombre, Clie_Apellido, Clie_Sexo,Clie_Telefono,Esta_Id, Muni_Id, Clie_Usua_Creacion, Clie_Fecha_Creacion)
	VALUES(@Clie_DNI, @Clie_Nombre, @Clie_Apellido, @Clie_Sexo,@Clie_Telefono, @Esta_Id, @Muni_Id, @Clie_Usua_Creacion, @Clie_Fecha_Creacion)
	SET @Clie_Id = SCOPE_IDENTITY();
	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
		END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_LLenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Clientes_LLenar]
@Clie_Id INT
AS
BEGIN
	SELECT	Clie.Clie_Id,
			Clie.Clie_DNI,
			Clie_Nombre,
			Clie_Apellido,
			Clie_Sexo,
			Clie_Telefono,
			Esta.Esta_Descripcion,
			Muni_Descripcion,
			Dept_Descripcion,
			Esta.Esta_Id,
			Muni.Muni_Id,
			Depa.Dept_Id,
			Clie_Fecha_Creacion,
			Clie_Usua_Creacion,
			Clie_Usua_Modifica,
			Clie_Fecha_Modifica,
			Creacion.Usua_Usuario AS Usua_Creacion,
			Modificacion.Usua_Usuario AS Usua_Modifica
			
	FROM Gral.tbClientes AS Clie LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Clie.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Clie.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	FULL JOIN Acce.tbUsuarios AS Creacion ON Clie.Clie_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Clie.Clie_Usua_Modifica = Modificacion.Usua_Id
	WHERE Clie.Clie_Id = @Clie_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Clientes_Mostrar]
AS
BEGIN
	SELECT	Clie.Clie_Id,
			Clie.Clie_DNI,
			Clie_Nombre,
			Clie_Apellido,
			Clie_Sexo,
			Clie_Telefono,
			Esta.Esta_Descripcion,
			Esta.Esta_Id,
			Muni.Muni_Descripcion,
			Muni.Muni_Id, 
			Depa.Dept_Descripcion, 
			Depa.Dept_Id
	FROM Gral.tbClientes AS Clie LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Clie.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Clie.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	WHERE Clie.Clie_Estado = 1 AND Esta.Esta_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Actualizar](
	@Dept_Id VARCHAR (2),
	@Dept_Descripcion VARCHAR (50),
	@Dept_Usua_Modifica INT, 
	@Dept_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY
	UPDATE [Gral].[tbDepartamentos] 
	SET 
	Dept_Descripcion = @Dept_Descripcion, 
	Dept_Usua_Modifica = @Dept_Usua_Modifica, 
	Dept_Fecha_Modifica = @Dept_Fecha_Modifica
	WHERE Dept_Id = @Dept_Id
	SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Eliminar](
	@Dept_Id VARCHAR (2)
)
AS
BEGIN
BEGIN TRY 
	DELETE FROM [Gral].[tbDepartamentos]
	WHERE Dept_Id = @Dept_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Insertar]( 
	@Dept_Id VARCHAR (2),
	@Dept_Descripcion VARCHAR (50), 
	@Dept_Usua_Creacion INT, 
	@Dept_Fecha_Creacion DATETIME,
	@UltimoID INT OUTPUT, 
	@Fecha VARCHAR(MAX) OUTPUT
)
AS
BEGIN
BEGIN TRY
	INSERT INTO [Gral].[tbDepartamentos] (Dept_Id,Dept_Descripcion, Dept_Usua_Creacion, Dept_Fecha_Creacion)
	VALUES(@Dept_Id,@Dept_Descripcion, @Dept_Usua_Creacion, @Dept_Fecha_Creacion)
	SET @UltimoID = 4
	SET @Fecha = GETDATE()
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Llenar](
	@Dept_Id VARCHAR (2)
)
AS
BEGIN
	SELECT Dept.Dept_Id,
			Dept.Dept_Descripcion,
			Dept.Dept_Usua_Creacion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Dept.Dept_Fecha_Creacion,
			Dept.Dept_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Dept.Dept_Fecha_Modifica
	FROM Gral.tbDepartamentos AS Dept FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Dept.Dept_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Dept.Dept_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Dept.Dept_Id = @Dept_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Mostrar]
AS
BEGIN
	SELECT	Depa.Dept_Id,
			Depa.Dept_Descripcion
	FROM Gral.tbDepartamentos AS Depa
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Actualizar](
	@Empl_Id INT,
	@Empl_DNI VARCHAR (50),
	@Empl_Nombre VARCHAR (50), 
	@Empl_Apellido VARCHAR (50), 
	@Empl_Sexo CHAR (1), 
	@Carg_Id INT, 
	@Empl_Correo VARCHAR(MAX),
	@Esta_Id INT, 
	@Muni_Id VARCHAR (4), 
	@Empl_Usua_Modifica INT, 
	@Empl_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY
	UPDATE [Gral].[tbEmpleados]
	SET 
	Empl_Nombre = @Empl_Nombre, 
	Empl_Apellido = @Empl_Apellido, 
	Empl_Sexo = @Empl_Sexo, 
	Esta_Id = @Esta_Id, 
	Muni_Id = @Muni_Id, 
	Carg_Id = @Carg_Id, 
	Empl_Usua_Modifica = @Empl_Usua_Modifica, 
	Empl_Fecha_Modifica = @Empl_Fecha_Modifica, 
	Empl_DNI = @Empl_DNI, 
	Empl_Correo = @Empl_Correo
	WHERE Empl_Id = @Empl_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END	
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Eliminar](
	@Empl_Id INT
)
AS
BEGIN
BEGIN TRY
	UPDATE [Gral].[tbEmpleados]
	SET Empl_Estado = 0
	WHERE Empl_Id = @Empl_Id
	SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_IngresarDNI]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_IngresarDNI] 
@Empl_DNI VARCHAR (40)
AS
BEGIN
	SELECT 
		Empl.Empl_Id,
		Empl.Empl_DNI,
		Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado
	FROM Gral.tbEmpleados AS Empl 
	WHERE  Empl.Empl_DNI = @Empl_DNI
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Insertar](
	@Empl_DNI VARCHAR (50),
	@Empl_Nombre VARCHAR (50), 
	@Empl_Apellido VARCHAR (50), 
	@Empl_Sexo CHAR (1), 
	@Esta_Id INT, 
	@Muni_Id VARCHAR(4), 
	@Carg_Id INT, 
	@Empl_Correo VARCHAR(MAX),
	@Empl_Usua_Creacion INT, 
	@Empl_Fecha_Creacion DATETIME
	
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Empl_Estado FROM Gral.[tbEmpleados] WHERE Empl_DNI = @Empl_DNI;
	BEGIN TRY
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
             
                UPDATE [Gral].[tbEmpleados] SET Empl_Estado = 1 WHERE Empl_DNI = @Empl_DNI;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
	INSERT INTO [Gral].[tbEmpleados] (Empl_DNI,Empl_Nombre, Empl_Apellido, Empl_Sexo,  Esta_Id, Muni_Id, Carg_Id, Empl_Usua_Creacion, Empl_Fecha_Creacion, [Empl_Correo])
	VALUES(@Empl_DNI,@Empl_Nombre, @Empl_Apellido, @Empl_Sexo, @Esta_Id, @Muni_Id, @Carg_Id, @Empl_Usua_Creacion, @Empl_Fecha_Creacion, @Empl_Correo)

	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END	
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Llenar] 
@Empl_Id INT
AS
BEGIN
	SELECT	Empl.Empl_Id,
			Empl.Empl_DNI,
			Empl.Empl_Nombre,
			Empl.Empl_Apellido,
			Empl.Empl_Sexo,
			Empl.Empl_Correo,
			Carg_Descripcion,
			Muni_Descripcion,
			Dept_Descripcion,
			Esta_Descripcion,
			Carg.Carg_Id,
			Esta.Esta_Id,
			Muni.Muni_Id,
			Depa.Dept_Id,
			Empl_Usua_Creacion,
			Empl_Fecha_Creacion,
			Empl_Usua_Modifica,
			Empl_Fecha_Modifica,
			Creacion.Usua_Usuario AS Creacion,
			Modificacion.Usua_Usuario AS Modifica
	FROM Gral.tbEmpleados AS Empl LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Empl.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbCargos AS Carg
	ON Empl.Carg_Id = Carg.Carg_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Empl.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	LEFT JOIN Acce.tbUsuarios AS Creacion ON Empl.Empl_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Empl.Empl_Usua_Modifica = Modificacion.Usua_Id
	WHERE Empl.Empl_Id = @Empl_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Mostrar]
AS
BEGIN
	SELECT	Empl.Empl_Id,
			Empl.Empl_DNI,
			Empl.Empl_Nombre,
			Empl.Empl_Apellido,
			Empl.Empl_Sexo,
			Empl.Empl_Correo,
			Carg.Carg_Descripcion,
			Carg.Carg_Id,
			Esta.Esta_Descripcion,
			Esta.Esta_Id,
			Muni.Muni_Descripcion,
			Muni.Muni_Id,
			Depa.Dept_Descripcion,
			Depa.Dept_Id

	FROM Gral.tbEmpleados AS Empl LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Empl.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbCargos AS Carg
	ON Empl.Carg_Id = Carg.Carg_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Empl.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	WHERE Empl.Empl_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_EstadosCiviles_Actualizar](
	@Esta_Id INT, 
	@Esta_Descripcion VARCHAR (50), 
	@Esta_Usua_Modifica INT, 
	@Esta_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY

	UPDATE [Gral].[tbEstadosCiviles]
	SET Esta_Descripcion = @Esta_Descripcion,  
	Esta_Usua_Modifica = @Esta_Usua_Modifica, 
	Esta_Fecha_Modifica = @Esta_Fecha_Modifica
	WHERE Esta_Id = @Esta_Id
	SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_EstadosCiviles_Eliminar](
	@Esta_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbEstadosCiviles]
	SET Esta_Estado = 0
	WHERE Esta_Id = @Esta_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_EstadosCiviles_Insertar](
	
	@Esta_Descripcion VARCHAR (50), 
	@Esta_Usua_Creacion INT, 
	@Esta_Fecha_Creacion DATETIME

)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Esta_Estado FROM [Gral].[tbEstadosCiviles] WHERE Esta_Descripcion = @Esta_Descripcion;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
             
                UPDATE [Gral].[tbEstadosCiviles] SET Esta_Estado = 1 WHERE Esta_Descripcion = @Esta_Descripcion;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
	INSERT INTO [Gral].[tbEstadosCiviles] (Esta_Descripcion,Esta_Usua_Creacion,Esta_Fecha_Creacion)
	VALUES ( @Esta_Descripcion, @Esta_Usua_Creacion, @Esta_Fecha_Creacion)

	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_EstadosCiviles_Llenar]
@Esta_Id INT
AS
BEGIN
	SELECT	Esta.Esta_Id,
			Esta.Esta_Descripcion,
			Esta.Esta_Usua_Creacion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Esta.Esta_Fecha_Creacion,
			Esta.Esta_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Esta.Esta_Fecha_Modifica
	FROM Gral.tbEstadosCiviles AS Esta FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Esta.Esta_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Esta.Esta_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Esta.Esta_Id = @Esta_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_EstadosCiviles_Mostrar]
AS
BEGIN
	SELECT	Esta.Esta_Id,
			Esta.Esta_Descripcion,
			Esta.Esta_Usua_Creacion,
			Esta_Fecha_Creacion,
			Esta.Esta_Usua_Modifica,
			Esta_Fecha_Modifica
	FROM Gral.tbEstadosCiviles AS Esta
	where [Esta_Estado] = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Marcas_Actualizar](
	@Marc_Id INT, 
	@Marc_Descripcion VARCHAR (100),
	@Marc_Usua_Modifica INT,
	@Marc_Fecha_Modifica DATETIME

)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbMarcas]
	SET
	Marc_Descripcion = @Marc_Descripcion, 
	Marc_Usuario_Modificiacion = @Marc_Usua_Modifica,
	Marc_Fecha_Modificacion = @Marc_Fecha_Modifica
	WHERE Marc_Id = @Marc_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Marcas_Eliminar](
	@Marc_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Gral].[tbMarcas]
	SET Marc_Estado = 0
	WHERE Marc_Id = @Marc_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Marcas_Insertar](
    @Marc_Descripcion VARCHAR (50),
    @Marc_Usua_Creacion INT,
    @Marc_Fecha_Creacion DATETIME
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Marc_Estado FROM [Gral].[tbMarcas] WHERE Marc_Descripcion = @Marc_Descripcion;

    BEGIN TRY
        IF @estadoActual IS NOT NULL
        BEGIN
           
            IF @estadoActual = 0
            BEGIN
                
                UPDATE [Gral].[tbMarcas] SET Marc_Estado = 1 WHERE Marc_Descripcion = @Marc_Descripcion;
                SELECT 1;
            END
            ELSE
            BEGIN
              
                SELECT 0;
            END
        END
        ELSE
        BEGIN

            INSERT INTO [Gral].[tbMarcas] (Marc_Descripcion, Marc_Usua_Creacion, Marc_Fecha_Creacion)
            VALUES (@Marc_Descripcion, @Marc_Usua_Creacion, @Marc_Fecha_Creacion);
        SELECT 1
        END
    END TRY
    BEGIN CATCH
       
        SELECT 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Gral].[SP_Marcas_Llenar]
@Marc_Id INT
AS
BEGIN
	SELECT	Marc.Marc_Id,
			Marc.Marc_Descripcion,
			Marc.Marc_Usua_Creacion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Marc.Marc_Fecha_Creacion,
			Marc.Marc_Usuario_Modificiacion,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Marc.Marc_Fecha_Modificacion
	FROM Gral.tbMarcas AS Marc FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Marc.Marc_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Marc.Marc_Usuario_Modificiacion = UsuaModi.Usua_Id

	WHERE Marc.Marc_Id = @Marc_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Marcas_Mostrar]
AS
BEGIN
	SELECT	Marc.Marc_Id,
			Marc.Marc_Descripcion
	FROM Gral.tbMarcas AS Marc
	WHERE Marc.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Actualizar](
	@Muni_Id VARCHAR (4), 
	@Muni_Descripcion VARCHAR (50), 
	@Dept_Id VARCHAR(2), 
	@Muni_Usua_Modifica INT, 
	@Muni_Fecha_Modifica DATETIME
)
AS
BEGIN
BEGIN TRY
	UPDATE [Gral].[tbMunicipios]
	SET Muni_Descripcion = @Muni_Descripcion, 
	Dept_Id = @Dept_Id, 
	Muni_Usua_Modifica = @Muni_Usua_Modifica, 
	Muni_Fecha_Modifica = @Muni_Fecha_Modifica
	WHERE Muni_Id = @Muni_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Eliminar](
	@Muni_Id VARCHAR (4)
)
AS
BEGIN
BEGIN TRY 
	DELETE FROM Gral.tbMunicipios
	WHERE Muni_Id = @Muni_Id

	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Insertar](
	 @Muni_Id VARCHAR (4),
	@Muni_Descripcion VARCHAR (50), 
	@Dept_Id VARCHAR (2), 
	@Muni_Usua_Creacion INT, 
	@Muni_Fecha_Creacion DATETIME
)
AS
BEGIN
BEGIN TRY
	INSERT INTO [Gral].[tbMunicipios] (Muni_Id,Muni_Descripcion,Dept_Id,Muni_Usua_Creacion,Muni_Fecha_Creacion)
	VALUES( @Muni_Id,@Muni_Descripcion, @Dept_Id, @Muni_Usua_Creacion, @Muni_Fecha_Creacion)
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Llenar] 
@Muni_Id VARCHAR (4)
AS
BEGIN
	SELECT		Muni.Muni_Id,
			Muni.Muni_Descripcion,
			Depa.Dept_Id,
			Depa.Dept_Descripcion,
			Muni.Muni_Usua_Creacion,
			UsuaCrea.Usua_Usuario AS Usua_Creacion,
			Muni.Muni_Fecha_Creacion,
			Muni.Muni_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Usua_Modifica,
			Muni.Muni_Fecha_Modifica
		
	FROM Gral.tbMunicipios AS Muni LEFT JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Id FULL JOIN Acce.tbUsuarios AS UsuaCrea
	ON Muni.Muni_Usua_Creacion = UsuaCrea.Usua_Id FULL JOIN Acce.tbUsuarios AS UsuaModi
	ON Muni.Muni_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Muni.Muni_Id = @Muni_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Mostrar]
AS
BEGIN
	SELECT		Muni_Id,
			Muni_Descripcion,
		   Dept_Descripcion,
		   Depa.Dept_Id
			
	FROM Gral.tbMunicipios AS Muni left JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_MostrarPorDepartamento]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_MostrarPorDepartamento]
@Dept_Id VARCHAR(2)
AS
BEGIN
	SELECT		Muni_Id,
			Muni_Descripcion,
			Muni.Dept_Id
			
	FROM Gral.tbMunicipios AS Muni INNER JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	WHERE Muni.Dept_Id = @Dept_Id;
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Actualizar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Actualizar]
(
@Sucu_Id INT, 
@Sucu_Calle VARCHAR(MAX), 
@Sucu_Direccion VARCHAR(MAX), 
@Muni_Id VARCHAR(4), 
@Sucu_Usua_Modi INT, 
@Sucu_Fecha_Modi DATETIME)
AS
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
		UPDATE [Gral].[tbSucursales] 
		SET [Sucu_Calle] = @Sucu_Calle, [Sucu_Direccion] = @Sucu_Direccion, 
			[Muni_Id] = Muni_Id, [Sucu_Usua_Modi] = @Sucu_Usua_Modi, [Sucu_Fecha_Modi] = @Sucu_Usua_Modi
		WHERE  Sucu_Id = @Sucu_Id
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Eliminar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Eliminar]
(
@Sucu_Id INT)
AS
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
		UPDATE [Gral].[tbSucursales] 
		SET Sucu_Estado = 0
		WHERE  Sucu_Id = @Sucu_Id
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Insertar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Insertar] 
(@Sucu_Calle VARCHAR(MAX), 
@Sucu_Direccion VARCHAR(MAX), 
@Muni_Id VARCHAR(4), 
@Sucu_Usua_Creacion INT, 
@Sucu_Fecha_Creacion DATETIME)
AS
BEGIN 
	BEGIN TRY
		BEGIN TRANSACTION;
		INSERT INTO [Gral].[tbSucursales] ([Sucu_Calle], [Sucu_Direccion], [Muni_Id], [Sucu_Usua_Creacion], [Sucu_Fecha_Creacion])
		VALUES (@Sucu_Calle, @Sucu_Direccion, @Muni_Id, @Sucu_Usua_Creacion, @Sucu_Fecha_Creacion)
		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH 
		SELECT -1 AS Resultado
		ROLLBACK;
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Llenar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Llenar]
@Sucu_Id INT
AS
BEGIN
SELECT [Sucu_Id], 
	   [Sucu_Calle], 
	   [Sucu_Direccion], 
	   m.Muni_Id,
	   m.Muni_Descripcion, 
	   d.Dept_Descripcion ,
	   d.Dept_Id,
	   [Sucu_Usua_Creacion],
	   usua1.Usua_Usuario AS Usua_Creacion, 
	   [Sucu_Fecha_Creacion],
	   [Sucu_Usua_Modi],
	   usua2.Usua_Usuario AS Usua_Modifica,
	   [Sucu_Fecha_Modi]
	   FROM Gral.tbSucursales s
       INNER JOIN Gral.tbMunicipios m ON s.Muni_Id = m.Muni_Id INNER JOIN Gral.tbDepartamentos d 
	   ON d.Dept_Id = m.Dept_Id FULL JOIN Acce.tbUsuarios usua1 
	   ON usua1.Usua_Id = s.Sucu_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
	   ON usua2.Usua_Id = s.Sucu_Usua_Modi
WHERE Sucu_Estado = 1 AND Sucu_Id = @Sucu_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Mostrar]    Script Date: 5/6/2024 08:57:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Mostrar] 
AS
BEGIN
SELECT [Sucu_Id], [Sucu_Calle], [Sucu_Direccion], m.Muni_Id , m.Muni_Descripcion, d.Dept_Id ,d.Dept_Descripcion FROM Gral.tbSucursales s
INNER JOIN Gral.tbMunicipios m ON s.Muni_Id = m.Muni_Id INNER JOIN Gral.tbDepartamentos d 
ON d.Dept_Id = m.Dept_Id
WHERE Sucu_Estado = 1
END
GO
