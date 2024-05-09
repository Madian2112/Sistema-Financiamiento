﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbCargos
    {
        public tbCargos()
        {
            tbEmpleados = new HashSet<tbEmpleados>();
        }

        public int Carg_Id { get; set; }
        public string Carg_Descripcion { get; set; }
        public int? Carg_Usua_Creacion { get; set; }
        public DateTime? Carg_Fecha_Creacion { get; set; }
        public int? Carg_Usua_Modifica { get; set; }
        public DateTime? Carg_Fecha_Modifica { get; set; }
        public bool? Carg_Estado { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }

        public virtual tbUsuarios Carg_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Carg_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbEmpleados> tbEmpleados { get; set; }
    }
}