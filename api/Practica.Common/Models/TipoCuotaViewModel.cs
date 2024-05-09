using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class TipoCuotaViewModel
    {
        public int Ticu_Id { get; set; }
        public string Ticu_Descripcion { get; set; }
        public int? Ticu_Usua_Creacion { get; set; }
        public DateTime? Ticu_Fecha_Creacion { get; set; }
        public int? Ticu_Usua_Modi { get; set; }
        public DateTime? Ticu_Fecha_Modi { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
