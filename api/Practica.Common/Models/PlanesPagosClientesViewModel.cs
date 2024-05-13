using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.Common.Models
{
    public class PlanesPagosClientesViewModel
    {
        [NotMapped]
        public string Anio { get; set; }
        [NotMapped]
        public string Mes { get; set; }
        [NotMapped]
        public string Clie_Sexo { get; set; }
        [NotMapped]
        public string Esta_Descripcion { get; set; }
        [NotMapped]
        public string Mode_Descripcion { get; set; }
        [NotMapped]
        public int CantidadPrestamos { get; set; }
        public int Pacl_Id { get; set; }
        public int? Papa_Id { get; set; }
        public decimal? Pacl_Monto_Pago { get; set; }
        public decimal? Pacl_Pago_Capital { get; set; }
        public decimal? Pacl_Pago_Intereses { get; set; }
        public decimal? Pacl_Pago_Mora { get; set; }
        public DateTime? Pacl_Fecha_Emision { get; set; }
        public int? Sucu_Id { get; set; }
        public int? Pacl_Usua_Creacion { get; set; }
        public DateTime? Pacl_Fecha_Creacion { get; set; }
        public int? Pacl_Usua_Modi { get; set; }
        public DateTime? Pacl_Fecha_Modi { get; set; }
    }

    public class PagosClientesViewModel
    {
        public int Pacl_Id { get; set; }
        public int Papa_Id { get; set; }
        public decimal Pacl_Monto_Pago { get; set; }

        [NotMapped]
        public int Pacl_NumeroCuota { get; set; }
    }
}
