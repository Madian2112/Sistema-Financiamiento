using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class VehiculoViewModel
    {
        public int Vehi_Id { get; set; }
        public string Vehi_Placa { get; set; }
        public string Vehi_Descripcion { get; set; }
        public string Vehi_Color { get; set; }
        public int? Vehi_Anio { get; set; }
        public int? Mode_Id { get; set; }
        public int? Vehi_Usua_Creacion { get; set; }
        public DateTime? Vehi_Fecha_Creacion { get; set; }
        public int? Vehi_Usua_Modifica { get; set; }
        public DateTime? Vehi_Fecha_Modifica { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
