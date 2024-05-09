using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public  class MunicipioViewModel
    {
        public string Muni_Id { get; set; }
        public string Muni_Descripcion { get; set; }
        public string Dept_Id { get; set; }
        [NotMapped]
        public string Dept_Descripcion { get; set; }
        public int? Muni_Usua_Creacion { get; set; }
        public DateTime? Muni_Fecha_Creacion { get; set; }
        public int? Muni_Usua_Modifica { get; set; }
        public DateTime? Muni_Fecha_Modifica { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
    }
}
