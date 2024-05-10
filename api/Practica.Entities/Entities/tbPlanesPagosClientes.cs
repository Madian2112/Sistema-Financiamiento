﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbPlanesPagosClientes
    {
        [NotMapped]
        public string Anio { get; set; }
        [NotMapped]
        public string Mes { get; set; }
        [NotMapped]
        public string Clie_Sexo { get; set; }
        [NotMapped]
        public string Esta_Descripcion { get; set; }
        [NotMapped]
        public string Mode_Descripcion { get; set; }
        [NotMapped]
        public int CantidadPrestamos { get; set; }
        [NotMapped]
        public string Empleado { get; set; }
        public int Pacl_Id { get; set; }
        public int? Papa_Id { get; set; }
        public decimal? Pacl_Monto_Pago { get; set; }
        public decimal? Pacl_Pago_Capital { get; set; }
        public decimal? Pacl_Pago_Intereses { get; set; }
        public decimal? Pacl_Pago_Mora { get; set; }
        public DateTime? Pacl_Fecha_Emision { get; set; }
        public int? Sucu_Id { get; set; }
        public int? Pacl_Usua_Creacion { get; set; }
        public DateTime? Pacl_Fecha_Creacion { get; set; }
        public int? Pacl_Usua_Modi { get; set; }
        public DateTime? Pacl_Fecha_Modi { get; set; }
        public bool? Pacl_Estado { get; set; }

        [NotMapped]
        public decimal Pacl_Financiamiento { get; set; }

        [NotMapped]
        public decimal Pacl_Saldo_Inicial { get; set; }

        [NotMapped]
        public decimal Pacl_Saldo_Restante { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }

        public virtual tbUsuarios Pacl_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Pacl_Usua_ModiNavigation { get; set; }
        public virtual tbPlanesPagos Papa { get; set; }
        public virtual tbSucursales Sucu { get; set; }
    }
}