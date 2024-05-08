using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class SucursalViewModel
    {
        public int Sucu_Id { get; set; }
        public string Sucu_Calle { get; set; }
        public string Sucu_Direccion { get; set; }
        public string Muni_Id { get; set; }
        public int? Sucu_Usua_Creacion { get; set; }
        public DateTime? Sucu_Fecha_Creacion { get; set; }
        public int? Sucu_Usua_Modi { get; set; }
        public DateTime? Sucu_Fecha_Modi { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
