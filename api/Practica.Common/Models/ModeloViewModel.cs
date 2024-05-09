using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class ModeloViewModel
    {
        public int Mode_Id { get; set; }
        public string Mode_Descripcion { get; set; }
        public int? Marc_Id { get; set; }
        public int? Mode_Usua_Creacion { get; set; }
        public DateTime? Mode_Fecha_Creacion { get; set; }
        public int? Mode_Usua_Modifica { get; set; }
        public DateTime? Mode_Fecha_Modifica { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
