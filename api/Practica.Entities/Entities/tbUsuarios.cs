﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbUsuarios
    {
        public tbUsuarios()
        {
            InverseUsua_Usua_CreacionNavigation = new HashSet<tbUsuarios>();
            InverseUsua_Usua_ModificaNavigation = new HashSet<tbUsuarios>();
            tbCargosCarg_Usua_CreacionNavigation = new HashSet<tbCargos>();
            tbCargosCarg_Usua_ModificaNavigation = new HashSet<tbCargos>();
            tbClientesClie_Usua_CreacionNavigation = new HashSet<tbClientes>();
            tbClientesClie_Usua_ModificaNavigation = new HashSet<tbClientes>();
            tbDepartamentosDept_Usua_CreacionNavigation = new HashSet<tbDepartamentos>();
            tbDepartamentosDept_Usua_ModificaNavigation = new HashSet<tbDepartamentos>();
            tbEmpleadosEmpl_Usua_CreacionNavigation = new HashSet<tbEmpleados>();
            tbEmpleadosEmpl_Usua_ModificaNavigation = new HashSet<tbEmpleados>();
            tbEstadosCivilesEsta_Usua_CreacionNavigation = new HashSet<tbEstadosCiviles>();
            tbEstadosCivilesEsta_Usua_ModificaNavigation = new HashSet<tbEstadosCiviles>();
            tbImagenesPorClientesImcl_Usua_CreacionNavigation = new HashSet<tbImagenesPorClientes>();
            tbImagenesPorClientesImcl_Usua_ModificaNavigation = new HashSet<tbImagenesPorClientes>();
            tbMarcasMarc_Usua_CreacionNavigation = new HashSet<tbMarcas>();
            tbMarcasMarc_Usuario_ModificiacionNavigation = new HashSet<tbMarcas>();
            tbModelosMode_Usua_CreacionNavigation = new HashSet<tbModelos>();
            tbModelosMode_Usua_ModificaNavigation = new HashSet<tbModelos>();
            tbMunicipiosMuni_Usua_CreacionNavigation = new HashSet<tbMunicipios>();
            tbMunicipiosMuni_Usua_ModificaNavigation = new HashSet<tbMunicipios>();
            tbPantallasPant_Usua_CreacionNavigation = new HashSet<tbPantallas>();
            tbPantallasPant_Usua_ModificaNavigation = new HashSet<tbPantallas>();
            tbPantallasPorRolesParo_Usua_CreacionNavigation = new HashSet<tbPantallasPorRoles>();
            tbPantallasPorRolesParo_Usua_ModificaNavigation = new HashSet<tbPantallasPorRoles>();
            tbPlanesPagosClientesPacl_Usua_CreacionNavigation = new HashSet<tbPlanesPagosClientes>();
            tbPlanesPagosClientesPacl_Usua_ModiNavigation = new HashSet<tbPlanesPagosClientes>();
            tbPlanesPagosPapa_Usua_CreacionNavigation = new HashSet<tbPlanesPagos>();
            tbPlanesPagosPapa_Usua_ModiNavigation = new HashSet<tbPlanesPagos>();
            tbRolesRol_Usua_CreacionNavigation = new HashSet<tbRoles>();
            tbRolesRol_Usua_ModificaNavigation = new HashSet<tbRoles>();
            tbSucursalesSucu_Usua_CreacionNavigation = new HashSet<tbSucursales>();
            tbSucursalesSucu_Usua_ModiNavigation = new HashSet<tbSucursales>();
            tbTipoCuotasTicu_Usua_CreacionNavigation = new HashSet<tbTipoCuotas>();
            tbTipoCuotasTicu_Usua_ModiNavigation = new HashSet<tbTipoCuotas>();
            tbVehiculosPorClientesVecl_Usua_CreacionNavigation = new HashSet<tbVehiculosPorClientes>();
            tbVehiculosPorClientesVecl_Usua_ModificaNavigation = new HashSet<tbVehiculosPorClientes>();
            tbVehiculosVehi_Usua_CreacionNavigation = new HashSet<tbVehiculos>();
            tbVehiculosVehi_Usua_ModificaNavigation = new HashSet<tbVehiculos>();
        }

        public int Usua_Id { get; set; }
        public string Usua_Usuario { get; set; }
        public string Usua_Color { get; set; }
        public string Usua_Contra { get; set; }
        public string Usuario { get; set; }
        public int? Usua_Admin { get; set; }
        public int? Empl_Id { get; set; }
        [NotMapped]
        public string correo { get; set; }

        public int? Rol_Id { get; set; }
        public int? Usua_Usua_Creacion { get; set; }
        public DateTime? Usua_Fecha_Creacion { get; set; }
        public int? Usua_Usua_Modifica { get; set; }
        public DateTime? Usua_Fecha_Modifica { get; set; }
        public bool? Usua_Estado { get; set; }

        public string Usua_VerificarCorreo { get; set; }

        [NotMapped]
        public string Empleado { get; set; }

        [NotMapped]
        public string Rol_Descripcion { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }

        public virtual tbEmpleados Empl { get; set; }
        public virtual tbRoles Rol { get; set; }
        public virtual tbUsuarios Usua_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Usua_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbUsuarios> InverseUsua_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbUsuarios> InverseUsua_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbCargos> tbCargosCarg_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbCargos> tbCargosCarg_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientesClie_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbClientes> tbClientesClie_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbDepartamentos> tbDepartamentosDept_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbDepartamentos> tbDepartamentosDept_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleadosEmpl_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleadosEmpl_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbEstadosCiviles> tbEstadosCivilesEsta_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbEstadosCiviles> tbEstadosCivilesEsta_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbImagenesPorClientes> tbImagenesPorClientesImcl_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbImagenesPorClientes> tbImagenesPorClientesImcl_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbMarcas> tbMarcasMarc_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbMarcas> tbMarcasMarc_Usuario_ModificiacionNavigation { get; set; }
        public virtual ICollection<tbModelos> tbModelosMode_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbModelos> tbModelosMode_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbMunicipios> tbMunicipiosMuni_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbMunicipios> tbMunicipiosMuni_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbPantallas> tbPantallasPant_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbPantallas> tbPantallasPant_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbPantallasPorRoles> tbPantallasPorRolesParo_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbPantallasPorRoles> tbPantallasPorRolesParo_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbPlanesPagosClientes> tbPlanesPagosClientesPacl_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbPlanesPagosClientes> tbPlanesPagosClientesPacl_Usua_ModiNavigation { get; set; }
        public virtual ICollection<tbPlanesPagos> tbPlanesPagosPapa_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbPlanesPagos> tbPlanesPagosPapa_Usua_ModiNavigation { get; set; }
        public virtual ICollection<tbRoles> tbRolesRol_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbRoles> tbRolesRol_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbSucursales> tbSucursalesSucu_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbSucursales> tbSucursalesSucu_Usua_ModiNavigation { get; set; }
        public virtual ICollection<tbTipoCuotas> tbTipoCuotasTicu_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbTipoCuotas> tbTipoCuotasTicu_Usua_ModiNavigation { get; set; }
        public virtual ICollection<tbVehiculosPorClientes> tbVehiculosPorClientesVecl_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbVehiculosPorClientes> tbVehiculosPorClientesVecl_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbVehiculos> tbVehiculosVehi_Usua_CreacionNavigation { get; set; }
        public virtual ICollection<tbVehiculos> tbVehiculosVehi_Usua_ModificaNavigation { get; set; }
    }
}