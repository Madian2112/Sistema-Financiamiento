﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbImagenesPorClientes
    {
        public int Imcl_Id { get; set; }
        public string Imcl_Imagen { get; set; }
        public int? Vecl_Id { get; set; }
        public int? Imcl_Usua_Creacion { get; set; }
        public DateTime? Imcl_Fecha_Creacion { get; set; }
        public int? Imcl_Usua_Modifica { get; set; }
        public DateTime? Imcl_Fecha_Modifica { get; set; }
        public bool? Imcl_Estado { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }

        [NotMapped]
        public string Vehi_Placa { get; set; }

        [NotMapped]
        public string Mode_Descripcion { get; set; }

        [NotMapped]
        public string Marc_Descripcion { get; set; }

        [NotMapped]
        public string Clie_Nombre { get; set; }

        [NotMapped]
        public int Vehi_Id { get; set; }

        [NotMapped]
        public string Cliente { get; set; }

        public virtual tbUsuarios Imcl_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Imcl_Usua_ModificaNavigation { get; set; }
        public virtual tbVehiculosPorClientes Vecl { get; set; }
    }
}