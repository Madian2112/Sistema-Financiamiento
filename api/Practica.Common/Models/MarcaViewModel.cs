using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public  class MarcaViewModel
    {
        public int Marc_Id { get; set; }
        public string Marc_Descripcion { get; set; }
        public int? Marc_Usua_Creacion { get; set; }
        public DateTime? Marc_Fecha_Creacion { get; set; }
        public int? Marc_Usuario_Modificiacion { get; set; }
        public DateTime? Marc_Fecha_Modificacion { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
