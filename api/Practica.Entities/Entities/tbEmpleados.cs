﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbEmpleados
    {
        public tbEmpleados()
        {
            tbUsuarios = new HashSet<tbUsuarios>();
        }

        public int Empl_Id { get; set; }
        public string Empl_DNI { get; set; }
        public string Empl_Nombre { get; set; }
        public string Empl_Apellido { get; set; }
        public string Empl_Sexo { get; set; }
        public int? Esta_Id { get; set; }
        public string Muni_Id { get; set; }
        public int? Carg_Id { get; set; }
        public int? Empl_Usua_Creacion { get; set; }
        public DateTime? Empl_Fecha_Creacion { get; set; }
        public int? Empl_Usua_Modifica { get; set; }
        public DateTime? Empl_Fecha_Modifica { get; set; }
        public bool? Empl_Estado { get; set; }

        [NotMapped]
        public string Dept_Id { get; set; }

        [NotMapped]
        public string Carg_Descripcion { get; set; }

        [NotMapped]
        public string Esta_Descripcion { get; set; }

        [NotMapped]
        public string Muni_Descripcion { get; set; }

        [NotMapped]
        public string Dept_Descripcion { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }

        [NotMapped]
        public string Empl_Correo { get; set; }

        public virtual tbCargos Carg { get; set; }
        public virtual tbUsuarios Empl_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Empl_Usua_ModificaNavigation { get; set; }
        public virtual tbEstadosCiviles Esta { get; set; }
        public virtual tbMunicipios Muni { get; set; }
        public virtual ICollection<tbUsuarios> tbUsuarios { get; set; }
    }
}