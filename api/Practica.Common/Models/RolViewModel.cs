﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class RolViewModel
    {
        public int Rol_Id { get; set; }
        public string Rol_Descripcion { get; set; }
       
        public string Pant_Descripcion { get; set; }
        public int? Rol_Usua_Creacion { get; set; }
        public DateTime? Rol_Fecha_Creacion { get; set; }
        public int? Rol_Usua_Modifica { get; set; }
        public DateTime? Rol_Fecha_Modifica { get; set; }
    }
}
