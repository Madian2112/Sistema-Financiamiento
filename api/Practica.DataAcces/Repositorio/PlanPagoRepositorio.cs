using Dapper;
using Microsoft.Data.SqlClient;
using Practica.Entities.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Practica.DataAcces.Repositorio
{
    public class PlanPagoRepositorio : IRepository<tbPlanesPagos>
    {
        public RequestStatus Actualizar(tbPlanesPagos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Papa_Id", item.Papa_Id);
                parametro.Add("Papa_Financiamiento", item.Papa_Financiamiento);
                parametro.Add("Papa_Precio_Mercado", item.Papa_Precio_Mercado);
                parametro.Add("Vecl_Id", item.Vecl_Id);
                parametro.Add("Ticu_Id", item.Ticu_Id);
                parametro.Add("Pap_Intereses_Porcentaje", item.Pap_Intereses_Porcentaje);
                parametro.Add("Papa_Numero_Cuota", item.Papa_Numero_Cuota);
                parametro.Add("Papa_Estado_PlanesPagos", item.Papa_Estado_PlanesPagos);
                parametro.Add("Papa_Fecha_Emision", item.Papa_Fecha_Emision);
                parametro.Add("Papa_Fecha_Finalizacion", item.Papa_Fecha_Finalizacion);
                parametro.Add("Papa_Usua_Modi", item.Papa_Usua_Modi);
                parametro.Add("Papa_Fecha_Modi", DateTime.Now);

                var result = db.Execute(ScriptBaseDatos.Papa_Actualizar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public RequestStatus Eliminar(int? id)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Papa_Id", id);
                var result = db.Execute(ScriptBaseDatos.Papa_Eliminar,
                    parametro,
                     commandType: CommandType.StoredProcedure
                    );

                string mensaje = (result == 1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = result, MessageStatus = mensaje };
            }
        }

        public tbPlanesPagos Find(int? id)
        {
            throw new NotImplementedException();
        }

        public RequestStatus Insertar(tbPlanesPagos item)
        {
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parametro = new DynamicParameters();
                parametro.Add("Papa_Financiamiento", item.Papa_Financiamiento);
                parametro.Add("Papa_Precio_Mercado", item.Papa_Precio_Mercado);
                parametro.Add("Vecl_Id", item.Vecl_Id);
                parametro.Add("Papa_Numero_Cuota", item.Papa_Numero_Cuota);
                parametro.Add("Papa_Fecha_Emision", DateTime.Now);
                parametro.Add("Papa_Usua_Creacion", 1);
                parametro.Add("Papa_Fecha_Creacion", DateTime.Now);
                parametro.Add("@UltimoId", dbType: DbType.Int32, direction: ParameterDirection.Output); // Agrega el parámetro de salida

                var result = db.Execute(ScriptBaseDatos.Papa_Insertar,
                    parametro,
                    commandType: CommandType.StoredProcedure
                    );

                int planpago = parametro.Get<int>("@UltimoId");

                item.Resultado = result;
                string mensaje = (result != -1) ? "Exito" : "Error";
                return new RequestStatus { CodeStatus = planpago, MessageStatus = mensaje };
            }
        }
        public IEnumerable<tbPlanesPagos> ObtenerPlanPagoID(int Papa_Id)
        {

            List<tbPlanesPagos> result = new List<tbPlanesPagos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Papa_Id = Papa_Id };
                result = db.Query<tbPlanesPagos>(ScriptBaseDatos.Papa_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagos> List()
        {
            List<tbPlanesPagos> result = new List<tbPlanesPagos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                result = db.Query<tbPlanesPagos>(ScriptBaseDatos.Papa_Mostrar, commandType: CommandType.Text).ToList();
                return result;
            }
        }
        public IEnumerable<tbPlanesPagos> Detalle(int Papa_Id)
        {
            List<tbPlanesPagos> result = new List<tbPlanesPagos>();
            using (var db = new SqlConnection(PracticaContext.ConnectionString))
            {
                var parameters = new { Papa_Id = Papa_Id };
                result = db.Query<tbPlanesPagos>(ScriptBaseDatos.Papa_Detalles, parameters, commandType: CommandType.StoredProcedure).ToList();
                return result;
            }
        }

    }
}
