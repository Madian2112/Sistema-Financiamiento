USE [dbCredirapi]
GO
/****** Object:  User [Nadaim_SQLLogin_1]    Script Date: 30/04/2024 0:43:41 ******/
CREATE USER [Nadaim_SQLLogin_1] FOR LOGIN [Nadaim_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [Nadaim_SQLLogin_1]
GO
/****** Object:  Schema [Acce]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Acce]
GO
/****** Object:  Schema [Cred]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Cred]
GO
/****** Object:  Schema [Credi]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Credi]
GO
/****** Object:  Schema [Gral]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Gral]
GO
/****** Object:  Schema [Nadaim_SQLLogin_1]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Nadaim_SQLLogin_1]
GO
/****** Object:  Schema [Vent]    Script Date: 30/04/2024 0:43:41 ******/
CREATE SCHEMA [Vent]
GO
/****** Object:  Table [Acce].[tbPantallas]    Script Date: 30/04/2024 0:43:41 ******/
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
/****** Object:  Table [Acce].[tbPantallasPorRoles]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Acce].[tbRoles]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Acce].[tbUsuarios]    Script Date: 30/04/2024 0:43:42 ******/
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
 CONSTRAINT [PK__tbUsuari__E863C8EEB5EBA728] PRIMARY KEY CLUSTERED 
(
	[Usua_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbImagenesPorClientes]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Cred].[tbModelos]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Cred].[tbPlanesPagos]    Script Date: 30/04/2024 0:43:42 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Papa_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbPlanesPagosClientes]    Script Date: 30/04/2024 0:43:42 ******/
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
	[Pacl_Fecha_Emision] [datetime] NULL,
	[Sucu_Id] [int] NULL,
	[Pacl_Usua_Creacion] [int] NULL,
	[Pacl_Fecha_Creacion] [datetime] NULL,
	[Pacl_Usua_Modi] [int] NULL,
	[Pacl_Fecha_Modi] [datetime] NULL,
	[Pacl_Estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pacl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Cred].[tbTipoCuotas]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Cred].[tbVehiculos]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Cred].[tbVehiculosPorClientes]    Script Date: 30/04/2024 0:43:42 ******/
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
PRIMARY KEY CLUSTERED 
(
	[Vecl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbCargos]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbClientes]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbDepartamentos]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbEmpleados]    Script Date: 30/04/2024 0:43:42 ******/
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
 CONSTRAINT [PK__tbEmplea__2EB12E8610D447FA] PRIMARY KEY CLUSTERED 
(
	[Empl_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Gral].[tbEstadosCiviles]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbMarcas]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbMunicipios]    Script Date: 30/04/2024 0:43:42 ******/
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
/****** Object:  Table [Gral].[tbSucursales]    Script Date: 30/04/2024 0:43:42 ******/
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

INSERT [Acce].[tbPantallas] ([Pant_Id], [Pant_Descripcion], [Pant_Usua_Creacion], [Pant_Fecha_Creacion], [Pant_Usua_Modifica], [Pant_Fecha_Modifica], [Pant_Estado]) VALUES (1, N'Cargos', 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbPantallas] OFF
GO
SET IDENTITY_INSERT [Acce].[tbRoles] ON 

INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (1, N'Aseador', 1, CAST(N'2024-04-29T21:49:09.957' AS DateTime), 1, CAST(N'2024-04-29T21:53:46.163' AS DateTime), 0)
INSERT [Acce].[tbRoles] ([Rol_Id], [Rol_Descripcion], [Rol_Usua_Creacion], [Rol_Fecha_Creacion], [Rol_Usua_Modifica], [Rol_Fecha_Modifica], [Rol_Estado]) VALUES (2, N'Gerente', 1, CAST(N'2024-04-29T22:02:36.357' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Acce].[tbRoles] OFF
GO
SET IDENTITY_INSERT [Acce].[tbUsuarios] ON 

INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado]) VALUES (1, N'Admin', N'Admin', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado]) VALUES (2, N'Synxx', N'3C9909AFEC25354D551DAE21590BB26E38D53F2173B8D3DC3EEE4C047E7AB1C1EB8B85103E3BE7BA613B31BB5C9C36214DC9F14A42FD7A2FDB84856BCA5C44C2', 1, 2, 2, 1, CAST(N'2024-04-29T22:09:09.907' AS DateTime), 1, CAST(N'2024-04-29T22:10:48.217' AS DateTime), 1)
INSERT [Acce].[tbUsuarios] ([Usua_Id], [Usua_Usuario], [Usua_Contra], [Usua_Admin], [Empl_Id], [Rol_Id], [Usua_Usua_Creacion], [Usua_Fecha_Creacion], [Usua_Usua_Modifica], [Usua_Fecha_Modifica], [Usua_Estado]) VALUES (3, N'Prueba', N'0BA7C1F753B174AA04D3AEA086C8FD27A99FC16DA1705BBDE09C1CB3CBA565C1A1CDB93AFB06D7B147EB0203440A0BFCF2F943834A2BC3F41059A8FBD44DBA92', 1, 2, 2, 1, CAST(N'2024-04-29T22:11:26.940' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [Acce].[tbUsuarios] OFF
GO
SET IDENTITY_INSERT [Cred].[tbModelos] ON 

INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (4, N'Papaaaaa', 2, 1, CAST(N'2024-09-09T00:00:00.000' AS DateTime), 1, CAST(N'2024-04-30T00:09:00.717' AS DateTime), 0)
INSERT [Cred].[tbModelos] ([Mode_Id], [Mode_Descripcion], [Marc_Id], [Mode_Usua_Creacion], [Mode_Fecha_Creacion], [Mode_Usua_Modifica], [Mode_Fecha_Modifica], [Mode_Estado]) VALUES (5, N'Prueba', 2, 1, CAST(N'2024-04-30T00:08:00.873' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Cred].[tbModelos] OFF
GO
SET IDENTITY_INSERT [Cred].[tbVehiculos] ON 

INSERT [Cred].[tbVehiculos] ([Vehi_Id], [Vehi_Placa], [Vehi_Descripcion], [Vehi_Color], [Vehi_Anio], [Mode_Id], [Vehi_Usua_Creacion], [Vehi_Fecha_Creacion], [Vehi_Usua_Modifica], [Vehi_Fecha_Modifica], [Vehi_Estado]) VALUES (1, N'HFDS843', N'Sin capo', N'Verde', 2020, 5, 1, CAST(N'2024-04-30T00:10:26.383' AS DateTime), 1, CAST(N'2024-04-30T00:16:12.287' AS DateTime), 0)
SET IDENTITY_INSERT [Cred].[tbVehiculos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbCargos] ON 

INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (1, N'Modelo', 1, CAST(N'2024-04-29T21:35:00.847' AS DateTime), 1, CAST(N'2024-04-29T21:35:38.787' AS DateTime), 1)
INSERT [Gral].[tbCargos] ([Carg_Id], [Carg_Descripcion], [Carg_Usua_Creacion], [Carg_Fecha_Creacion], [Carg_Usua_Modifica], [Carg_Fecha_Modifica], [Carg_Estado]) VALUES (2, N'Gerente', 1, CAST(N'2024-04-29T21:35:54.110' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [Gral].[tbCargos] OFF
GO
SET IDENTITY_INSERT [Gral].[tbClientes] ON 

INSERT [Gral].[tbClientes] ([Clie_Id], [Clie_DNI], [Clie_Nombre], [Clie_Apellido], [Clie_Sexo], [Clie_Telefono], [Esta_Id], [Muni_Id], [Clie_Usua_Creacion], [Clie_Fecha_Creacion], [Clie_Usua_Modifica], [Clie_Fecha_Modifica], [Clie_Estado]) VALUES (1, N'123456789101', N'Kevin', N'Sosa', N'F', 509865, 1, N'0501', 1, CAST(N'2024-04-29T21:28:25.080' AS DateTime), 1, CAST(N'2024-04-29T21:29:34.680' AS DateTime), 0)
SET IDENTITY_INSERT [Gral].[tbClientes] OFF
GO
INSERT [Gral].[tbDepartamentos] ([Dept_Id], [Dept_Descripcion], [Dept_Usua_Creacion], [Dept_Fecha_Creacion], [Dept_Usua_Modifica], [Dept_Fecha_Modifica]) VALUES (N'05', N'Atlantida', 1, CAST(N'2024-04-29T20:36:36.347' AS DateTime), 1, CAST(N'2024-04-29T20:43:49.993' AS DateTime))
GO
SET IDENTITY_INSERT [Gral].[tbEmpleados] ON 

INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado]) VALUES (1, N'000000000', N'DSF', N'FDS', N'F', 1, N'0501', 1, 1, CAST(N'2024-04-29T21:47:08.023' AS DateTime), 1, CAST(N'2024-04-29T21:48:05.353' AS DateTime), 0)
INSERT [Gral].[tbEmpleados] ([Empl_Id], [Empl_DNI], [Empl_Nombre], [Empl_Apellido], [Empl_Sexo], [Esta_Id], [Muni_Id], [Carg_Id], [Empl_Usua_Creacion], [Empl_Fecha_Creacion], [Empl_Usua_Modifica], [Empl_Fecha_Modifica], [Empl_Estado]) VALUES (2, N'0000000000000', N'Prueba', N'Prueba', N'M', 1, N'0501', 1, 1, CAST(N'2024-04-29T22:01:43.870' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbEmpleados] OFF
GO
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] ON 

INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (1, N'Solterrr', 1, CAST(N'2024-04-29T21:13:20.103' AS DateTime), 1, CAST(N'2024-04-29T21:18:13.080' AS DateTime), 1)
INSERT [Gral].[tbEstadosCiviles] ([Esta_Id], [Esta_Descripcion], [Esta_Usua_Creacion], [Esta_Fecha_Creacion], [Esta_Usua_Modifica], [Esta_Fecha_Modifica], [Esta_Estado]) VALUES (2, N'Casado', 1, CAST(N'2024-04-29T21:18:35.693' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [Gral].[tbEstadosCiviles] OFF
GO
SET IDENTITY_INSERT [Gral].[tbMarcas] ON 

INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (1, N'Toyotaaa', 1, CAST(N'2024-04-29T23:40:51.300' AS DateTime), 1, CAST(N'2024-04-29T23:47:17.060' AS DateTime), 0)
INSERT [Gral].[tbMarcas] ([Marc_Id], [Marc_Descripcion], [Marc_Usua_Creacion], [Marc_Fecha_Creacion], [Marc_Usuario_Modificiacion], [Marc_Fecha_Modificacion], [Marc_Estado]) VALUES (2, N'Nissan', 1, CAST(N'2024-04-30T00:02:40.217' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [Gral].[tbMarcas] OFF
GO
INSERT [Gral].[tbMunicipios] ([Muni_Id], [Muni_Descripcion], [Dept_Id], [Muni_Usua_Creacion], [Muni_Fecha_Creacion], [Muni_Usua_Modifica], [Muni_Fecha_Modifica]) VALUES (N'0501', N'San Pedro', N'05', 1, CAST(N'2024-04-29T20:59:58.007' AS DateTime), 1, CAST(N'2024-04-29T21:03:21.077' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tbMarcas__2E48416819C7C283]    Script Date: 30/04/2024 0:43:51 ******/
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
ALTER TABLE [Cred].[tbPlanesPagosClientes] ADD  DEFAULT ((1)) FOR [Pacl_Estado]
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
/****** Object:  StoredProcedure [Acce].[SP_Pantallas_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Eliminar] 
(
	@Pant_ID INT,
	@Rol_ID INT
)
AS
BEGIN
BEGIN TRY
	DELETE FROM [Acce].[tbPantallasPorRoles]
	WHERE  Pant_Id = @Pant_ID AND Rol_Id = @Rol_ID
	SELECT 1
	END TRY
	BEGIN CATCH
	SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Insertar](
	@Rol_Id INT,
	@Pant_Id INT,
	@Paro_Usua_Creacion INT,
	@Paro_Fecha_Creacion DATETIME
)
AS
BEGIN
INSERT INTO Acce.tbPantallasPorRoles(Rol_Id,Pant_Id,Paro_Usua_Creacion,Paro_Fecha_Creacion)
VALUES (@Rol_Id,@Pant_Id,@Paro_Usua_Creacion,@Paro_Fecha_Creacion)
END
GO
/****** Object:  StoredProcedure [Acce].[SP_PantallasPorRoles_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_PantallasPorRoles_Mostrar] 
@Rol_Id INT
AS
BEGIN
	SELECT	PanRo.Rol_Id,
	PAN.Pant_Id,
			Pant_Descripcion
	FROM Acce.tbPantallasPorRoles AS PanRo 
	INNER JOIN Acce.tbPantallas AS PAN ON PAN.Pant_Id = PanRo.Pant_Id
	WHERE  Pan.Pant_Estado = 1 AND PanRo.Rol_Id = @Rol_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_Roles_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_Eliminar](
	@Rol_Id INT
)
AS
BEGIN
BEGIN TRY 
	UPDATE [Acce].[tbRoles]
	SET Rol_Estado = 0
	WHERE Rol_Id = @Rol_Id
	SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Roles_Insertar](
	
	@Rol_Descripcion VARCHAR (50), 
	@Rol_Usua_Creacion INT, 
	@Rol_Fecha_Creacion DATETIME,
	@role_id INT OUTPUT
)
AS
BEGIN
    DECLARE @estadoActual INT;

    SELECT @estadoActual = Rol_Estado FROM [Acce].[tbRoles] WHERE Rol_Descripcion = @Rol_Descripcion;
BEGIN TRY 
      IF @estadoActual IS NOT NULL
	     BEGIN
       
            IF @estadoActual = 0
            BEGIN
                -- El estado es 0, actualiza el estado a 1
                UPDATE [Acce].[tbRoles] SET Rol_Estado = 1 WHERE Rol_Descripcion = @Rol_Descripcion;
                SELECT 1
            END
            ELSE
            BEGIN
      
                SELECT 0;
            END
        END
        ELSE
        BEGIN
	INSERT INTO [Acce].[tbRoles] (Rol_Descripcion,Rol_Usua_Creacion,Rol_Fecha_Creacion)
	VALUES( @Rol_Descripcion, @Rol_Usua_Creacion, @Rol_Fecha_Creacion)
	SET @role_id = SCOPE_IDENTITY();
	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_LLenar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_Roles_LLenar]
@Rol_Id INT
AS
BEGIN
	SELECT	Rol.Rol_Id,
				Rol_Descripcion,
				Rol_Usua_Creacion,
				Rol_Usua_Modifica,
				Rol_Fecha_Creacion,
				Rol_Fecha_Modifica,
				Creacion.Usua_Usuario AS UsuarioCreacion,
				Modificacion.Usua_Usuario AS UsuarioModificacion
	FROM Acce.tbRoles AS Rol
	 LEFT JOIN Acce.tbUsuarios AS Creacion ON Rol.Rol_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Rol.Rol_Usua_Modifica = Modificacion.Usua_Id
	WHERE Rol.Rol_Estado = 1 AND Rol.Rol_Id = @Rol_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [Acce].[SP_Roles_Mostrar]
AS
BEGIN
	SELECT	
	Rol_Id,
				Rol_Descripcion
	FROM Acce.tbRoles AS Rol
	WHERE Rol.Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Roles_MostrarVistaMaster]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_InicioSesion]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Acce].[SP_Usuarios_InicioSesion]
	@Usuario VARCHAR (100),
	@Contra	VARCHAR (MAX)
AS
BEGIN

	SELECT usu.Usua_Id AS Usua_Id,
			usu.Usua_Usuario AS Usua_Nombre,
			usu.Usua_Contra AS Usua_Contraseña,
			emp.Empl_Nombre + ' ' + emp.Empl_Apellido AS Empl_Empleado,
			emp.Empl_Id,
			p.pant_descripcion,
			usu.Usua_Admin
	FROM Acce.tbUsuarios AS usu LEFT JOIN Gral.tbEmpleados AS emp
	ON usu.empl_id = emp.empl_id LEFT JOIN Acce.tbPantallasPorRoles AS R ON r.Rol_Id = usu.Rol_Id LEFT JOIN Acce.tbPantallas AS p ON p.pant_id = R.pant_id
	WHERE usu.usua_Usuario = @Usuario AND usu.usua_Contra = CONVERT (VARCHAR (MAX), HASHBYTES ('SHA2_512', @Contra), 2);
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
        Creacion.Usua_Usuario AS UsuarioCreacion,
        Usu.Usua_Fecha_Modifica,
        Modificacion.Usua_Usuario AS UsuarioModificacion 

    FROM Acce.tbUsuarios AS Usu 
    LEFT JOIN Gral.tbEmpleados AS Empl ON Usu.Empl_Id = Empl.Empl_Id 
    LEFT JOIN Acce.tbRoles AS Rol ON Usu.Rol_Id = Rol.Rol_Id 
    LEFT JOIN Acce.tbUsuarios AS Creacion ON Usu.Usua_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Usu.Usua_Usua_Modifica = Modificacion.Usua_Id
    WHERE Usu.Usua_Id = @Usua_Id
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
		Empl.Empl_Nombre + ' ' + Empl.Empl_Apellido AS Empleado,
		Rol.Rol_Descripcion 

	FROM Acce.tbUsuarios AS Usu LEFT JOIN Gral.tbEmpleados AS Empl
	ON Usu.Empl_Id = Empl.Empl_Id LEFT JOIN Acce.tbRoles AS Rol
	ON Usu.Rol_Id = Rol.Rol_Id 
	WHERE Usu.Usua_Estado = 1 AND  Rol.Rol_Estado = 1
END
GO
/****** Object:  StoredProcedure [Acce].[SP_Usuarios_Reestablecer]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_ImagenesPorClientes_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	ON Mode.Marc_Id = Marc.Marc_Id LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Mode.Mode_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Mode.Mode_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Mode.Mode_Id = @Mode_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Modelos_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Cred].[SP_Modelos_Mostrar]
AS
BEGIN
	SELECT	Mode.Mode_Id,
			Mode.Mode_Descripcion,
			Marc.Marc_Descripcion
	FROM Cred.tbModelos AS Mode LEFT JOIN Gral.tbMarcas AS Marc
	ON Mode.Marc_Id = Marc.Marc_Id  
	WHERE  Mode.Mode_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagos_Insertar]
(@Papa_Financiamiento MONEY, @Papa_Precio_Mercado MONEY, @Vecl_Id INT, @Ticu_Id INT, @Pap_Intereses_Porcentaje INT ,@Papa_Numero_Cuota INT, 
@Papa_Estado_PlanesPagos BIT, @Papa_Fecha_Emision DATETIME ,@Papa_Fecha_Finalizacion DATETIME, @Papa_Usua_Creacion INT,
@Papa_Fecha_Creacion DATETIME
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION;
		DECLARE @UltimoId INT
		DECLARE @InteresMonto MONEY


		INSERT INTO Cred.tbPlanesPagos (Papa_Financiamiento, Papa_Precio_Mercado, Vecl_Id, Ticu_Id, Papa_Intereses_Porcentaje ,Papa_Numero_Cuota, Papa_Estado_PlanesPagos, Papa_Fecha_Emision, Papa_Fecha_Finalizacion, [Papa_Usua_Creacion], [Papa_Fecha_Creacion])
		VALUES(@Papa_Financiamiento, @Papa_Precio_Mercado, @Vecl_Id, @Ticu_Id, @Pap_Intereses_Porcentaje ,@Papa_Numero_Cuota, @Papa_Estado_PlanesPagos, @Papa_Fecha_Emision, @Papa_Fecha_Finalizacion, @Papa_Usua_Creacion, @Papa_Fecha_Creacion)
		SELECT @UltimoId = SCOPE_IDENTITY()

		SELECT @InteresMonto = @Papa_Financiamiento * @Pap_Intereses_Porcentaje / 100

		UPDATE Cred.tbPlanesPagos
		SET Papa_Intereses_Monto = @InteresMonto
		WHERE Papa_Id = @UltimoId

		SELECT 1 AS Resultado
		COMMIT;
	END TRY
	BEGIN CATCH
		SELECT -1 AS Resultado 
		ROLLBACK
	END CATCH
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagos_Llenar]
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

		   FROM [Cred].[tbPlanesPagos] pp INNER JOIN [Cred].[tbTipoCuotas] tp
		   ON pp.[Ticu_Id] = tp.[Ticu_Id] INNER JOIN [Cred].[tbVehiculosPorClientes] vc
		   ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
		   ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c
		   ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
		   ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
		   ON ma.Marc_Id = m.Marc_Id INNER JOIN Acce.tbUsuarios usua1 
		   ON usua1.Usua_Id = pp.Papa_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
		   ON usua2.Usua_Id = pp.Papa_Usua_Modi
		   WHERE pp.Papa_Estado = 1 AND tp.Ticu_Estado = 1 AND vc.Vecl_Estado = 1 AND v.Vehi_Estado = 1 AND c.Clie_Estado = 1 AND
				 c.Clie_Estado = 1 AND m.Mode_Estado = 1 AND ma.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagos_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
		   ma.Marc_Descripcion,
		   m.Mode_Descripcion,
		   CONCAT(c.Clie_Nombre ,' ', c.Clie_Apellido) AS Cliente,
		   [Papa_Intereses_Porcentaje], 
		   [Papa_Intereses_Monto], 
		   [Papa_Numero_Cuota], 
		   [Papa_Mora], 
		   [Papa_Estado_PlanesPagos], 
		   [Papa_Fecha_Emision], 
		   [Papa_Fecha_Finalizacion]
		   FROM [Cred].[tbPlanesPagos] pp INNER JOIN [Cred].[tbTipoCuotas] tp
		   ON pp.[Ticu_Id] = tp.[Ticu_Id] INNER JOIN [Cred].[tbVehiculosPorClientes] vc
		   ON vc.Vecl_Id = pp.Vecl_Id INNER JOIN Cred.tbVehiculos v 
		   ON v.Vehi_Id = vc.Vehi_Id INNER JOIN Gral.tbClientes c
		   ON c.Clie_Id = vc.Clie_Id INNER JOIN Cred.tbModelos m 
		   ON m.Mode_Id = v.Mode_Id INNER JOIN Gral.tbMarcas ma
		   ON ma.Marc_Id = m.Marc_Id
		   WHERE pp.Papa_Estado = 1 AND tp.Ticu_Estado = 1 AND vc.Vecl_Estado = 1 AND v.Vehi_Estado = 1 AND c.Clie_Estado = 1 AND
				 c.Clie_Estado = 1 AND m.Mode_Estado = 1 AND ma.Marc_Estado = 1
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Cred].[SP_PlanesPagosClientes_Actualizar]
(@Pacl_Id INT ,@Papa_Id INT, @Pacl_Monto_Pago MONEY, @Pacl_Fecha_Emision DATETIME, @Sucu_Id INT, @Pacl_Usua_Modi INT, @Pacl_Fecha_Modi DATETIME)
AS
BEGIN
	BEGIN TRY 
		BEGIN TRANSACTION;
		DECLARE @MontoInteres MONEY
		DECLARE @MontoCapital MONEY

		SELECT @MontoInteres = Papa_Intereses_Monto FROM Cred.tbPlanesPagos WHERE Papa_Id = @Papa_Id

		UPDATE Cred.tbPlanesPagosClientes 
		SET Papa_Id = @Papa_Id, Pacl_Monto_Pago = @Pacl_Monto_Pago, Pacl_Fecha_Emision = @Pacl_Fecha_Emision, 
			Sucu_Id = @Sucu_Id, Pacl_Usua_Modi = @Pacl_Usua_Modi, Pacl_Fecha_Modi= @Pacl_Fecha_Modi
		WHERE Pacl_Id = @Pacl_Id
		
		SELECT @MontoCapital = @MontoInteres - @Pacl_Monto_Pago

		UPDATE Cred.tbPlanesPagosClientes
		SET Pacl_Pago_Intereses = @MontoInteres, Pacl_Pago_Capital = @MontoCapital
		WHERE Pacl_Id = @Pacl_Id

		SELECT 1 AS Resultado
		COMMIT;
	END TRY 
	BEGIN CATCH 
		SELECT -1 AS Resultado;
		ROLLBACK;
	END CATCH 
END
GO
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_PlanesPagosClientes_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	   usua1.Usua_Usuario as Usua_Modi,
	   [Ticu_Fecha_Modi] 
	   FROM Cred.tbTipoCuotas tp INNER JOIN Acce.tbUsuarios usua1
	   ON usua1.Usua_Id = tp.Ticu_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
	   ON usua2.Usua_Id = tp.Ticu_Usua_Modi
	   WHERE Ticu_Estado = 1 AND Ticu_Id = @Ticu_Id

END
GO
/****** Object:  StoredProcedure [Cred].[SP_TipoCuotas_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
    @Vehi_Fecha_Creacion DATETIME
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
        SELECT 1
        END
    END TRY
    BEGIN CATCH
       
        SELECT 0;
    END CATCH
END

GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	ON Vehi.Mode_Id = Mode.Mode_Id LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Mode.Mode_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Mode.Mode_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Vehi.Vehi_Id = @Vehi_Id
END
GO
/****** Object:  StoredProcedure [Cred].[SP_Vehiculos_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
			Mode.Mode_Descripcion
	FROM Cred.tbVehiculos AS Vehi LEFT JOIN Cred.tbModelos AS Mode
	ON Vehi.Mode_Id = Mode.Mode_Id  
	WHERE  Vehi.Vehi_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	FROM Gral.tbCargos AS Carg LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Carg.Carg_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Carg.Carg_Usua_Modifica = UsuaModi.Usua_Id

	WHERE Carg.Carg_Id = @Carg_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Cargos_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Clientes_IngresarDNI]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
	@Clie_Fecha_Creacion DATETIME
	
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

	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
		END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_LLenar]    Script Date: 30/04/2024 0:43:52 ******/
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
			Creacion.Usua_Usuario AS UsuarioCreacion,
			Modificacion.Usua_Usuario AS UsuarioModificacion
			
	FROM Gral.tbClientes AS Clie LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Clie.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Clie.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	LEFT JOIN Acce.tbUsuarios AS Creacion ON Clie.Clie_Usua_Creacion = Creacion.Usua_Id 
    LEFT JOIN Acce.tbUsuarios AS Modificacion ON Clie.Clie_Usua_Modifica = Modificacion.Usua_Id
	WHERE Clie.Clie_Id = @Clie_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Clientes_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
			Muni.Muni_Descripcion,
			Depa.Dept_Descripcion
	FROM Gral.tbClientes AS Clie LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Clie.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Clie.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	WHERE Clie.Clie_Estado = 1 AND Esta.Esta_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Departamentos_Insertar]( 
	@Dept_Id VARCHAR (2),
	@Dept_Descripcion VARCHAR (50), 
	@Dept_Usua_Creacion INT, 
	@Dept_Fecha_Creacion DATETIME
)
AS
BEGIN
BEGIN TRY
	INSERT INTO [Gral].[tbDepartamentos] (Dept_Id,Dept_Descripcion, Dept_Usua_Creacion, Dept_Fecha_Creacion)
	VALUES(@Dept_Id,@Dept_Descripcion, @Dept_Usua_Creacion, @Dept_Fecha_Creacion)
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	FROM Gral.tbDepartamentos AS Dept LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Dept.Dept_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Dept.Dept_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Dept.Dept_Id = @Dept_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Departamentos_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Empleados_Actualizar](
	@Empl_Id INT,
	@Empl_Nombre VARCHAR (50), 
	@Empl_Apellido VARCHAR (50), 
	@Empl_Sexo CHAR (1), 
	@Esta_Id INT, 
	@Muni_Id VARCHAR (4), 
	@Carg_Id INT, 
	@Empl_Usua_Modifica INT, 
	@Empl_Fecha_Modifica DATETIME, 
	@Empl_DNI VARCHAR (50)
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
	Empl_DNI = @Empl_DNI
	WHERE Empl_Id = @Empl_Id
		SELECT 1
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END	
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Empleados_IngresarDNI]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
	@Muni_Id VARCHAR (4), 
	@Carg_Id INT, 
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
	INSERT INTO [Gral].[tbEmpleados] (Empl_DNI,Empl_Nombre, Empl_Apellido, Empl_Sexo,  Esta_Id, Muni_Id, Carg_Id, Empl_Usua_Creacion, Empl_Fecha_Creacion)
	VALUES(@Empl_DNI,@Empl_Nombre, @Empl_Apellido, @Empl_Sexo, @Esta_Id, @Muni_Id, @Carg_Id, @Empl_Usua_Creacion, @Empl_Fecha_Creacion)

	SELECT 1
	END
	END TRY
	BEGIN CATCH
		SELECT 0
	END CATCH
END	
GO
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Empleados_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
			Carg.Carg_Descripcion,
			Esta.Esta_Descripcion,
			Muni.Muni_Descripcion,
			Depa.Dept_Descripcion
	FROM Gral.tbEmpleados AS Empl LEFT JOIN Gral.tbEstadosCiviles AS Esta
	ON Empl.Esta_Id = Esta.Esta_Id LEFT JOIN Gral.tbCargos AS Carg
	ON Empl.Carg_Id = Carg.Carg_Id LEFT JOIN Gral.tbMunicipios AS Muni
	ON Empl.Muni_Id = Muni.Muni_Id LEFT JOIN Gral.tbDepartamentos AS Depa
	ON Muni.Dept_Id = Depa.Dept_Id
	WHERE Empl.Empl_Estado = 1
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
			UsuaCrea.Usua_Usuario AS Creacion,
			Esta.Esta_Fecha_Creacion,
			Esta.Esta_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Modifica,
			Esta.Esta_Fecha_Modifica
	FROM Gral.tbEstadosCiviles AS Esta LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Esta.Esta_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Esta.Esta_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Esta.Esta_Id = @Esta_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_EstadosCiviles_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	FROM Gral.tbMarcas AS Marc LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Marc.Marc_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Marc.Marc_Usuario_Modificiacion = UsuaModi.Usua_Id

	WHERE Marc.Marc_Id = @Marc_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Marcas_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
			UsuaCrea.Usua_Usuario AS Creacion,
			Muni.Muni_Fecha_Creacion,
			Muni.Muni_Usua_Modifica,
			UsuaModi.Usua_Usuario AS Modifica,
			Muni.Muni_Fecha_Modifica
		
	FROM Gral.tbMunicipios AS Muni LEFT JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Id LEFT JOIN Acce.tbUsuarios AS UsuaCrea
	ON Muni.Muni_Usua_Creacion = UsuaCrea.Usua_Id LEFT JOIN Acce.tbUsuarios AS UsuaModi
	ON Muni.Muni_Usua_Modifica = UsuaModi.Usua_Id
	WHERE Muni.Muni_Id = @Muni_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Gral].[SP_Municipios_Mostrar]
AS
BEGIN
	SELECT		Muni_Id,
			Muni_Descripcion,
		Dept_Descripcion
			
	FROM Gral.tbMunicipios AS Muni left JOIN Gral.tbDepartamentos as Depa
	ON Muni.Dept_Id = Depa.Dept_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Municipios_MostrarPorDepartamento]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Actualizar]    Script Date: 30/04/2024 0:43:52 ******/
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
		SET [Sucu_Calle] = @Sucu_Calle, [Sucu_Direccion] = Sucu_Direccion, 
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
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Eliminar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Insertar]    Script Date: 30/04/2024 0:43:52 ******/
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
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Llenar]    Script Date: 30/04/2024 0:43:52 ******/
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
	   m.Muni_Descripcion, 
	   d.Dept_Descripcion ,
	   [Sucu_Usua_Creacion],
	   usua1.Usua_Usuario AS Usua_Creacion, 
	   [Sucu_Fecha_Creacion],
	   [Sucu_Usua_Modi],
	   usua2.Usua_Usuario AS Usua_Modi,
	   [Sucu_Fecha_Modi]
	   FROM Gral.tbSucursales s
       INNER JOIN Gral.tbMunicipios m ON s.Muni_Id = m.Muni_Id INNER JOIN Gral.tbDepartamentos d 
	   ON d.Dept_Id = m.Dept_Id INNER JOIN Acce.tbUsuarios usua1 
	   ON usua1.Usua_Id = s.Sucu_Usua_Creacion LEFT JOIN Acce.tbUsuarios usua2
	   ON usua2.Usua_Id = s.Sucu_Usua_Modi
WHERE Sucu_Estado = 1 AND Sucu_Id = @Sucu_Id
END
GO
/****** Object:  StoredProcedure [Gral].[SP_Sucursales_Mostrar]    Script Date: 30/04/2024 0:43:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [Gral].[SP_Sucursales_Mostrar] 
AS
BEGIN
SELECT [Sucu_Id], [Sucu_Calle], [Sucu_Direccion], m.Muni_Descripcion, d.Dept_Descripcion FROM Gral.tbSucursales s
INNER JOIN Gral.tbMunicipios m ON s.Muni_Id = m.Muni_Id INNER JOIN Gral.tbDepartamentos d 
ON d.Dept_Id = m.Dept_Id
WHERE Sucu_Estado = 1
END
GO
