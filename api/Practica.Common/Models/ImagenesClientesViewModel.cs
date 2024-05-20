using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class ImagenesClientesViewModel
    {
        public int Imcl_Id { get; set; }
        public string Imcl_Imagen { get; set; }
        public int? Vecl_Id { get; set; }
        public int? Imcl_Usua_Creacion { get; set; }
        public DateTime? Imcl_Fecha_Creacion { get; set; }
        public int? Imcl_Usua_Modifica { get; set; }
        public DateTime? Imcl_Fecha_Modifica { get; set; }
        public bool? Imcl_Estado { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
