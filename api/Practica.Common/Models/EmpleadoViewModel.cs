using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class EmpleadoViewModel
    {
        public int Empl_Id { get; set; }
        public string? Empl_DNI { get; set; }
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

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
