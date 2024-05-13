using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.DataAcces.Repositorio
{
    public class ScriptBaseDatos
    {
        #region Usuarios
        public static string Usua_Mostrar = "Acce.SP_Usuarios_Mostrar";
        public static string Usua_Insertar = "Acce.SP_Usuarios_Insertar";
        public static string Usua_Actualizar = "Acce.SP_Usuarios_Actualizar";
        public static string Usua_Eliminar = "Acce.SP_Usuarios_Eliminar";
        public static string Usua_Detalles = "Acce.SP_Usuarios_Llenar";
        public static string Usua_Reestablecer = "[Acce].[SP_Usuarios_Reestablecer]";
        public static string Usua_Inicio = "Acce.SP_Usuarios_InicioSesion";
        #endregion

        #region Roles
        public static string Rol_Mostrar = "Acce.SP_Roles_Mostrar";
        public static string Rol_Insertar = "Acce.SP_Roles_Insertar";
        public static string Rol_Actualizar = "Acce.SP_Roles_Actualizar";
        public static string Rol_Eliminar = "Acce.SP_Roles_Eliminar";
        public static string Rol_Detalles = "Acce.SP_Roles_Llenar";
        #endregion

        #region Pantallas Por Roles
        public static string PantXRol_Insertar = "[Acce].[SP_PantallasPorRoles_Insertar]";
        public static string PantXRol_Eliminar = "[Acce].[SP_PantallasPorRoles_Eliminar]";
        public static string Pant_Mostrar2 = "[Acce].[SP_Pantallas_Mostrar2]";
        public static string Pant_Mostrar = "[Acce].[SP_Pantallas_Mostrar]";
        public static string PantxRoles_Mostrar = "[Acce].[SP_PantallasPorRoles_Mostrar]";
        #endregion

        #region Departamentos
        public static string Dept_Mostrar = "Gral.SP_Departamentos_Mostrar";
        public static string Dept_Insertar = "Gral.SP_Departamentos_Insertar";
        public static string Dept_Actualizar = "Gral.SP_Departamentos_Actualizar";
        public static string Dept_Eliminar = "Gral.SP_Departamentos_Eliminar";
        public static string Dept_Detalles = "Gral.SP_Departamentos_Llenar";
        public static string Dept_VistaMaestra = "[Gral].[SP_Departamentos_VistaMaster] ";
        public static string Dept_MuniXDepa = "[Gral].[SP_Municipios_MostrarPorDepartamento]";
        #endregion


        #region Municipios
        public static string Muni_Mostrar = "Gral.SP_Municipios_Mostrar";
        public static string Muni_Insertar = "Gral.SP_Municipios_Insertar";
        public static string Muni_Actualizar = "Gral.SP_Municipios_Actualizar";
        public static string Muni_Eliminar = "Gral.SP_Municipios_Eliminar";
        public static string Muni_Detalles = "Gral.SP_Municipios_Llenar";
        #endregion

        #region Clientes
        public static string Clie_Mostrar = "Gral.SP_Clientes_Mostrar";
        public static string Clie_Insertar = "Gral.SP_Clientes_Insertar";
        public static string Clie_Actualizar = "Gral.SP_Clientes_Actualizar";
        public static string Clie_Eliminar = "Gral.SP_Clientes_Eliminar";
        public static string Clie_Detalles = "Gral.SP_Clientes_Llenar";
        public static string Clie_IngresarDNI = "[Gral].[SP_Clientes_IngresarDNI]";
        #endregion

        #region Empleados
        public static string Empl_Mostrar = "Gral.SP_Empleados_Mostrar";
        public static string Empl_Insertar = "Gral.SP_Empleados_Insertar";
        public static string Empl_Actualizar = "Gral.SP_Empleados_Actualizar";
        public static string Empl_Eliminar = "Gral.SP_Empleados_Eliminar";
        public static string Empl_Detalles = "Gral.SP_Empleados_Llenar";
        #endregion

        #region Estados Civiles
        public static string Esta_Mostrar = "Gral.SP_EstadosCiviles_Mostrar";
        public static string Esta_Insertar = "Gral.SP_EstadosCiviles_Insertar";
        public static string Esta_Actualizar = "Gral.SP_EstadosCiviles_Actualizar";
        public static string Esta_Eliminar = "Gral.SP_EstadosCiviles_Eliminar";
        public static string Esta_Detalles = "Gral.SP_EstadosCiviles_Llenar";
        #endregion

        #region Cargos
        public static string Carg_Mostrar = "Gral.SP_Cargos_Mostrar";
        public static string Carg_Insertar = "Gral.SP_Cargos_Insertar";
        public static string Carg_Actualizar = "Gral.SP_Cargos_Actualizar";
        public static string Carg_Eliminar = "Gral.SP_Cargos_Eliminar";
        public static string Carg_Detalles = "Gral.SP_Cargos_Llenar";
        #endregion

        #region Marcas
        public static string Marc_Mostrar = "Gral.SP_Marcas_Mostrar";
        public static string Marc_Insertar = "Gral.SP_Marcas_Insertar";
        public static string Marc_Actualizar = "Gral.SP_Marcas_Actualizar";
        public static string Marc_Eliminar = "Gral.SP_Marcas_Eliminar";
        public static string Marc_Detalles = "Gral.SP_Marcas_Llenar";
        #endregion

        #region Modelos
        public static string Mode_Mostrar = "[Cred].[SP_Modelos_Mostrar]";
        public static string Mode_Insertar = "Cred.SP_Modelos_Insertar";
        public static string Mode_Actualizar = "Cred.SP_Modelos_Actualizar";
        public static string Mode_Eliminar = "Cred.SP_Modelos_Eliminar";
        public static string Mode_Detalles = "Cred.SP_Modelos_Llenar";
        #endregion

        #region Vehiculos
        public static string Vehi_Mostrar = "Cred.SP_Vehiculos_Mostrar";
        public static string Vehi_Insertar = "Cred.SP_Vehiculos_Insertar";
        public static string Vehi_Actualizar = "Cred.SP_Vehiculos_Actualizar";
        public static string Vehi_Eliminar = "Cred.SP_Vehiculos_Eliminar";
        public static string Vehi_Detalles = "Cred.SP_Vehiculos_Llenar";
        public static string Vehi_IngresarVehi = "[Cred].[SP_Vehiculos_IngresarPlaca]";
        public static string Vehi_ListCV = "[Cred].[SP_VehiculosPorClientes_Listar]";
        #endregion

        #region Vehiculos Por Clientes
        public static string Vecl_Mostrar = "[Cred].[SP_VehiculosPorClientes_Mostrar]";
        public static string Vecl_Insertar = "[Cred].[SP_VehiculosPorClientes_Insertar]";
        public static string Vecl_Eliminar = "[Cred].[SP_VehiculosPorClientes_Eliminar]";
        #endregion

        #region Sucursales
        public static string Sucu_Mostrar = "Gral.SP_Sucursales_Mostrar";
        public static string Sucu_Insertar = "Gral.SP_Sucursales_Insertar";
        public static string Sucu_Actualizar = "Gral.SP_Sucursales_Actualizar";
        public static string Sucu_Eliminar = "Gral.SP_Sucursales_Eliminar";
        public static string Sucu_Detalles = "Gral.SP_Sucursales_Llenar";
        #endregion

        #region Planes Pagos
        public static string Papa_Mostrar = "Cred.SP_PlanesPagos_Mostrar";
        public static string Papa_Insertar = "Cred.SP_PlanesPagos_Insertar";
        public static string Papa_Actualizar = "Cred.SP_PlanesPagos_Actualizar";
        public static string Papa_Eliminar = "Cred.SP_PlanesPagos_Eliminar";
        public static string Papa_Detalles = "Cred.SP_PlanesPagos_Llenar";
        #endregion


        #region Planes Pagos Clientes [Cred].[SP_PlanesPagosClientes_Buscar]
        public static string Pacl_Mostrar = "Cred.SP_PlanesPagosClientes_Mostrar";
        public static string Pacl_Insertar = "Cred.SP_PlanesPagosClientes_Insertar";
        public static string Pacl_InsertarFecha = "[Cred].[SP_PlanesPagosClientes_InsertarFechas]";
        public static string Pacl_LlenarPlanPago = "Cred.SP_PlanesPagosClientes_LlenarPlanPago";
        public static string Pacl_Actualizar = "[Cred].[SP_PlanesPagosClientes_Actualizar]";
        public static string Pacl_Eliminar = "Cred.SP_PlanesPagosClientes_Eliminar";
        public static string Pacl_Detalles = "Cred.SP_PlanesPagosClientes_Llenar";
        public static string Pacl_Buscar = "[Cred].[SP_PlanesPagosClientes_Buscar]";
        public static string Pacl_SaberMora = "Cred.SP_PlanesPagosClientes_InsertarMora";
        public static string Pacl_InsertarFechaPrevia = "Cred.SP_PlanesPagosClientes_InsertarValorFechaPrevia";
        public static string Pacl_BuscarFechaPrevia = "[Cred].[SP_PlanesPagosClientes_BuscarFechaPrevia]";
        public static string Pacl_PrestamoPorMes = "[Cred].[SP_PlanesPagosClientes_PrestamoPorMes]";
        public static string Pacl_PrestamoPorEstado = "[Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivil]";
        public static string Pacl_PrestamoPorSexo = "[Cred].[SP_PlanesPagosClientes_PrestamoPorSexo]";
        public static string Pacl_PrestamoPorModelo = "[Cred].[SP_PlanesPagosClientes_PrestamoPorModelo]";
        public static string Pacl_PrestamoPorMesFiltro = "[Cred].[SP_PlanesPagosClientes_PrestamoPorMesFiltro]";
        public static string Pacl_PrestamoPorEstadoFiltro = "[Cred].[SP_PlanesPagosClientes_PrestamoPorEstadoCivilFiltro]";
        public static string Pacl_PrestamoPorSexoFiltro = "[Cred].[SP_PlanesPagosClientes_PrestamoPorSexoFiltro]";
        public static string Pacl_PrestamoPorModeloFiltro = "[Cred].[SP_PlanesPagosClientes_PrestamoPorModeloFiltro]";

        #endregion

        #region Reportes
        public static string Repo_PrestamoPorMes = "[Cred].[SP_Reportes_PrestamoPorMes]";
        public static string Repo_PrestamoPorModelo = "[Cred].[SP_Reportes_PrestamoPorModelo]";
        public static string Repo_PrestamoPorSexo = "[Cred].[SP_PlanesPagosClientes_PrestamoPorSexoFiltro]";
        public static string Repo_PrestamoPorEstado = "[Cred].[SP_Reportes_PrestamoPorEstadoCivil]";
        #endregion

        #region Tipos Cuotas
        public static string Ticu_Mostrar = "Cred.SP_TipoCuotas_Mostrar";
        public static string Ticu_Insertar = "[Cred].[SP_TipoCuotas_Insertar]";
        public static string Ticu_Actualizar = "Cred.SP_TipoCuotas_Actualizar";
        public static string Ticu_Eliminar = "Cred.SP_TipoCuotas_Eliminar";
        public static string Ticu_Detalles = "Cred.SP_TipoCuotas_Llenar";
        #endregion

        #region Imagenes Por Clientes
        public static string Imcl_Insertar = "Cred.SP_ImagenesPorClientes_Insertar";
        #endregion
    }

}
