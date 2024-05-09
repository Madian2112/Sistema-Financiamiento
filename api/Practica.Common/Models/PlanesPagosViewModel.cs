using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class PlanesPagosViewModel
    {

        public int Papa_Id { get; set; }
        public decimal? Papa_Financiamiento { get; set; }
        public decimal? Papa_Precio_Mercado { get; set; }
        public int? Vecl_Id { get; set; }
        public int? Ticu_Id { get; set; }
        public int? Pap_Intereses_Porcentaje { get; set; }
        public decimal? Pap_Intereses_Monto { get; set; }
        public int? Papa_Numero_Cuota { get; set; }
        public int? Papa_Mora { get; set; }
        public bool? Papa_Estado_PlanesPagos { get; set; }
        public DateTime? Papa_Fecha_Emision { get; set; }
        public DateTime? Papa_Fecha_Finalizacion { get; set; }
        public int? Papa_Usua_Creacion { get; set; }
        public DateTime? Papa_Fecha_Creacion { get; set; }
        public int? Papa_Usua_Modi { get; set; }
        public DateTime? Papa_Fecha_Modificacion { get; set; }

        [NotMapped]
        public string Usua_Creacion { get; set; }

        [NotMapped]
        public string Usua_Modifica { get; set; }
      
                [NotMapped]
        public int Resultado { get; set; }

    }
}
