﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

#nullable disable

namespace Practica.Entities.Entities
{
    public partial class tbPantallas
    {
        public tbPantallas()
        {
            tbPantallasPorRoles = new HashSet<tbPantallasPorRoles>();
        }

        public int Pant_Id { get; set; }
        public string Pant_Descripcion { get; set; }
        public int? Pant_Usua_Creacion { get; set; }
        public DateTime? Pant_Fecha_Creacion { get; set; }
        public int? Pant_Usua_Modifica { get; set; }
        public DateTime? Pant_Fecha_Modifica { get; set; }
        public bool? Pant_Estado { get; set; }

        public virtual tbUsuarios Pant_Usua_CreacionNavigation { get; set; }
        public virtual tbUsuarios Pant_Usua_ModificaNavigation { get; set; }
        public virtual ICollection<tbPantallasPorRoles> tbPantallasPorRoles { get; set; }
    }
}